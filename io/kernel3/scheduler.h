#include "task_descriptor.h"
#include "queue.h"
#include "kernel_state.h"

#ifndef SCHEDULER_H_
#define SCHEDULER_H_

typedef struct Scheduler {
	unsigned int max_tasks;
	/* Pointer to the currently scheduled task */
	TD * current_task_descriptor;
	TD task_descriptors[MAX_TASKS + 1];
	short inited_td[MAX_TASKS + 1];
	PriorityQueue task_queue;
	unsigned int num_non_zombie_tasks;
	unsigned int num_tasks;
} Scheduler;

void Scheduler_Initialize(Scheduler * scheduler);

void Scheduler_InitAndSetKernelTask(Scheduler * scheduler, KernelState * k_state);

void Scheduler_CreateAndScheduleNewTask(Scheduler * scheduler, KernelState * k_state, int priority, void (*code)( ) );

TD * Scheduler_ScheduleNextTask(Scheduler * scheduler, KernelState * k_state);

void Scheduler_SaveCurrentTaskState(Scheduler * scheduler, KernelState * k_state);

void Scheduler_ScheduleAndSetNextTaskState(Scheduler * scheduler, KernelState * k_state);

void Scheduler_SetNextTaskState(Scheduler * scheduler, KernelState * k_state);

int Scheduler_IsInitedTid(Scheduler * scheduler, int tid);


void safely_add_task_to_priority_queue(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority);


#endif
