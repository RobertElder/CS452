
#include "task_descriptor.h"

#ifndef KERNEL_STATE_H_
#define KERNEL_STATE_H_

typedef struct KernelState {
	/*  These two values are set automatically when before a kernel function is envoked, and re-instated to their registers on exit. */
	void * user_prod_sp_value;
	void * user_prod_lr_value;
	/* The maximum number of tasks that the kernel currently supports. */
	unsigned int max_tasks;
} KernelState;

#endif /* KERNEL_STATE_H_ */
