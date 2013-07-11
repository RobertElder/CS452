#ifndef TRAIN_DATA_STRUCTURES_H_
#define TRAIN_DATA_STRUCTURES_H_
#include "message.h"
#include "tracks/track_node.h"
#include "random.h"
#include "tracks/track_data.h"

#define SENSORS_PER_MODULE 16
#define NUM_SWITCHES 256
#define NUM_ENGINES 1

#define MAX_ROUTE_NODE_INFO 100

static const int const LIGHTS_MASK = 16;
static const int const REVERSE_SPEED = 15;

static const double const SPEED_ALPHA = 0.9;
static const int const TARGET_SPEED = 500;  // mm
static const int const STOPPING_DISTANCE[] = {
	0, // 0
	50, // 1
	50, // 2
	50, // 3
	50, // 4
	100, // 5
	200, // 6
	400, // 7
	600, // 8
	800, // 9
	800, // 10
	900, // 11
	900, // 12
	1000, // 13
	1000, // 14
	0, // 15
};
static const double FEEDBACK_CONTROL_SPEED_INCREMENT = 0.75;
static const int STARTUP_TRAIN_SPEED = 11;
static const double MAX_PHYSICAL_SPEED = 750; // mm/s

typedef enum TrainEngineState {
	TRAIN_ENGINE_IDLE,
	TRAIN_ENGINE_FINDING_POSITION,
	TRAIN_ENGINE_FOUND_STARTING_POSITION,
	TRAIN_ENGINE_WAIT_FOR_DESTINATION,
	TRAIN_ENGINE_GOT_DESTINATION,
	TRAIN_ENGINE_RUNNING,
	TRAIN_ENGINE_NEAR_DESTINATION,
	TRAIN_ENGINE_AT_DESTINATION,
	TRAIN_ENGINE_WAIT_AND_GO_FOREVER,
	TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN,
	TRAIN_ENGINE_CALIBRATING_SPEED,
} TrainEngineState;

static const char const TRAIN_ENGINE_STATE_NAMES[][20] = {
	"Idle",
	"Finding Position",
	"Found Start Posn",
	"Wait for Dest",
	"Got Destination",
	"Running",
	"Near Destination",
	"At Destination",
	"Wait & Go 4evr",
	"Reverse & Retry",
	"Calibrate Speed",
};

typedef enum TrainCommand {
	TRAIN_STOP,
	TRAIN_GO,
	TRAIN_SPEED,
	TRAIN_REVERSE,
	TRAIN_SWITCH,
	TRAIN_READ_SENSOR,
	TRAIN_CACHE_ALL_SENSORS,
	TRAIN_GET_CACHED_SENSOR_DATA,
} TrainCommand;

typedef enum SENSOR_MODULE {
	SENSOR_MODULE_A = 0,
	SENSOR_MODULE_B = 1,
	SENSOR_MODULE_C = 2,
	SENSOR_MODULE_D = 3,
	SENSOR_MODULE_E = 4,
	NUM_SENSOR_MODULES = 5,
} SENSOR_MODULE;

typedef enum TrainServerState {
	TRAIN_SERVER_IDLE,
	TRAIN_SERVER_SHUTDOWN,
	TRAIN_SERVER_BLOCK_UNTIL_SENSOR,
} TrainServerState;

typedef enum SwitchState {
	SWITCH_UNKNOWN = 'U',
	SWITCH_STRAIGHT = 'S',
	SWITCH_CURVED = 'C',
} SwitchState;

typedef enum SwitchDirectionCode {
	SWITCH_STRAIGHT_CODE = 33,
	SWITCH_CURVED_CODE = 34,
} SwitchDirectionCode;

typedef enum TrainEngineClientCommand {
	TRAIN_ENGINE_CLIENT_DO_NOTHING,
	TRAIN_ENGINE_CLIENT_SET_SPEED,
} TrainEngineClientCommand;

typedef struct TrainCommandMessage {
	MessageType message_type;
	TrainCommand command;
	char c1;
	char c2;
} TrainCommandMessage;

typedef struct TrainEngineClientMessage {
	MessageType message_type;
	TrainEngineClientCommand command;
	char c1;
	char c2;
} TrainEngineClientMessage;

typedef struct TrainSensorMessage {
	MessageType message_type;
	int module_num;
	int sensor_bit_flag;
} TrainSensorMessage;

typedef struct GenericTrainMessage {
	MessageType message_type;
	int int1;
	int int2;
	char * char1;
} GenericTrainMessage;

typedef struct RouteNodeInfo {
	track_node * node;
	track_edge * edge;
	SwitchState switch_state;
} RouteNodeInfo;

typedef struct TrainEngine {
	int tid;
	int train_num;
	TrainEngineState state;
	track_node * next_node;
	int speed_setting;
	double granular_speed_setting; 
	double calculated_speed;
	double last_calculated_speed;
	double expected_time_at_next_sensor;
	double expected_time_at_last_sensor;
	double actual_time_at_last_sensor;
	int distance_to_next_sensor;
	int distance_to_destination;
	double estimated_distance_after_node;
	track_node * current_node;
	track_node * source_node;
	track_node * destination_node;
	RouteNodeInfo route_node_info[MAX_ROUTE_NODE_INFO];
	int route_node_index;
	int route_nodes_length;
	short go_forever;
	double wait_until;
} TrainEngine;

typedef struct TrainEngineStatusMessage {
	MessageType message_type;
	TrainEngine * train_engine;
} TrainEngineStatusMessage;

typedef struct TrainServer {
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	TrainServerState state;
	RNG rng;
	
	// Bit flags for each sensor is stored from right to left where
	// flag & 1<<0 is the first sensor
	// flag & 1<<1 is the second sensor
	// flag & 1<<15 is the 16th sensor
	// Modules and sensors are 0-index internally, but rememeber they should be presented 1-index to the train and to the screen.
	int sensor_bit_flags[NUM_SENSOR_MODULES];
	int new_sensor_bit_flags_for_ui[NUM_SENSOR_MODULES];
	int sensor_time_log[NUM_SENSOR_MODULES][SENSORS_PER_MODULE];
	int source_tid;
	int num_child_task_running;
	int train_command_server_tid;
	int train_sensor_reader_tid;
	int blocked_tid;
	int train_server_timer_tid;
	int switch_master_tid;
	
	track_node track_a_nodes[TRACK_MAX];
	track_node track_b_nodes[TRACK_MAX];
	track_node * current_track_nodes;
	
	SwitchState switch_states[NUM_SWITCHES];
	SwitchState switches_to_change[NUM_SWITCHES];
	SwitchQueue queued_switch_changes;
	
	TrainEngine train_engines[NUM_ENGINES];
	TrainSpeedQueue train_speed_queue;
} TrainServer;

#endif