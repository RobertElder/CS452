#ifndef MODEL_H
#define MODEL_H

#define NUM_SENSOR_BANKS 5
#define MAX_NUM_TRAINS 10

typedef struct track_edge {
  int dest;
  int distance;
} track_edge_t;

#define NODE_MAX_EDGES 3

typedef struct track_switch {
  track_edge_t ahead[2]; // (curved, straight)
  track_edge_t behind;
  int set;
} track_switch_t;

typedef struct track_sensor {
  track_edge_t ahead;
  track_edge_t behind;
  track_edge_t filler[1];
  char trig_forward, trig_back;
} track_sensor_t;

typedef struct track_stop {
  track_edge_t ahead;
  track_edge_t filler[2];
} track_stop_t;

typedef struct track_node {
  enum {
    NODE_SWITCH,
    NODE_SENSOR,
    NODE_STOP,
  } type;
  char name[5];
  int id, id2;
  union {
    track_switch_t sw;
    track_sensor_t se;
    track_stop_t st;
    track_edge_t edges[4];
  };
  int x, y; // location (for GUI)
} track_node_t;

typedef struct track_model {
  int num_nodes;
  track_node_t* nodes;
  int sensor_nodes[NUM_SENSOR_BANKS*16];
} track_model_t;

// Returns 0 on success, < 0 otherwise.
int parse_model(const char* filename, track_model_t* model);

void free_model(track_model_t* model);

#endif
