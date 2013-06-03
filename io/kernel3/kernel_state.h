
#include "task_descriptor.h"
#include "queue.h"
#include "message.h"
#include "buffer.h"

#ifndef KERNEL_STATE_H_
#define KERNEL_STATE_H_

#define MAX_TASKS 10

typedef struct KernelState {
	/*  IMPORTANT!!!  The order of the items in this struct is important
	 *  because we automatically set them in assembly expecting them to be at a certain location */
	/*  These four values are set automatically when before a kernel function is envoked, and re-instated to their registers on exit. */
	void * user_proc_sp_value;  /* MUST BE 1st item in struct */
	void * user_proc_lr_value;  /* MUST BE 2nd item in struct */
	int user_proc_return_value;  /* MUST BE 3rd item in struct */
	int user_proc_spsr;  /* MUST BE 4th item in struct */
	/* The maximum number of tasks that the kernel currently supports. */
	unsigned int max_tasks;
	/* Pointer to the currently scheduled task */
	TD * current_task_descriptor;
	TD task_descriptors[MAX_TASKS + 1];
	short inited_td[MAX_TASKS + 1];
	PriorityQueue task_queue;
	unsigned int num_tasks;
	void * redboot_sp_value;
	void * redboot_lr_value;
	int redboot_spsr_value;
	KernelMessage messages[MAX_MESSAGES];
	RingBufferIndex messages_index;
} KernelState;


#endif /* KERNEL_STATE_H_ */
