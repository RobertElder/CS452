#include "clock.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "message.h"
#include "tasks.h"

void ClockServer_Start() {
	ClockServer server;
	ClockServer_Initialize(&server);
	ClockMessage * receive_msg = (ClockMessage *) server.receive_buffer;
	int source_tid;
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: start\n", server.tid);
	
	int return_code = RegisterAs((char *)CLOCK_SERVER_NAME);
	assert(return_code == 0, "ClockServer: Failed to register name");

	while (1) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_msg->message_type) {
		case MESSAGE_TYPE_NOTIFIER:
			ClockServer_HandleNotifier(&server, source_tid, receive_msg);
			break;
		case MESSAGE_TYPE_TIME_REQUEST:
			ClockServer_HandleTimeRequest(&server, source_tid, receive_msg);
			break;
		case MESSAGE_TYPE_DELAY_REQUEST:
			ClockServer_HandleDelayRequest(&server, source_tid, receive_msg);
			break;
		default:
			assertf(0, "ClockServer: unknown message type %d", receive_msg->message_type);
			break;
		}
		
		Pass();
	}
	
	Exit();
}


void ClockServer_Initialize(ClockServer * server) {
	server->tid = MyTid();
}


void ClockServer_HandleNotifier(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//TODO
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Notifer from %d\n", server->tid, source_tid);
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//TODO
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Time Request from %d\n", server->tid, source_tid);
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//TODO
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Delay Request from %d\n", server->tid, source_tid);
	ClockMessage * reply_message = (ClockMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}


void ClockClient_Start() {
	ClockClient client;
	ClockClient_Initialize(&client);
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: start\n", client.tid);
	
	assertf(client.server_tid, "ClockClient: server not found. got=%d", client.server_tid);
	assertf(client.server_tid, "ClockClient: parent not found. got=%d", client.parent_tid);
	
	K3Message * send_message = (K3Message *) client.send_buffer;
	K3Message * reply_message = (K3Message *) client.reply_buffer;
	
	Send(client.parent_tid, client.send_buffer, MESSAGE_SIZE, client.reply_buffer, MESSAGE_SIZE);
	
	assertf(reply_message->message_type == MESSAGE_TYPE_ACK, "ClockClient TID=%d: failed to get ACK message\n");
	
	client.delay_time = reply_message->delay_time;
	client.num_delays = reply_message->num_delays;
	
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: Got delay_time=%d, num_delays=%dt\n", client.tid, client.delay_time, client.num_delays);
	
	
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: Exit\n", client.tid);
	
	Exit();
}

void ClockClient_Initialize(ClockClient * client) {
	client->tid = MyTid();
	robprintfbusy((const unsigned char *)"ClockClient asdfasdfsdfa");
	client->server_tid = WhoIs((char*) CLOCK_SERVER_NAME);
	

	
	client->parent_tid = MyParentTid();
}

