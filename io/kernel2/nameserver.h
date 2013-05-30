#include "tasks.h"
#ifndef NAMESERVER_H_
#define NAMESERVER_H_

typedef struct NameServerMessage {
	MessageType message_type;
	char * str;
} NameServerMessage;

void NameServer_Start();

#endif /* NAMESERVER_H_ */
