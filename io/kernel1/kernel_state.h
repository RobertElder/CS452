
#include "task_descriptor.h"

#ifndef KERNEL_STATE_H_
#define KERNEL_STATE_H_

typedef struct KernelState {
	/* The maximum number of tasks that the kernel currently supports. */
	unsigned int max_tasks;
	/* The last value of the kernel stack pointer.  This will always be the same value just after entering a kernel function. */
	void * last_kernel_sp;
} KernelState;

#endif /* KERNEL_STATE_H_ */
