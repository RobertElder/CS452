#ifndef TRAIN_ABSTRACTION_LAYER_H_
#define TRAIN_ABSTRACTION_LAYER_H_
#include "train_data_structures.h"
#include "tracks/track_node.h"
#include "public_kernel_interface.h"

void TAL_Initialize(TAL * tal, TrainServer * server);

int TAL_IsSensorFaulty(TAL * tal, int module_num, int sensor_num);

int TAL_IsSwitchFaulty(TAL * tal, int switch_num);

int TAL_IsDestinationSensorBad(TAL * tal, int module_num, int sensor_num);

void TAL_CalculateTrainSpeedBySensor(TAL * tal, TrainEngine * engine);

void TAL_CalculateTrainSpeedByGuessing(TAL * tal, TrainEngine * engine);

void TAL_CalculateTrainLocation(TAL * tal, TrainEngine * engine);

void TAL_SetInitialTrainLocation(TAL * tal, TrainEngine * engine, track_node * node);

void TAL_TransitionToNextNode(TAL * tal, TrainEngine * engine, track_node * node);

track_node * TAL_GetUnreservedSensor(TAL * tal);

track_node * TAL_GetTrainReservedSensor(TAL * tal, int train_num);

track_node * TAL_GetNextNode(TAL * tal, track_node * node);

int TAL_DistanceToNextNode(TAL * tal, TrainEngine * engine);

void TAL_SetTrainWait(TAL * tal, TrainEngine * engine, int seconds);

int TAL_IsTrainWaiting(TAL * tal, TrainEngine * engine);

int TAL_IsNextNodeAvailable(TAL * tal, TrainEngine * engine);

SwitchState TAL_GetSwitchState(TAL * tal, int switch_num);

int TAL_GetSlowSpeedSetting(TAL * tal, TrainEngine * engine);

void TAL_FeedbackControlSystem(TAL * tal, TrainEngine * engine);

void TAL_SetTrainSpeed(TAL * tal, double speed, int train_num, int lights);

void TAL_PopulatePath(TAL * tal, TrainEngine * engine);

track_node * TAL_UndirectedNodeToTrackNode(TAL * tal, undirected_node * node, undirected_node * next);

void TAL_PrepareNextSwitch(TAL * tal, TrainEngine * engine);

void TAL_ReserveNode(TAL * tal, TrainEngine * engine, track_node * node);

void TAL_ReleaseNodes(TAL * tal, TrainEngine * engine, int num_to_keep);

void TAL_ReservePathNodes(TAL * tal, TrainEngine * engine);

void TAL_ReverseTrain(TAL * tal, TrainEngine * engine, int restart_speed);

void TAL_AddPoints(TAL * tal, TrainEngine * engine, int points);

int TAL_DistanceToNode(TAL * tal, track_node * source_node, track_node * dest_node);

track_node * TAL_GetNearestSensor(TAL * tal, track_node * node, int * sensor_distance);

track_node * TAL_GetNearestSensorByAttribution(TAL * tal, TrainEngine * engine);

#endif
