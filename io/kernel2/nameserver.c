#include "nameserver.h"
#include "memory.h"
#include "message.h"
#include "public_kernel_interface.h"
#include "robio.h"

void NameServer_Start() {
	NameServer ns;
	NameServer_Initialize(&ns);
	robprintfbusy((const unsigned char *)"Name server here %d\n", ns.tid);

	int sender_id;
	NameServerMessage * received_message;
	NameServerMessage * outgoing_message;

	while(1){
		Receive( &sender_id, ns.receive_buffer, MESSAGE_SIZE);
		robprintfbusy((const unsigned char *)"After Receive call in name server\n");
		received_message = (NameServerMessage *) ns.receive_buffer;

		switch (received_message->message_type) {
			case MESSAGE_TYPE_REGISTER_AS:{
				robprintfbusy((const unsigned char *)"Name server got request from %d to register %s\n", sender_id, received_message->str);
				NameServer_SetName(&ns, sender_id, received_message->str);
				outgoing_message = (NameServerMessage *) ns.reply_buffer;
				outgoing_message->message_type = MESSAGE_TYPE_REGISTER_AS_OK;
				Reply(sender_id, ns.reply_buffer, MESSAGE_SIZE);
				break;
			}case MESSAGE_TYPE_WHOIS:{
				outgoing_message = (NameServerMessage *) ns.reply_buffer;
				outgoing_message->message_type = MESSAGE_TYPE_WHOIS_REPLY;
				outgoing_message->num = NameServer_GetName(&ns, received_message->str);
				Reply(sender_id, ns.reply_buffer, MESSAGE_SIZE);
				break;
			}default:{
				assert(0,"Name server message type not found.");
				break;
			}
		}
		Pass();
	}
	assert(0, "Shouldn't see me\n");
}


void NameServer_Initialize(NameServer * ns) {
	ns->num_clients = 0;
	ns->tid = MyTid();

	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		ns->filled[i] = 0;
	}
}

void NameServer_SetName(NameServer * ns, int tid, char * name) {
	if (0 <= tid && tid < MAX_TASKS + 1) {
		m_strcpy(ns->names[tid], name, m_strlen(name) + 1);
		ns->filled[tid] = 1;
	} else {
		assert(0,"Out of space for registered names in name server.");
	}
}

int NameServer_GetName(NameServer * ns, char * name) {
	int tid;

	for (tid = 0; tid < MAX_TASKS + 1; tid++) {
		if (!ns->filled[tid]) {
			continue;
		}

		if (m_strcmp(ns->names[tid], name) == 0) {
			return tid;
		}
	}

	return 0;
}

