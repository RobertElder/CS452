#include "message.h"

#ifndef TRAIN_H_
#define TRAIN_H_

static const char const TRAIN_SERVER_NAME[] = "TrnSvr";

typedef enum TRAIN_COMMAND {
	TRAIN_STOP,
	TRAIN_GO,
	TRAIN_SPEED,
	TRAIN_REVERSE,
	TRAIN_SWITCH,
	TRAIN_READ_SENSOR,
} TRAIN_COMMAND;

typedef struct TrainCommandMessage {
	MessageType message_type;
} TrainCommandMessage;

typedef struct SensorValue {
	char upper;
	char lower;
} SensorValue;

typedef struct TrainSensorMessage {
	MessageType message_type;
	int module_num;
	SensorValue sensor_value;
} TrainSensorMessage;

typedef enum SENSOR_MODULE {
	SENSOR_MODULE_A = 1,
	SENSOR_MODULE_B = 2,
	SENSOR_MODULE_C = 3,
	SENSOR_MODULE_D = 4,
	SENSOR_MODULE_E = 5,
} SENSOR_MODULE;

typedef struct TrainServer {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	short shutdown;
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	SensorValue sensor_values[SENSOR_MODULE_A + SENSOR_MODULE_E];
	int source_tid;
	int num_child_task_running;
} TrainServer;


void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

void TrainServer_HandleSensorReaderData(TrainServer * server);

void TrainServer_HandleSensorQuery(TrainServer * server);

void TrainSensorReader_Start();

#endif
