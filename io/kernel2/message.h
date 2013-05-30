#ifndef MESSAGE_H_
#define MESSAGE_H_

#define MESSAGE_SIZE 100

typedef enum MessageType {
	MESSAGE_TYPE_REGISTER_AS = 0,
	MESSAGE_TYPE_WHOIS,
	MESSAGE_TYPE_WHOIS_REPLY,
} MessageType;

#endif /* MESSAGE_H_ */
