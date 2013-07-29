#ifndef TRAIN_DATA_STRUCTURES_H_
#define TRAIN_DATA_STRUCTURES_H_
#include "message.h"
#include "tracks/track_node.h"
#include "random.h"
#include "tracks/track_data.h"

#define SENSORS_PER_MODULE 16
#define NUM_SWITCHES 256
#define MAX_NUM_ENGINES 10

#define MAX_ROUTE_NODE_INFO 100
#define MAX_UNDIRECTED_NODE_PATH 100

static const int const LIGHTS_MASK = 16;
static const int const REVERSE_SPEED = 15;
static const int const TRAIN_SYSTEM_GO = 96;
static const int const TRAIN_SYSTEM_STOP = 97;

static const double const SPEED_ALPHA = 0.9;
static const double const GUESSING_SPEED_UP_ALPHA = 0.1;
static const double const GUESSING_SPEED_DOWN_ALPHA = 0.3;
static const int const TARGET_SPEED = 430;  // mm
static const int const STOPPING_DISTANCE[52][16] = {
	{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}, // 0-9
	{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}, // 10-19
	{0},{0},{0},{0},{0},{0},{0},{0},{0},{0}, // 20-29
	{0},{0},{0},{0},{0},
		//  Train 35
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0},
	{0},{0},{0},{0},{0},{0},{0},
		//  Train 43
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0},
	{0},
		//  Train 45
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0},
	{0},
		//  Train 47
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0},
		//  Train 48
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0},
		//  Train 49
		{0, 50, 50, 50, 50, 100, 300, 450, 530, 620, 660, 700, 780, 820, 900, 0},
		//  Train 50
		{0, 50, 50, 50, 50, 100, 300, 450, 530, 620, 660, 700, 780, 820, 900, 0},
		//  Train 51
		{0, 50, 50, 50, 50, 100, 200, 400, 460, 520, 560, 600, 650, 700, 1000, 0}
};

static const double FEEDBACK_CONTROL_SPEED_INCREMENT = 0.4;
static const double FEEDBACK_CONTROL_SPEED_DECREMENT = -0.7;
static const int STARTUP_TRAIN_SPEED = 8;
static const int FINDING_POSITION_SPEED = 4;
static const double MAX_PHYSICAL_SPEED = 550; // mm/s
static const int SWITCH_DISTANCE = 500; // mm

static const int POINTS_EXCELLENT_TRAIN = 100;
static const int POINTS_VERY_GOOD_TRAIN = 10;
static const int POINTS_GOOD_TRAIN = 5;
static const int POINTS_BAD_TRAIN = -5;
static const int POINTS_VERY_BAD_TRAIN = -10;
static const int POINTS_EXTREMELY_BAD_TRAIN = -100;

typedef enum TrainEngineState {
	TRAIN_ENGINE_IDLE,
	TRAIN_ENGINE_FINDING_POSITION,
	TRAIN_ENGINE_RESYNC_POSITION,
	TRAIN_ENGINE_FOUND_STARTING_POSITION,
	TRAIN_ENGINE_WAIT_FOR_DESTINATION,
	TRAIN_ENGINE_GOT_DESTINATION,
	TRAIN_ENGINE_WAIT_FOR_ALL_READY,
	TRAIN_ENGINE_RUNNING,
	TRAIN_ENGINE_NEAR_DESTINATION,
	TRAIN_ENGINE_AT_DESTINATION,
	TRAIN_ENGINE_WAIT_AND_GO_FOREVER,
	TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN,
	TRAIN_ENGINE_CALIBRATING_SPEED,
	TRAIN_ENGINE_WAIT_FOR_RESERVATION,
	TRAIN_ENGINE_WRONG_LOCATION,
} TrainEngineState;

static const char const TRAIN_ENGINE_STATE_NAMES[][17] = {
	"Idle",
	"Finding Position",
	"Resync Position",
	"Found Start Posn",
	"Wait for Dest",
	"Got Destination",
	"Wait 4 All Ready",
	"Running",
	"Near Destination",
	"At Destination",
	"Wait & Go 4evr",
	"Reverse & Retry",
	"Calibrate Speed",
	"Wait 4 Reservtn",
	"Wrong Location",
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
	int train_num;
	TrainEngineState state;
	int speed_setting;
	int raw_speed_setting;
	double last_time_speed_update;
	double granular_speed_setting; 
	double calculated_speed;
	double last_calculated_speed;
	double expected_time_at_next_sensor;
	double expected_time_at_last_sensor;
	double actual_time_at_last_sensor;
	double time_at_last_node;
	int distance_to_next_sensor;
	int distance_to_next_node;
	int sample_distance_to_next_sensor;
	int distance_to_destination;
	int distance_to_next_switch;
	double estimated_distance_after_node;
	double last_time_location_update;
	track_node * previous_node;
	track_node * current_node;
	track_node * next_node;
	track_node * source_node;
	track_node * destination_node;
	RouteNodeInfo route_node_info[MAX_ROUTE_NODE_INFO];
	int route_node_index;
	int route_nodes_length;
	short go_forever;
	double wait_until;
	undirected_node train_node;
	short use_sensor_for_speed_calculation;
	undirected_node * undirected_node_path[MAX_UNDIRECTED_NODE_PATH];
	int undirected_node_path_length;
	TrainEngineReservationQueue reservation_queue;
	int print_message_hash;
	int lost_count;
	int points;
} TrainEngine;

typedef struct TrainEngineStatusMessage {
	MessageType message_type;
	TrainEngine * train_engine;
	track_node * track_nodes;
} TrainEngineStatusMessage;

typedef struct TrainServer TrainServer;

typedef struct TrainAbstractionLayer {
	TrainServer * train_server;
} TAL;

struct TrainServer {
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
	int num_engines;
	int sensor_reader_blocked;
	int train_engine_client_tid;
	
	track_node track_a_nodes[TRACK_MAX];
	track_node track_b_nodes[TRACK_MAX];
	track_node * current_track_nodes;
	
	undirected_node track_a_undirected_nodes[TRACK_MAX];
	undirected_node track_b_undirected_nodes[TRACK_MAX];
	undirected_node * current_undirected_nodes;
	
	int num_track_a_undirected_nodes;
	int num_track_b_undirected_nodes;
	
	SwitchState switch_states[NUM_SWITCHES];
	SwitchState switches_to_change[NUM_SWITCHES];
	SwitchQueue queued_switch_changes;
	
	TrainEngine train_engines[MAX_NUM_ENGINES];
	TrainSpeedQueue train_speed_queue;
	
	TAL tal;
	
	int dijkstras_enabled;
};

#endif
