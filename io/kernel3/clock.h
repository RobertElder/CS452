#include "message.h"
#include "notifier.h"
#include "kernel_state.h"
#ifndef CLOCK_H_
#define CLOCK_H_

static const char CLOCK_SERVER_NAME[] = "clock_server";

typedef struct ClockMessage {
	MessageType message_type;
	int num;
} ClockMessage;

typedef struct ClockServer {
	int tid;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	unsigned int ticks;
	int tid_to_delay_until[MAX_TASKS + 1];
	short shutdown;
	short running;
} ClockServer;

void ClockServer_Start();

void ClockServer_Initialize(ClockServer * server);

void ClockServer_HandleNotifier(ClockServer * server, int source_tid, NotifyMessage * receive_msg);

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

void ClockServer_HandleShutdownRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

int ClockServer_GetNextTask(ClockServer * server);

void ClockServer_UnblockDelayedTasks(ClockServer * server);


typedef struct ClockClient {
	int server_tid;
	int tid;
	int parent_tid;
	int delay_time;
	int num_delays;
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
} ClockClient;

void ClockClient_Start();

void ClockClient_Initialize(ClockClient * client);

void print_current_time();

#endif
