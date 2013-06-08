#include "task_descriptor.h"
#include "robio.h"
#include "kernel_state.h"

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void * sp, void * lr) {
	td->id = id;
	td->state = READY;
	td->priority = priority;
	td->parent_id = parent_id;
	td->stack_pointer = sp;
	td->link_register = lr;
	td->spsr_register = 16 + 0x80; /*  This will turn on user mode. */
	td->return_value = 0;
	td->origin_tid = 0;
	td->receive_msg = 0;
	td->reply_msg = 0;
	Queue_Initialize(&td->messages);
}

int is_tid_in_range(int tid) {
	if (tid < 0 || tid > MAX_TASKS + 1) {
		return 0;
	}
	return 1;
}
