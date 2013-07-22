
#include "../track_data.h"
#include "undirected_nodes.h"

#include "assert.h"
#include "string.h"
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

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

	int seed = 1374438791;
	srand(seed);
	printf("Seeded with %d.\n",seed);

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
	
		int max_path_length = 20;
		int actual_path_length = 0;
		undirected_node * path[max_path_length];
		//  Do dijkstra's on the two trains to tell how far they are appart
		dijkstra(
			path,
			max_path_length,
			&actual_path_length,
			track_a_undirected_nodes,
			num_track_a_undirected_nodes,
			train_nodes,
			num_trains,
			&train_nodes[0],
			&train_nodes[1]
		);

		if(rand() % 1000 == 0){
			//print_undirected_path_info(path, actual_path_length);
		}
	}
}
