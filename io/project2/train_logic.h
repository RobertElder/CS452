#ifndef TRAIN_LOGIC_H_
#define TRAIN_LOGIC_H_
#include "train_data_structures.h"

void TrainServer_ProcessEngine(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineCalibratingSpeed(TrainServer * server, TrainEngine * engine);

track_node * TrainServer_GetEnginePosition(TrainServer * server);

void TrainServer_SetTrainSpeed(TrainServer * server, int speed, int train_num);

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine);

#endif
