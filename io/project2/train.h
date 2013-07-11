#ifndef TRAIN_H_
#define TRAIN_H_
#include "train_data_structures.h"
#include "tracks/track_data.h"
#include "route.h"

static const char const TRAIN_SERVER_NAME[] = "TrnSvr";
static const char const TRAIN_COMMAND_SERVER_NAME[] = "TCmSvr";
static const char const TRAIN_SERVER_TIMER_NAME[] = "TrSTmr";
static const char const TRAIN_SWITCH_MASTER_NAME[] = "TrSwMr";


void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

void TrainServer_HandleSensorReaderData(TrainServer * server);

void TrainServer_HandleSensorQuery(TrainServer * server);

void TrainServer_HandleSwitchData(TrainServer * server);

void QueueSwitchState(TrainServer * , int , SwitchState);

SwitchState GetQueuedSwitchState(TrainServer *, int);

void TrainServer_HandleSwitchQuery(TrainServer * server);

void TrainServer_HandleSelectTrack(TrainServer * server);

void TrainServer_HandleSetTrain(TrainServer * server, short go_forever);

void TrainServer_HandleSetDestination(TrainServer * server);

void TrainServer_HandleQueryTrainEngine(TrainServer * server);

void TrainServer_HandleTrainEngineClientCommandRequest(TrainServer * server);

void TrainServer_HandleGetSwitchRequest(TrainServer * server);

void TrainServer_HandleSetSwitch(TrainServer * server);

void TrainServer_QueueSwitchStates(TrainServer *, TrainEngine * engine);

void TrainServerTimer_Start();

void TrainCommandServer_Start();

void TrainSensorReader_Start();

void TrainEngineClient_Start();

void TrainEngine_Initialize(TrainEngine * engine, int train_num);

void TrainEngine_SetInitialSwitches();

void TrainSwitchMaster_Start();

int is_sensor_blacklisted(int module_num, int sensor_num, TrainServer * server);

track_node * GetRandomSensorReachableViaDirectedGraph(TrainServer *, track_node *);

track_node * GetRandomSensor(TrainServer *);

#endif
