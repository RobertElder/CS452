#include "task_descriptor.h"

void TD_Initialize(TD * td, int id, QueuePriority priority, int parent_id) {
	td->id = id;
	td->state = ACTIVE;
	td->priority = priority;
	td->parent_id = parent_id;
	td->stack_pointer = 0;
	td->spsr = 0;
	td->return_value = 0;
}
