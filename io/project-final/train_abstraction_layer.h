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

track_node * TAL_GetNextNode(TAL * tal, TrainEngine * engine);

void TAL_SetTrainWait(TAL * tal, TrainEngine * engine, int seconds);

int TAL_IsTrainWaiting(TAL * tal, TrainEngine * engine);

int TAL_IsNextNodeAvailable(TAL * tal, TrainEngine * engine);

SwitchState TAL_GetSwitchState(TAL * tal, int switch_num);

int TAL_GetSlowSpeedSetting(TAL * tal, TrainEngine * engine);

void TAL_FeedbackControlSystem(TAL * tal, TrainEngine * engine);

void TAL_SetTrainSpeed(TAL * tal, double speed, int train_num, int lights);

#endif
