#include "ui.h"
#include "public_kernel_interface.h"
#include "ansi.h"
#include "queue.h"
#include "robio.h"
#include "random.h"

void UIServer_Start() {
	int return_code = RegisterAs((char*) UI_SERVER_NAME);
	int source_tid;
	int shutdown = 0;
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
		// TODO: handle notifier messages from keyboard server and train server
		case MESSAGE_TYPE_SHUTDOWN:
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);
			robprintfbusy((const unsigned char *)"UIServer_Start Exiting because of shutdown.\n");
			shutdown = 1;
			break;
		case MESSAGE_TYPE_HELLO:
			if(shutdown){
				//  Tell it to stop sending requests.
				robprintfbusy((const unsigned char *)"Going to tell the ui server to shutdown.\n");
				reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			}
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);
			if(shutdown){
				Exit();
			}
			//UIServer_Render(&server);
			break;
		default:
			assert(0, "UIServer_Start: unknown message type");
			break;
		}
	}
}

void UIServer_Initialize(UIServer * server) {
	server->print_message_count = 0;
}

void UIServer_Render(UIServer * server) {
	ANSI_Cursor(1, 1);
	ANSI_Color(WHITE, BLUE);
	ANSI_ClearScreen(CLEAR_ALL);
	ANSI_Cursor(1, 1);
	PutString(COM2, 
		"> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <"
		" .. { SYSTIME = ");
	Pass();
	UIServer_PrintTime(server);
	PutString(COM2, " } ");
	Pass();
	ANSI_CursorNextLine(1);
	UIServer_PrintCommandLine(server);
}

void UIServer_PrintTime(UIServer * server) {
	unsigned int time = (unsigned int) (TimeSeconds() * 1000);
	unsigned int ms = time % 1000;
	time /= 1000;
	unsigned int sec = time % 60;
	time /= 60;
	unsigned int min = time % 60;

	PutString(COM2, "%d:%d,%d", min, sec, ms);
}

void UIServer_PrintCommandLine(UIServer * server) {
	ANSI_Style(BOLD_STYLE);
	PutString(COM2, "C:\\> ");
	ANSI_Style(NORMAL_STYLE);
	PutString(COM2, "KERNEL~1.EXE");
}

void UITimer_Start() {
	int return_code = RegisterAs((char*) UI_TIMER_NAME);
	assert(return_code == 0, "UITimer_Start failed to register name");
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	int server_tid = WhoIs((char*) UI_SERVER_NAME);
	assert(server_tid, "UITimer_Start: server tid not found");
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	while (1) {
		robprintfbusy((const unsigned char *)"Before delay..\n");
		DelaySeconds(1);
		robprintfbusy((const unsigned char *)"After delay..\n");
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, 
			"UITimer_Start: didn't get ACK message");

		if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"UITimer_Start shutting down by request.\n");
			break;
		}
	}
	
	Exit();
}

