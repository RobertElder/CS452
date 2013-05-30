#ifndef MESSAGE_H_
#define MESSAGE_H_

#define MESSAGE_SIZE 100
#define MAX_MESSAGES 50

typedef enum MessageType {
	MESSAGE_TYPE_REGISTER_AS = 0,
	MESSAGE_TYPE_REGISTER_AS_OK,
	MESSAGE_TYPE_WHOIS,
	MESSAGE_TYPE_WHOIS_REPLY,
	MESSAGE_TYPE_SIGN_UP,
	MESSAGE_TYPE_SIGN_UP_OK,
	MESSAGE_TYPE_CHOOSE,
	MESSAGE_TYPE_PLAY,
	MESSAGE_TYPE_RESULT,
	MESSAGE_TYPE_QUIT,
	MESSAGE_TYPE_GOODBYE,
} MessageType;


typedef struct KernelMessage {
	int origin;
	int destination;
	char msg[MESSAGE_SIZE];
	char * dest_buffer;
	unsigned int origin_size;
	unsigned int destination_size;

} KernelMessage;

void KernelMessage_Initialize(KernelMessage * km,
		int origin, int destination, char * msg, char * dest_buffer,
		unsigned int origin_size, unsigned int destination_size);

#endif /* MESSAGE_H_ */
