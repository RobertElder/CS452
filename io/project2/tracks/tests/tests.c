
#include "../track_data.h"
#include "assert.h"
#include "string.h"
#include <stdio.h>

void set_references(track_node * track_nodes, undirected_node * undirected_nodes, int * num_undirected_nodes){
	/* This function will set all the references of undirected nodes to directed ones and vice versa */
  	memset(undirected_nodes, 0, TRACK_MAX*sizeof(undirected_node));
	int i;
	//  Put references to the directed nodes from the undirected ones, and vice versa
	for(i = 0; i < TRACK_MAX; i++){
		//  If this track node has been initialized (not all of the array is used)
		if(track_nodes[i].reverse){
			//  Get the pointer and reverse pointer for this undirected node
			track_node * directed_node1 = &(track_nodes[i]);
			track_node * directed_node2 = directed_node1->reverse;

			//  If there is no undirected node set for this pair, set one
			if(!(directed_node1->undirected_node)){
				assert(!(directed_node2->undirected_node));
				undirected_node * undirected_node_ptr = &(undirected_nodes[*num_undirected_nodes]);
				*num_undirected_nodes = *num_undirected_nodes + 1;

				directed_node1->undirected_node = undirected_node_ptr;
				directed_node2->undirected_node = undirected_node_ptr;
				//  Directed node now points to directed one


				if(directed_node1 < directed_node2){
					undirected_node_ptr->track_node1 = directed_node1;
					undirected_node_ptr->track_node2 = directed_node2;
				}else if(directed_node1 > directed_node2){
					undirected_node_ptr->track_node2 = directed_node1;
					undirected_node_ptr->track_node1 = directed_node2;
				}else{
					assert(0);
				}
				//  Undirected node now points to directed ones.
			}
		}
	}
}

void add_adjacent_undirected_node(undirected_node * node, undirected_node * node_to_add){
	
	/* This function assumes that the node_to_add is in the directed graph and is connected to the node*/
	//  These are the candidate directed nodes that are connected to this
	track_edge * e1 = 0;
	track_edge * e2 = 0;
	track_edge * e3 = 0;

	//  The simple next and last nodes
	e1 = &(node->track_node1->edge[DIR_AHEAD]);
	e2 = &(node->track_node2->edge[DIR_AHEAD]);

	//  The possible third one
	if(node->type == NODE_SWITCH){
		//  If this is a switch, one of the directions should have a curve
		if(node->track_node1->type == NODE_BRANCH){
			e3 = &(node->track_node1->edge[DIR_CURVED]);
		}else if(node->track_node2->type == NODE_BRANCH){
			e3 = &(node->track_node2->edge[DIR_CURVED]);
		}else{
			assert(0);
		}
	}

	int matching_nodes = 0;
	int matching_distance = 0;
	if(e1->dest && (e1->dest->undirected_node == node_to_add)){
		matching_nodes++;
		matching_distance = e1->dist;
	}
	if(e2->dest && (e2->dest->undirected_node == node_to_add)){
		matching_nodes++;
		matching_distance = e2->dist;
	}
	if(e3 && e3->dest && (e3->dest->undirected_node == node_to_add)){
		matching_nodes++;
		matching_distance = e3->dist;
	}

	assert(matching_nodes == 1);

	assert(node->adjacent_nodes.num_adjacent_nodes < 3);
	
	undirected_edge edge_to_add;
	edge_to_add.next_node = node_to_add;
	edge_to_add.micrometers_distance = matching_distance * 1000;
	
	node->adjacent_nodes.edge[node->adjacent_nodes.num_adjacent_nodes] = edge_to_add;
	node->adjacent_nodes.num_adjacent_nodes = node->adjacent_nodes.num_adjacent_nodes +1;
}

void set_adjacency_lists(undirected_node * undirected_nodes, int * num_undirected_nodes){
	int i;
	for(i = 0; i < *num_undirected_nodes; i++){
		//  Figure out what node type the undirected node is.
		assert(undirected_nodes[i].track_node1);
		if(undirected_nodes[i].track_node1->type == NODE_SENSOR){
			undirected_nodes[i].type = NODE_SENSOR;
		}else if(undirected_nodes[i].track_node1->type == NODE_MERGE || undirected_nodes[i].track_node1->type == NODE_BRANCH){
			undirected_nodes[i].type = NODE_SWITCH;
		}else if(undirected_nodes[i].track_node1->type == NODE_ENTER || undirected_nodes[i].track_node1->type == NODE_EXIT){
			undirected_nodes[i].type = NODE_END;
		}else{
			assert(0);
		}

		if(undirected_nodes[i].track_node1->edge[DIR_STRAIGHT].dest){
			add_adjacent_undirected_node(&(undirected_nodes[i]), undirected_nodes[i].track_node1->edge[DIR_STRAIGHT].dest->undirected_node);
		}
		if(undirected_nodes[i].track_node2->edge[DIR_STRAIGHT].dest){
			add_adjacent_undirected_node(&(undirected_nodes[i]), undirected_nodes[i].track_node2->edge[DIR_STRAIGHT].dest->undirected_node);
		}
		if(undirected_nodes[i].type == NODE_SWITCH){
			if(undirected_nodes[i].track_node1->type == NODE_BRANCH){
				add_adjacent_undirected_node(&(undirected_nodes[i]), undirected_nodes[i].track_node1->edge[DIR_CURVED].dest->undirected_node);
			}else if(undirected_nodes[i].track_node2->type == NODE_BRANCH){
				add_adjacent_undirected_node(&(undirected_nodes[i]), undirected_nodes[i].track_node2->edge[DIR_CURVED].dest->undirected_node);
			}else{
				assert(0);
			}
		}
	}
}

void init_undirected_nodes(track_node * track_nodes, undirected_node * undirected_nodes, int * num_undirected_nodes){
	set_references(track_nodes, undirected_nodes, num_undirected_nodes);
	set_adjacency_lists(undirected_nodes, num_undirected_nodes);
}

int add_all_distances(undirected_node * undirected_nodes, int num_undirected_nodes){
	//  Use this as a kind of hashing function to make sure that preconditions and post-conditions are true.
	//  The value this returns for a given map should never change.
	int total = 0;
	int i;
	for(i = 0; i < num_undirected_nodes; i++){
		int j;
		for(j = 0; j < undirected_nodes[i].adjacent_nodes.num_adjacent_nodes; j++){
			total += undirected_nodes[i].adjacent_nodes.edge[j].micrometers_distance;
		}
	}
	return total;
}

void add_train_node(undirected_node * train, undirected_node * src, undirected_node * dst, int distance){
	assert(train->type == NODE_TRAIN);
	//  Will insert the train node into the graph at 'distance' after src on the way to dst.
	int i;
	int edge_src_index = -1;
	for(i = 0; i < src->adjacent_nodes.num_adjacent_nodes; i++){
		if(src->adjacent_nodes.edge[i].next_node == dst){
			edge_src_index = i;
		}
	}
	//  Should be found
	assert(edge_src_index != -1);

	int edge_dst_index = -1;
	for(i = 0; i < dst->adjacent_nodes.num_adjacent_nodes; i++){
		if(dst->adjacent_nodes.edge[i].next_node == src){
			edge_dst_index = i;
		}
	}

	//  Should be found
	assert(edge_dst_index != -1);
	//  The distances should be the same either way, if not something broke
	assert(src->adjacent_nodes.edge[edge_src_index].micrometers_distance == dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance);

	int total_distance = src->adjacent_nodes.edge[edge_src_index].micrometers_distance;

	assert(distance < total_distance);
	assert(distance > 0);

	int distance_src_to_train = distance;
	int distance_train_to_dst = total_distance - distance;

	//  Src points to train, not dst 
	src->adjacent_nodes.edge[edge_src_index].micrometers_distance = distance_src_to_train;
	src->adjacent_nodes.edge[edge_src_index].next_node = train;
	//  Dst points to train, not src
	dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance = distance_train_to_dst;
	dst->adjacent_nodes.edge[edge_dst_index].next_node = train;

	train->track_node1 = 0;
	train->track_node2 = 0;

	//  The train is always adjacent to exactly 2 nodes at once.
	train->adjacent_nodes.num_adjacent_nodes = 2;
	train->adjacent_nodes.edge[0].next_node = src;
	train->adjacent_nodes.edge[0].micrometers_distance = distance_src_to_train;
	train->adjacent_nodes.edge[1].next_node = dst;
	train->adjacent_nodes.edge[1].micrometers_distance = distance_train_to_dst;

	//  We don't update anything in the underlying direced graph here because we don't care about trains there.
}

void remove_train_node(undirected_node * train, undirected_node * src, undirected_node * dst){
	assert(train->type == NODE_TRAIN);
	//  Will insert the train node into the graph at 'distance' after src on the way to dst.
	int i;
	int edge_src_index = -1;
	for(i = 0; i < src->adjacent_nodes.num_adjacent_nodes; i++){
		if(src->adjacent_nodes.edge[i].next_node == train){
			edge_src_index = i;
		}
	}
	//  Should be found
	assert(edge_src_index != -1);

	int edge_dst_index = -1;
	for(i = 0; i < dst->adjacent_nodes.num_adjacent_nodes; i++){
		if(dst->adjacent_nodes.edge[i].next_node == train){
			edge_dst_index = i;
		}
	}

	//  Should be found
	assert(edge_dst_index != -1);

	//  Recalculate the total distance.
	int total_distance = dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance + src->adjacent_nodes.edge[edge_src_index].micrometers_distance;
	src->adjacent_nodes.edge[edge_src_index].micrometers_distance = total_distance;
	src->adjacent_nodes.edge[edge_src_index].next_node = dst;
	dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance = total_distance;
	dst->adjacent_nodes.edge[edge_dst_index].next_node = src;

	train->track_node1 = 0;
	train->track_node2 = 0;

	train->adjacent_nodes.num_adjacent_nodes = 0;
	train->adjacent_nodes.edge[0].next_node = 0;
	train->adjacent_nodes.edge[0].micrometers_distance = 0;
	train->adjacent_nodes.edge[1].next_node = 0;
	train->adjacent_nodes.edge[1].micrometers_distance = 0;
}

int main() {
	track_node track_a_nodes[TRACK_MAX];
	track_node track_b_nodes[TRACK_MAX];
	init_tracka(track_a_nodes);
	init_trackb(track_b_nodes);

	undirected_node track_a_undirected_nodes[TRACK_MAX];
	undirected_node track_b_undirected_nodes[TRACK_MAX];

	int num_track_a_undirected_nodes = 0;
	int num_track_b_undirected_nodes = 0;

	init_undirected_nodes(track_a_nodes, track_a_undirected_nodes, &num_track_a_undirected_nodes);
	init_undirected_nodes(track_b_nodes, track_b_undirected_nodes, &num_track_b_undirected_nodes);

	int track_a_length = add_all_distances(track_a_undirected_nodes, num_track_a_undirected_nodes);
	int track_b_length = add_all_distances(track_b_undirected_nodes, num_track_b_undirected_nodes);
	printf("Total distance in track a is %d\n", track_a_length);
	printf("Total distance in track b is %d\n", track_b_length);

	undirected_node train_1_node;
  	memset(&train_1_node, 0, sizeof(undirected_node));
	train_1_node.type = NODE_TRAIN;
	
	undirected_node * node_1 = &track_a_undirected_nodes[0];
	undirected_node * node_2 = node_1->adjacent_nodes.edge[0].next_node;

	add_train_node(&train_1_node, node_1, node_2, 300);
	remove_train_node(&train_1_node, node_1, node_2);
}
