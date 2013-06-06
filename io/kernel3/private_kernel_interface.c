#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"
#include "message.h"
#include "queue.h"
#include "memory.h"

void asm_KernelExit();

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



void k_InitKernel(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	/*  Remember where to return to, in case we want to hand control back to redboot */
	k_state->redboot_sp_value = k_state->user_proc_sp_value;
	k_state->redboot_lr_value = k_state->user_proc_lr_value;
	k_state->redboot_spsr_value = k_state->user_proc_spsr;
	//  Directly set the kernel state structure values on the stack.
	Scheduler_Initialize(&k_state->scheduler);
	Scheduler_InitAndSetKernelTask(&k_state->scheduler, k_state);

	RingBufferIndex_Initialize(&k_state->messages_index, QUEUE_SIZE);
	
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler_CreateAndScheduleNewTask(&k_state->scheduler, k_state, priority, code);

	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
	
	Scheduler_SaveCurrentTaskState(scheduler, k_state);
	
	scheduler->current_task_descriptor->return_value = scheduler->current_task_descriptor->id;
	
	Scheduler_SetNextTaskState(scheduler, k_state);
	
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
	
	Scheduler_SaveCurrentTaskState(scheduler, k_state);
	
	scheduler->current_task_descriptor->return_value = scheduler->current_task_descriptor->parent_id;
	
	Scheduler_SetNextTaskState(scheduler, k_state);
	
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
	
	Scheduler_SaveCurrentTaskState(scheduler, k_state);
	
	scheduler->current_task_descriptor->state = READY;
	
	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);

	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
	
	Scheduler_SaveCurrentTaskState(scheduler, k_state);
	
	scheduler->current_task_descriptor->state = ZOMBIE;
	
	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
	
	asm_KernelExit();
}

int k_Send(int tid, char *msg, int msglen, char *reply, int replylen){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
		
	Scheduler_SaveCurrentTaskState(scheduler, k_state);

	int return_value = 8;
	TD * current_td = scheduler->current_task_descriptor;

	if (Scheduler_IsInitedTid(scheduler, tid)) {
		scheduler->current_task_descriptor->reply_msg = reply;
		scheduler->current_task_descriptor->reply_len = replylen;
		
		TD * target_td = &scheduler->task_descriptors[tid];
		
		if(target_td->state == SEND_BLOCKED){
			//robprintfbusy((unsigned const char *)"Task: %d sends to task %d and unblocks it because it was waiting for send.\n",k_state->current_task_descriptor->id, tid);
			
			//  That task is now ready to be scheduled
			target_td->state = READY;
	
			PriorityQueue_Put(&(scheduler->task_queue), target_td,
				target_td->priority);
	
			target_td->return_value = msglen;
	
			assert((int) target_td->receive_msg, "k_Send: receive_msg isn't set");
	
			m_strcpy(target_td->receive_msg, msg, msglen);
	
			//  This task is now blocked on a reply
			current_td->state = REPLY_BLOCKED;
			*(target_td->origin_tid) = scheduler->current_task_descriptor->id;
	
			Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
		}else{
			//robprintfbusy((unsigned const char *)"Task %d sends a message to: %d and blocks because the destination is not blocked on send.\n",k_state->current_task_descriptor->id, tid);
			int index = RingBufferIndex_Put(&k_state->messages_index);
			KernelMessage * km = &k_state->messages[index];
	
			KernelMessage_Initialize(km, current_td->id, tid, msg, reply, msglen, replylen);
			Queue_PushEnd(&target_td->messages, km);
	
			scheduler->current_task_descriptor->state = RECEIVE_BLOCKED;
	
			Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
		}
	} else {
		if (!is_tid_in_range(tid)) {
			return_value = ERR_K_TID_OUT_OF_RANGE;
		} else {
			return_value = ERR_K_TID_DOES_NOT_EXIST;
		}
	}

	scheduler->current_task_descriptor->return_value = return_value;
	Scheduler_SetNextTaskState(scheduler, k_state);
	
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_Receive(int *tid, char *msg, int msglen){
	assert(msglen >= MESSAGE_SIZE, "k_Receive user space msg len is too small for our message");

	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
		
	Scheduler_SaveCurrentTaskState(scheduler, k_state);
	
	//  Attempt to receive a message from the queue associated with that process.
	KernelMessage * message = (KernelMessage *) Queue_PopStart(&scheduler->current_task_descriptor->messages);
	
	//  Remember where to store the message one we get it
	scheduler->current_task_descriptor->receive_msg = msg;
	scheduler->current_task_descriptor->origin_tid = tid;
	
	if(message == 0){
		//robprintfbusy((unsigned const char *)"Task: %d is blocking in receive because there are no messages.\n",k_state->current_task_descriptor->id);
		
		//  No messages, block this task
		scheduler->current_task_descriptor->state = SEND_BLOCKED;
		scheduler->current_task_descriptor->return_value = MESSAGE_SIZE;
		
		//  Switch to the next ready process.
		Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
	}else{
		//robprintfbusy((unsigned const char *)"Task %d receives a message from %d because there is a message waiting.\n",k_state->current_task_descriptor->id,message->origin);
		
		//  There is a message, give it to the task
		RingBufferIndex_Get(&k_state->messages_index);
		m_strcpy(msg, message->msg, msglen);

		*tid = message->origin;
		assert(message->origin, "k_Receive: no message origin");
		
		scheduler->current_task_descriptor->return_value = message->origin_size;
		assert(scheduler->task_descriptors[message->origin].state == RECEIVE_BLOCKED, "Impossible state, sender shoudl be receive blocked.");
		
		scheduler->task_descriptors[message->origin].state = REPLY_BLOCKED;
		Scheduler_SetNextTaskState(scheduler, k_state);

	}
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_Reply(int tid, char *reply, int replylen){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
		
	Scheduler_SaveCurrentTaskState(scheduler, k_state);

	int return_value = 0;

	scheduler->current_task_descriptor->reply_msg = reply;
	if (Scheduler_IsInitedTid(scheduler, tid)) {
		//robprintfbusy((unsigned const char *)"Task %d replies to task %d\n",k_state->current_task_descriptor->id,tid);
		TD * target_td = &scheduler->task_descriptors[tid];
		
		assert(target_td->state == REPLY_BLOCKED,
			"Impossible state, replying to non reply blocked task.");

		if (target_td->state != REPLY_BLOCKED) {
			return_value = ERR_K_TASK_NOT_REPLY_BLOCKED;
		} else if (target_td->reply_len > replylen) {
			assert(0, "k_Reply: Insufficient space in destination");
			return_value = ERR_K_INSUFFICIENT_SPACE;
		} else {
			assert((int) target_td->reply_msg, "k_Reply: reply_msg isn't set");
			m_strcpy(target_td->reply_msg, reply, replylen);
			target_td->state = READY;
			PriorityQueue_Put(&(scheduler->task_queue), target_td, 
				target_td->priority);
		}
	} else {
		if (!is_tid_in_range(tid)) {
			return_value = ERR_K_TID_OUT_OF_RANGE;
		} else {
			return_value = ERR_K_TID_DOES_NOT_EXIST;
		}
	}

	scheduler->current_task_descriptor->return_value = return_value;
	
	Scheduler_SetNextTaskState(scheduler, k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_AwaitEvent(EventID event_id) {
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	Scheduler * scheduler = &k_state->scheduler;
		
	Scheduler_SaveCurrentTaskState(scheduler, k_state);

	scheduler->current_task_descriptor->state = EVENT_BLOCKED;
	scheduler->current_task_descriptor->event_id = event_id;
	// TODO do something
	
	robprintfbusy((const unsigned char *)"AwaitEvent called\n");
		
	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
		
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}
