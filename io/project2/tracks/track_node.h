#ifndef TRACK_NODE_H_
#define TRACK_NODE_H_

typedef enum {
  NODE_NONE,
  NODE_SENSOR,
  NODE_BRANCH,
  NODE_MERGE,
  NODE_ENTER,
  NODE_EXIT,
  NODE_END,
  NODE_SWITCH,
  NODE_TRAIN,
} node_type;

#define DIR_AHEAD 0
#define DIR_STRAIGHT 0
#define DIR_CURVED 1

struct track_node;

typedef struct track_node track_node;
typedef struct track_edge track_edge;


typedef struct undirected_node undirected_node;
typedef struct undirected_edge undirected_edge;
typedef struct adjacency_list adjacency_list;

struct track_edge {
  track_edge *reverse;
  track_node *src, *dest;
  int dist;             /* in millimetres */
};

struct track_node {
  const char *name;
  node_type type;
  int num;              /* sensor or switch number */
  track_node *reverse;  /* same location, but opposite direction */
  track_edge edge[2];
  int reserved;
  undirected_node * undirected_node;
};

struct undirected_edge {
	/* Used for undirected nodes */
	undirected_node * next_node;
	int micrometers_distance;
};

struct adjacency_list {
	//  There can be a maximum of 3 nodes adjacent to the current undirected edge.
	undirected_edge edge[3];
	int num_adjacent_nodes;
};

struct undirected_node {
	/* 
	By convention, track_node1 should be the lower number track node of the two.
	*/
	track_node * track_node1;
	track_node * track_node2;
	adjacency_list adjacent_nodes;
	node_type type;
	//  Part of Dijkstra's algorithm
	int dij_dist;
	undirected_node * dij_previous;
};

#endif
