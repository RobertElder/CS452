
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
}
