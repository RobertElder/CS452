#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"

void asm_KernelExit();




TD * schedule_next_task(KernelState * k_state){
	int current_task_id = k_state->current_task_descriptor->id;
	
	/*
	int next_task_id = current_task_id == 4 ? 1 : current_task_id + 1;
	robprintfbusy((const unsigned char *)"Context switching from task %d to task %d.\n",current_task_id,next_task_id);
	return &(k_state->task_descriptors[next_task_id]);
	*/
	
	k_state->current_task_descriptor = READY;
	
	while (1) {
		TD * td = PriorityQueue_Get(&(k_state->task_queue));
	
		if (td == 0) {
			return 0;
		} else if (td->state != ZOMBIE) {
			PriorityQueue_Put(&(k_state->task_queue), td, td->priority);
			robprintfbusy((const unsigned char *)"Context switching from task %d to task %d.\n",current_task_id,td->id);
			td->state = ACTIVE;
			return td;
		} else {
			robprintfbusy((const unsigned char *)"Not scheduling %d because it's a zombie now.\n", td->id);
		}
	}
	
	assert(0, "Shouldn't get here");
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
	robprintfbusy((const unsigned char *)"In function k_InitKernel\n");
	print_kernel_state(k_state);
	//  Directly set the kernel state structure values on the stack.
	k_state->max_tasks = MAX_TASKS;
	k_state->num_tasks = 1; /* There is one task, the start task we are creating now */
	k_state->current_task_descriptor = &(k_state->task_descriptors[0]);
	TD_Initialize(k_state->current_task_descriptor, 0, LOWEST, 99, get_stack_base(0), (void *)&KernelTask_Start);
	PriorityQueue_Initialize(&k_state->task_queue);
	
	robprintfbusy((const unsigned char *)"Leaving k_InitKernel.\n");
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
		robprintfbusy((const unsigned char *)"In function k_Create. "
			"Priority is %d, code is %x, new id is %d\n",
			priority, code, k_state->num_tasks);
		print_kernel_state(k_state);
		
		TD * td = &(k_state->task_descriptors[k_state->num_tasks]);
		TD_Initialize(td, new_task_id, priority, k_state->current_task_descriptor->id, get_stack_base(new_task_id), code);
		k_state->num_tasks += 1;

		int queue_return_code = PriorityQueue_Put(&k_state->task_queue, td, priority);
		assert(queue_return_code != ERR_QUEUE_FULL,"priority queue full");
		assert(queue_return_code != ERR_QUEUE_PRIORITY,"priority queue wrong priority");

		rtn = td->id;
	}

	robprintfbusy((const unsigned char *)"Leaving k_Create.\n");
	k_state->user_proc_return_value = rtn;
	print_kernel_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	k_state->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	k_state->current_task_descriptor->link_register = k_state->user_proc_lr_value;

	//robprintfbusy((const unsigned char *)"In function k_MyTid\n");
	//print_kernel_state(k_state);
	//robprintfbusy((const unsigned char *)"Leaving k_MyTid\n");
	k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
	k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	k_state->user_proc_return_value = k_state->current_task_descriptor->id;
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	k_state->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	k_state->current_task_descriptor->link_register = k_state->user_proc_lr_value;

	robprintfbusy((const unsigned char *)"In function k_MyParentTid\n");
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_MyParentTid\n");
	k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
	k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	k_state->user_proc_return_value = k_state->current_task_descriptor->parent_id;
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	k_state->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	k_state->current_task_descriptor->link_register = k_state->user_proc_lr_value;
	//  Check for stack overflow and underflows
	validate_stack_value(k_state->current_task_descriptor);
	robprintfbusy((const unsigned char *)"In function k_Pass\n");
	print_kernel_state(k_state);
	k_state->current_task_descriptor = schedule_next_task(k_state);
	
	if (k_state->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
	}else{
		k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	}

	robprintfbusy((const unsigned char *)"Leaving k_Pass\n");
	print_kernel_state(k_state);
	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	robprintfbusy((const unsigned char *)"In function k_Exit\n");
	print_kernel_state(k_state);
	k_state->current_task_descriptor->state = ZOMBIE;
	k_state->current_task_descriptor = schedule_next_task(k_state);
	
	if (k_state->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
	}else{
		k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	}
	
	robprintfbusy((const unsigned char *)"Leaving k_Exit\n");
	asm_KernelExit();
}
