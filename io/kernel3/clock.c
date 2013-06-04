#include "clock.h"
#include "public_kernel_interface.h"
#include "robio.h"

void ClockServer_Start() {
	ClockServer server;
	ClockServer_Initialize(&server);
	ClockMessage * receive_msg = (ClockMessage *) server.receive_buffer;
	int source_tid;

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

}


void ClockServer_HandleNotifier(ClockServer * server, int source_tid, ClockMessage * receive_msg) {}

void ClockServer_HandleTimeRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {}

void ClockServer_HandleDelayRequest(ClockServer * server, int source_tid, ClockMessage * receive_msg) {}


void ClockClient_Start() {
	ClockClient client;
	ClockClient_Initialize(&client);
	
	
	Exit();
}

void ClockClient_Initialize(ClockClient * client) {
	client->tid = MyTid();
	client->server_tid = WhoIs((char*) CLOCK_SERVER_NAME);
}

