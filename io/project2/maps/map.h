#include "../train.h"

#ifndef MAP_H_
#define MAP_H_

typedef struct TrainMapLabelPosition {
	int row;
	int col;
	int ascii_offset;
} TrainMapLabelPosition;

typedef struct TrainMap {
	char * ascii;
	TrainMapLabelPosition switches[256];
	TrainMapLabelPosition sensors[(SENSOR_MODULE_A + SENSOR_MODULE_E) * 256];
} TrainMap;


#endif
