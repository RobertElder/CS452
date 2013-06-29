#include "queue.h"
#include "public_kernel_interface.h"

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
	MessageQueue messages;
	int parent_id;
	int * stack_pointer;
	int * link_register;
	int * entry_point;
	int spsr_register;
	int return_value;
	int entry_mode;
	char * receive_msg;
	unsigned int reply_len;
	char * reply_msg;
	int * origin_tid;
	int send_to_tid;
	EventID event_id;
} TD;

static const char const TASK_STATE_NAMES[][20] = {
	"\033[37mready\033[0m",
	"\033[32mactive\033[0m",
	"\033[34mzombie\033[0m",
	"\033[35msend_b\033[0m",
	"\033[31mrecv_b\033[0m",
	"\033[36mreply_b\033[0m",
	"\033[33mevent_b\033[0m"
};

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void *, void *);

int is_tid_in_range(int tid);



#endif /* TASK_DESCRIPTOR_H_ */
