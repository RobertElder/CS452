#include "nameserver.h"
#include "tasks.h"


void NameServer_Start() {
	// TODO
	// Allocate a static amount of memory on the stack for the registered names

	int sender_id;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	NameServerMessage * received_message;

	robprintfbusy((const unsigned char *)"Name server here %d\n", MyTid());

	while(1){
		Receive( &sender_id, receive_buffer, MESSAGE_SIZE);
		received_message = (NameServerMessage *) receive_buffer;

		switch (received_message->message_type) {
			case MESSAGE_TYPE_REGISTER_AS:{
				/*
				if(name already exists){
					overwrite
				}else{
					if(enough space for one more){
						add it
					}else{
						assert(0,"Out of space for registered names in name server.");
					}
				}
				*/
				reply_buffer[0] = 0;
			}case MESSAGE_TYPE_WHOIS:{
				/*
				reply(the task id they asked for);
				*/
			}default:{
				assert(0,"Name server message type not found.");
			}
		}
		Pass();
	}
	assert(0, "Shouldn't see me\n");
}
