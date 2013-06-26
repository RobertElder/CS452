#include "message.h"

#ifndef TRAIN_H_
#define TRAIN_H_

#define SENSORS_PER_MODULE 16

static const char const TRAIN_SERVER_NAME[] = "TrnSvr";
static const char const TRAIN_COMMAND_SERVER_NAME[] = "TCmSvr";

typedef enum TrainCommand {
	TRAIN_STOP,
	TRAIN_GO,
	TRAIN_SPEED,
	TRAIN_REVERSE,
	TRAIN_SWITCH,
	TRAIN_READ_SENSOR,
} TrainCommand;

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
} TrainServer;


void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

void TrainServer_HandleSensorReaderData(TrainServer * server);

void TrainServer_HandleSensorQuery(TrainServer * server);

void TrainCommandServer_Start();

void TrainSensorReader_Start();

#endif
