#ifndef ROUTE_H_
#define ROUTE_H_
#include "train_data_structures.h"
#include "tracks/track_data.h"
#include "random.h"

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num);

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name);


int QueueSwitchStatesForDirectedPath(SwitchState * , track_node * , track_node * , track_node * , int levels);

int PopulateRouteNodeInfo(RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * end_node, int levels, int array_index, int *);



#endif
