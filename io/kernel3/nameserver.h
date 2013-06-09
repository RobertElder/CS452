#include "message.h"
#include "kernel_state.h"
#include "robio.h"

#ifndef NAMESERVER_H_
#define NAMESERVER_H_

// FIXME if the max name is not a multiple of 4, infinite loop happens
#define MAX_CLIENT_NAME_LENGTH 40

typedef struct NameServerMessage {
	MessageType message_type;
	char * str;
	int num;
} NameServerMessage;

typedef struct NameServer {
	int tid;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	char names[MAX_TASKS + 1][MAX_CLIENT_NAME_LENGTH];
	short filled[MAX_TASKS + 1];
	unsigned int num_clients;
} NameServer;

void NameServer_Start();
void NameServer_Initialize(NameServer * ns);
void NameServer_SetName(NameServer * ns, int tid, char * name);
int NameServer_GetName(NameServer * ns, char * name);
void NameServer_PrintTable(NameServer * ns);

#endif /* NAMESERVER_H_ */
