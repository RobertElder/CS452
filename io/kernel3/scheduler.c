#include "scheduler.h"
#include "private_kernel_interface.h"
#include "tasks.h"
#include "task_descriptor.h"
#include "robio.h"
#include "public_kernel_interface.h"

void Scheduler_Initialize(Scheduler * scheduler) {
	scheduler->max_tasks = MAX_TASKS;
	scheduler->num_tasks = 1; /* There is one task, the start task we are creating now */
	PriorityQueue_Initialize(&scheduler->task_queue);
	scheduler->num_non_zombie_tasks = 0;
	
	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		scheduler->inited_td[i] = 0;
	}
}

void Scheduler_InitAndSetKernelTask(Scheduler * scheduler, KernelState * k_state) {
	TD * task_descriptor = &(scheduler->task_descriptors[0]);
	int task_priority = LOWEST;
	int task_id = 0;
	TD_Initialize(task_descriptor, task_id, task_priority, 99, get_stack_base(task_id), (void *)&KernelTask_Start);
	
	scheduler->num_non_zombie_tasks += 1;
	safely_add_task_to_priority_queue(&scheduler->task_queue, task_descriptor, task_priority);
	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
}

TD * Scheduler_ScheduleNextTask(Scheduler * scheduler, KernelState * k_state){
	int times = 0;
	int min_priority = 0;
	
	while (min_priority < NUM_PRIORITIES) {
		int i;
		for (i = 0; i < MAX_TASKS + 2; i++) {
			TD * td = PriorityQueue_GetLower(&(scheduler->task_queue), min_priority, (void*)&min_priority);
	
			if (td == 0) {
				//  There are no ready tasks found.
				break;
			} else if (td->state == READY) {
				//  We're scheduling this task now, put it at the end of the queue
				PriorityQueue_Put(&(scheduler->task_queue), td, td->priority);
				td->state = ACTIVE;
				return td;
			} else if (td->state == RECEIVE_BLOCKED || td->state == SEND_BLOCKED || td->state == REPLY_BLOCKED || td->state == EVENT_BLOCKED) {
				// Remember to put the task back in the ready queue when its ready
				//  Just keep executing in this loop until we find a ready task.
			} else if (td->state == ZOMBIE) {
				// TODO:
				// Destroy the zombie task
				scheduler->num_non_zombie_tasks -= 1;
			} else {
				assertf(0,"Unknown task state: %d for tid=%d.",td->state, td->id);
			}
			times++;
			assertf(times < (MAX_TASKS + 2) * NUM_PRIORITIES,"Scheduler ran more than %d times, probably a bug.", (MAX_TASKS + 2) * NUM_PRIORITIES);
		}
		
		min_priority++;
	}
	
	assertf(scheduler->num_non_zombie_tasks == 0,"Number of non-zombie tasks is not zero. Count=%d", scheduler->num_non_zombie_tasks);
	
	robprintfbusy((const unsigned char *)"No tasks in queue!\n");
	return 0;
	
	assert(0, "Shouldn't get here");
}

void Scheduler_SaveCurrentTaskState(Scheduler * scheduler, KernelState * k_state) {
	scheduler->current_task_descriptor->stack_pointer = k_state->user_proc_sp_value;
	scheduler->current_task_descriptor->link_register = k_state->user_proc_lr_value;
	scheduler->current_task_descriptor->spsr_register = k_state->user_proc_spsr;
}

void Scheduler_SetNextTaskState(Scheduler * scheduler, KernelState * k_state) {
	if (scheduler->current_task_descriptor == 0) {
		/* Nothing to do, exit to redboot. */
		k_state->user_proc_sp_value = k_state->redboot_sp_value;
		k_state->user_proc_lr_value = k_state->redboot_lr_value;
		k_state->user_proc_return_value = 0;
		k_state->user_proc_spsr = k_state->redboot_spsr_value;
	}else{
		k_state->user_proc_sp_value = scheduler->current_task_descriptor->stack_pointer;
		k_state->user_proc_lr_value = scheduler->current_task_descriptor->link_register;
		k_state->user_proc_return_value = scheduler->current_task_descriptor->return_value;
		k_state->user_proc_spsr = scheduler->current_task_descriptor->spsr_register;
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
		TD_Initialize(td, new_task_id, priority, parent_id, get_stack_base(new_task_id), code);
		scheduler->num_tasks += 1;
		scheduler->inited_td[new_task_id] = 1;
		scheduler->num_non_zombie_tasks += 1;

		safely_add_task_to_priority_queue(&scheduler->task_queue, td, priority);

		rtn = td->id;
	}

	Scheduler_SaveCurrentTaskState(scheduler, k_state);

	scheduler->current_task_descriptor->return_value = rtn;
	scheduler->current_task_descriptor->state = READY;

	Scheduler_ScheduleAndSetNextTaskState(scheduler, k_state);
}


void safely_add_task_to_priority_queue(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority){
	int queue_return_code = PriorityQueue_Put(queue, item, priority);
	assert(queue_return_code != ERR_QUEUE_FULL,"priority queue full");
	assert(queue_return_code != ERR_QUEUE_PRIORITY,"priority queue wrong priority");
}
