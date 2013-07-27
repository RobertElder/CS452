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

void TrainServer_HandleSetNumEngines(TrainServer * server);

void TrainServer_HandleResetTrack(TrainServer * server);

void TrainServer_HandleSetDijkstras(TrainServer * server);

void TrainServer_QueueSwitchStates(TrainServer *, TrainEngine * engine);

int TrainServer_EngineNumToArrayIndex(TrainServer *, int train_num);

int TrainServer_NumActivatedEngines(TrainServer * server);

void TrainServerTimer_Start();

void TrainCommandServer_Start();

void TrainSensorReader_Start();

void TrainEngineClient_Start();

void TrainEngine_Initialize(TrainEngine * engine, int train_num);

void TrainEngine_SetInitialSwitches();

void TrainSwitchMaster_Start();

track_node * GetRandomSensorReachableViaDirectedGraph(TrainServer *, track_node *, int train_num);

track_node * GetRandomSensor(TrainServer *);

int IsNodeReachableViaDirectedGraph(TrainServer * , int train_num, track_node * , track_node * , int );

int PopulateRouteNodeInfo(TrainServer * server, RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * end_node, int levels, int array_index, int *, int);

void TrainServer_ProcessEngines(TrainServer *);

void TrainServer_ConsiderReplyToTrainSensorReader(TrainServer * server);

#endif

