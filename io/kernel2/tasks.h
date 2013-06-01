#include "message.h"
#ifndef TASK_H_
#define TASK_H_

typedef struct TestMessage {
	MessageType message_type;
} TestMessage;

void KernelTask_Start();

void FirstTask_Start();

void SecondTask_Start();


#endif
