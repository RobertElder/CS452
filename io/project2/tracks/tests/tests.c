
#include "../track_data.h"
#include "assert.h"
#include "string.h"
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

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

void sanity_check_distances(undirected_node * undirected_nodes, int * num_undirected_nodes){
	int i;
	//  Make sure distances are commutative (sanity check)
	for(i = 0; i < *num_undirected_nodes; i++){
		int j;
		for(j = 0; j < undirected_nodes[i].adjacent_nodes.num_adjacent_nodes; j++){
			undirected_node * other_node = undirected_nodes[i].adjacent_nodes.edge[j].next_node;
			//  Get the edge index that brings us back to this node in the other node
			int index = get_edge_index(other_node, &undirected_nodes[i]);
			assert(undirected_nodes[i].adjacent_nodes.edge[j].micrometers_distance == other_node->adjacent_nodes.edge[index].micrometers_distance);
		}
	}
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
	int edge_src_index = get_edge_index(src, dst);
	assert(edge_src_index != -1);

	int edge_dst_index = get_edge_index(dst, src);
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
	int edge_src_index = get_edge_index(src, train);
	assert(edge_src_index != -1);

	int edge_dst_index = get_edge_index(dst, train);
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

void print_move_over_statement(undirected_node * n1, undirected_node * n2){
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

}

void move_train_distance(undirected_node * train, undirected_node * src, undirected_node * dst, undirected_node * preferred, int distance){
	//  Moves a train forward 'distance' micrometers on the route from src to dst.
	//  If the movement takes the train over a switch, we will go toward the preferred node.

	if(distance == 0)
		return;

	int edge_src_index = get_edge_index(src, train);
	assert(edge_src_index != -1);

	int edge_dst_index = get_edge_index(dst, train);
	assert(edge_dst_index != -1);

	int total_distance = dst->adjacent_nodes.edge[edge_dst_index].micrometers_distance + src->adjacent_nodes.edge[edge_src_index].micrometers_distance;
	//  If we moved it distance amount, where would it be in relation to src?
	int new_position = distance + src->adjacent_nodes.edge[edge_src_index].micrometers_distance;
	//  Remove the train, because we are going to put it somewhere else
	remove_train_node(train, src, dst);

	if(new_position < 0){
		print_move_over_statement(src, preferred);
		//  This means we are going backward to a node before src
		int edge_preferred_index = get_edge_index(src, preferred);
		assert(edge_preferred_index != -1);

		int max_distance = src->adjacent_nodes.edge[edge_preferred_index].micrometers_distance;
		int back_position = max_distance + new_position;
		assert(back_position > 0 && back_position < max_distance);
		add_train_node(train, preferred, src, back_position);
	}else if(new_position == 0){
		assert(src->adjacent_nodes.edge[edge_src_index].micrometers_distance != 1);
		//  Just push it forward 1 micrometer
		add_train_node(train, src, dst, 1);
	}else if(new_position > 0 && new_position < total_distance){
		add_train_node(train, src, dst, new_position);
	}else if(new_position >= total_distance){
		print_move_over_statement(dst, preferred);
		//  This means we are going forward to a node after dst
		int edge_preferred_index = get_edge_index(dst, preferred);
		assert(edge_preferred_index != -1);

		int max_distance = dst->adjacent_nodes.edge[edge_preferred_index].micrometers_distance;
		int forward_position = new_position - total_distance;
		assert(forward_position >= 0 && forward_position < max_distance);
		if(forward_position == 0){
			//  Just bump it forward one position
			assert(max_distance != 1);
			forward_position = 1;
		}
		add_train_node(train, dst, preferred, forward_position);
	}else{
		assert(0);
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
	undirected_node * smallest_node = 0;
	int i;
	for(i = 0; i < num_nodes; i++){
		if(nodes[i] && nodes[i]->dij_dist < smallest){
			smallest_node = nodes[i];
			smallest = smallest_node->dij_dist;
			//  Remove it
			nodes[i] = 0;
		}
	}
	return smallest_node;
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
	for(i = 0; i < num_undirected_track_nodes; i++){
		node_set[i] = &(train_nodes[i + num_undirected_track_nodes]);
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
		assert(U->dij_dist != infinity);
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
	assert(U);
	//  Gotta build the list backwards
	undirected_node * U_temp = U;
	//  Find out how many there are
	while(U->dij_previous){
		//  Don't overfill the buffer
		assert(*result_path_length < max_result_path_length);
		*result_path_length = *result_path_length + 1;
		U = U->dij_previous;
	}
	int current_index = *result_path_length;
	U = U_temp;
	while(U->dij_previous){
		current_index--;
		result_path[current_index] = U;
		U = U->dij_previous;
	}
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

	int num_trains = 2;
	undirected_node train_nodes[num_trains];
  	memset(train_nodes, 0, num_trains*sizeof(undirected_node));

	int i;
	for(i = 0; i < num_trains; i++){
		train_nodes[i].type = NODE_TRAIN;
	}
	
	undirected_node * node_1 = &(track_a_undirected_nodes[0]);
	undirected_node * node_2 = node_1->adjacent_nodes.edge[0].next_node;
	assert(node_1 != node_2);

	//  Put the second train after it
	undirected_node * node_3 = &train_nodes[0];
	undirected_node * node_4 = node_2;

	add_train_node(&train_nodes[0], node_1, node_2, 10);

	add_train_node(&train_nodes[1], node_3, node_4, 10);

	srand(time(NULL));

	undirected_node * src_node_t1;
	undirected_node * dst_node_t1;
	undirected_node * src_node_t2;
	undirected_node * dst_node_t2;

	//  0 = forwar, 1 = backward
	int direction_t1 = 0;
	int direction_t2 = 0;

	for(i = 0; i < 100000000; i++){
		sanity_check_distances(track_a_undirected_nodes, &num_track_a_undirected_nodes);
		src_node_t1 = train_nodes[0].adjacent_nodes.edge[direction_t1].next_node;
		dst_node_t1 = train_nodes[0].adjacent_nodes.edge[direction_t1 ? 0 : 1].next_node;

		//  Get an edge index that is not not pointing to the train
		int preferred_index_t1 = get_random_other_edge_index(dst_node_t1, get_edge_index(dst_node_t1, &train_nodes[0]));
		if(preferred_index_t1 == -1){
			direction_t1 = (direction_t1 ? 0 : 1);
		}
		
		//  Move train 1 a distance of 1 micrometer on the path from src to dst , and if we go past node 2, 
		//  go to the preferred_index edge of node_2
		move_train_distance(&train_nodes[0], src_node_t1, dst_node_t1, dst_node_t1->adjacent_nodes.edge[preferred_index_t1].next_node, rand() % 5);
		
		src_node_t2 = train_nodes[1].adjacent_nodes.edge[direction_t2].next_node;
		dst_node_t2 = train_nodes[1].adjacent_nodes.edge[direction_t2 ? 0 : 1].next_node;

		//  Get an edge index that is not not pointing to the train
		int preferred_index_t2 = get_random_other_edge_index(dst_node_t2, get_edge_index(dst_node_t2, &train_nodes[1]));
		if(preferred_index_t2 == -1){
			direction_t2 = (direction_t2 ? 0 : 1);
		}
		
		//  Move train 1 a distance of 1 micrometer on the path from src to dst , and if we go past node 2, 
		//  go to the preferred_index edge of node_2
		move_train_distance(&train_nodes[1], src_node_t2, dst_node_t2, dst_node_t2->adjacent_nodes.edge[preferred_index_t2].next_node, rand() % 5);
	}
}
