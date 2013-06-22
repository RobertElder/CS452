#include "message.h"
#include "kernel_state.h"
#include "robio.h"

#ifndef NAMESERVER_H_
#define NAMESERVER_H_

#define MAX_CLIENT_NAME_LENGTH 7
#define CLIENT_NAME_SIZE 8

typedef struct NameServerMessage {
	MessageType message_type;
	char str[MAX_CLIENT_NAME_LENGTH + 1];
	int num;
} NameServerMessage;

typedef struct NameServer {
	int tid;
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char names[MAX_TASKS + 1][CLIENT_NAME_SIZE];
	short filled[MAX_TASKS + 1];
	unsigned int num_clients;
} NameServer;

void NameServer_Start();
void NameServer_Initialize(NameServer * ns);
void NameServer_SetName(NameServer * ns, int tid, char * name);
int NameServer_GetName(NameServer * ns, char * name);
void NameServer_PrintTable(NameServer * ns);

#endif /* NAMESERVER_H_ */
