#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"

void asm_KernelExit();




TD * schedule_next_task(KernelState * k_state){
	int current_task_id = k_state->current_task_descriptor->id;
	
	k_state->current_task_descriptor = READY;
	
	while (1) {
		TD * td = PriorityQueue_Get(&(k_state->task_queue));
	
		if (td == 0) {
			return 0;
		} else if (td->state != ZOMBIE) {
			PriorityQueue_Put(&(k_state->task_queue), td, td->priority);
			td->state = ACTIVE;
			return td;
		} else {
		}
	}
	
	assert(0, "Shouldn't get here");
}

void save_current_task_state(KernelState * k_state) {
	k_state->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	k_state->current_task_descriptor->link_register = k_state->user_proc_lr_value;
	k_state->current_task_descriptor->spsr_register = k_state->user_proc_spsr;
}

void set_next_task_state(KernelState * k_state) {
	k_state->current_task_descriptor = schedule_next_task(k_state);
	
	if (k_state->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
		k_state->user_proc_return_value = 0;
	}else{
		k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
		k_state->user_proc_return_value = k_state->current_task_descriptor->return_value;
	}
}

void print_kernel_state(KernelState * k_state){
	//TD * current_t = k_state->current_task_descriptor;
	//robprintfbusy((const unsigned char *)"---- Kernel State ----.\n");
	//robprintfbusy((const unsigned char *)"Max tasks: %d.\n",k_state->max_tasks);
	//robprintfbusy((const unsigned char *)"SP value: %x task %d.\n",current_t->stack_pointer, current_t->id);
	//robprintfbusy((const unsigned char *)"LR value: %x task %d.\n",current_t->link_register, current_t->id);
	//robprintfbusy((const unsigned char *)"Return value (if applicable): %x.\n",k_state->user_proc_return_value);
}

/* TODO:  Calling a kernel function from inside another kernel function is currently not supported. */

void * get_stack_base(unsigned int task_id){
	/*TODO: actually figure out how to place the stacks so they don't do crazy things and overwrite memory */
	return (void*)(USER_TASKS_STACK_START - (task_id * USER_TASK_STACK_SIZE));
}

void validate_stack_value(TD * td){
	int empty_stack_value = (int)get_stack_base(td->id);
	int full_stack_value = empty_stack_value - USER_TASK_STACK_SIZE;
	assertf(
		((int)td->stack_pointer) < empty_stack_value,
		"User task id %d has stack underflow. SP is %x, but shouldn't be more than %x.",
		td->id,
		td->stack_pointer,
		empty_stack_value
	);
	assertf(
		((int)td->stack_pointer) > full_stack_value,
		"User task id %d has stack overflow. SP is %x, but shouldn't be less than %x.",
		td->id,
		td->stack_pointer,
		full_stack_value
	);

}

void k_InitKernel(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	/*  Remember where to return to, in case we want to hand control back to redboot */
	k_state->redboot_sp_value = k_state->user_proc_sp_value;
	k_state->redboot_lr_value = k_state->user_proc_lr_value;
	print_kernel_state(k_state);
	//  Directly set the kernel state structure values on the stack.
	k_state->max_tasks = MAX_TASKS;
	k_state->num_tasks = 1; /* There is one task, the start task we are creating now */
	k_state->current_task_descriptor = &(k_state->task_descriptors[0]);
	TD_Initialize(k_state->current_task_descriptor, 0, LOWEST, 99, get_stack_base(0), (void *)&KernelTask_Start);
	PriorityQueue_Initialize(&k_state->task_queue);
	
	//  Set the currently saved process LR and SP to the new process so we can context switch into it when we do asm_KernelExit.
	k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
	k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	print_kernel_state(k_state);
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	//  Grab the parameters before they are overwritten
	register int *register_0 asm ("r0");
	priority = (int)register_0;
	register int *register_1 asm ("r1");
	code = (void (*)() )register_1;
	int rtn = 0;

	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	
	if (k_state->num_tasks >= k_state->max_tasks) {
		assert(0,"out of tds");
		rtn = ERR_K_OUT_OF_TD;
	}else if (!Queue_IsValidPriority(priority)) {
		assert(0,"invalid priority");
		rtn = ERR_K_INVALID_PRIORITY;
	}else{
		int new_task_id = k_state->num_tasks;
		print_kernel_state(k_state);
		
		TD * td = &(k_state->task_descriptors[k_state->num_tasks]);
		TD_Initialize(td, new_task_id, priority, k_state->current_task_descriptor->id, get_stack_base(new_task_id), code);
		k_state->num_tasks += 1;

		int queue_return_code = PriorityQueue_Put(&k_state->task_queue, td, priority);
		assert(queue_return_code != ERR_QUEUE_FULL,"priority queue full");
		assert(queue_return_code != ERR_QUEUE_PRIORITY,"priority queue wrong priority");

		rtn = td->id;
	}
	
	save_current_task_state(k_state);
	k_state->current_task_descriptor->return_value = rtn;
	set_next_task_state(k_state);

	print_kernel_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	k_state->current_task_descriptor->return_value = k_state->current_task_descriptor->id;
	set_next_task_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	print_kernel_state(k_state);
	k_state->current_task_descriptor->return_value = k_state->current_task_descriptor->parent_id;
	set_next_task_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	//  Check for stack overflow and underflows
	validate_stack_value(k_state->current_task_descriptor);
	print_kernel_state(k_state);
	set_next_task_state(k_state);

	print_kernel_state(k_state);
	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	print_kernel_state(k_state);
	k_state->current_task_descriptor->state = ZOMBIE;
	set_next_task_state(k_state);
	
	asm_KernelExit();
}
