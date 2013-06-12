#include "task_descriptor.h"
#include "robio.h"
#include "kernel_state.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void * sp, void * lr) {
	td->id = id;
	td->state = READY;
	td->priority = priority;
	td->parent_id = parent_id;
	td->stack_pointer = sp;
	td->link_register = lr;
	td->spsr_register = 16 + (TIMER_INTERRUPTS_ENABLED ? 0 : 0x80); /*  This will turn on user mode and enable/disable timer interrupts. */
	td->return_value = 0;
	td->origin_tid = 0;
	td->receive_msg = 0;
	td->reply_msg = 0;
	Queue_Initialize(&td->messages, MESSAGE_QUEUE_SIZE);
	td->event_id = NULL_EVENT;
}

int is_tid_in_range(int tid) {
	if (tid < 0 || tid > MAX_TASKS + 1) {
		return 0;
	}
	return 1;
}
