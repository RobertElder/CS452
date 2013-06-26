#include "model.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int parse_model_file(FILE* file, track_model_t* model)
{
  char init[10];
  memset(init, 0, 10);

  if (fscanf(file, " %9s", init) < 1) {
    fprintf(stderr, "Could not read initial string.\n");
    return -1;
  }

  if (strcmp(init, "track") != 0) {
    fprintf(stderr, "Expected 'track', got '%s'\n", init);
    return -1;
  }

  model->num_nodes = -1;
  
  if (fscanf(file, " %d", &model->num_nodes) < 1) {
    fprintf(stderr, "Did not get num_nodes\n");
    return -1;
  }

  if (model->num_nodes < 0) {
    fprintf(stderr, "num_nodes must be positive\n");
    return -1;
  }
  model->nodes = malloc(sizeof(track_node_t)*model->num_nodes);
  if (!model->nodes) {
    fprintf(stderr, "Could not allocate space for %d nodes.\n", model->num_nodes);
    return -1;
  }
  
  int i;
  for (i = 0; i < model->num_nodes; i++) {

    int num;
    if (fscanf(file, " %d", &num) < 1) {
      fprintf(stderr, "Could not get index\n");
      return -1;
    }
    if (num < 0 || num >= model->num_nodes) {
      fprintf(stderr, "%d is an invalid index\n", num);
      return -1;
    }

    track_node_t* node = &model->nodes[num];
    
    char name[5];
    memset(name, 0, 5);
    if (fscanf(file, " %4s", name) < 1) {
      fprintf(stderr, "Could not get name\n");
      return -1;
    }

    strcpy(node->name, name);

    char type[10];
    memset(type, 0, 10);
    if (fscanf(file, " %9s", type) < 1) {
      fprintf(stderr, "Could not get node type\n");      
      return -1;
    }

    if (fscanf(file, " %i", &node->id) < 1) {
      fprintf(stderr, "Could not get id\n");
      return -1;
    }

    if (fscanf(file, " %d", &node->x) < 1) {
      fprintf(stderr, "Could not get x coordinate\n");
      return -1;
    }
    if (fscanf(file, " %d", &node->y) < 1) {
      fprintf(stderr, "Could not get y coordinate\n");
      return -1;
    }


    node->id2 = 0;

    int k;
    for (k = 0; k < NODE_MAX_EDGES; k++) node->edges[k].dest = -1;
    if (strcmp(type, "sensor") == 0) {
      // Parse a sensor
      node->type = NODE_SENSOR;
      
      int num_edges;
      if (fscanf(file, " %d", &num_edges) < 1) {
        fprintf(stderr, "Could not get number of edges\n");
        return -1;
      }

      model->sensor_nodes[ node->id * 2 ] = num;
      model->sensor_nodes[ node->id * 2 + 1 ] = num;
      
      // Parse the edges
      int j;
      for (j = 0; j < num_edges; j++) {
        track_edge_t edge;
        if (fscanf(file, " %d", &edge.dest) < 1) {
          fprintf(stderr, "Could not get edge destination\n");
          return -1;
        }

        if (edge.dest < 0 || edge.dest > model->num_nodes) {
          fprintf(stderr, "edge destination %d out of bounds\n", edge.dest);
          return -1;
        }
        
        char edgetype[10];
        memset(edgetype, 0, 10);
        if (fscanf(file, " %9s", edgetype) < 1) {
          fprintf(stderr, "Could not get edge type\n");
          return -1;
        }

        if (fscanf(file, " %d", &edge.distance) < 1) {
          fprintf(stderr, "Could not get edge distance\n");
          return -1;
        }
        
        if (strcmp(edgetype, "ahead") == 0) {
          node->se.ahead = edge;
        } else if (strcmp(edgetype, "behind") == 0) {
          node->se.behind = edge;
        } else {
          fprintf(stderr, "Invalid edge direction %s\n", edgetype);
          return -1;
        }
      }
      node->se.trig_forward = 0;
      node->se.trig_back = 0;
    } else if (strcmp(type, "switch") == 0) {
      // Parse a switch
      node->type = NODE_SWITCH;
      
      char defaultdir[10];
      memset(defaultdir, 0, 10);
      if (fscanf(file, " %9s", defaultdir) < 1) return -1;
      if (strcmp(defaultdir, "straight") == 0) {
        node->sw.set = SWITCH_STRAIGHT;
      } else if (strcmp(defaultdir, "curved") == 0) {
        node->sw.set = SWITCH_CURVED;
      } else {
        return -1;
      }
      
      int num_edges;
      if (fscanf(file, " %d", &num_edges) < 1) return -1;

      // Parse the edges
      int j;
      for (j = 0; j < num_edges; j++) {
        track_edge_t edge;
        if (fscanf(file, " %d", &edge.dest) < 1) return -1;

        if (edge.dest < 0 || edge.dest > model->num_nodes) {
          fprintf(stderr, "edge destination %d out of bounds\n", edge.dest);
          return -1;
        }
        
        char edgetype[10];
        memset(edgetype, 0, 10);
        if (fscanf(file, " %9s", edgetype) < 1) return -1;

        if (fscanf(file, " %d", &edge.distance) < 1) return -1;
        
        if (strcmp(edgetype, "behind") == 0) {
          node->sw.behind = edge;
        } else if (strcmp(edgetype, "curved") == 0) {
          node->sw.ahead[SWITCH_CURVED] = edge;
        } else if (strcmp(edgetype, "straight") == 0) {
          node->sw.ahead[SWITCH_STRAIGHT] = edge;
        } else {
          return -1;
        }
      }
    } else if (strcmp(type, "stop") == 0) {
      // Parse a sensor
      node->type = NODE_STOP;
      
      int num_edges;
      if (fscanf(file, " %d", &num_edges) < 1) {
        fprintf(stderr, "Could not get number of edges\n");
        return -1;
      }

      // Parse the edges
      int j;
      for (j = 0; j < num_edges; j++) {
        track_edge_t edge;
        if (fscanf(file, " %d", &edge.dest) < 1) {
          fprintf(stderr, "Could not get edge destination\n");
          return -1;
        }

        if (edge.dest < 0 || edge.dest > model->num_nodes) {
          fprintf(stderr, "edge destination %d out of bounds\n", edge.dest);
          return -1;
        }
        
        char edgetype[10];
        memset(edgetype, 0, 10);
        if (fscanf(file, " %9s", edgetype) < 1) {
          fprintf(stderr, "Could not get edge type\n");
          return -1;
        }

        if (fscanf(file, " %d", &edge.distance) < 1) {
          fprintf(stderr, "Could not get edge distance\n");
          return -1;
        }
        
        if (strcmp(edgetype, "ahead") == 0) {
          node->st.ahead = edge;
        } else {
          fprintf(stderr, "Invalid edge direction %s\n", edgetype);
          return -1;
        }
      }
    } else {
      return -1;
    }
  }
  // Whew, all parsed.
  return 0;
}

int parse_model(const char* filename, track_model_t* model)
{
  FILE* file;
  file = fopen(filename, "r");
  if (file == 0) {
    fprintf(stderr, "Could not open %s.\n", filename);
    return -1;
  }

  model->nodes = 0;
  int rval = parse_model_file(file, model);
  if (rval < 0) {
    free_model(model);
  }
  
  fclose(file);
  return rval;
}

void free_model(track_model_t* model)
{
  if (model->nodes == 0) return;

  free(model->nodes);
  model->nodes = 0;
}
