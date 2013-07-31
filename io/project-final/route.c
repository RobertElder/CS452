#include "route.h"
#include "robio.h"
#include "memory.h"
#include "public_kernel_interface.h"

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num) {
	int indexed_sensor_num = module_num * SENSORS_PER_MODULE + sensor_num;
	int i;
	for (i = 0; i < TRACK_MAX; i++) {
		track_node * node = &track_nodes[i];
		
		if (node->type == NODE_SENSOR && node->num == indexed_sensor_num) {
			return node;
		}
	}
	
	assertf(0, "SensorToTrackNode: Unknown node for Module=%d, Sensor=%d", module_num, sensor_num);
	return 0;
}

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name) {
	int i;
	for (i = 0; i < TRACK_MAX; i++) {
		track_node * node = &track_nodes[i];
		
		if (m_strcmp(name, node->name) == 0) {
			return node;
		}
	}
	
	return 0;
}

void ReserveTrackNode(track_node * node, int train_num){
	assertf((node->reserved == 0 || node->reserved == train_num),"Attempting to reserve node %s that is reserved to %d.", node->name, train_num);
	assertf((node->reverse->reserved == 0 || node->reverse->reserved == train_num),"Attempting to reserve node %s that is reserved to %d.", node->reverse->name, train_num);
	node->reserved = train_num;
	node->reverse->reserved = train_num;
	//PrintMessage("Reserve %s %s by %d", node->name, node->reverse->name, train_num);
}

void ReleaseTrackNode(track_node * node, int train_num){
	assertf((node->reserved == train_num || node->reserved == 0),"Attempting to release node %s that is reserved to %d instead of %d.", node->name, node->reserved, train_num);
	assertf((node->reverse->reserved == train_num || node->reverse->reserved == 0),"Attempting to release node %s that is reserved to %d instead of %d.", node->reverse->name,node->reverse->reserved, train_num);
	node->reserved = 0;
	node->reverse->reserved = 0;
	//PrintMessage("Release %s %s by %d", node->name, node->reverse->name, train_num);
}

void ReleaseTrackNodes(TrainEngine * engine) {
	assert(0, "ReleaseTrackNodes: obsoleted. Use TAL_ReleaseNodes instead");
	
	int i;
	for (i = 0; i < engine->route_nodes_length; i++) {
		ReleaseTrackNode(engine->route_node_info[i].node, engine->train_num);
	}
}

void ReserveTrackNodes(TrainEngine * engine) {
	assert(0, "ReserveTrackNodes: obsoleted. Use TAL_ReservePathNodes instead");
	
	int i;
	for (i = 0; i < engine->route_nodes_length; i++) {
		ReserveTrackNode(engine->route_node_info[i].node, engine->train_num);
	}
}
