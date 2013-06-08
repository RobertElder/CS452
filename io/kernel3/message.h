#ifndef MESSAGE_H_
#define MESSAGE_H_

#include "queue.h"

#define MESSAGE_SIZE 100

typedef enum MessageType {
	MESSAGE_TYPE_REGISTER_AS = 0,
	MESSAGE_TYPE_REGISTER_AS_OK,
	MESSAGE_TYPE_WHOIS,
	MESSAGE_TYPE_WHOIS_REPLY,
	MESSAGE_TYPE_SIGN_UP,
	MESSAGE_TYPE_SIGN_UP_OK,
	MESSAGE_TYPE_PLAY,
	MESSAGE_TYPE_RESULT,
	MESSAGE_TYPE_QUIT,
	MESSAGE_TYPE_GOODBYE,
	MESSAGE_TYPE_ACK,
	MESSAGE_TYPE_NEG_ACK,
	MESSAGE_TYPE_SHUTDOWN,
	MESSAGE_TYPE_WAIT,
	MESSAGE_TYPE_NAME_SERVER_SHUTDOWN,
	MESSAGE_TYPE_NOTIFIER,
	MESSAGE_TYPE_TIME_REQUEST,
	MESSAGE_TYPE_TIME_REPLY,
	MESSAGE_TYPE_DELAY_REQUEST,
	MESSAGE_TYPE_DELAY_REPLY,
	MESSAGE_TYPE_HELLO,
} MessageType;


typedef struct KernelMessage {
	int origin;
	int destination;
	char msg[MESSAGE_SIZE];
	char * dest_buffer;
	unsigned int origin_size;
	unsigned int destination_size;

} KernelMessage;


// This message is used for passing messages of different types
typedef struct GenericMessage {
	MessageType message_type;  // This member should always be first.
} GenericMessage;

void KernelMessage_Initialize(KernelMessage * km,
		int origin, int destination, char * msg, char * dest_buffer,
		unsigned int origin_size, unsigned int destination_size);

#endif /* MESSAGE_H_ */
