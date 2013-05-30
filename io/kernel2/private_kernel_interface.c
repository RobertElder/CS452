#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"

void asm_KernelExit();

void safely_add_task_to_priority_queue(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority){
	int queue_return_code = PriorityQueue_Put(queue, item, priority);
	assert(queue_return_code != ERR_QUEUE_FULL,"priority queue full");
	assert(queue_return_code != ERR_QUEUE_PRIORITY,"priority queue wrong priority");
}

TD * schedule_next_task(KernelState * k_state){
	k_state->current_task_descriptor = READY;
	
	while (1) {
		TD * td = PriorityQueue_Get(&(k_state->task_queue));
	
		if (td == 0) {
			//  There are no ready tasks found.
			return 0;
		} else if (td->state != ZOMBIE) {
			//  We're scheduling this task now, put it at the end of the queue
			PriorityQueue_Put(&(k_state->task_queue), td, td->priority);
			td->state = ACTIVE;
			return td;
		} else {
			// TODO:
			// Destroy the zombie task
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
	if (k_state->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
		k_state->user_proc_return_value = 0;
		k_state->user_proc_spsr = k_state->redboot_spsr_value;
	}else{
		k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
		k_state->user_proc_return_value = k_state->current_task_descriptor->return_value;
		k_state->user_proc_spsr = k_state->current_task_descriptor->spsr_register;
	}
}

void schedule_and_set_next_task_state(KernelState * k_state) {
	k_state->current_task_descriptor = schedule_next_task(k_state);
	set_next_task_state(k_state);
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
		((int)td->stack_pointer) <= empty_stack_value,
		"User task id %d has stack underflow. SP is %x, but shouldn't be more than %x.",
		td->id,
		td->stack_pointer,
		empty_stack_value
	);
	assertf(
		((int)td->stack_pointer) >= full_stack_value,
		"User task id %d has stack overflow. SP is %x, but shouldn't be less than %x.",
		td->id,
		td->stack_pointer,
		full_stack_value
	);

}

void k_InitKernel(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	TD * task_descriptor = &(k_state->task_descriptors[0]);
	int task_priority = LOWEST;
	int task_id = 0;
	/*  Remember where to return to, in case we want to hand control back to redboot */
	k_state->redboot_sp_value = k_state->user_proc_sp_value;
	k_state->redboot_lr_value = k_state->user_proc_lr_value;
	k_state->redboot_spsr_value = k_state->user_proc_spsr;
	print_kernel_state(k_state);
	//  Directly set the kernel state structure values on the stack.
	k_state->max_tasks = MAX_TASKS;
	k_state->num_tasks = 1; /* There is one task, the start task we are creating now */
	TD_Initialize(task_descriptor, task_id, task_priority, 99, get_stack_base(task_id), (void *)&KernelTask_Start);
	PriorityQueue_Initialize(&k_state->task_queue);
	safely_add_task_to_priority_queue(&k_state->task_queue, task_descriptor, task_priority);
	schedule_and_set_next_task_state(k_state);
	print_kernel_state(k_state);
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	int rtn = ERR_K_DEFAULT;

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

		safely_add_task_to_priority_queue(&k_state->task_queue, td, priority);

		rtn = td->id;
	}
	
	save_current_task_state(k_state);
	k_state->current_task_descriptor->return_value = rtn;
	schedule_and_set_next_task_state(k_state);

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
	schedule_and_set_next_task_state(k_state);

	print_kernel_state(k_state);
	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	validate_stack_value(k_state->current_task_descriptor);
	print_kernel_state(k_state);
	k_state->current_task_descriptor->state = ZOMBIE;
	schedule_and_set_next_task_state(k_state);
	
	asm_KernelExit();
}

int k_Send(int tid, char *msg, int msglen, char *reply, int replylen){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	assert((tid == 1), "param problem in ksend tid\n");
	assert(((char*)2 == msg), "param problem in ksend msg\n");
	assert((3 == msglen), "param problem in ksend msglen\n");
	assert(((char*)4 == reply), "param problem in ksend reply\n");
	assertf((383 == replylen), "param problem in ksend replylen, should be 383, but is %d\n",replylen);
	k_state->current_task_descriptor->return_value = 8;
	set_next_task_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_Receive(int *tid, char *msg, int msglen){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	//  Attempt to receive a message from the queue associated with that process.
	void * message = Queue_PopStart(&k_state->current_task_descriptor->messages);
	if(message == (void *)0){
		//  No messages, block this task
		k_state->current_task_descriptor->state = RECEIVE_BLOCKED;
		k_state->current_task_descriptor->return_value = MESSAGE_SIZE;
		//  Switch to the next ready process.
		schedule_and_set_next_task_state(k_state);
	}else{
		//  There is a message, give it to the task
		assert(0,"case not considered.");
	}
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_Reply(int *tid, char *msg, int msglen){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	save_current_task_state(k_state);
	assert((tid == (int*)1), "param problem\n");
	assert(((char*)2 == msg), "param problem\n");
	assert((3 == msglen), "param problem\n");
	k_state->current_task_descriptor->return_value = 6;
	set_next_task_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}
