#include "task_descriptor.h"
#include "robio.h"

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void * sp, void * lr) {
	td->id = id;
	td->state = READY;
	td->priority = priority;
	td->parent_id = parent_id;
	td->stack_pointer = sp;
	td->link_register = lr;
	td->spsr_register = 16; /*  This will turn on user mode. */
	td->return_value = 0;
	td->receive_tid = 0;
	Queue_Initialize(&td->messages);
}
