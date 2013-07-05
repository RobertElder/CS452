#include "task_descriptor.h"
#include "queue.h"
#include "kernel_state.h"
#include "public_kernel_interface.h"

#ifndef SCHEDULER_H_
#define SCHEDULER_H_

#define MAX_FUNCTION_MAPPINGS 30
#ifdef TEST
	#define WATCHDOG_STARVATION_COUNT 4000000
#else
	#define WATCHDOG_STARVATION_COUNT 1000000
#endif

typedef struct FunctionMapping{
	void * entry_point;
	const char * function_name;
} FunctionMapping;

typedef struct Scheduler {
	unsigned int max_tasks;
	/* Pointer to the currently scheduled task */
	TD * current_task_descriptor;
	TD task_descriptors[MAX_TASKS + 1];
	short inited_td[MAX_TASKS + 1];
	PriorityQueue task_queue;
	// Accounting counters
	unsigned int num_ready;
	unsigned int num_active;
	unsigned int num_zombie;
	unsigned int num_send_blocked;
	unsigned int num_reply_blocked;
	unsigned int num_receive_blocked;
	unsigned int num_event_blocked;
	unsigned int num_tasks;
	unsigned int has_tasks_event_blocked[NUM_EVENTS];
	unsigned int functions_registered;
	FunctionMapping function_mappings[MAX_FUNCTION_MAPPINGS];
	unsigned int scheduled_counter;
	unsigned int watchdog_feed_counter;
} Scheduler;

void Scheduler_Initialize(Scheduler * scheduler);

void Scheduler_InitAndSetKernelTask(Scheduler * scheduler, KernelState * k_state);

void Scheduler_CreateAndScheduleNewTask(Scheduler * scheduler, KernelState * k_state, int priority, void (*code)( ) );

TD * Scheduler_ScheduleNextTask(Scheduler * scheduler, KernelState * k_state);

void Scheduler_SaveCurrentTaskState(Scheduler * scheduler, KernelState * k_state);

void Scheduler_ScheduleAndSetNextTaskState(Scheduler * scheduler, KernelState * k_state);

void Scheduler_SetNextTaskState(Scheduler * scheduler, KernelState * k_state);

int Scheduler_IsInitedTid(Scheduler * scheduler, int tid);

void Scheduler_ChangeTDState(Scheduler * scheduler, TD * td, TaskState new_state);

void Scheduler_PrintTDCounts(Scheduler * scheduler);

void Scheduler_UnblockTasksOnEvent(Scheduler * scheduler, EventID event_id);

void safely_add_task_to_priority_queue(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority);

void DebugRegisterFunction();

const char * GetRegisteredFunctionName(Scheduler * scheduler, void * entry);

void SchedulerWatchdogTask_Start();

#endif
