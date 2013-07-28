#ifndef TRAIN_LOGIC_H_
#define TRAIN_LOGIC_H_
#include "train_data_structures.h"

void TrainServer_ProcessEngine(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineResyncPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineWaitForDestination(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineGotDestination(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineWaitForAllReady(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineNearDestination(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineCalibratingSpeed(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineWaitAndGoForever(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineReverseAndTryAgain(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineWaitForReservation(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineWrongLocation(TrainServer * server, TrainEngine * engine);

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine);

void TrainServer_TrainProceedOrWait(TrainServer * server, TrainEngine * engine);

int DistanceToNextSensor(TrainEngine * engine);

int DistanceToNextSwitch(TrainEngine * engine);

int DistanceToDestination(TrainEngine * engine);

track_node * GetNextSensor(TrainEngine * engine);

track_node * GetNextSwitch(TrainEngine * engine);

SwitchState GetNextSwitchState(TrainEngine * engine);

int TrainServer_UpdateRouteIndex(TrainServer * server, TrainEngine * engine);

#endif
