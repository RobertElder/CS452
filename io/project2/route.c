#include "route.h"
#include "robio.h"
#include "memory.h"

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

void ReserveTrackNodes(TrainEngine * engine) {
	//  Reserve the node(s) at the start of the path
	track_node * first_node = engine->route_node_info[0].node;
	first_node->reverse->reserved = engine->train_num;
	if(first_node->type == NODE_BRANCH){
		first_node->reverse->reserved = engine->train_num;
	}

	int i;
	for (i = 0; i < engine->route_nodes_length; i++) {
		track_node * node = engine->route_node_info[i].node;
		node->reserved = engine->train_num;
	}

	//  Reserve the node(s) at the start of the path
	track_node * last_node = engine->route_node_info[engine->route_nodes_length -1].node;
	last_node->edge[DIR_AHEAD].dest->reserved = engine->train_num;
	if(last_node->type == NODE_BRANCH){
		last_node->edge[DIR_CURVED].dest->reserved = engine->train_num;
	}
}

void ReleaseTrackNodes(TrainEngine * engine) {
	//  Reserve the node(s) at the start of the path
	track_node * first_node = engine->route_node_info[0].node;
	assert(first_node->reverse->reserved == engine->train_num,"Attempting to release a node that I don't own");
	first_node->reverse->reserved = 0;
	if(first_node->type == NODE_BRANCH){
		assert(first_node->reverse->reserved == engine->train_num,"Attempting to release a node that I don't own");
		first_node->reverse->reserved = 0;
	}

	int i;
	for (i = 0; i < engine->route_nodes_length; i++) {
		track_node * node = engine->route_node_info[i].node;
		assert(node->reserved == engine->train_num,"Attempting to release a node that I don't own");
		node->reserved = 0;
	}

	//  Reserve the node(s) at the start of the path
	track_node * last_node = engine->route_node_info[engine->route_nodes_length -1].node;
	assert(last_node->edge[DIR_AHEAD].dest->reserved == engine->train_num,"Attempting to release a node that I don't own");
	last_node->edge[DIR_AHEAD].dest->reserved = 0;
	if(last_node->type == NODE_BRANCH){
		assert(last_node->edge[DIR_CURVED].dest->reserved == engine->train_num,"Attempting to release a node that I don't own");
		last_node->edge[DIR_CURVED].dest->reserved = 0;
	}
}


