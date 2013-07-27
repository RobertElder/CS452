#ifndef MESSAGE_H_
#define MESSAGE_H_

#include "queue.h"

#define MESSAGE_SIZE 16
#define CHAR_MESSAGE_CONTENT_SIZE 8

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
	MESSAGE_TYPE_DELAY_UNTIL_REQUEST,
	MESSAGE_TYPE_DELAY_UNTIL_REPLY,
	MESSAGE_TYPE_HELLO,
	MESSAGE_TYPE_PRINT,
	MESSAGE_TYPE_DATA,
	MESSAGE_TYPE_SENSOR_DATA,
	MESSAGE_TYPE_SWITCH_DATA,
	MESSAGE_TYPE_TRAIN_COMMAND,
	MESSAGE_TYPE_QUERY_SENSOR,
	MESSAGE_TYPE_QUERY_SWITCH,
	MESSAGE_TYPE_BLOCK_UNTIL_SENSOR,
	MESSAGE_TYPE_SELECT_TRACK,
	MESSAGE_TYPE_SET_TRAIN,
	MESSAGE_TYPE_SET_DESTINATION,
	MESSAGE_TYPE_QUERY_TRAIN_ENGINE,
	MESSAGE_TYPE_UI_PRINT_MESSAGE,
	MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST,
	MESSAGE_TYPE_GET_SWITCH_REQUEST,
	MESSAGE_TYPE_SET_SWITCH,
	MESSAGE_TYPE_GO_FOREVER,
	MESSAGE_TYPE_SET_NUM_ENGINES,
	MESSAGE_TYPE_RESET_TRACK,
	MESSAGE_TYPE_SET_DIJKSTRAS,
} MessageType;


typedef struct KernelMessage {
	int origin;
	int destination;
	char msg[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char * dest_buffer;
	unsigned int origin_size;
	unsigned int destination_size;

} KernelMessage;


// This message is used for passing messages of different types
typedef struct GenericMessage {
	MessageType message_type;  // This member should always be first.
} GenericMessage;

typedef struct CharMessage {
	MessageType message_type;
	char chars[CHAR_MESSAGE_CONTENT_SIZE];
	unsigned int count;
} CharMessage;

void KernelMessage_Initialize(KernelMessage * km,
		int origin, int destination, char * msg, char * dest_buffer,
		unsigned int origin_size, unsigned int destination_size);

#endif /* MESSAGE_H_ */
