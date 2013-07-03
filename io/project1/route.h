#include "tracks/track_data.h"
#include "random.h"
#include "train.h"

#ifndef ROUTE_H_
#define ROUTE_H_

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num);

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name);

track_node * GetRandomSensor(RNG * rng, track_node * track_nodes);

track_node * GetRandomSensorReachableViaDirectedGraph(RNG *, track_node *, track_node *);

int IsNodeReachableViaDirectedGraph(track_node * , track_node * , track_node * , int );

int QueueSwitchStatesForDirectedPath(SwitchState * , track_node * , track_node * , track_node * , int levels);

#endif
