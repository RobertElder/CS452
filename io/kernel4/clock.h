#ifndef CLOCK_H_
#define CLOCK_H_

#include "message.h"
#include "notifier.h"
#include "kernel_state.h"

static const char const CLOCK_SERVER_NAME[] = "ClckSvr";
static int * const TIMER4_VAL_LOW = (int*) 0x80810060;
static int * const TIMER4_VAL_HIGH = (int*) 0x80810084;

typedef struct ClockMessage {
	MessageType message_type;
	int num;
} ClockMessage;

typedef struct ClockServer {
	int tid;
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	unsigned int ticks;
	int tid_to_delay_until[MAX_TASKS + 1];
	short shutdown;
	short running;
	unsigned int last_timer_value; // for debugging
} ClockServer;

void ClockServer_Start();

void ClockServer_Initialize(ClockServer * server);

void ClockServer_HandleNotifier(ClockServer * server, int source_tid, NotifyMessage * receive_msg);

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg, short absolute);

void ClockServer_HandleShutdownRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg);

int ClockServer_GetNextTask(ClockServer * server, int min_tid);

void ClockServer_UnblockDelayedTasks(ClockServer * server);


typedef struct ClockClient {
	int server_tid;
	int tid;
	int parent_tid;
	int delay_time;
	int num_delays;
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
} ClockClient;

void ClockClient_Start();

void ClockClient_Initialize(ClockClient * client);

void print_current_time();

void ProfileStart();

void ProfileEnd(const char *);

#endif
