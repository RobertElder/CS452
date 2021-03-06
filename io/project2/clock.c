#include "priorities.h"
#include "clock.h"
#include "robio.h"
#include "message.h"
#include "tasks.h"
#include "public_kernel_interface.h"
#include "queue.h"

static int profile_last_time_value = 0;

void ClockServer_Start() {
	DebugRegisterFunction(&ClockServer_Start,__func__);
	DebugRegisterFunction(&ClockClient_Start,"ClockClient_Start");
	ClockServer server;
	ClockServer_Initialize(&server);
	
	GenericMessage * receive_msg = (GenericMessage *) server.receive_buffer;
	int source_tid;
	
	assert(sizeof(NotifyMessage) <= MESSAGE_SIZE, "NotifyMessage size too big");
	assert(sizeof(ClockMessage) <= MESSAGE_SIZE, "ClockMessage size too big");
	
	int return_code = RegisterAs((char *)CLOCK_SERVER_NAME);
	assert(return_code == 0, "ClockServer: Failed to register name");
	
	int tid = Create(CLOCKNOTIFIER_START_PRIORITY, ClockNotifier_Start);
	assert(tid > 0, "ClockNotifier tid not positive");
	
	// For Debugging
	*TIMER4_VAL_HIGH |= 1 << 8;
	server.last_timer_value = *TIMER4_VAL_LOW;
	
	while (server.running) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		//Print("ClockServer: received %d message type\n", receive_msg->message_type);
		
		switch(receive_msg->message_type) {
		case MESSAGE_TYPE_NOTIFIER:
			ClockServer_HandleNotifier(&server, source_tid, (NotifyMessage*) receive_msg);
			break;
		case MESSAGE_TYPE_TIME_REQUEST:
			ClockServer_HandleTimeRequest(&server, source_tid, (ClockMessage*) receive_msg);
			break;
		case MESSAGE_TYPE_DELAY_REQUEST:
			ClockServer_HandleDelayRequest(&server, source_tid, (ClockMessage*) receive_msg, 0);
			break;
		case MESSAGE_TYPE_DELAY_UNTIL_REQUEST:
			ClockServer_HandleDelayRequest(&server, source_tid, (ClockMessage*) receive_msg, 1);
			break;
		case MESSAGE_TYPE_SHUTDOWN:
			ClockServer_HandleShutdownRequest(&server, source_tid, (ClockMessage*) receive_msg);
			break;
		default:
			assertf(0, "ClockServer: unknown message type %d", receive_msg->message_type);
			break;
		}
		
		ClockServer_UnblockDelayedTasks(&server);
		Pass();
	}
	
	Exit();
}


void ClockServer_Initialize(ClockServer * server) {
	server->tid = MyTid();
	server->ticks = 0;
	server->shutdown = 0;
	server->running = 1;
	
	int tid;
	for (tid = 0; tid < MAX_TASKS + 1; tid++) {
		server->tid_to_delay_until[tid] = 0;
	}
}


void ClockServer_HandleNotifier(ClockServer * server, int source_tid, NotifyMessage * receive_msg) {
	assert(receive_msg->event_id == CLOCK_TICK_EVENT, "ClockServer didn't get a clock tick event id");
	
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	
	if (server->shutdown) {
		reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
		server->running = 0;
	} else {
		reply_message->message_type = MESSAGE_TYPE_ACK;
	}

#ifdef SLOWWARN
	// Debugging code
	int now = *TIMER4_VAL_LOW;
	int diff = (now - server->last_timer_value) / 983.0 * 1000.0;
	server->last_timer_value = now;
#endif

	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);

#ifdef SLOWWARN
	// Debugging code
	if (diff > 2 * (TICK_SIZE * 1000)) {
		server->slow_counter = server->slow_counter + 1;
		if(server->slow_counter % 2 == 0)
			robprintfbusy((const unsigned char *) "\033[1;31mSLOW! %dus\033[0m\n", diff);
	}
#endif
	
	server->ticks += 1;
}

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//Print("ClockServer TID=%d: Handle Time Request from %d. Current tick=%d\n", server->tid, source_tid, server->ticks);
	
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_TIME_REPLY;
	reply_message->num = server->ticks;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg, short absolute) {
	//Print("ClockServer TID=%d: Handle Delay Request from %d with value %d\n", server->tid, source_tid, receive_msg->num);
	
	if (!absolute) {
		receive_msg->num += server->ticks;
	}
	
	if (receive_msg->num <= server->ticks) {
		assertf(0,
		"\033[1;33mClockServer: WARNING delay value in the past from tid=%d! "
		"Got=%d, now=%d\033[0m\n", source_tid, receive_msg->num, server->ticks);
	
		ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
		
		if (absolute) {
			reply_message->message_type = MESSAGE_TYPE_DELAY_UNTIL_REPLY;
		} else {
			reply_message->message_type = MESSAGE_TYPE_DELAY_REPLY;
		}
	
		Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	} else {
		server->tid_to_delay_until[source_tid] = receive_msg->num;
	}
}


int ClockServer_GetNextTask(ClockServer * server, int min_tid) {
	// TODO do we need a sorted list, heap, or not?
	
	assertf(is_tid_in_range(min_tid), "ClockServer_GetNextTask tid not in range");
	
	int tid;
	for (tid = min_tid; tid < MAX_TASKS + 1; tid++) {
		if (server->tid_to_delay_until[tid] && (server->tid_to_delay_until[tid] <= server->ticks || server->shutdown)) {
			return tid;
		}
	}

	return 0;
}

void ClockServer_UnblockDelayedTasks(ClockServer * server) {
	int tid = 0;
	int count = 0;
	
	while (1) {
		tid = ClockServer_GetNextTask(server, tid);
		
		if (tid == 0) {
			break;
		}
		
		server->tid_to_delay_until[tid] = 0;
		
		ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_DELAY_REPLY;
		
		//Print("ClockServer TID=%d: unblocking %d\n", server->tid, tid);
	
		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
		
		count++;
		
		assert(count <= MAX_TASKS + 1, "ClockServer_UnblockDelayedTasks running for too long");
	}
	
}

void ClockServer_HandleShutdownRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	server->shutdown = 1;
	
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
}


void ClockClient_Start() {
	ClockClient client;
	ClockClient_Initialize(&client);
	assertf(client.server_tid, "ClockClient: server not found. got=%d", client.server_tid);
	assertf(client.server_tid, "ClockClient: parent not found. got=%d", client.parent_tid);
	
	K3Message * send_message = (K3Message *) client.send_buffer;
	K3Message * reply_message = (K3Message *) client.reply_buffer;
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	Send(client.parent_tid, client.send_buffer, MESSAGE_SIZE, client.reply_buffer, MESSAGE_SIZE);
	
	assertf(reply_message->message_type == MESSAGE_TYPE_ACK, "ClockClient TID=%d: failed to get ACK message\n");
	
	client.delay_time = reply_message->delay_time;
	client.num_delays = reply_message->num_delays;
	
	int i;
	for (i = 0; i < client.num_delays; i++) {
		//Print("ClockClient TID=%d: About to delay %d, i=%d\n", client.tid, client.delay_time, i);
		Delay(client.delay_time);
	}

	//Print("ClockClient TID=%d: Finished, telling idletask we're shutting down.\n", client.tid);


	send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	
	i = 0;
	int admin_tid;
	
	while (1) {
		admin_tid = WhoIs((char*) ADMINISTRATOR_TASK_NAME);
		
		if (admin_tid) {
			break;
		}
		i++;
		
		assertf(i < 1000, "ClockClient TID=%d: Didn't get an admin tid");
	}
	
	Send(admin_tid, client.send_buffer, MESSAGE_SIZE, client.reply_buffer, MESSAGE_SIZE);
	assertf(reply_message->message_type == MESSAGE_TYPE_ACK, "ClockClient TID=%d: failed to get ACK message\n");
	
	Exit();
}

void ClockClient_Initialize(ClockClient * client) {
	client->tid = MyTid();
	client->server_tid = WhoIs((char*) CLOCK_SERVER_NAME);
	client->parent_tid = MyParentTid();
}

void print_current_time() {
}

void ProfileStart() {
	profile_last_time_value = *TIMER4_VAL_LOW;
}

void ProfileEnd(const char * str) {
	int now = *TIMER4_VAL_LOW;
	int diff = (now - profile_last_time_value) / 983.0 * 1000.0;
	profile_last_time_value = now;
	robprintfbusy((const unsigned char *) "\033[1;32m%s %dus\033[0m\n", str, diff);
}
