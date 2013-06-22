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
	SENSOR_MODULE_A = 1,
	SENSOR_MODULE_B = 2,
	SENSOR_MODULE_C = 3,
	SENSOR_MODULE_D = 4,
	SENSOR_MODULE_E = 5,
} SENSOR_MODULE;

typedef struct TrainServer {
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	short shutdown;
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	
	// Bit flags for each sensor is stored from right to left where
	// flag & 1<<0 is the first sensor
	// flag & 1<<1 is the second sensor
	// flag & 1<<15 is the 16th sensor
	int sensor_bit_flags[SENSOR_MODULE_A + SENSOR_MODULE_E];
	int sensor_time_log[SENSOR_MODULE_A + SENSOR_MODULE_E][SENSORS_PER_MODULE];
	int source_tid;
	int num_child_task_running;
	int train_command_server_tid;
} TrainServer;


void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

void TrainServer_HandleSensorReaderData(TrainServer * server);

void TrainServer_HandleSensorQuery(TrainServer * server);

void TrainCommandServer_Start();

void TrainSensorReader_Start();

#endif
