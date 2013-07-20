
#include "../track_data.h"
#include "assert.h"
#include "string.h"

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
	/*
	assert(node->adjacent_nodes.num_adjacent_nodes < 3);
	//  These are the candidate directed nodes that are connected to this
	track_node * n1 = 0;
	track_node * n2 = 0;
	track_node * n3 = 0;

	//  
	if(node->type == NODE_SWITCH){
		if(node->track_node1->type == BRANCH_NODE)
			n3 = 
		}else if(node->track_node1->type == BRANCH_NODE){
		}else{
		}
	}
	
	
	undirected_edge edge_to_add;
	edge_to_add->next_node = node_to_add;
	edge_to_add->micrometers_distance = n1->undirected_node == node_to_add ? n1->:;
	
	node->adjacent_nodes.edge[node->adjacent_nodes.num_adjacent_nodes] = 
	node->adjacent_nodes.num_adjacent_nodes = node->adjacent_nodes.num_adjacent_nodes +1;
	*/
	
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

		if(undirected_nodes[i].type == NODE_SWITCH){
			
		}else{
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
