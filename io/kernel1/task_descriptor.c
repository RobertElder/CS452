#include "task_descriptor.h"
#include "robio.h"

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id, void * sp, void * lr) {
	td->id = id;
	td->state = ACTIVE;
	td->priority = priority;
	td->parent_id = parent_id;
	td->stack_pointer = sp;
	td->link_register = lr;
	td->spsr_register = 0;
	td->return_value = 0;
}
