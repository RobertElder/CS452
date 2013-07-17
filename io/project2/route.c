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







int QueueSwitchStatesForDirectedPath(SwitchState * switch_queue, track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels, int train_num) {
	assert(0,"This function is not used anymore.");	
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if (!(start_node->reserved == train_num)){
		return 0;
	}

	if(start_node == dest_node){
		return 1;
	}else if(start_node->type == NODE_MERGE){
		return QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, train_num);
	}else if(start_node->type == NODE_SENSOR){
		return QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, train_num);
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		int rtn1 = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1, train_num);
		int rtn2 = 0;	
		//  If we found a route with the first path, don't go the other route too
		if(!rtn1){
			rtn2 = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1, train_num);
		}
		if(rtn1){
			//  We need to switch this one to get to our destination
			assertf((switch_queue[start_node->num] == SWITCH_UNKNOWN),"This path requires that switch %d be set twice.",start_node->num);
			switch_queue[start_node->num] = SWITCH_STRAIGHT;
		}else if (rtn2){
			assertf((switch_queue[start_node->num] == SWITCH_UNKNOWN),"This path requires that switch %d be set twice.",start_node->num);
			switch_queue[start_node->num] = SWITCH_CURVED;
		}
		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}

}

int PopulateRouteNodeInfo(RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels, int array_index, int * route_nodes_length, int train_num) {
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if (start_node->reserved){
		return 0;
	}

	if(start_node == dest_node){
		*route_nodes_length = (*route_nodes_length) + 1;
		assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
		info_array[array_index].node = start_node;
		info_array[array_index].switch_state = SWITCH_UNKNOWN;
		info_array[array_index].edge = 0;
		return 1;
	}else if(start_node->type == NODE_MERGE){
		int r = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		
		if (r) {
			*route_nodes_length = (*route_nodes_length) + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_UNKNOWN;
			info_array[array_index].edge = &start_node->edge[DIR_AHEAD];
		}
		
		return r;
	}else if(start_node->type == NODE_SENSOR){
		int r = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		if(r){
			*route_nodes_length = (*route_nodes_length) + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_UNKNOWN;
			info_array[array_index].edge = &start_node->edge[DIR_AHEAD];
		}
		return r;
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		//  Save this for when we search the two possibilities
		int current_route_length = *route_nodes_length;
		int rtn1 = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		int route_length_1 = *route_nodes_length;
		*route_nodes_length = current_route_length;
		int rtn2 = 0;
		int route_length_2 = 0;
		//  Don't do crazy stuff and overwrite the path if we find 2 paths
		if(!rtn1){
			rtn2 = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
			route_length_2 = *route_nodes_length;
		}

		if(rtn1){
			*route_nodes_length = route_length_1 + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_STRAIGHT;
			info_array[array_index].edge = &start_node->edge[DIR_STRAIGHT];
		}else if (rtn2){
			*route_nodes_length = route_length_2 + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_CURVED;
			info_array[array_index].edge = &start_node->edge[DIR_CURVED];
		}
		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}
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


