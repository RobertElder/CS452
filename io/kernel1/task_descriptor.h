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
	int parent_id;
	int * stack_pointer;
	int * spsr;
	int return_value;
} TD;

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id);

#endif /* TASK_DESCRIPTOR_H_ */
