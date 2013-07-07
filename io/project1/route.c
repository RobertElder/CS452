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

track_node * GetRandomSensor(RNG * rng, track_node * track_nodes) {
	while(1){
		int index = RNG_Get(rng) % TRACK_MAX;
		if(track_nodes[index].reverse && track_nodes[index].type == NODE_SENSOR){
			return &(track_nodes[index]);
		}
	}

}

track_node * GetRandomSensorReachableViaDirectedGraph(RNG * rng, track_node * track_nodes, track_node * start_node) {
	int i = 0;
	while(1){
		track_node * random_sensor = GetRandomSensor(rng, track_nodes);
		if(random_sensor != start_node && IsNodeReachableViaDirectedGraph(track_nodes, start_node, random_sensor, 0)){
			return random_sensor;
		}
		i++;
		//assert(i < 100, "Unable to find a sensor that was reachable via the directed graph in current direction.");
		
		if (i > 100) {
			return 0;
		}
	}
}

int IsNodeReachableViaDirectedGraph(track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels) {
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if(start_node == dest_node){
		return 1;
	}else if(start_node->type == NODE_MERGE){
		return IsNodeReachableViaDirectedGraph(track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
	}else if(start_node->type == NODE_SENSOR){
		return IsNodeReachableViaDirectedGraph(track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		int rtn1 = IsNodeReachableViaDirectedGraph(track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1);
		int rtn2 = IsNodeReachableViaDirectedGraph(track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1);
		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}
}

int QueueSwitchStatesForDirectedPath(SwitchState * switch_queue, track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels) {
	
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if(start_node == dest_node){
		return 1;
	}else if(start_node->type == NODE_MERGE){
		int r = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
		if(r){
		}
		return r;
	}else if(start_node->type == NODE_SENSOR){
		int r = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
		if(r){
		}
		return r;
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		int rtn1 = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1);
		int rtn2 = QueueSwitchStatesForDirectedPath(switch_queue, track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1);
		if(rtn1){
			//  We need to switch this one to get to our destination
			assertf((switch_queue[start_node->num] == SWITCH_UNKNOWN),"This path requires that switch %d be set twice.",start_node->num);
			switch_queue[start_node->num] = SWITCH_STRAIGHT;
		}else if (rtn2){
//			assertf((switch_queue[start_node->num] == SWITCH_UNKNOWN),"This path requires that switch %d be set twice.",start_node->num);
			switch_queue[start_node->num] = SWITCH_CURVED;
		}
		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}

}

int PopulateRouteNodeInfo(RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels, int array_index, int * route_nodes_length) {
	//  Don't go too deep
	if (levels > 20){
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
		int r = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length);
		
		if (r) {
			*route_nodes_length = (*route_nodes_length) + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_UNKNOWN;
			info_array[array_index].edge = &start_node->edge[DIR_AHEAD];
		}
		
		return r;
	}else if(start_node->type == NODE_SENSOR){
		int r = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length);
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
		int rtn1 = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1, array_index + 1, route_nodes_length);
		int route_length_1 = *route_nodes_length;
		*route_nodes_length = current_route_length;
		int rtn2 = PopulateRouteNodeInfo(info_array, track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1, array_index + 1, route_nodes_length);
		int route_length_2 = *route_nodes_length;
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

int DistanceToNextSensor(RouteNodeInfo * info_array, int array_index) {
	int distance = 0;
	int i;
	
	for (i = array_index; i < MAX_ROUTE_NODE_INFO; i++) {
		RouteNodeInfo info = info_array[i];
		
		if (info.node->type == NODE_SENSOR && i != array_index) {
			break;
		}
		
		distance += info.edge->dist;
	}
	
	return distance;
}

int DistanceToDestination(RouteNodeInfo * info_array, int array_index, track_node * destination_node) {
	int distance = 0;
	int i;
	
	for (i = array_index; i < MAX_ROUTE_NODE_INFO; i++) {
		RouteNodeInfo info = info_array[i];
		
		if (info.node == destination_node) {
			break;
		}
		
		distance += info.edge->dist;
	}
	
	return distance;
}

track_node * GetNextSensor(RouteNodeInfo * info_array, int array_index) {
	int i;
	
	for (i = array_index; i < MAX_ROUTE_NODE_INFO; i++) {
		RouteNodeInfo info = info_array[i];
		
		if (info.node->type == NODE_SENSOR && i != array_index) {
			return info.node;
		}
		
	}
	
	return 0;
}
