#include "queue.h"

#ifndef TASK_DESCRIPTOR_H_
#define TASK_DESCRIPTOR_H_

typedef enum TaskState {
	READY,
	ACTIVE,
	ZOMBIE,
	SEND_BLOCKED,
	RECEIVE_BLOCKED,
	REPLY_BLOCKED,
	EVENT_BLOCKED
} TaskState;

typedef struct TaskDescriptor {
	int id;
	TaskState state;
	QueuePriority priority;
	Queue messages;
	int parent_id;
	int * stack_pointer;
	int * link_register;
	int spsr_register;
	int return_value;
	char * receive_msg;
	char * reply_msg;
	int * origin_tid;
} TD;

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void *, void *);

#endif /* TASK_DESCRIPTOR_H_ */
