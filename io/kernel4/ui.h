#include "message.h"

#ifndef UI_H_
#define UI_H_

static const char const UI_SERVER_NAME[] = "UISvr";

typedef struct UIMessage {
	MessageType message_type;
	int row;
} UIMessage;

typedef struct UIServer {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	unsigned int print_message_count;
} UIServer;

void UIServer_Start();

void UIServer_Initialize(UIServer * server);

void UIServer_Render(UIServer * server);

void UIServer_PrintTime(UIServer * server);

void UIServer_PrintCommandLine(UIServer * server);

void UITimer_Start();

#endif
