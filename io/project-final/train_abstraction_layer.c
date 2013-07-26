#include "train_abstraction_layer.h"
#include "route.h"
#include "robio.h"
#include "train.h"
#include "train_logic.h"
#include "tracks/undirected_nodes.h"

void TAL_Initialize(TAL * tal, TrainServer * server) {
	tal->train_server = server;
}

int TAL_IsSensorFaulty(TAL * tal, int module_num, int sensor_num) {
	if (tal->train_server->current_track_nodes == tal->train_server->track_a_nodes) {
		if (//  These ones will stick
			(module_num == 4 && (sensor_num == 15 || sensor_num == 16)) ||
			(module_num == 3 && (sensor_num == 8 || sensor_num == 9)) ||
			(module_num == 2 && (sensor_num == 8))
			
		) {
			return 1;
		}
	} else {
		if (
			(module_num == 0 && (sensor_num == 0 || sensor_num == 1)) ||
			(module_num == 3 && (sensor_num == 7))
		) {
			return 1;
		}
	}
	
	return 0;
}

int TAL_IsSwitchFaulty(TAL * tal, int switch_num) {
	if (tal->train_server->current_track_nodes == tal->train_server->track_a_nodes) {
		if (switch_num == 156) {
			return 1;
		}
	} else {
		if (switch_num == 18) {
			return 1;
		}
	}
	
	return 0;
}

int TAL_IsDestinationSensorBad(TAL * tal, int module_num, int sensor_num) {
	if (tal->train_server->current_track_nodes == tal->train_server->track_a_nodes) {
		if (
				//  These ones can't be reached because they are too close to the end of the track.
				module_num == 1 && (
					sensor_num == 6 ||
					sensor_num == 7 ||
					sensor_num == 8 ||
					sensor_num == 9 ||
					sensor_num == 10 ||
					sensor_num == 11
				)
		) {
			return 1;
		}
	} else {
		if (
		//  The ones are too close to the end of the track.
			(module_num == 1 && (
					sensor_num == 6 ||
					sensor_num == 7 ||
					sensor_num == 8 ||
					sensor_num == 9 ||
					sensor_num == 10 ||
					sensor_num == 11
				)
			)
		) {
			return 1;
		}
	}
	
	if (TAL_IsSensorFaulty(tal, module_num, sensor_num)) {
		return 1;
	}
	
	return 0;
}

void TAL_CalculateTrainSpeedBySensor(TAL * tal, TrainEngine * engine) {
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
	engine->last_time_speed_update = time;
	engine->distance_to_next_sensor = DistanceToNextSensor(engine);
	engine->expected_time_at_next_sensor = (double) engine->distance_to_next_sensor / engine->calculated_speed + time;
}

void TAL_CalculateTrainSpeedByGuessing(TAL * tal, TrainEngine * engine) {
	double time = TimeSeconds();
	
	if (time < engine->last_time_speed_update + 0.1) {
		return;
	}
	
	double new_speed = engine->granular_speed_setting / 14.0 * TARGET_SPEED;
	engine->last_calculated_speed = engine->calculated_speed;
	engine->calculated_speed = GUESSING_SPEED_ALPHA * new_speed + (1 - GUESSING_SPEED_ALPHA) * engine->last_calculated_speed;
	
	engine->last_time_speed_update = time;
}

void TAL_CalculateTrainLocation(TAL * tal, TrainEngine * engine) {
	assert(engine->current_node != 0, "TAL_CalculateTrainLocation: no current node");

	double time = TimeSeconds();
	double delta_time = time - engine->last_time_location_update;
	double distance_traveled = engine->calculated_speed * delta_time;
	engine->estimated_distance_after_node += distance_traveled;
	engine->distance_to_destination = DistanceToDestination(engine) - engine->estimated_distance_after_node;
	engine->last_time_location_update = time;
	
	move_train_distance(&engine->train_node, engine->current_node->undirected_node, engine->next_node->undirected_node, TAL_GetNextNode(tal, engine->next_node)->undirected_node, distance_traveled / 1000.0);

	if (engine->estimated_distance_after_node > engine->distance_to_next_node && engine->next_node) {
		assertf(engine->next_node != 0, "Next node of %s is 0", engine->current_node->name);
		PrintMessage("Guessing train is at %s (%d > %d)", engine->next_node->name, (int) engine->estimated_distance_after_node, (int) engine->distance_to_next_node);
		TAL_TransitionToNextNode(tal, engine, engine->next_node);
	}
}

void TAL_SetInitialTrainLocation(TAL * tal, TrainEngine * engine, track_node * node) {
	TAL_TransitionToNextNode(tal, engine, node);
}

void TAL_TransitionToNextNode(TAL * tal, TrainEngine * engine, track_node * node) {
	if (engine->previous_node) {
//		ReleaseTrackNode(engine->previous_node, engine->train_num);
		remove_train_node(&engine->train_node, engine->current_node->undirected_node, engine->next_node->undirected_node);
	}
	
	engine->previous_node = engine->current_node;
	engine->current_node = node;
	engine->next_node = TAL_GetNextNode(tal, engine->current_node);
	engine->estimated_distance_after_node = 0;
	engine->distance_to_next_node = TAL_DistanceToNextNode(tal, engine);
	engine->time_at_last_node = TimeSeconds();
	
	add_train_node(&engine->train_node, node->undirected_node, engine->next_node->undirected_node, 1);
	
	ReserveTrackNode(engine->current_node, engine->train_num);
//	ReserveTrackNode(engine->next_node, engine->train_num);
}

track_node * TAL_GetUnreservedSensor(TAL * tal) {
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((tal->train_server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				track_node * candidate_node = SensorToTrackNode(tal->train_server->current_track_nodes, sensor_module, sensor_num);
				if (!candidate_node->reserved) {
					return candidate_node;
				}
			}
		}
	}
	
	return 0;
}

track_node * TAL_GetTrainReservedSensor(TAL * tal, int train_num) {
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((tal->train_server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				track_node * candidate_node = SensorToTrackNode(tal->train_server->current_track_nodes, sensor_module, sensor_num);
				
				if (candidate_node->reserved == train_num) {
					return candidate_node;
				}
			}
		}
	}

	return 0;
}

track_node * TAL_GetNextNode(TAL * tal, track_node * node) {
	assert(node != 0, "TAL_GetNextNode: no node");
	
	if (node->type == NODE_BRANCH) {
		if (TAL_GetSwitchState(tal, node->num) == SWITCH_CURVED) {
			return node->edge[DIR_CURVED].dest;
		} else if (TAL_GetSwitchState(tal, node->num) == SWITCH_STRAIGHT) {
			return node->edge[DIR_STRAIGHT].dest;
		} else {
			assertf(0, "TAL_GetNextNode: unable to determine next node from branch %d because it is unknown state", node->num);
			return 0;
		}
	} else {
		return node->edge[DIR_AHEAD].dest;
	}
}

int TAL_DistanceToNextNode(TAL * tal, TrainEngine * engine) {
	assert(engine->current_node != 0, "TAL_DistanceToNextNode: engine has no current node");
	
	if (engine->current_node->type == NODE_BRANCH) {
		if (TAL_GetSwitchState(tal, engine->current_node->num) == SWITCH_CURVED) {
			return engine->current_node->edge[DIR_CURVED].dist;
		} else if (TAL_GetSwitchState(tal, engine->current_node->num) == SWITCH_STRAIGHT) {
			return engine->current_node->edge[DIR_STRAIGHT].dist;
		} else {
			assertf(0, "TAL_DistanceToNextNode: unable to determine next node from branch %d because it is unknown state", engine->current_node->num);
			return 0;
		}
	} else {
		return engine->current_node->edge[DIR_AHEAD].dist;
	}
}

void TAL_SetTrainWait(TAL * tal, TrainEngine * engine, int seconds) {
	engine->wait_until = TimeSeconds() + seconds;
}

int TAL_IsTrainWaiting(TAL * tal, TrainEngine * engine) {
	return (engine->wait_until > TimeSeconds());
}

int TAL_IsNextNodeAvailable(TAL * tal, TrainEngine * engine) {
	return !(TAL_GetNextNode(tal, engine->current_node)->reserved);
}

SwitchState TAL_GetSwitchState(TAL * tal, int switch_num) {
	assert(switch_num <= NUM_SWITCHES, "TAL_GetSwitchState: invalid switch num");
	return tal->train_server->switch_states[switch_num];
}

int TAL_GetSlowSpeedSetting(TAL * tal, TrainEngine * engine) {
	//  These ones are close to switches so we need to slow down more.  We need to be at speed 8 for
	//  the other ones, otherwise we stall.
	if(
		engine->destination_node == &(tal->train_server->track_b_nodes[6]) || // A7
		engine->destination_node == &(tal->train_server->track_b_nodes[34]) || // C3
		engine->destination_node == &(tal->train_server->track_b_nodes[8]) || // A9
		engine->destination_node == &(tal->train_server->track_b_nodes[13]) || // A14
		engine->destination_node == &(tal->train_server->track_b_nodes[2]) || // A3
		engine->destination_node == &(tal->train_server->track_b_nodes[45]) || // C14
		engine->destination_node == &(tal->train_server->track_b_nodes[39]) || // C8
		engine->destination_node == &(tal->train_server->track_b_nodes[36]) || // C5
		engine->destination_node == &(tal->train_server->track_b_nodes[75]) || // E12
		engine->destination_node == &(tal->train_server->track_b_nodes[31]) // B16
	){
		return 1;
	}else if(
		engine->destination_node == &(tal->train_server->track_b_nodes[76]) || // E13
		engine->destination_node == &(tal->train_server->track_b_nodes[69]) // E6
	){
		return 2;
	} else {
		return 3;
	}
}

void TAL_FeedbackControlSystem(TAL * tal, TrainEngine * engine) {
	double new_speed_setting = engine->granular_speed_setting;

	if (engine->calculated_speed < TARGET_SPEED && engine->granular_speed_setting < STARTUP_TRAIN_SPEED) {
		new_speed_setting = STARTUP_TRAIN_SPEED;
	} else if (engine->calculated_speed < TARGET_SPEED && engine->granular_speed_setting < 11) {
		new_speed_setting += FEEDBACK_CONTROL_SPEED_INCREMENT;
	} else if (engine->calculated_speed > TARGET_SPEED && engine->granular_speed_setting > 8) {
		new_speed_setting += FEEDBACK_CONTROL_SPEED_DECREMENT;
	}
	
	//PrintMessage("Feedback control setting speed to %d for train %d.", new_speed_setting, engine->train_num);
	
	TAL_SetTrainSpeed(tal, new_speed_setting, engine->train_num, 1);
}

void TAL_SetTrainSpeed(TAL * tal, double speed, int train_num, int lights) {
	int slot_num = TrainServer_EngineNumToArrayIndex(tal->train_server, train_num);
	TrainEngine * engine = &tal->train_server->train_engines[slot_num];
	
	engine->granular_speed_setting = speed;
	
	int new_speed_setting = speed;
	
	if (lights) {
		new_speed_setting |= LIGHTS_MASK;
	}
	
	if (tal->train_server->train_engines[slot_num].raw_speed_setting != new_speed_setting) {
		int speed_command = new_speed_setting << 8 | train_num;
		Queue_PushEnd((Queue*) &tal->train_server->train_speed_queue, (QUEUE_ITEM_TYPE) speed_command);
	
		engine->speed_setting = speed;
		engine->raw_speed_setting = new_speed_setting;
	}
}

void TAL_PopulatePath(TAL * tal, TrainEngine * engine, track_node * destination_node) {
	int num_undirected_nodes;
	undirected_node * train_nodes[MAX_NUM_ENGINES];
	
	int i;
	for (i = 0; i < tal->train_server->num_engines; i++) {
		train_nodes[i] = &tal->train_server->train_engines[i].train_node;
	}
	
	if (tal->train_server->current_undirected_nodes == tal->train_server->track_a_undirected_nodes) {
		num_undirected_nodes = tal->train_server->num_track_a_undirected_nodes;
	} else {
		num_undirected_nodes = tal->train_server->num_track_b_undirected_nodes;
	}

	dijkstra(
		engine->undirected_node_path,
		MAX_UNDIRECTED_NODE_PATH,
		&engine->undirected_node_path_length,
		tal->train_server->current_undirected_nodes,
		num_undirected_nodes,
		train_nodes,
		tal->train_server->num_engines,
		&engine->train_node,
		destination_node->undirected_node
	);
}
