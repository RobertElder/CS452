#include "message.h"
#include "public_kernel_interface.h"

#ifndef NOTIFIER_H_
#define NOTIFIER_H_

typedef struct NotifyMessage {
	MessageType message_type;
	EventID event_id;
} NotifyMessage;

void ClockNotifier_Start();

#endif
