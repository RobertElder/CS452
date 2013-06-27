#include "message.h"
#include "tracks/track_data.h"

#ifndef TRAIN_H_
#define TRAIN_H_

#define SENSORS_PER_MODULE 16
#define NUM_SWITCHES 256

static const char const TRAIN_SERVER_NAME[] = "TrnSvr";
static const char const TRAIN_COMMAND_SERVER_NAME[] = "TCmSvr";
static const char const TRAIN_SERVER_TIMER_NAME[] = "TrSTmr";

static const int const LIGHTS_MASK = 16;

typedef enum TrainCommand {
	TRAIN_STOP,
	TRAIN_GO,
	TRAIN_SPEED,
	TRAIN_REVERSE,
	TRAIN_SWITCH,
	TRAIN_READ_SENSOR,
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
	SWITCH_UNKNOWN = 0,
	SWITCH_STRAIGHT = 'S',
	SWITCH_CURVED = 'C',
} SwitchState;

typedef enum SwitchDirectionCode {
	SWITCH_STRAIGHT_CODE = 33,
	SWITCH_CURVED_CODE = 34,
} SwitchDirectionCode;

typedef enum TrainEngineState {
	TRAIN_ENGINE_IDLE,
	TRAIN_ENGINE_FINDING_POSITION,
	TRAIN_ENGINE_FOUND_STARTING_POSITION,
	TRAIN_ENGINE_RUNNING,
	TRAIN_ENGINE_AT_DESTINATION,
} TrainEngineState;

typedef struct TrainCommandMessage {
	MessageType message_type;
	TrainCommand command;
	char c1;
	char c2;
} TrainCommandMessage;

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

typedef struct TrainEngine TrainEngine;

typedef struct TrainEngineStatusMessage {
	MessageType message_type;
/*	const char * current_node_name;
	const char * next_node_name;
	TrainEngineState state;
	char train_num;
	char speed_setting;
*/
	TrainEngine * train_engine;
} TrainEngineStatusMessage;

static const char const TRAIN_ENGINE_STATE_NAMES[][20] = {
	"Idle",
	"Finding Position",
	"Found Start Posn",
	"Running",
	"At Destination",
};

struct TrainEngine {
	int train_num;
	TrainEngineState state;
	track_node * current_node;
	track_node * next_node;
	int speed_setting;
	double calculated_speed;
	double expected_time_at_next_sensor;
	double expected_time_at_last_sensor;
	double actual_time_at_last_sensor;
	track_node * destination_node;
};

typedef struct TrainServer {
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	TrainServerState state;
	
	// Bit flags for each sensor is stored from right to left where
	// flag & 1<<0 is the first sensor
	// flag & 1<<1 is the second sensor
	// flag & 1<<15 is the 16th sensor
	// Modules and sensors are 0-index internally, but rememeber they should be presented 1-index to the train and to the screen.
	int sensor_bit_flags[NUM_SENSOR_MODULES];
	int sensor_time_log[NUM_SENSOR_MODULES][SENSORS_PER_MODULE];
	int source_tid;
	int num_child_task_running;
	int train_command_server_tid;
	int train_sensor_reader_tid;
	int blocked_tid;
	int train_server_timer_tid;
	
	track_node track_a_nodes[TRACK_MAX];
	track_node track_b_nodes[TRACK_MAX];
	track_node * current_track_nodes;
	
	SwitchState switch_states[NUM_SWITCHES];
	
	TrainEngine train_engine;
} TrainServer;


void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

void TrainServer_HandleSensorReaderData(TrainServer * server);

void TrainServer_HandleSensorQuery(TrainServer * server);

void TrainServer_HandleSwitchData(TrainServer * server);

void TrainServer_HandleSwitchQuery(TrainServer * server);

void TrainServer_HandleSelectTrack(TrainServer * server);

void TrainServer_HandleSetTrain(TrainServer * server);

void TrainServer_HandleSetDestination(TrainServer * server);

void TrainServer_HandleQueryTrainEngine(TrainServer * server);

void TrainServer_ProcessEngine(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine);

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine);

track_node * TrainServer_GetEnginePosition(TrainServer * server);

void TrainServerTimer_Start();

void TrainCommandServer_Start();

void TrainSensorReader_Start();

void TrainEngine_Initialize(TrainEngine * engine, int train_num);

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num);

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name);

#endif
