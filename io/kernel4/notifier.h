#ifndef NOTIFIER_H_
#define NOTIFIER_H_

#include "message.h"
#include "public_kernel_interface.h"

typedef struct NotifyMessage {
	MessageType message_type;
	EventID event_id;
} NotifyMessage;

void ClockNotifier_Start();

#endif
