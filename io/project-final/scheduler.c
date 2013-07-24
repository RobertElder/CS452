#include "scheduler.h"
#include "private_kernel_interface.h"
#include "tasks.h"
#include "task_descriptor.h"
#include "robio.h"
#include "rps.h"
#include "clock.h"
#include "public_kernel_interface.h"
#include "kernel_state.h"
#include "kernel_irq.h"

extern int _EndOfProgram;
static short SchedulerWatchdogEnabled = 1;

void Scheduler_Initialize(Scheduler * scheduler) {
	scheduler->max_tasks = MAX_TASKS;
	scheduler->num_tasks = 0; 
	PriorityQueue_Initialize(&scheduler->task_queue);
	scheduler->num_ready = 0;
	scheduler->num_receive_blocked = 0;
	scheduler->num_send_blocked = 0;
	scheduler->num_reply_blocked = 0;
	scheduler->num_event_blocked = 0;
	scheduler->num_active = 0;
	scheduler->num_zombie = 0;
	scheduler->functions_registered = 0;
	scheduler->watchdog_feed_counter = 0;
	scheduler->scheduled_counter = 0;
	scheduler->halt = 0;
	scheduler->sampled_scheduled_counter = 0;
	scheduler->sampled_low_priority_counter = 0;
	
	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		scheduler->inited_td[i] = 0;
	}
	for (i = 0; i < NUM_EVENTS; i++) {
		scheduler->has_tasks_event_blocked[i] = 0;
	}
}

void DebugRegisterFunction(void * entry, const char * name){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	assert(k_state->scheduler.functions_registered < MAX_FUNCTION_MAPPINGS,"There are too many debug function names registered.");
	assertf(!GetRegisteredFunctionName(&k_state->scheduler,entry),"Attempting to register the function named %s twice.",name);
	k_state->scheduler.function_mappings[k_state->scheduler.functions_registered].entry_point = entry;
	k_state->scheduler.function_mappings[k_state->scheduler.functions_registered].function_name = name;
	k_state->scheduler.functions_registered = k_state->scheduler.functions_registered + 1;
}

const char * GetRegisteredFunctionName(Scheduler * scheduler, void * entry){
	int i;
	for(i = 0; i < scheduler->functions_registered; i++){
		if(scheduler->function_mappings[i].entry_point == entry)
			return scheduler->function_mappings[i].function_name;
	}
	return (char *)0;
}

void Scheduler_InitAndSetKernelTask(Scheduler * scheduler, KernelState * k_state) {
	TD * task_descriptor = &(scheduler->task_descriptors[0]);
	/*  Initialize so it does not point at garbage, will be set again later. */
	scheduler->current_task_descriptor = task_descriptor;
	int task_priority = PRIORITY_31;
	int task_id = 0;
	/* TODO: add define special case for partent of first task */
	TD_Initialize(task_descriptor, task_id, task_priority, 99, get_stack_base(task_id), (void *)&KernelTask_Start);
	
	scheduler->num_ready += 1;
	scheduler->num_tasks++; 
	safely_add_task_to_priority_queue(&scheduler->task_queue, task_descriptor, task_priority);
	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
}

TD * Scheduler_ScheduleNextTask(Scheduler * scheduler, KernelState * k_state){
	int times = 0;
	int min_priority = 0;

	while (min_priority < NUM_PRIORITIES && !scheduler->halt) {
		int i;
		for (i = 0; i < MAX_TASKS + 2; i++) {
			TD * td = PriorityQueue_GetLower(&(scheduler->task_queue), min_priority, (void*)&min_priority);
	
			if (td == 0) {
				//  There are no ready tasks found.
				break;
			} else if (td->state == READY) {
				Scheduler_ChangeTDState(scheduler, td, ACTIVE);
				return td;
			} else if (td->state == RECEIVE_BLOCKED || td->state == SEND_BLOCKED || td->state == REPLY_BLOCKED || td->state == EVENT_BLOCKED) {
				assertf(0, "Task %d is %s but it is in the ready queue.\n", td->id, TASK_STATE_NAMES[td->state]);
			} else if (td->state == ZOMBIE) {
				// TODO:
				// Destroy the zombie task
				Scheduler_ChangeTDState(scheduler, td, ZOMBIE);
			} else {
				assertf(0,"Unknown task state: %d for tid=%d.",td->state, td->id);
			}
			times++;
			assertf(times < (MAX_TASKS + 2) * NUM_PRIORITIES,"Scheduler ran more than %d times, probably a bug.", (MAX_TASKS + 2) * NUM_PRIORITIES);
		}
		
		min_priority++;
	}
	
	robprintfbusy((const unsigned char *)"\x1b[r\033[44;37mNo tasks in queue!\033[0m\n");
	
	if(TIMER_INTERRUPTS_ENABLED){
		IRQ_ClearTimerInterrupt();
		IRQ_DisableTimerVIC2();
		IRQ_DisableUARTInterrupts();
	}
	
	Scheduler_PrintTDCounts(scheduler);
	
	if (scheduler->halt) {
		return 0;
	}

// TODO: don't ignore this
	assertf(scheduler->num_ready == 0,
		"Number of ready tasks is not zero. Count=%d", scheduler->num_ready);
	assertf(scheduler->num_active == 0,
		"Number of active tasks is not zero. Count=%d", scheduler->num_active);
/*	assertf(scheduler->num_send_blocked == 0,
		"Number of send_blocked tasks is not zero. Count=%d",
		scheduler->num_send_blocked);
	assertf(scheduler->num_reply_blocked == 0,
		"Number of reply_blocked tasks is not zero. Count=%d",
		scheduler->num_reply_blocked);
	
	assertf(scheduler->num_receive_blocked == 0,
		"Number of recive_blocked tasks is not zero. Count=%d",
		scheduler->num_receive_blocked);
*/
	/*
	 * After careful consideration, I've concluded that it is acceptable for a task
	 * to terminate in the event blocked state.  This is necessary for some events such
	 * as waiting on keyboard input, which may never happen.
	assertf(scheduler->num_event_blocked == 0,
		"Number of event_blocked tasks is not zero. Count=%d",
		scheduler->num_event_blocked);
	*/	
	
	return 0;
	
	assert(0, "Shouldn't get here");
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

void Scheduler_SaveCurrentTaskState(Scheduler * scheduler, KernelState * k_state) {
	//  Make sure the stack is within acceptable bounds.
	validate_stack_value(scheduler->current_task_descriptor);
	scheduler->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	scheduler->current_task_descriptor->link_register = k_state->user_proc_lr_value;
	scheduler->current_task_descriptor->spsr_register = k_state->user_proc_spsr;
	scheduler->current_task_descriptor->entry_mode = k_state->user_proc_entry_mode;
}

void Scheduler_SetNextTaskState(Scheduler * scheduler, KernelState * k_state) {
	scheduler->scheduled_counter++;
	scheduler->sampled_scheduled_counter++;
	
	if (scheduler->sampled_scheduled_counter > 1000000) {
		scheduler->sampled_scheduled_counter = 0;
		scheduler->sampled_low_priority_counter = 0;
	}
	
	if (scheduler->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
		k_state->user_proc_return_value = 0;
		k_state->user_proc_spsr = k_state->redboot_spsr_value;
		k_state->user_proc_entry_mode = 0; /* We always init via the kernel.  0 = kernel api entry*/
	}else{
		k_state->user_proc_sp_value = scheduler->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = scheduler->current_task_descriptor->link_register;
		k_state->user_proc_return_value = scheduler->current_task_descriptor->return_value;
		k_state->user_proc_spsr = scheduler->current_task_descriptor->spsr_register;
		k_state->user_proc_entry_mode = scheduler->current_task_descriptor->entry_mode;
		scheduler->current_task_descriptor->schedule_timestamp = scheduler->scheduled_counter;
		scheduler->current_task_descriptor->scheduled_counter++;
		scheduler->watchdog_feed_counter++;

		if (scheduler->current_task_descriptor->priority == PRIORITY_31) {
			scheduler->sampled_low_priority_counter++;
		}
		
		if (scheduler->current_task_descriptor->entry_point == (int*) &SchedulerWatchdogTask_Start) {
			scheduler->watchdog_feed_counter = 0;
			
			if (scheduler->num_ready + scheduler->num_event_blocked + scheduler->num_receive_blocked + scheduler->num_reply_blocked + scheduler->num_send_blocked + scheduler->num_event_blocked == 0) {
				SchedulerWatchdogEnabled = 0;
			}
		} else {
			if (scheduler->watchdog_feed_counter > WATCHDOG_STARVATION_COUNT) {
				robprintfbusy((const unsigned char *)"\033[0;1m ***** WATCHDOG *****\033[0m\n");
				Scheduler_PrintTDCounts(scheduler);
				robprintfbusy((const unsigned char *)"\033[0;1m ***** WATCHDOG *****\033[0m\n");
				while (1) {};
			}
		}
	}
}

void Scheduler_ScheduleAndSetNextTaskState(Scheduler * scheduler, KernelState * k_state) {
	scheduler->current_task_descriptor = Scheduler_ScheduleNextTask(scheduler, k_state);
	Scheduler_SetNextTaskState(scheduler, k_state);
}

int Scheduler_IsInitedTid(Scheduler * scheduler, int tid) {
	if (!is_tid_in_range(tid)) {
		return 0;
	}

	if (scheduler->inited_td[tid]) {
		return 1;
	}

	return 0;
}

void Scheduler_CreateAndScheduleNewTask(Scheduler * scheduler, KernelState * k_state, int priority, void (*code)( )) {
	int rtn = ERR_K_DEFAULT;

	if (scheduler->num_tasks >= scheduler->max_tasks) {
		assert(0,"out of tds");
		rtn = ERR_K_OUT_OF_TD;
	}else if (!Queue_IsValidPriority(priority)) {
		assert(0,"invalid priority");
		rtn = ERR_K_INVALID_PRIORITY;
	}else{
		int new_task_id = scheduler->num_tasks;
		int parent_id = scheduler->current_task_descriptor->id;
		
		TD * td = &(scheduler->task_descriptors[new_task_id]);
		int stack_end = ((int)get_stack_base(new_task_id) - USER_TASK_STACK_SIZE) + 4;
		assertf(stack_end > (int)&_EndOfProgram, "Attempted to create a new task, but this task's stack space goes down to %x, but the kernel ends at %x.  This means we the stack will overwrite the kernel.  There are currently %d tasks.\n", stack_end, (int)&_EndOfProgram, scheduler->num_tasks);

		TD_Initialize(td, new_task_id, priority, parent_id, get_stack_base(new_task_id), code);
		scheduler->num_tasks += 1;
		scheduler->inited_td[new_task_id] = 1;
		scheduler->num_ready += 1;

		safely_add_task_to_priority_queue(&scheduler->task_queue, td, priority);

		rtn = td->id;
	}

	Scheduler_SaveCurrentTaskState(scheduler, k_state);

	scheduler->current_task_descriptor->return_value = rtn;
	Scheduler_ChangeTDState(scheduler, scheduler->current_task_descriptor, READY);

	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
}

void Scheduler_ChangeTDState(Scheduler * scheduler, TD * td, TaskState new_state) {
	switch(td->state) {
	case READY:{
		assertf(new_state == ACTIVE,"A ready task is becomming %s. task: %d\n", TASK_STATE_NAMES[new_state], td->id);
		scheduler->num_ready--;
		break;
	}case ACTIVE:
		scheduler->num_active--;
		break;
	case SEND_BLOCKED:
		scheduler->num_send_blocked--;
		break;
	case REPLY_BLOCKED:
		scheduler->num_reply_blocked--;
		break;
	case RECEIVE_BLOCKED:
		scheduler->num_receive_blocked--;
		break;
	case EVENT_BLOCKED:
		scheduler->num_event_blocked--;
		break;
	case ZOMBIE:
		scheduler->num_zombie--;
		break;
	default:
		assert(0,"Scheduler_ChangePriority: invalid old state");
		break;
	}
	
	switch(new_state) {
	case READY:
		if(td->state != READY){
			//  Any time we make a task ready, add it to the ready queue
			safely_add_task_to_priority_queue(&scheduler->task_queue, td, td->priority);
		}
		scheduler->num_ready++;
		break;
	case ACTIVE:
		scheduler->num_active++;
		break;
	case SEND_BLOCKED:
		if(td->state != ACTIVE){
			assertf(0,"We are send blocking an %s task: %d\n", TASK_STATE_NAMES[td->state], td->id);
		}
		scheduler->num_send_blocked++;
		break;
	case REPLY_BLOCKED:
		if(td->state != RECEIVE_BLOCKED && td->state != ACTIVE){
			assertf(0,"We are reply blocking an %s task: %d\n", TASK_STATE_NAMES[td->state], td->id);
		}
		scheduler->num_reply_blocked++;
		break;
	case RECEIVE_BLOCKED:
		if(td->state != ACTIVE){
			assertf(0,"We are receive blocking an %s task: %d\n", TASK_STATE_NAMES[td->state], td->id);
		}
		scheduler->num_receive_blocked++;
		break;
	case EVENT_BLOCKED:
		if(td->state != ACTIVE){
			assertf(0,"We are event blocking an %s task: %d\n", TASK_STATE_NAMES[td->state], td->id);
		}
		scheduler->num_event_blocked++;
		break;
	case ZOMBIE:
		scheduler->num_zombie++;
		break;
	default:
		assert(0,"Scheduler_ChangePriority: invalid new state");
		break;
	}
	
	td->state = new_state;
}


void Scheduler_PrintTDCounts(Scheduler * scheduler) {
	robprintfbusy((const unsigned char *)"\033[1mScheduler_PrintTDCounts\033[0m\n");
	robprintfbusy((const unsigned char *)" NUM_TASKS = %d\n", scheduler->num_tasks);
	robprintfbusy((const unsigned char *)" 0. READY = %d\n", scheduler->num_ready);
	robprintfbusy((const unsigned char *)" 1. ACTIVE = %d\n", scheduler->num_active);
	robprintfbusy((const unsigned char *)" 2. ZOMBIE = %d\n", scheduler->num_zombie);
	robprintfbusy((const unsigned char *)" 3. SEND_BLOCKED = %d\n", scheduler->num_send_blocked);
	robprintfbusy((const unsigned char *)" 4. RECEIVE_BLOCKED = %d\n", scheduler->num_receive_blocked);
	robprintfbusy((const unsigned char *)" 5. REPLY_BLOCKED = %d\n", scheduler->num_reply_blocked);
	robprintfbusy((const unsigned char *)" 6. EVENT_BLOCKED = %d\n", scheduler->num_event_blocked);
	
	robprintfbusy((const unsigned char *)" TDs: \n");
	
	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		if (Scheduler_IsInitedTid(scheduler, i)) {
			const char * function_name = GetRegisteredFunctionName(scheduler, scheduler->task_descriptors[i].entry_point);
			int percentage_run = (float) scheduler->task_descriptors[i].scheduled_counter / scheduler->scheduled_counter * 100;
			if(function_name){
				robprintfbusy(
					(const unsigned char *)" %d: %s  (%s->%d) P=%d C=%d (%d%%) T=%d\n",
					i, 
					TASK_STATE_NAMES[scheduler->task_descriptors[i].state],
					function_name,
					scheduler->task_descriptors[i].send_to_tid,
					scheduler->task_descriptors[i].priority,
					scheduler->task_descriptors[i].scheduled_counter,
					percentage_run,
					scheduler->task_descriptors[i].schedule_timestamp
				);
			}else{
				robprintfbusy(
					(const unsigned char *)" %d: %s  (%x->%d) P=%d C=%d (%d%%) T=%d\n",
					i, 
					TASK_STATE_NAMES[scheduler->task_descriptors[i].state],
					scheduler->task_descriptors[i].entry_point,
					scheduler->task_descriptors[i].send_to_tid,
					scheduler->task_descriptors[i].priority,
					scheduler->task_descriptors[i].scheduled_counter,
					percentage_run,
					scheduler->task_descriptors[i].schedule_timestamp
				);
			}
		}
	}
	
	robprintfbusy((const unsigned char *)"    End Print\n");
}

void Scheduler_UnblockTasksOnEvent(Scheduler * scheduler, EventID event_id) {
	unsigned int task_id = scheduler->has_tasks_event_blocked[event_id];
	if (!task_id) {
		assert(event_id != UART1_TX_EVENT,"Lost transmit event so outputserver will deadlock.");
		return;
	}else{
		Scheduler_ChangeTDState(scheduler, &scheduler->task_descriptors[task_id], READY);
		scheduler->has_tasks_event_blocked[event_id] = 0;
	}
}

void safely_add_task_to_priority_queue(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority){
	int queue_return_code = PriorityQueue_Put(queue, item, priority);
	assert(queue_return_code != ERR_QUEUE_FULL,"priority queue full");
	assert(queue_return_code != ERR_QUEUE_PRIORITY,"priority queue wrong priority");
}

void SchedulerWatchdogTask_Start() {
	DebugRegisterFunction(&SchedulerWatchdogTask_Start,__func__);

	while (SchedulerWatchdogEnabled) {
		Pass();
	}
	
	robprintfbusy((const unsigned char *)"\033[0;1m * Watchdog exit *\033[0m\n");
	Exit();
}

void Scheduler_Halt(Scheduler * scheduler) {
	scheduler->halt = 1;
}

float Scheduler_GetSystemLoad(Scheduler * scheduler) {
	return ((float) scheduler->sampled_low_priority_counter) / scheduler->sampled_scheduled_counter;
}