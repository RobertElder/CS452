#include "clock.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "message.h"

void ClockServer_Start() {
	ClockServer server;
	ClockServer_Initialize(&server);
	ClockMessage * receive_msg = (ClockMessage *) server.receive_buffer;
	int source_tid;
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: start\n", server.tid);
	
	int return_code = RegisterAs(CLOCK_SERVER_NAME);
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
	ClockMessage * reply_message = server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//TODO
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Time Request from %d\n", server->tid, source_tid);
	ClockMessage * reply_message = server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {
	//TODO
	
	robprintfbusy((const unsigned char *)"ClockServer TID=%d: Handle Delay Request from %d\n", server->tid, source_tid);
	ClockMessage * reply_message = server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
}


void ClockClient_Start() {
	ClockClient client;
	ClockClient_Initialize(&client);
	
	robprintfbusy((const unsigned char *)"ClockClient TID=%d: start\n", client.tid);
	assertf(client.server_tid, "ClockClient: server not found. got=%d", client.server_tid);
	
	Exit();
}

void ClockClient_Initialize(ClockClient * client) {
	client->tid = MyTid();
	client->server_tid = WhoIs((char*) CLOCK_SERVER_NAME);
}

