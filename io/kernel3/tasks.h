#include "message.h"

#ifndef TASK_H_
#define TASK_H_

#define ADMINISTRATOR_TASK_TID 21
#define IDLE_TASK_TID 22

typedef struct K3Message {
	MessageType message_type;
	int delay_time;
	int num_delays;
} K3Message;

void KernelTask_Start();

void FirstTask_Start();

void AdministratorTask_Start();

void IdleTask_Start();

void ClockPrintTask_Start();

#endif
