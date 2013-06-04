#include "message.h"
#ifndef CLOCK_H_
#define CLOCK_H_

static const char CLOCK_SERVER_NAME[] = "clock_server";

typedef struct ClockMessage {
	MessageType message_type;
	int num;
} ClockMessage;

typedef struct ClockServer {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
} ClockServer;

void ClockServer_Start();

void ClockServer_Initialize(ClockServer * server);

void ClockServer_HandleNotifier(ClockServer * server, int source_tid, ClockMessage * receive_msg);

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);


typedef struct ClockClient {
	int server_tid;
	int tid;
} ClockClient;

void ClockClient_Start();

void ClockClient_Initialize(ClockClient * client);

#endif
