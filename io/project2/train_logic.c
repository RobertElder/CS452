#include "train_logic.h"
#include "public_kernel_interface.h"
#include "robio.h"

void TrainServer_ProcessEngine(TrainServer * server, TrainEngine * engine) {
	if (!engine->train_num) {
		return;
	}
	
	switch(engine->state) {
	case TRAIN_ENGINE_IDLE:
		TrainServer_ProcessEngineIdle(server, engine);
		break;
	case TRAIN_ENGINE_FINDING_POSITION:
		TrainServer_ProcessEngineFindingPosition(server, engine);
		break;
	case TRAIN_ENGINE_RESYNC_POSITION:
		TrainServer_ProcessEngineResyncPosition(server, engine);
		break;
	case TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN:
		TrainServer_ProcessEngineReverseAndTryAgain(server, engine);
		break;
	case TRAIN_ENGINE_FOUND_STARTING_POSITION:
		TrainServer_ProcessEngineFoundStartingPosition(server, engine);
		break;
	case TRAIN_ENGINE_WAIT_FOR_DESTINATION:
		TrainServer_ProcessEngineWaitForDestination(server, engine);
		break;
	case TRAIN_ENGINE_GOT_DESTINATION:
		TrainServer_ProcessEngineGotDestination(server, engine);
		break;
	case TRAIN_ENGINE_WAIT_FOR_ALL_READY:
		TrainServer_ProcessEngineWaitForAllReady(server, engine);
		break;
	case TRAIN_ENGINE_RUNNING:
		TrainServer_ProcessEngineRunning(server, engine);
		break;
	case TRAIN_ENGINE_NEAR_DESTINATION:
		TrainServer_ProcessEngineNearDestination(server, engine);
		break;
	case TRAIN_ENGINE_AT_DESTINATION:
		TrainServer_ProcessEngineAtDestination(server, engine);
		break;
	case TRAIN_ENGINE_WAIT_AND_GO_FOREVER:
		TrainServer_ProcessEngineWaitAndGoForever(server, engine);
		break;
	case TRAIN_ENGINE_CALIBRATING_SPEED:
		TrainServer_ProcessEngineCalibratingSpeed(server, engine);
		break;
	default:
		assert(0, "Unknown Train Engine State");
		break;
	}
}

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine) {
	//PrintMessage("Engine %d is starting, setting speed to %d.", engine->train_num, FINDING_POSITION_SPEED);
	TrainServer_SetTrainSpeed(server, FINDING_POSITION_SPEED, engine->train_num);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server, engine);
	
	if (node && engine->current_node != node) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		engine->current_node = node;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	}
}

void TrainServer_ProcessEngineResyncPosition(TrainServer * server, TrainEngine * engine) {
	TrainServer_ProcessEngineFindingPosition(server, engine);
}

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	//PrintMessage("Found starting position.");
	
	engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
}

void TrainServer_ProcessEngineWaitForDestination(TrainServer * server, TrainEngine * engine) {
	// TODO disambig whether the user should input the destination or random destination
	engine->destination_node = GetRandomSensorReachableViaDirectedGraph(server, engine->current_node);
		
	if (!engine->destination_node) {
		// Reverse and try again
		//PrintMessage("No destination in this direction! Reversing..");
		TrainServer_SetTrainSpeed(server, REVERSE_SPEED, engine->train_num);
		DelaySeconds(1);
		TrainServer_SetTrainSpeed(server, FINDING_POSITION_SPEED, engine->train_num);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
		return;
	}

	engine->state = TRAIN_ENGINE_GOT_DESTINATION;
}

void TrainServer_ProcessEngineGotDestination(TrainServer * server, TrainEngine * engine) {
	TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	engine->source_node = engine->current_node;

	//PrintMessage("Engine %d travelling from %s to %s.",engine->train_num, engine->current_node->name ,engine->destination_node->name);

	engine->route_nodes_length = 0;
	engine->route_node_index = 0;
	PopulateRouteNodeInfo(server, engine->route_node_info, server->current_track_nodes, engine->current_node, engine->destination_node, 0, 0, &(engine->route_nodes_length), engine->train_num);
	ReserveTrackNodes(engine);
	
	int i = 0;
	for(i = 0; i < engine->route_nodes_length; i++){
		//PrintMessage("Route %d) %s.",i, engine->route_node_info[i].node->name);
	}

	engine->state = TRAIN_ENGINE_WAIT_FOR_ALL_READY;
}

void TrainServer_ProcessEngineWaitForAllReady(TrainServer * server, TrainEngine * engine) {
	if (TrainServer_NumActivatedEngines(server) == server->num_engines) {
		TrainServer_QueueSwitchStates(server, engine);
		engine->granular_speed_setting = STARTUP_TRAIN_SPEED;
		TrainServer_SetTrainSpeed(server, STARTUP_TRAIN_SPEED | LIGHTS_MASK, engine->train_num);
		engine->state = TRAIN_ENGINE_RUNNING;
	}
}

int DistanceToNextSensor(TrainEngine * engine) {
	int distance = 0;
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		if (engine->route_node_info[i].node->type == NODE_SENSOR && i != engine->route_node_index) {
			break;
		}
		
		distance += engine->route_node_info[i].edge->dist;
	}
	
	return distance;
}

track_node * GetNextSensor(TrainEngine * engine) {
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		
		if (engine->route_node_info[i].node->type == NODE_SENSOR && i != engine->route_node_index) {
			return engine->route_node_info[i].node;
		}
		
	}
	
	return 0;
}

int DistanceToDestination(TrainEngine * engine) {
	int distance = 0;
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		
		if (engine->route_node_info[i].node == engine->destination_node) {
			break;
		}
		
		distance += engine->route_node_info[i].edge->dist;
	}
	
	return distance;
}

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server, engine);
	
	if (node && node != engine->current_node) {
		engine->current_node = node;
		TrainServer_ProcessSensorData(server, engine);
		
		if (node->reserved && node->reserved != engine->train_num) {
			//PrintMessage("!!! Train %d went into track %s reserved for train %d", engine->train_num, node->name, node->reserved);
		} else if (!node->reserved) {
			//PrintMessage("!!! Train %d went into track %s that was not reserved", engine->train_num, node->name);
		}
	}
	
	double time = TimeSeconds() - engine->actual_time_at_last_sensor;
	engine->estimated_distance_after_node = engine->calculated_speed * time;
	engine->distance_to_destination = DistanceToDestination(engine) - engine->estimated_distance_after_node;
	
	assert(engine->speed_setting < 16, "Train Speed Setting is set wrong");
	int stopping_distance = STOPPING_DISTANCE[engine->train_num][engine->speed_setting];

	if((!(engine->state == TRAIN_ENGINE_NEAR_DESTINATION)) && engine->distance_to_destination < stopping_distance) {
		//PrintMessage("Slowing down because distance (%d) less than stopping distance (%d).", engine->distance_to_destination, stopping_distance);
		TrainServer_SlowTrainDown(server, engine);
		engine->sample_distance_to_next_sensor = engine->distance_to_destination;
	}
}

void TrainServer_ProcessEngineNearDestination(TrainServer * server, TrainEngine * engine) {
	int stopping_distance = STOPPING_DISTANCE[engine->train_num][engine->speed_setting];
	
	if (engine->distance_to_destination > stopping_distance * 2) {
//		PrintMessage("Speeding back up because distance was great");
		engine->state = TRAIN_ENGINE_RUNNING;
	}

	TrainServer_ProcessEngineRunning(server, engine);
}

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine) {
	double time = TimeSeconds();
	double time_difference = time - engine->actual_time_at_last_sensor;
	double new_speed = (double) engine->distance_to_next_sensor / time_difference;
	engine->last_calculated_speed = engine->calculated_speed;
	engine->calculated_speed = SPEED_ALPHA * new_speed + (1 - SPEED_ALPHA) * engine->last_calculated_speed;
	
	if (engine->calculated_speed > MAX_PHYSICAL_SPEED) {
		//PrintMessage("Train speed calculation too fast (%d mm/s). Capping.", (int) engine->calculated_speed);
		engine->calculated_speed = MAX_PHYSICAL_SPEED;
	}
	
	engine->actual_time_at_last_sensor = time;
	engine->expected_time_at_last_sensor = engine->expected_time_at_next_sensor;
	engine->next_node = 0;
	
	if (engine->current_node == engine->destination_node) {
		engine->state = TRAIN_ENGINE_AT_DESTINATION;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
		//PrintMessage("At destination %s.", engine->current_node->name);
		ReleaseTrackNodes(engine);
		return;
	}
	
	// Feedback control system
	if (engine->state != TRAIN_ENGINE_NEAR_DESTINATION) {
		if (engine->calculated_speed < TARGET_SPEED && engine->granular_speed_setting < 11) {
			engine->granular_speed_setting += FEEDBACK_CONTROL_SPEED_INCREMENT;
		} else if (engine->calculated_speed > TARGET_SPEED && engine->granular_speed_setting > 8) {
			engine->granular_speed_setting += FEEDBACK_CONTROL_SPEED_DECREMENT;
		}
		
		int new_speed_setting = (int) engine->granular_speed_setting;
		//PrintMessage("Feedback control setting speed to %d for train %d.", new_speed_setting, engine->train_num);
		
		if (new_speed_setting != engine->speed_setting) {
			TrainServer_SetTrainSpeed(server, new_speed_setting | LIGHTS_MASK, engine->train_num);
		}
	}
	
	
	int i = 0;
	int found = 0;
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		if (engine->route_node_info[i].node == engine->current_node) {
			found = 1;
			engine->route_node_index = i;
			break;
		}
	}

	if(!(found)){
		//PrintMessage("\x1b[31;44mUnable to find current sensor (%s) in route list from %s to %s.", engine->current_node->name, engine->source_node->name, engine->destination_node->name);
	}

	engine->distance_to_next_sensor = DistanceToNextSensor(engine);
	engine->expected_time_at_next_sensor = (double) engine->distance_to_next_sensor / engine->calculated_speed + time;

	TrainServer_QueueSwitchStates(server, engine);
	
	track_node * next_node = GetNextSensor(engine);
		
	if (next_node && next_node == engine->destination_node) {
		//PrintMessage("Slowing down because next node is destination node.");
		TrainServer_SlowTrainDown(server, engine);
	}
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	if (engine->go_forever) {
		engine->state = TRAIN_ENGINE_WAIT_AND_GO_FOREVER;
	}
}

void TrainServer_ProcessEngineWaitAndGoForever(TrainServer * server, TrainEngine * engine) {
	TrainServer_SetTrainSpeed(server, FINDING_POSITION_SPEED, engine->train_num);
	
	track_node * next_node = engine->current_node->edge[DIR_AHEAD].dest;
	
	if (next_node && next_node->type == NODE_EXIT) {
		TrainServer_SetTrainSpeed(server, REVERSE_SPEED, engine->train_num);
		TrainServer_SetTrainSpeed(server, FINDING_POSITION_SPEED, engine->train_num);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
	} else {
		engine->state = TRAIN_ENGINE_RESYNC_POSITION;
	}
}

void TrainServer_ProcessEngineReverseAndTryAgain(TrainServer * server, TrainEngine * engine) {
	TrainServer_ProcessEngineFindingPosition(server, engine);
}

track_node * TrainServer_GetEnginePosition(TrainServer * server, TrainEngine * engine) {
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				track_node * candidate_node = SensorToTrackNode(server->current_track_nodes, sensor_module, sensor_num);
				// TODO: need to sensor attribution better
				
				if (candidate_node->reserved == engine->train_num) {
					return candidate_node;
				}
				
				if (engine->state == TRAIN_ENGINE_FINDING_POSITION && !candidate_node->reserved) {
					return candidate_node;
				}
				
				// TODO: Remove this case below once the engine is actually reserving tracks as it moves along
				if ((engine->state == TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN || engine->state == TRAIN_ENGINE_RESYNC_POSITION) && !candidate_node->reserved) {
					return candidate_node;
				}
				
				// TODO: Remove this case below as trains should be on their reserved tracks anyway
				// this only checks if the node is on the path
				int i;
				for (i = 0; i < engine->route_nodes_length; i++) {
					if (engine->route_node_info[i].node == candidate_node) {
						return candidate_node;
					}
				}
			}
		}
	}
	
	return 0;
}

void TrainServer_ProcessEngineCalibratingSpeed(TrainServer * server, TrainEngine * engine) {
	// TODO this calibration is too hard coded
	double difference;

	// ticks in both directions
	int t_11 = server->sensor_time_log[SENSOR_MODULE_C][16 - 1];
	int t_12 = server->sensor_time_log[SENSOR_MODULE_D][11 - 1];
	int t_21 = server->sensor_time_log[SENSOR_MODULE_C][15 - 1];
	int t_22 = server->sensor_time_log[SENSOR_MODULE_D][12 - 1];
	
	if (t_11 && t_12) {
		difference = (t_11 - t_12) * TICK_SIZE / 1000.0;
	} else if (t_21 && t_22) {
		difference = (t_21 - t_22) * TICK_SIZE / 1000.0;
	} else {
		return;
	}
	
	if (difference < 0) {
		difference = -difference;
	}
	
	engine->calculated_speed = 45.0 / difference; // 45mm over time
	TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	TrainServer_SetTrainSpeed(server, 5, engine->train_num);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_SetTrainSpeed(TrainServer * server, int speed, int train_num) {
	int train_speed_settings = speed << 8 | train_num;
	Queue_PushEnd((Queue*) &server->train_speed_queue, (QUEUE_ITEM_TYPE) train_speed_settings);
	
	int slot_num = TrainServer_EngineNumToArrayIndex(server, train_num);
	
	server->train_engines[slot_num].speed_setting = speed & ~LIGHTS_MASK;
}

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine) {
	if (engine->state == TRAIN_ENGINE_RUNNING) {
		int slow_speed = 7;

		//  These ones are close to switches so we need to slow down more.  We need to be at speed 8 for
		//  the other ones, otherwise we stall.
		if(
			engine->destination_node == &(server->track_b_nodes[6]) || // A7
			engine->destination_node == &(server->track_b_nodes[34]) || // C3
			engine->destination_node == &(server->track_b_nodes[8]) || // A9
			engine->destination_node == &(server->track_b_nodes[13]) || // A14
			engine->destination_node == &(server->track_b_nodes[2]) || // A3
			engine->destination_node == &(server->track_b_nodes[45]) || // C14
			engine->destination_node == &(server->track_b_nodes[39]) || // C8
			engine->destination_node == &(server->track_b_nodes[36]) || // C5
			engine->destination_node == &(server->track_b_nodes[75]) || // E12
			engine->destination_node == &(server->track_b_nodes[31]) // B16
		){
			slow_speed = 3;
		}else if(
			engine->destination_node == &(server->track_b_nodes[76]) || // E13
			engine->destination_node == &(server->track_b_nodes[69]) // E6
		){
			slow_speed = 4;
		}

		TrainServer_SetTrainSpeed(server, slow_speed, engine->train_num);
		engine->state = TRAIN_ENGINE_NEAR_DESTINATION;
		//PrintMessage("Slowing down");
	}
}
