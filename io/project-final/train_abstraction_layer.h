#ifndef TRAIN_ABSTRACTION_LAYER_H_
#define TRAIN_ABSTRACTION_LAYER_H_
#include "train_data_structures.h"
#include "tracks/track_node.h"

typedef struct TrainAbstractionLayer {
	TrainServer * train_server;
} TAL;

void TAL_Initialize(TAL * tal, TrainServer * server);

void TAL_SetTrack(TAL * tal, char name);

void TAL_SetNumEngines(TAL * tal, int num_engines);

void TAL_InitializeTrainEngineSlot(TAL * tal, int train_num, int slot_num);

void TAL_SetTrainSpeed(TAL * tal, int train_num, double speed, int lights);

double TAL_GetTrainSpeed(TAL * tal, int train_num);

int TAL_IsSensorFaulty(TAL * tal, int module_num, int sensor_num);

int TAL_IsSwitchFaulty(TAL * tal, int switch_num);

int TAL_IsDestinationNodeBad(TAL * tal, undirected_node * node);

void TAL_CalculateTrainLocation(TAL * tal, int train_num);

void TAL_SetInitialTrainLocation(TAL * tal, int train_num);

undirected_node * TAL_GetLikelyTrainSensor(TAL * tal, int train_num);

undirected_node * TAL_GetNextNode(TAL * tal, int train_num);

void TAL_SetTrainLocation(TAL * tal, int train_num);


#endif
