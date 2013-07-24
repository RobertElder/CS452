#ifndef NOTIFIER_H_
#define NOTIFIER_H_

#include "message.h"
#include "public_kernel_interface.h"

typedef struct NotifyMessage {
	MessageType message_type;
	EventID event_id;
} NotifyMessage;

void ClockNotifier_Start();

void KeyboardInputNotifier_Start();

void ScreenOutputNotifier_Start();

void TrainInputNotifier_Start();

void TrainOutputNotifier_Start();

void TrainIONotifier_Start();

#endif
