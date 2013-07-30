#include "train_logic.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "tracks/undirected_nodes.h"
#include "train_abstraction_layer.h"

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
	case TRAIN_ENGINE_WAIT_FOR_RESERVATION:
		TrainServer_ProcessEngineWaitForReservation(server, engine);
		break;
	case TRAIN_ENGINE_WRONG_LOCATION:
		TrainServer_ProcessEngineWrongLocation(server, engine);
		break;
	default:
		assert(0, "Unknown Train Engine State");
		break;
	}
}

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine) {
	//PrintMessage("Engine %d is starting, setting speed to %d.", engine->train_num, FINDING_POSITION_SPEED);
	TAL_SetTrainSpeed(&server->tal, FINDING_POSITION_SPEED, engine->train_num, 1);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
#ifdef TRAINS
	track_node * node = TAL_GetUnreservedSensor(&server->tal);
#else
	track_node * node = GetRandomSensor(server);
	while (1) {
		if (!node->reserved || node->reserved == engine->train_num) {
			break;
		}
		node = GetRandomSensor(server);
	}
#endif
	
	if (node && engine->current_node != node) {
		TAL_SetInitialTrainLocation(&server->tal, engine, node);
		TAL_SetTrainWait(&server->tal, engine, 4);
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		TAL_AddPoints(&server->tal, engine, POINTS_VERY_GOOD_TRAIN, "finding its position");
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
}

void TrainServer_ProcessEngineResyncPosition(TrainServer * server, TrainEngine * engine) {
	assert(0, "TrainServer_ProcessEngineResyncPosition: obsoleted");
}

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	//PrintMessage("Found starting position.");
	
	if (!TAL_IsTrainWaiting(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_WAIT_FOR_ALL_READY;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
}

void TrainServer_ProcessEngineWaitForDestination(TrainServer * server, TrainEngine * engine) {
	// TODO disambig whether the user should input the destination or random destination
	engine->destination_node = GetRandomSensorReachableViaDirectedGraph(server, engine->current_node, engine->train_num);
	
	if (!engine->destination_node) {
		// Reverse and try again
		//PrintMessage("No destination in this direction! Reversing..");
		TAL_ReverseTrain(&server->tal, engine, FINDING_POSITION_SPEED);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
		return;
	}

	engine->state = TRAIN_ENGINE_GOT_DESTINATION;
}

void TrainServer_ProcessEngineGotDestination(TrainServer * server, TrainEngine * engine) {
	TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
	engine->source_node = engine->current_node;

	//PrintMessage("Engine %d travelling from %s to %s.",engine->train_num, engine->current_node->name ,engine->destination_node->name);

	engine->route_nodes_length = 0;
	engine->route_node_index = 0;
	if (server->dijkstras_enabled) {
		TAL_PopulatePath(&server->tal, engine);
	} else {
		if (engine->current_node->type == NODE_BRANCH) {
			// The algorithm doesn't care that we are on a switch, so use the next node
			assert(engine->next_node != 0, "TrainServer_ProcessEngineGotDestination: unhandled case");
			PopulateRouteNodeInfo(server, engine->route_node_info, server->current_track_nodes, engine->next_node, engine->destination_node, 0, 0, &(engine->route_nodes_length), engine->train_num);
		} else {
			PopulateRouteNodeInfo(server, engine->route_node_info, server->current_track_nodes, engine->current_node, engine->destination_node, 0, 0, &(engine->route_nodes_length), engine->train_num);
		}
	}
	
	if (engine->route_nodes_length == 0) {
		engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
		//PrintMessage("!!! Train %d got zero length route", engine->train_num);
		TAL_AddPoints(&server->tal, engine, POINTS_VERY_BAD_TRAIN, "for deciding to go nowhere");
		return;
	}
	
	TAL_ReservePathNodes(&server->tal, engine);
	
	int i = 0;
	for(i = 0; i < engine->route_nodes_length; i++){
		//PrintMessage("Route %d) %s.",i, engine->route_node_info[i].node->name);
	}

	engine->granular_speed_setting = STARTUP_TRAIN_SPEED;
	TAL_SetTrainSpeed(&server->tal, STARTUP_TRAIN_SPEED, engine->train_num, 1);
	engine->state = TRAIN_ENGINE_RUNNING;
}

void TrainServer_ProcessEngineWaitForAllReady(TrainServer * server, TrainEngine * engine) {
	if (TrainServer_NumActivatedEngines(server) == server->num_engines) {
		TrainServer_SnapTrainLocationBySensor(server, engine);
		engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
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

int DistanceToNextSwitch(TrainEngine * engine, int route_index) {
	int distance = 0;
	int i;
	
	for (i = route_index; i < engine->route_nodes_length; i++) {
		if (engine->route_node_info[i].node->type == NODE_BRANCH && i != engine->route_node_index) {
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

track_node * GetNextSwitch(TrainEngine * engine, int route_index) {
	int i;
	
	for (i = route_index; i < engine->route_nodes_length; i++) {
		
		if (engine->route_node_info[i].node->type == NODE_BRANCH && i != engine->route_node_index) {
			return engine->route_node_info[i].node;
		}
		
	}
	
	return 0;
}

SwitchState GetNextSwitchState(TrainEngine * engine, int route_index) {
	int i;
	
	for (i = route_index; i < engine->route_nodes_length; i++) {
		
		if (engine->route_node_info[i].node->type == NODE_BRANCH && i != engine->route_node_index) {
			return engine->route_node_info[i].switch_state;
		}
		
	}
	
	return SWITCH_UNKNOWN;
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
	TrainServer_SnapTrainLocationBySensor(server, engine);
	
	if (engine->current_node == engine->destination_node) {
		engine->use_sensor_for_speed_calculation = 0;
		engine->state = TRAIN_ENGINE_AT_DESTINATION;
		TAL_SetTrainWait(&server->tal, engine, 4);
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
		//PrintMessage("At destination %s.", engine->current_node->name);
		
		TAL_ReleaseNodes(&server->tal, engine, 3);
		TAL_AddPoints(&server->tal, engine, POINTS_EXCELLENT_TRAIN, "arriving at its destination");
		return;
	}
	
	TAL_PrepareNextSwitch(&server->tal, engine);
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
	
	int found = TrainServer_UpdateRouteIndex(server, engine);
	if (found == 0 || found == -1) {
		engine->lost_count += 1;
		
		if (engine->lost_count > 1000) {
			engine->lost_count = 0;
			PrintMessage("*** Train %d is lost. ***", engine->train_num);
			PrintMessage("Train %d: Route index=%d, length=%d, state=%d", engine->train_num, engine->route_node_index, engine->route_nodes_length, engine->state);
			TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 1);
			TAL_ReleaseNodes(&server->tal, engine, 3);
			engine->state = TRAIN_ENGINE_WRONG_LOCATION;
			TAL_AddPoints(&server->tal, engine, POINTS_EXTREMELY_BAD_TRAIN, "for being completely off course");
			
			int i;
			for(i = 0; i < engine->route_nodes_length; i++) {
				PrintMessage("Train %d Route %d %s", engine->train_num, i, engine->route_node_info[i].node->name);
			}
			return;
		}
	}
	
	TAL_PrepareNextSwitch(&server->tal, engine);
	
	assert(engine->speed_setting < 16, "Train Speed Setting is set wrong");
	int stopping_distance = STOPPING_DISTANCE[engine->train_num][engine->speed_setting];

	if(engine->state == TRAIN_ENGINE_RUNNING && engine->distance_to_destination < stopping_distance) {
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
		TAL_AddPoints(&server->tal, engine, POINTS_BAD_TRAIN, "slowing down and speeding back up");
	}

	TrainServer_ProcessEngineRunning(server, engine);
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
}

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine) {
	TAL_CalculateTrainSpeedBySensor(&server->tal, engine);
	
	if (engine->state != TRAIN_ENGINE_NEAR_DESTINATION) {
		TAL_FeedbackControlSystem(&server->tal, engine);
	}
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	if (engine->go_forever && !TAL_IsTrainWaiting(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_WAIT_AND_GO_FOREVER;
	}
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
}

void TrainServer_ProcessEngineWaitAndGoForever(TrainServer * server, TrainEngine * engine) {
	engine->state = TRAIN_ENGINE_WAIT_FOR_ALL_READY;
}

void TrainServer_ProcessEngineReverseAndTryAgain(TrainServer * server, TrainEngine * engine) {
	if (engine->current_node->type == NODE_EXIT) {
		TAL_ReverseTrain(&server->tal, engine, FINDING_POSITION_SPEED);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
		TAL_ReleaseNodes(&server->tal, engine, 3);
	} else if (TAL_IsNextNodeAvailable(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		TAL_ReleaseNodes(&server->tal, engine, 3);
	} else {
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 1);
		engine->state = TRAIN_ENGINE_WAIT_FOR_RESERVATION;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
}

void TrainServer_ProcessEngineWaitForReservation(TrainServer * server, TrainEngine * engine) {
	if (TAL_IsNextNodeAvailable(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
	} else if (RNG_GetRange(&server->rng, 1, 100) == 1) {
		TAL_ReverseTrain(&server->tal, engine, 1);
		//PrintMessage("Train %d: gave up waiting. Reversing", engine->train_num);
		TAL_AddPoints(&server->tal, engine, POINTS_GOOD_TRAIN, "trying another path");
	}
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
}

void TrainServer_ProcessEngineWrongLocation(TrainServer * server, TrainEngine * engine) {
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainSpeed(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
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
	TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
	TAL_SetTrainSpeed(&server->tal, 5, engine->train_num, 0);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine) {
	if (engine->state == TRAIN_ENGINE_RUNNING) {
		int slow_speed = TAL_GetSlowSpeedSetting(&server->tal, engine);
		
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
		TAL_SetTrainSpeed(&server->tal, slow_speed, engine->train_num, 0);
		engine->state = TRAIN_ENGINE_NEAR_DESTINATION;
		//PrintMessage("Slowing down");
	}
}

void TrainServer_TrainProceedOrWait(TrainServer * server, TrainEngine * engine) {
	if (engine->current_node->type == NODE_EXIT) {
		// Next node is unavailable, but it's not a collision into a train
	} else if (!TAL_IsNextNodeAvailable(&server->tal, engine)) {
		// Emergency stop
		TAL_ReverseTrain(&server->tal, engine, 1);
		TAL_ReverseTrain(&server->tal, engine, 0);
		engine->state = TRAIN_ENGINE_WAIT_FOR_RESERVATION;
		
		assert(engine->next_node != 0, "TrainServer_TrainProceedOrWait: attempting to wait for reservation clear on next node which is 0");
		
		PrintMessage("Train %d on %s avoiding collision into %d on %s", engine->train_num, engine->current_node->name, engine->next_node->reserved, engine->next_node->name);
	}
}

int TrainServer_UpdateRouteIndex(TrainServer * server, TrainEngine * engine) {
	assertf(engine->route_nodes_length != 0, "TrainServer_UpdateRouteIndex: Train %d has 0 length route", engine->train_num);

	int i = 0;
	int found = 0;
	
	// This accounts for when the sensor reading snaps or rubber bands the train to a sensor by giving it a window of how much the train has proceeded on its route
	int start_index = engine->route_node_index - 4;
	
	if (start_index < 0) {
		start_index = 0;
	}
	
	for (i = start_index; i < engine->route_nodes_length; i++) {
		if (engine->route_node_info[i].node == engine->current_node) {
			found = 1;
			engine->route_node_index = i;
			break;
		} else if (engine->route_node_info[i].node->reverse == engine->current_node) {
			found = -1;
			engine->route_node_index = i;
			break;
		}
	}
	
	// This special case is used when we use the recursive algorithm, but we skip the branch because it can't handle starting on a switch
	if (found == 0 && engine->source_node->type == NODE_BRANCH && engine->source_node == engine->current_node) {
		found = 2;
	}
	
	int new_print_message_hash = found ^ engine->route_node_index ^ (int) engine->current_node;
	
	if (new_print_message_hash != engine->print_message_hash) {
		engine->print_message_hash = new_print_message_hash;
	
		if (found == -1) {
			PrintMessage("!!! Train %d: Reversed? Current node=%s but route=%s", engine->train_num, engine->current_node->name, engine->route_node_info[engine->route_node_index].node->name);
		} else if (found == 2) {
			//PrintMessage("Train %d: %s not in route list, but considered special case.", engine->train_num, engine->current_node->name);
		} else if(found != 1){
			PrintMessage("!!! Train %d: Unable to find current node %s in route list", engine->train_num, engine->current_node->name);
		}
	}
	
	return found;
}

void TrainServer_SnapTrainLocationBySensor(TrainServer * server, TrainEngine * engine) {
	track_node * node = TAL_GetTrainReservedSensor(&server->tal, engine->train_num);
	
	if (!node) {
		track_node * nearest_node = TAL_GetNearestSensorByAttribution(&server->tal, engine);
		
		if (nearest_node && !nearest_node->reserved) {
			node = nearest_node;
			//PrintMessage("Train %d: Sensor attribution used node %s though not on path!", engine->train_num, node->name);
			TAL_AddPoints(&server->tal, engine, POINTS_VERY_BAD_TRAIN, "straying off course");
		}
	}
	
	if (node && node != engine->current_node) {
		engine->use_sensor_for_speed_calculation = 1;
		TAL_TransitionToNextNode(&server->tal, engine, node);
		TrainServer_ProcessSensorData(server, engine);
	}
}

