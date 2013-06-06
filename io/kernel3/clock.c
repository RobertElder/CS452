#include "clock.h"
#include "robio.h"
#include "message.h"
#include "tasks.h"
#include "public_kernel_interface.h"
#include "queue.h"

void ClockServer_Start() {
	ClockServer server;
	ClockServer_Initialize(&server);
	
	GenericMessage * receive_msg = (GenericMessage *) server.receive_buffer;
	int source_tid;
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: start\n", server.tid);
	
	int return_code = RegisterAs((char *)CLOCK_SERVER_NAME);
	assert(return_code == 0, "ClockServer: Failed to register name");
	
	while (1) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_msg->message_type) {
		case MESSAGE_TYPE_NOTIFIER:
			ClockServer_HandleNotifier(&server, source_tid, (NotifyMessage*) receive_msg);
			break;
		case MESSAGE_TYPE_TIME_REQUEST:
			ClockServer_HandleTimeRequest(&server, source_tid, (ClockMessage*) receive_msg);
			break;
		case MESSAGE_TYPE_DELAY_REQUEST:
			ClockServer_HandleDelayRequest(&server, source_tid, (ClockMessage*) receive_msg);
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
	
	int tid;
	for (tid = 0; tid < MAX_TASKS + 1; tid++) {
		server->tid_to_delay_until[tid] = 0;
	}
}


void ClockServer_HandleNotifier(ClockServer * server, int source_tid, NotifyMessage * receive_msg) {
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Notifer from %d\n", server->tid, source_tid);
	
	assert(receive_msg->event_id == CLOCK_TICK_EVENT, "ClockServer didn't get a clock tick event id");
	
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	server->ticks += 1;
}

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Time Request from %d. Current tick=%d\n", server->tid, source_tid, server->ticks);
	
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	reply_message->num = server->ticks;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Delay Request from %d with value %d\n", server->tid, source_tid, receive_msg->num);
	
	if (receive_msg->num <= server->ticks) {
		robprintfbusy((const unsigned char *)"ClockServer TID=%d: WARNING delay value in the past!");
	
		ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_ACK;
	
		Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	} else {
		server->tid_to_delay_until[source_tid] = receive_msg->num;
	}
}


int ClockServer_GetNextTask(ClockServer * server) {
	// TODO do we need a sorted list, heap, or not?
	
	int tid;
	for (tid = 0; tid < MAX_TASKS + 1; tid++) {
		if (server->tid_to_delay_until[tid] <= server->ticks) {
			return tid;
		}
	}

	return 0;
}

void ClockServer_UnblockDelayedTasks(ClockServer * server) {
	int tid;
	int count = 0;
	
	while (1) {
		tid = ClockServer_GetNextTask(server);
		
		if (tid == 0) {
			break;
		}
		
		ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_ACK;
	
		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
		
		count++;
		
		assert(count <= MAX_TASKS + 1, "ClockServer_UnblockDelayedTasks running for too long");
	}
	
}


void ClockClient_Start() {
	ClockClient client;
	ClockClient_Initialize(&client);
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: start\n", client.tid);
	
	assertf(client.server_tid, "ClockClient: server not found. got=%d", client.server_tid);
	assertf(client.server_tid, "ClockClient: parent not found. got=%d", client.parent_tid);
	
	K3Message * send_message = (K3Message *) client.send_buffer;
	K3Message * reply_message = (K3Message *) client.reply_buffer;
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	Send(client.parent_tid, client.send_buffer, MESSAGE_SIZE, client.reply_buffer, MESSAGE_SIZE);
	
	assertf(reply_message->message_type == MESSAGE_TYPE_ACK, "ClockClient TID=%d: failed to get ACK message\n");
	
	client.delay_time = reply_message->delay_time;
	client.num_delays = reply_message->num_delays;
	
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: Got delay_time=%d, num_delays=%d\n", client.tid, client.delay_time, client.num_delays);
	
	int i;
	for (i = 0; i < client.num_delays; i++) {
		Delay(client.delay_time);
		robprintfbusy((const unsigned char *)"ClockClient TID=%d: I just delayed delay_time=%d, i=%d\n", client.tid, client.delay_time, i);
	}
	
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: Exit\n", client.tid);
	
	Exit();
}

void ClockClient_Initialize(ClockClient * client) {
	client->tid = MyTid();
	robprintfbusy((const unsigned char *)"ClockClient_Initialize TID=%d here\n", client->tid);
	client->server_tid = WhoIs((char*) CLOCK_SERVER_NAME);
	client->parent_tid = MyParentTid();
}

