#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"
#include "message.h"
#include "queue.h"
#include "memory.h"

void asm_KernelExit();

extern int _DataStart;
extern int _DataEnd;
extern int _BssStart;
extern int _BssEnd;
extern int _EndOfProgram;

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
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	assertf(task_id <= k_state->scheduler.num_tasks,"Get stack base was passed the value %d, which should be less or equal to max tasks: %d.", task_id, k_state->scheduler.num_tasks);
	return (void*)(USER_TASKS_STACK_START - (task_id * USER_TASK_STACK_SIZE));
}

void print_memory_status(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	robprintfbusy((const unsigned char *)"--  Printing map of how our 32MB of memory is currently allocated.  --\n");
	robprintfbusy((const unsigned char *)"Redboot Stuff:    0x00000000 - 0000x%x\n",((unsigned int)&_DataStart) - 1);
	robprintfbusy((const unsigned char *)"The Kernel:       0x000%x - 0x000%x\n",(unsigned int)&_DataStart, ((unsigned int)&_EndOfProgram) - 1);
	int user_stacks_end = USER_TASKS_STACK_START - (USER_TASK_STACK_SIZE * k_state->scheduler.num_tasks);
	robprintfbusy((const unsigned char *)"Unallocated:      0x000%x - 0x0%x\n",(unsigned int)&_EndOfProgram, user_stacks_end);

	int i;
	for(i = k_state->scheduler.num_tasks -1; i > -1; i--){
		int stack_base = (int)get_stack_base(i);
		int stack_end = (stack_base - USER_TASK_STACK_SIZE) + 4;
		int last_sp = (int)k_state->scheduler.task_descriptors[i].stack_pointer;
		int kb_used = (stack_base - last_sp) / 1024;
		int kb_total = USER_TASK_STACK_SIZE / 1024;
		robprintfbusy((const unsigned char *)"Stack of task %d:  0x0%x - 0x0%x (Was %x on last ctxt switch.  %d of %d kb used.)\n",i, stack_end, stack_base, last_sp, kb_used, kb_total);
	}

	int kernel_stack_base = (int) KERNEL_STACK_START;
	int kernel_stack_end = (kernel_stack_base - KERNEL_STACK_SIZE) + 4;
	robprintfbusy((const unsigned char *)"Kernel Stack:     0x0%x - 0x0%x\n",kernel_stack_end, kernel_stack_base);
	robprintfbusy((const unsigned char *)"Unallocated:      0x0%x - 0x0%x\n",kernel_stack_base + 4, k_state->redboot_sp_value -1);
	robprintfbusy((const unsigned char *)"Redboot Stack:    0x0%x - 0x01FFFFFF\n",k_state->redboot_sp_value);
	robprintfbusy((const unsigned char *)"All memory        0x00000000 - 0x01FFFFFF\n");

	int unallocated1 = user_stacks_end - (unsigned int)&_EndOfProgram + 1;
	int unallocated2 = (((int)k_state->redboot_sp_value) -1) - (kernel_stack_base + 4) + 1;
	int total_unallocated = unallocated1 + unallocated2;

	/*  Set all memory to zeros as a test to see if it breaks anything:
	//  Validate that we actually can control this memory
	char * ch = (char *)&_EndOfProgram;
	for(i = 0; i < (user_stacks_end - (unsigned int)&_EndOfProgram + 1); i++){
		if(i % 10000 == 0)
			robprintfbusy((const unsigned char *)"%x\n", i);

		ch[i] = 0;
	}

	ch = (char *)(kernel_stack_base + 4);
	for(i = 0; i < ((((int)k_state->redboot_sp_value) -1) - (kernel_stack_base + 4) + 1); i++){
		if(i % 10000 == 0)
			robprintfbusy((const unsigned char *)"%x\n", i);
		ch[i] = 0;
	}

	*/


	int unallocated_megs = total_unallocated / 1048576;
	int unallocated_kibs = (total_unallocated - (1048576 * unallocated_megs)) / 1024;
	int unallocated_bytes = total_unallocated - (1048576 * unallocated_megs) - (unallocated_kibs * 1024);


	robprintfbusy((const unsigned char *)"There are currently %d MB, %d KB and %d bytes of memory unallocated.\n", unallocated_megs, unallocated_kibs, unallocated_bytes);
}

void k_InitKernel(){
		

	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	/*  Remember where to return to, in case we want to hand control back to redboot */
	k_state->redboot_sp_value = k_state->user_proc_sp_value;
	k_state->redboot_lr_value = k_state->user_proc_lr_value;
	k_state->redboot_spsr_value = k_state->user_proc_spsr;
	//  Initialize all memory blocks to unallocated.
	int i;
	for(i = 0; i < NUM_MEMORY_BLOCKS; i++){
		k_state->memory_blocks_status[i] = 0;
	}
	//  Directly set the kernel state structure values on the stack.
	Scheduler_Initialize(&k_state->scheduler);
	Scheduler_InitAndSetKernelTask(&k_state->scheduler, k_state);

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

		MessageType * mmm = (MessageType*)msg;
		if( *mmm == MESSAGE_TYPE_PLAY)
			robprintfbusy((const unsigned char *)"In k_Send for play message dest: %d source: %d, target state: %d\n",tid, k_state->scheduler.current_task_descriptor->id,target_td->state);
		if( tid == 2)
			robprintfbusy((const unsigned char *)"In k_Send message to nameserver from %d\n", k_state->scheduler.current_task_descriptor->id);
		
		if(target_td->state == SEND_BLOCKED){
			robprintfbusy((const unsigned char *)"send blocked branch\n");
			//robprintfbusy((unsigned const char *)"Task: %d sends to task %d and unblocks it because it was waiting for send.\n",k_state->current_task_descriptor->id, tid);
			
			//  That task is now ready to be scheduled
			target_td->state = READY;
	
			PriorityQueue_Put(&(scheduler->task_queue), target_td,
				target_td->priority);
	
			target_td->return_value = msglen;
	
			assert((int) target_td->receive_msg, "k_Send: receive_msg isn't set");
			assert(msglen == 100, "msglen not 100");	
			m_strcpy(target_td->receive_msg, msg, msglen);
	
			//  This task is now blocked on a reply
			current_td->state = REPLY_BLOCKED;
			*(target_td->origin_tid) = scheduler->current_task_descriptor->id;
	
			Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
		}else{
			//robprintfbusy((unsigned const char *)"Task %d sends a message to: %d and blocks because the destination is not blocked on send.\n",k_state->current_task_descriptor->id, tid);
			KernelMessage * km = (KernelMessage *)request_memory(k_state->memory_blocks_status, k_state->memory_blocks);	

			KernelMessage_Initialize(km, current_td->id, tid, msg, reply, msglen, replylen);
			Queue_PushEnd(&target_td->messages, km);
			assert((int)km, "Pushed a null message\n");
			robprintfbusy((const unsigned char *)"pushing km %x, my tid is %d \n", km, scheduler->current_task_descriptor->id);
	
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
		robprintfbusy((const unsigned char *)"no message to receive km %x, mytid is %d\n", message, scheduler->current_task_descriptor->id);
		//robprintfbusy((unsigned const char *)"Task: %d is blocking in receive because there are no messages.\n",k_state->current_task_descriptor->id);
		
		//  No messages, block this task
		scheduler->current_task_descriptor->state = SEND_BLOCKED;
		scheduler->current_task_descriptor->return_value = MESSAGE_SIZE;
		
		//  Switch to the next ready process.
		Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
	}else{
		robprintfbusy((const unsigned char *)"in receive message km %x, mytid is %d\n", message, scheduler->current_task_descriptor->id);
		//robprintfbusy((unsigned const char *)"Task %d receives a message from %d because there is a message waiting.\n",k_state->current_task_descriptor->id,message->origin);
		
		//  There is a message, give it to the task
		assert(msglen == 100, "msglen not 100");	
		m_strcpy(msg, message->msg, msglen);

		*tid = message->origin;
		assert(message->origin, "k_Receive: no message origin");
		
		scheduler->current_task_descriptor->return_value = message->origin_size;
		assert(scheduler->task_descriptors[message->origin].state == RECEIVE_BLOCKED, "Impossible state, sender shoudl be receive blocked.");
		
		scheduler->task_descriptors[message->origin].state = REPLY_BLOCKED;
		Scheduler_SetNextTaskState(scheduler, k_state);
		release_memory(k_state->memory_blocks_status, k_state->memory_blocks, message);	
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
			assert(replylen == 100, "msglen not 100");	
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
