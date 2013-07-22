#include "undirected_nodes.h"
#include "../track_data.h"
#include "../track_node.h"

#ifdef TESTS

#include "assert.h"
#include "string.h"
#include <stdio.h>
#include <stdlib.h>

#define assertf(a,b) assert(a)

#else

#define printf(format, args...) PrintMessage(format, args)

#endif

int get_edge_index(undirected_node * src, undirected_node * target){
	int i;
	int edge_src_index = -1;
	for(i = 0; i < src->adjacent_nodes.num_adjacent_nodes; i++){
		if(src->adjacent_nodes.edge[i].next_node == target){
			edge_src_index = i;
		}
	}
	return edge_src_index;
}

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
				assertf(!(directed_node2->undirected_node),"Overwriting the directed node for pair.");
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
					assertf(0,"Should not reach this point.");
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
			assertf(0,"Impossible case.");
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

	assertf(matching_nodes == 1,"There is a number of matching nodes different than 1.");

	assertf(node->adjacent_nodes.num_adjacent_nodes < 3, "There should not be more than 3 adjacent nodes.");
	
	undirected_edge edge_to_add;
	edge_to_add.next_node = node_to_add;
	edge_to_add.micrometers_distance = matching_distance * 1000;
	
	node->adjacent_nodes.edge[node->adjacent_nodes.num_adjacent_nodes] = edge_to_add;
	node->adjacent_nodes.num_adjacent_nodes = node->adjacent_nodes.num_adjacent_nodes +1;
}

void sanity_check_distances(undirected_node * undirected_nodes, int * num_undirected_nodes){
	int i;
	//  Make sure distances are commutative (sanity check)
	for(i = 0; i < *num_undirected_nodes; i++){
		int j;
		for(j = 0; j < undirected_nodes[i].adjacent_nodes.num_adjacent_nodes; j++){
			undirected_node * other_node = undirected_nodes[i].adjacent_nodes.edge[j].next_node;
			//  Get the edge index that brings us back to this node in the other node
			int index = get_edge_index(other_node, &undirected_nodes[i]);
			assertf(undirected_nodes[i].adjacent_nodes.edge[j].micrometers_distance == other_node->adjacent_nodes.edge[index].micrometers_distance, "Distances were different.");
		}
	}
}

void set_adjacency_lists(undirected_node * undirected_nodes, int * num_undirected_nodes){
	int i;
	for(i = 0; i < *num_undirected_nodes; i++){
		//  Figure out what node type the undirected node is.
		assertf(undirected_nodes[i].track_node1, "track node 1 not set.");
		if(undirected_nodes[i].track_node1->type == NODE_SENSOR){
			undirected_nodes[i].type = NODE_SENSOR;
		}else if(undirected_nodes[i].track_node1->type == NODE_MERGE || undirected_nodes[i].track_node1->type == NODE_BRANCH){
			undirected_nodes[i].type = NODE_SWITCH;
		}else if(undirected_nodes[i].track_node1->type == NODE_ENTER || undirected_nodes[i].track_node1->type == NODE_EXIT){
			undirected_nodes[i].type = NODE_END;
		}else{
			assertf(0,"Impossible case.");
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
				assertf(0,"Impossible case.");
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
	assertf(train->type == NODE_TRAIN, "Not a train node.");
	//  Will insert the train node into the graph at 'distance' after src on the way to dst.
	int i;
	int edge_src_index = get_edge_index(src, dst);
	assertf(edge_src_index != -1, "src edge not found.");

	int edge_dst_index = get_edge_index(dst, src);
	assertf(edge_dst_index != -1, "dst edge not found.");

	//  The distances should be the same either way, if not something broke
	assertf(src->adjacent_nodes.edge[edge_src_index].micrometers_distance == dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance, "distance was different.");

	int total_distance = src->adjacent_nodes.edge[edge_src_index].micrometers_distance;

	assertf(distance < total_distance, "We don't support adding distances that are that large yet.");
	assertf(distance > 0,"You shouldn't add a negative distance.");

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
	assertf(train->type == NODE_TRAIN, "not a train node.");
	//  Will insert the train node into the graph at 'distance' after src on the way to dst.
	int i;
	int edge_src_index = get_edge_index(src, train);
	assertf(edge_src_index != -1, "src edge not found");

	int edge_dst_index = get_edge_index(dst, train);
	assertf(edge_dst_index != -1, "dst edge not found");

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

void print_move_over_statement(undirected_node * n1, undirected_node * n2){
#ifdef TESTS
	printf("Train moving over ");

	if(n1->track_node1 && n1->track_node1){
		printf("%s/%s", n1->track_node1->name, n1->track_node2->name);
	}else{
		printf("train");
	}

	printf(" toward ");

	if(n2->track_node1 && n2->track_node1){
		printf("%s/%s", n2->track_node1->name, n2->track_node2->name);
	}else{
		printf("train");
	}

	printf(".\n");
#endif
}

void move_train_distance(undirected_node * train, undirected_node * src, undirected_node * dst, undirected_node * preferred, int distance){
	//  Moves a train forward 'distance' micrometers on the route from src to dst.
	//  If the movement takes the train over a switch, we will go toward the preferred node.

	if(distance == 0)
		return;

	int edge_src_index = get_edge_index(src, train);
	assertf(edge_src_index != -1, "src edge not found");

	int edge_dst_index = get_edge_index(dst, train);
	assertf(edge_dst_index != -1, "dst edge not fonund");

	int total_distance = dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance + src->adjacent_nodes.edge[edge_src_index].micrometers_distance;
	//  If we moved it distance amount, where would it be in relation to src?
	int new_position = distance + src->adjacent_nodes.edge[edge_src_index].micrometers_distance;
	//  Remove the train, because we are going to put it somewhere else
	remove_train_node(train, src, dst);

	if(new_position < 0){
		print_move_over_statement(src, preferred);
		//  This means we are going backward to a node before src
		int edge_preferred_index = get_edge_index(src, preferred);
		assertf(edge_preferred_index != -1, "preferred edge not found");

		int max_distance = src->adjacent_nodes.edge[edge_preferred_index].micrometers_distance;
		int back_position = max_distance + new_position;
		assertf(back_position > 0 && back_position < max_distance, "bad back position");
		add_train_node(train, preferred, src, back_position);
	}else if(new_position == 0){
		assertf(src->adjacent_nodes.edge[edge_src_index].micrometers_distance != 1, "Bad case not supported with 1");
		//  Just push it forward 1 micrometer
		add_train_node(train, src, dst, 1);
	}else if(new_position > 0 && new_position < total_distance){
		add_train_node(train, src, dst, new_position);
	}else if(new_position >= total_distance){
		print_move_over_statement(dst, preferred);
		//  This means we are going forward to a node after dst
		int edge_preferred_index = get_edge_index(dst, preferred);
		assertf(edge_preferred_index != -1, "preferred edge not found");

		int max_distance = dst->adjacent_nodes.edge[edge_preferred_index].micrometers_distance;
		int forward_position = new_position - total_distance;
		assertf(forward_position >= 0 && forward_position < max_distance, "bad forward position.");
		if(forward_position == 0){
			//  Just bump it forward one position
			assertf(max_distance != 1, "max distance is 1");
			forward_position = 1;
		}
		add_train_node(train, dst, preferred, forward_position);
	}else{
		assertf(0,"Impossible case.");
	}
}

int get_random_other_edge_index(undirected_node * node, int index){
	if(node->adjacent_nodes.num_adjacent_nodes < 2){
		return -1;
	}
	int other_index = index;
	while(other_index == index){
		other_index = rand() % node->adjacent_nodes.num_adjacent_nodes;
	}
	return other_index;
}

undirected_node * get_smallest_distance_node_in_Q(undirected_node ** nodes, int num_nodes){
	/*  Returns node pointer, or 0 when no nodes left */
	int smallest = 1000000000;
	int smallest_node_index = -1;
	undirected_node * smallest_node = 0;
	int i;
	for(i = 0; i < num_nodes; i++){
		if(nodes[i] && (nodes[i]->dij_dist < smallest)){
			smallest = nodes[i]->dij_dist;
			smallest_node_index = i;
		}
	}
	assertf(smallest_node_index != -1, "smallest node not found.");
	undirected_node * rtn = nodes[smallest_node_index];
	nodes[smallest_node_index] = 0;
	return rtn;
}

int is_node_in_Q(undirected_node ** nodes, int num_nodes, undirected_node * target){
	int i;
	for(i = 0; i < num_nodes; i++){
		if(nodes[i] == target){
			return 1;
		}
	}
	return 0;
}


void dijkstra(undirected_node ** result_path, int max_result_path_length, int * result_path_length, undirected_node * undirected_track_nodes, int num_undirected_track_nodes, undirected_node * train_nodes, int num_train_nodes, undirected_node * src, undirected_node * dst){
	//  Will expect a pointer to an array that it will populate with a set of undirected nodes
	//  That will take you from src to dst
	int infinity = 999999999;
	int total_nodes = num_train_nodes + num_undirected_track_nodes;
	undirected_node * node_set[total_nodes];
	//  Make a set of the nodes we want to explore.
	int i;
	for(i = 0; i < num_undirected_track_nodes; i++){
		node_set[i] = &(undirected_track_nodes[i]);
	}
	for(i = 0; i < num_train_nodes; i++){
		node_set[i + num_undirected_track_nodes] = &(train_nodes[i]);
	}
	//  Initialize
	for(i = 0; i < total_nodes; i++){
		node_set[i]->dij_dist = infinity;
		node_set[i]->dij_previous = 0;
	}

	*result_path_length = 0;

	src->dij_dist = 0;

	undirected_node * U;

	while(U = get_smallest_distance_node_in_Q(node_set, total_nodes)){
		//  It should always find some path
		assertf(U->dij_dist != infinity, "OH NOES INFINITY");
		if(U == dst){
			break;
		}
		int j;
		for(j = 0; j < U->adjacent_nodes.num_adjacent_nodes; j++){
			undirected_node * V = U->adjacent_nodes.edge[j].next_node;
			if(is_node_in_Q(node_set, total_nodes, V)){
				int alt = U->dij_dist + U->adjacent_nodes.edge[j].micrometers_distance;
				if(alt < V->dij_dist){
					V->dij_dist = alt;
					V->dij_previous = U;
				}
			}
		}
	}
	assertf(U, "U was not found.");
	//  Gotta build the list backwards
	undirected_node * U_temp = U;
	//  Find out how many there are
	while(U){
		//  Don't overfill the buffer
		assertf(*result_path_length < max_result_path_length, "Result path was too small.");
		*result_path_length = *result_path_length + 1;
		U = U->dij_previous;
	}
	int current_index = *result_path_length;
	U = U_temp;
	while(U){
		current_index--;
		result_path[current_index] = U;
		U = U->dij_previous;
	}
}



void print_undirected_path_info(undirected_node ** path, int actual_path_length){
	printf("Length: %d. ", actual_path_length);
	int i;
	int total_cost = 0;
	for(i = 0; i < actual_path_length; i++){
		if(path[i]->track_node1 && path[i]->track_node2){
			printf("%s/%s", path[i]->track_node1->name, path[i]->track_node2->name);
		}else{
			printf("train");
		}
		if(i != actual_path_length -1){
			printf(" -> ");
			undirected_node * current_node = path[i];
			undirected_node * next_node = path[i+1];
			int index = get_edge_index(current_node, next_node);
			assertf(index != -1, "Index not found.");
			total_cost += current_node->adjacent_nodes.edge[index].micrometers_distance;
		}
	}
	printf(" Cost: %d.\n", total_cost);
}
