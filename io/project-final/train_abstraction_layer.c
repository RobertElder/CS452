#include "train_abstraction_layer.h"
#include "route.h"

void TAL_Initialize(TAL * tal, TrainServer * server) {
	tal->train_server = server;
}

void TAL_SetTrack(TAL * tal, char name) {}

void TAL_SetNumEngines(TAL * tal, int num_engines) {}

void TAL_InitializeTrainEngineSlot(TAL * tal, int train_num, int slot_num) {}

void TAL_SetTrainSpeed(TAL * tal, int train_num, double speed, int lights) {}

double TAL_GetTrainSpeed(TAL * tal, int train_num) {return 0;}

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
	
	return 0;
}

void TAL_CalculateTrainLocation(TAL * tal, int train_num) {}

void TAL_SetInitialTrainLocation(TAL * tal, int train_num) {}

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

undirected_node * TAL_GetLikelyTrainSensor(TAL * tal, int train_num) {return 0;}

undirected_node * TAL_GetNextNode(TAL * tal, int train_num) {return 0;}

void TAL_SetTrainLocation(TAL * tal, int train_num) {}

void TAL_SetTrainWait(TAL * tal, TrainEngine * engine, int seconds) {
	engine->wait_until = TimeSeconds() + seconds;
}

int TAL_IsTrainWaiting(TAL * tal, TrainEngine * engine) {
	return (engine->wait_until > TimeSeconds());
}

