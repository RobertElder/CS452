#include "message.h"

#ifndef TASK_H_
#define TASK_H_

typedef struct K3Message {
	MessageType message_type;
	int delay_time;
	int num_delays;
} K3Message;

void KernelTask_Start();

void FirstTask_Start();

void IdleTask_Start();

#endif
