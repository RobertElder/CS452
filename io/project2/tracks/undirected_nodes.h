#ifndef _UNDIRECTED_NODES_H
#define _UNDIRECTED_NODES_H

#include "../track_node.h"

int get_edge_index(undirected_node * src, undirected_node * target);

void set_references(track_node * track_nodes, undirected_node * undirected_nodes, int * num_undirected_nodes);

void add_adjacent_undirected_node(undirected_node * node, undirected_node * node_to_add);

void sanity_check_distances(undirected_node * undirected_nodes, int * num_undirected_nodes);

void set_adjacency_lists(undirected_node * undirected_nodes, int * num_undirected_nodes);

void init_undirected_nodes(track_node * track_nodes, undirected_node * undirected_nodes, int * num_undirected_nodes);

int add_all_distances(undirected_node * undirected_nodes, int num_undirected_nodes);

void add_train_node(undirected_node * train, undirected_node * src, undirected_node * dst, int distance);

void remove_train_node(undirected_node * train, undirected_node * src, undirected_node * dst);

void print_move_over_statement(undirected_node * n1, undirected_node * n2);

void move_train_distance(undirected_node * train, undirected_node * src, undirected_node * dst, undirected_node * preferred, int distance);

int get_random_other_edge_index(undirected_node * node, int index);

void dijkstra(undirected_node ** result_path, int max_result_path_length, int * result_path_length, undirected_node * undirected_track_nodes, int num_undirected_track_nodes, undirected_node * train_nodes, int num_train_nodes, undirected_node * src, undirected_node * dst);


void print_undirected_path_info(undirected_node ** path, int actual_path_length);

#endif
