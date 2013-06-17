#include "message.h"

#ifndef UI_H_
#define UI_H_

#define UI_SERVER_COMMAND_BUFFER_SIZE 80

static const char const UI_SERVER_NAME[] = "UISvr";
static const char const UI_TIMER_NAME[] = "UITmr";
static const char const UI_SERVER_HEADER[] = "> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <";

typedef struct UIMessage {
	MessageType message_type;
	int row;
} UIMessage;

typedef struct UIServer {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	unsigned int print_message_count;
	short dirty;
	char command_buffer[UI_SERVER_COMMAND_BUFFER_SIZE];
	int command_buffer_index;
} UIServer;

void UIServer_Start();

void UIServer_Initialize(UIServer * server);

void UIServer_Render(UIServer * server);

void UIServer_PrintTime(UIServer * server);

void UIServer_PrintCommandLine(UIServer * server);

void UIServer_ProcessKeystroke(UIServer * server, char c);

void UITimer_Start();

#endif
