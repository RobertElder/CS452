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
	track_node * node = TAL_GetUnreservedSensor(&server->tal);
	
	if (node && engine->current_node != node) {
		TAL_SetInitialTrainLocation(&server->tal, engine, node);
		TAL_SetTrainWait(&server->tal, engine, 4);
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
}

void TrainServer_ProcessEngineResyncPosition(TrainServer * server, TrainEngine * engine) {
	if (TAL_IsNextNodeAvailable(&server->tal, engine)) {
		TrainServer_ProcessEngineFindingPosition(server, engine);
	} else {
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 1);
		engine->state = TRAIN_ENGINE_WAIT_FOR_RESERVATION;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
}

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	//PrintMessage("Found starting position.");
	
	if (!TAL_IsTrainWaiting(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_WAIT_FOR_ALL_READY;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
}

void TrainServer_ProcessEngineWaitForDestination(TrainServer * server, TrainEngine * engine) {
	// TODO disambig whether the user should input the destination or random destination
	engine->destination_node = GetRandomSensorReachableViaDirectedGraph(server, engine->current_node, engine->train_num);
		
	if (!engine->destination_node) {
		// Reverse and try again
		//PrintMessage("No destination in this direction! Reversing..");
		TAL_SetTrainSpeed(&server->tal, REVERSE_SPEED, engine->train_num, 0);
		TAL_SetTrainSpeed(&server->tal, FINDING_POSITION_SPEED, engine->train_num, 0);
		engine->current_node = engine->current_node->reverse;
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
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
		PopulateRouteNodeInfo(server, engine->route_node_info, server->current_track_nodes, engine->current_node, engine->destination_node, 0, 0, &(engine->route_nodes_length), engine->train_num);
	}
	ReserveTrackNodes(engine);
	
	// TODO: not good, may trip up other trains
	//TrainServer_QueueSwitchStates(server, engine);

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
		engine->state = TRAIN_ENGINE_WAIT_FOR_DESTINATION;
	}
	
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
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

int DistanceToNextSwitch(TrainEngine * engine) {
	int distance = 0;
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
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

track_node * GetNextSwitch(TrainEngine * engine) {
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		
		if (engine->route_node_info[i].node->type == NODE_BRANCH && i != engine->route_node_index) {
			return engine->route_node_info[i].node;
		}
		
	}
	
	return 0;
}

SwitchState GetNextSwitchState(TrainEngine * engine) {
	int i;
	
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		
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
	track_node * node = TAL_GetTrainReservedSensor(&server->tal, engine->train_num);
	
	if (node && node != engine->current_node) {
		engine->use_sensor_for_speed_calculation = 1;
		TAL_TransitionToNextNode(&server->tal, engine, node);
		TrainServer_ProcessSensorData(server, engine);
	}
	
	if (engine->current_node == engine->destination_node) {
		engine->use_sensor_for_speed_calculation = 0;
		engine->state = TRAIN_ENGINE_AT_DESTINATION;
		TAL_SetTrainWait(&server->tal, engine, 4);
		TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
		//PrintMessage("At destination %s.", engine->current_node->name);
		ReleaseTrackNodes(engine);
		ReserveTrackNode(engine->current_node, engine->train_num);
		return;
	}
	
	
	/*	if (node->reserved && node->reserved != engine->train_num) {
			PrintMessage("!!! Train %d went into track %s reserved for train %d", engine->train_num, node->name, node->reserved);
			TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
			engine->state = TRAIN_ENGINE_WRONG_LOCATION;
		} else if (!node->reserved) {
			PrintMessage("!!! Train %d went into track %s that was not reserved", engine->train_num, node->name);
			TAL_SetTrainSpeed(&server->tal, 0, engine->train_num, 0);
			engine->state = TRAIN_ENGINE_WRONG_LOCATION;
		}
	}*/
	
	if (!engine->use_sensor_for_speed_calculation) {
		TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	}
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
	
	// TODO queuing switch states like this not good, should use distance to next switch
	//TrainServer_QueueSwitchStates(server, engine);
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
	}

	TrainServer_ProcessEngineRunning(server, engine);
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
}

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine) {
	TAL_CalculateTrainSpeedBySensor(&server->tal, engine);
	
	if (engine->state != TRAIN_ENGINE_NEAR_DESTINATION) {
		TAL_FeedbackControlSystem(&server->tal, engine);
	}
	
	TrainServer_UpdateRouteIndex(server, engine);
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	if (engine->go_forever && !TAL_IsTrainWaiting(&server->tal, engine)) {
		engine->state = TRAIN_ENGINE_WAIT_AND_GO_FOREVER;
	}
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
	TAL_CalculateTrainLocation(&server->tal, engine);
	TrainServer_TrainProceedOrWait(server, engine);
}

void TrainServer_ProcessEngineWaitAndGoForever(TrainServer * server, TrainEngine * engine) {
	engine->state = TRAIN_ENGINE_WAIT_FOR_ALL_READY;
	
/*
	track_node * next_node = engine->current_node->edge[DIR_AHEAD].dest;
	
	if (next_node && next_node->type == NODE_EXIT) {
		TAL_SetTrainSpeed(&server->tal, REVERSE_SPEED, engine->train_num);
		TAL_SetTrainSpeed(&server->tal, FINDING_POSITION_SPEED, engine->train_num);
		engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
	} else {
		TAL_SetTrainSpeed(&server->tal, FINDING_POSITION_SPEED, engine->train_num);
		engine->state = TRAIN_ENGINE_RESYNC_POSITION;
	}
*/
}

void TrainServer_ProcessEngineReverseAndTryAgain(TrainServer * server, TrainEngine * engine) {
	TrainServer_ProcessEngineFindingPosition(server, engine);
}

void TrainServer_ProcessEngineWaitForReservation(TrainServer * server, TrainEngine * engine) {
	if (TAL_IsNextNodeAvailable(&server->tal, engine)) {
		TAL_SetTrainSpeed(&server->tal, FINDING_POSITION_SPEED, engine->train_num, 0);
		engine->state = TRAIN_ENGINE_RESYNC_POSITION;
	}
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
}

void TrainServer_ProcessEngineWrongLocation(TrainServer * server, TrainEngine * engine) {
	TAL_CalculateTrainSpeedByGuessing(&server->tal, engine);
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
	if (!TAL_IsNextNodeAvailable(&server->tal, engine)) {
		TAL_SetTrainSpeed(&server->tal, REVERSE_SPEED, engine->train_num, 1);
		engine->state = TRAIN_ENGINE_WAIT_FOR_RESERVATION;
		PrintMessage("Train %d avoiding collision on %s", engine->train_num, engine->current_node->name);
		TAL_TransitionToNextNode(&server->tal, engine, engine->current_node->reverse);
	}
}

void TrainServer_UpdateRouteIndex(TrainServer * server, TrainEngine * engine) {
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
		PrintMessage("!!! Unable to find current node %s in route list", engine->current_node->name);
	}
}

