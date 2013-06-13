#include "ui.h"
#include "public_kernel_interface.h"
#include "ansi.h"
#include "queue.h"
#include "robio.h"
#include "random.h"

void UIServer_Start() {
	int return_code = RegisterAs((char*) UI_SERVER_NAME);
	int source_tid;
	assert(return_code == 0, "UIServer_Start failed to register name");
	
	int tid = Create(HIGH, &UITimer_Start);
	assert(tid, "UITimer tid 0");
	
	UIServer server;
	UIServer_Initialize(&server);

	GenericMessage * receive_message = (GenericMessage *) server.receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server.reply_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;

	while(1) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_message->message_type) {
		case MESSAGE_TYPE_HELLO:
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);
			UIServer_Render(&server);
			break;
		case MESSAGE_TYPE_PRINT:
			UIServer_HandlePrint(&server, source_tid, receive_message);
			break;
		default:
			assert(0, "UIServer_Start: unknown message type");
			break;
		}
	}

	Exit();
}

void UIServer_Initialize(UIServer * server) {
	server->print_message_count = 0;
}

void UIServer_Render(UIServer * server) {
	ANSI_Cursor(1, 1);
	ANSI_Color(WHITE, BLUE);
	ANSI_ClearScreen(CLEAR_ALL);
	ANSI_Cursor(1, 1);
	PutString(COM2, "> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <");
	ANSI_CursorNextLine(1);
	PutString(COM2, "The time now is %d", (int)TimeSeconds());
}

void UIServer_HandlePrint(UIServer * server, int source_tid, GenericMessage * receive_message) {
//	UIMessage * ui_message = (UIMessage *) receive_message;
	UIMessage * reply_message = (UIMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	reply_message->row = 20 + server->print_message_count;
	
	Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	server->print_message_count += 1;
	server->print_message_count = server->print_message_count % 20;
}

void UITimer_Start() {
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	int server_tid = WhoIs((char*) UI_SERVER_NAME);
	assert(server_tid, "UITimer_Start: server tid not found");
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	while (1) {
		DelaySeconds(0.5);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, 
			"UITimer_Start: didn't get ACK message");
	}
	
	Exit();
}

