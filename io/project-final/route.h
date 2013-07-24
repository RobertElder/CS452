#ifndef ROUTE_H_
#define ROUTE_H_
#include "train_data_structures.h"
#include "tracks/track_data.h"
#include "random.h"

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num);

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name);

void ReleaseTrackNodes(TrainEngine * engine);

void ReleaseTrackNode(track_node *, int);

void ReserveTrackNodes(TrainEngine * engine);

void ReserveTrackNode(track_node *, int);

#endif
