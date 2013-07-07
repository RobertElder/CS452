#ifndef ROUTE_H_FORWARD_
#define ROUTE_H_FORWARD_
typedef struct RouteNodeInfo RouteNodeInfo;
#define MAX_ROUTE_NODE_INFO 100
#include "train.h"
#endif

#ifndef ROUTE_H_
#define ROUTE_H_
#include "tracks/track_data.h"
#include "random.h"


struct RouteNodeInfo {
	track_node * node;
	track_edge * edge;
	SwitchState switch_state;
};

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num);

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name);

track_node * GetRandomSensor(RNG * rng, track_node * track_nodes);

track_node * GetRandomSensorReachableViaDirectedGraph(RNG *, track_node *, track_node *);

int IsNodeReachableViaDirectedGraph(track_node * , track_node * , track_node * , int );

int QueueSwitchStatesForDirectedPath(SwitchState * , track_node * , track_node * , track_node * , int levels);

int PopulateRouteNodeInfo(RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * end_node, int levels, int array_index, int *);

int DistanceToNextSensor(RouteNodeInfo * info_array, int array_index);

int DistanceToDestination(RouteNodeInfo * info_array, int array_index, track_node * destination_node);

track_node * GetNextSensor(RouteNodeInfo * info_array, int array_index);

#endif
