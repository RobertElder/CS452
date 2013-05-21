
#include "task_descriptor.h"

#ifndef KERNEL_STATE_H_
#define KERNEL_STATE_H_

typedef struct KernelState {
	/*  IMPORTANT!!!  The order of the items in this struct is important
	 *  because we automatically set them in assembly expecting them to be at a certain location */
	/*  These two values are set automatically when before a kernel function is envoked, and re-instated to their registers on exit. */
	void * user_proc_sp_value;
	void * user_proc_lr_value;
	/* The maximum number of tasks that the kernel currently supports. */
	unsigned int max_tasks;
	TD * current_task_descriptor;
	TD task_descriptors[5];
	
} KernelState;

#endif /* KERNEL_STATE_H_ */
