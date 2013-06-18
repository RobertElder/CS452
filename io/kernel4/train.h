#include "message.h"

#ifndef TRAIN_H_
#define TRAIN_H_

static const char const TRAIN_SERVER_NAME[] = "TrnSvr";

typedef struct TrainMessage {
	MessageType message_type;
} TrainMessage;

typedef struct TrainServer {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	char send_buffer[MESSAGE_SIZE];
} TrainServer;

void TrainServer_Start();

void TrainServer_Initialize(TrainServer * server);

#endif
