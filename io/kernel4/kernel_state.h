#ifndef KERNEL_STATE_H_
#define KERNEL_STATE_H_

#include "task_descriptor.h"
#include "queue.h"
#include "message.h"
#include "memory.h"
#include "buffer.h"

#define MAX_TASKS 1570

typedef struct KernelState KernelState;
#include "scheduler.h"

struct KernelState {
	/*  IMPORTANT!!!  The order of the items in this struct is important
	 *  because we automatically set them in assembly expecting them to be at a certain location */
	/*  These four values are set automatically when before a kernel function is envoked, and re-instated to their registers on exit. */
	void * user_proc_sp_value;  /* MUST BE 1st item in struct */
	void * user_proc_lr_value;  /* MUST BE 2nd item in struct */
	int user_proc_return_value;  /* MUST BE 3rd item in struct */
	int user_proc_spsr;  /* MUST BE 4th item in struct */
	void * last_kernel_sp_value;  /* MUST BE 5th item in struct.  This is used to validate kernel stack pointer */
	int user_proc_entry_mode;  /* MUST BE 6th item in struct.  Used to indicate how a process entered the kenerl */
	unsigned char memory_blocks_status[NUM_MEMORY_BLOCKS];
	unsigned char memory_blocks[NUM_MEMORY_BLOCKS * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE)];
	Scheduler scheduler;
	void * redboot_sp_value;
	void * redboot_lr_value;
	int redboot_spsr_value;
};


#endif /* KERNEL_STATE_H_ */
