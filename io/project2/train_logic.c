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
	PrintMessage("Engine %d is starting.", engine->train_num);
	TrainServer_SetTrainSpeed(server, 4, engine->train_num);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node && engine->current_node != node) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		engine->current_node = node;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	}
}

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	PrintMessage("Found starting position.");
	
	engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
}

void TrainServer_ProcessEngineWaitForDestination(TrainServer * server, TrainEngine * engine) {
	// TODO disambig whether the user should input the destination or random destination
	engine->destination_node = GetRandomSensorReachableViaDirectedGraph(server, engine->current_node);
		
	if (!engine->destination_node) {
		// Reverse and try again
		PrintMessage("No destination in this direction! Reversing..");
		TrainServer_SetTrainSpeed(server, REVERSE_SPEED, engine->train_num);
		TrainServer_SetTrainSpeed(server, 4, engine->train_num);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
		return;
	}
	
	engine->state = TRAIN_ENGINE_GOT_DESTINATION;
}

void TrainServer_ProcessEngineGotDestination(TrainServer * server, TrainEngine * engine) {
	engine->source_node = engine->current_node;

	PrintMessage("Travelling from %s to %s.",engine->current_node->name ,engine->destination_node->name);

	engine->route_nodes_length = 0;
	PopulateRouteNodeInfo(engine->route_node_info, server->current_track_nodes, engine->current_node, engine->destination_node, 0, 0, &(engine->route_nodes_length));

	TrainServer_QueueSwitchStates(server, engine);
	engine->granular_speed_setting = STARTUP_TRAIN_SPEED;
	TrainServer_SetTrainSpeed(server, STARTUP_TRAIN_SPEED | LIGHTS_MASK, engine->train_num);
	
	engine->state = TRAIN_ENGINE_RUNNING;
}

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node && node != engine->current_node) {
		engine->current_node = node;
		TrainServer_ProcessSensorData(server, engine);
	}
	
	double time = TimeSeconds() - engine->actual_time_at_last_sensor;
	engine->estimated_distance_after_node = engine->calculated_speed * time;
	engine->distance_to_destination = DistanceToDestination(engine->route_node_info, engine->route_node_index, engine->destination_node) - engine->estimated_distance_after_node;
	
	assert(engine->speed_setting < 16, "Train Speed Setting is set wrong");
	int stopping_distance = STOPPING_DISTANCE[engine->speed_setting];

	if (engine->distance_to_destination < stopping_distance) {
		TrainServer_SlowTrainDown(server, engine);
	}
}

void TrainServer_ProcessEngineNearDestination(TrainServer * server, TrainEngine * engine) {
	TrainServer_ProcessEngineRunning(server, engine);
}

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine) {
	double time = TimeSeconds();
	double time_difference = time - engine->actual_time_at_last_sensor;
	double new_speed = (double) engine->distance_to_next_sensor / time_difference;
	engine->last_calculated_speed = engine->calculated_speed;
	engine->calculated_speed = SPEED_ALPHA * new_speed + (1 - SPEED_ALPHA) * engine->last_calculated_speed;
	
	if (engine->calculated_speed > MAX_PHYSICAL_SPEED) {
		PrintMessage("Train speed calculation too fast (%d mm/s). Capping.", (int) engine->calculated_speed);
		engine->calculated_speed = MAX_PHYSICAL_SPEED;
	}
	
	engine->actual_time_at_last_sensor = time;
	engine->expected_time_at_last_sensor = engine->expected_time_at_next_sensor;
	engine->next_node = 0;
	
	if (engine->current_node == engine->destination_node) {
		engine->state = TRAIN_ENGINE_AT_DESTINATION;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
		PrintMessage("At destination %s.", engine->current_node->name);
		return;
	}
	
	// Feedback control system
	if (engine->state != TRAIN_ENGINE_NEAR_DESTINATION) {
		if (engine->calculated_speed < TARGET_SPEED && engine->granular_speed_setting < 12) {
			engine->granular_speed_setting += FEEDBACK_CONTROL_SPEED_INCREMENT;
		} else if (engine->calculated_speed > TARGET_SPEED && engine->granular_speed_setting > 8) {
			engine->granular_speed_setting -= FEEDBACK_CONTROL_SPEED_INCREMENT;
		}
		
		int new_speed_setting = (int) engine->granular_speed_setting;
		
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

	engine->distance_to_next_sensor = DistanceToNextSensor(engine->route_node_info, engine->route_node_index);
	engine->expected_time_at_next_sensor = (double) engine->distance_to_next_sensor / engine->calculated_speed + time;

	TrainServer_QueueSwitchStates(server, engine);
	
	track_node * next_node = GetNextSensor(engine->route_node_info, engine->route_node_index);
		
	if (next_node && next_node == engine->destination_node) {
		TrainServer_SlowTrainDown(server, engine);
	}
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	// Blink the lights
	if (Time() % 50 == 0) {
		TrainServer_SetTrainSpeed(server, LIGHTS_MASK, engine->train_num);
		Delay(1);
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	}
	
	if (engine->go_forever) {
		// Pause a bit so we can see it found destination
		engine->wait_until = TimeSeconds() + 4;
		engine->state = TRAIN_ENGINE_WAIT_AND_GO_FOREVER;
	}
}

void TrainServer_ProcessEngineWaitAndGoForever(TrainServer * server, TrainEngine * engine) {
	//TrainEngine_Initialize(engine, engine->train_num);
	//engine->go_forever = 1;
	
	if (engine->wait_until < TimeSeconds()) {
		engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
	}
}

void TrainServer_ProcessEngineReverseAndTryAgain(TrainServer * server, TrainEngine * engine) {
	TrainServer_ProcessEngineFindingPosition(server, engine);
}

track_node * TrainServer_GetEnginePosition(TrainServer * server) {
	// TODO, need to sensor attribution better
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				return SensorToTrackNode(server->current_track_nodes, sensor_module, sensor_num);
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
	
	int i;
	for (i = 0; i < NUM_ENGINES; i++) {
		if (server->train_engines[i].train_num == train_num) {
			server->train_engines[i].speed_setting = speed & ~LIGHTS_MASK;
			break;
		}
	}
}

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine) {
	if (engine->state == TRAIN_ENGINE_RUNNING) {
		TrainServer_SetTrainSpeed(server, 3, engine->train_num);
		engine->state = TRAIN_ENGINE_NEAR_DESTINATION;
		PrintMessage("Slowing down");
	}
}