#ifndef QUEUE_H_
#define QUEUE_H_

#define TASK_QUEUE_SIZE 1570
#define MESSAGE_QUEUE_SIZE 10
#define SWITCH_QUEUE_SIZE 256
#define QUEUE_ITEM_TYPE void*
#define NUM_PRIORITIES 32
#define TRAIN_SPEED_QUEUE_SIZE 50
#define TRAIN_ENGINE_RESERVATION_QUEUE_SIZE 50

static const int ERR_QUEUE_FULL = -1;
static const int ERR_QUEUE_PRIORITY = -2;

typedef enum QueuePriority {
	PRIORITY_0 = 0,
	PRIORITY_1 = 1,
	PRIORITY_2 = 2,
	PRIORITY_3 = 3,
	PRIORITY_4 = 4,
	PRIORITY_5 = 5,
	PRIORITY_6 = 6,
	PRIORITY_7 = 7,
	PRIORITY_8 = 8,
	PRIORITY_9 = 9,
	PRIORITY_10 = 10,
	PRIORITY_11 = 11,
	PRIORITY_12 = 12,
	PRIORITY_13 = 13,
	PRIORITY_14 = 14,
	PRIORITY_15 = 15,
	PRIORITY_16 = 16,
	PRIORITY_17 = 17,
	PRIORITY_18 = 18,
	PRIORITY_19 = 19,
	PRIORITY_20 = 20,
	PRIORITY_21 = 21,
	PRIORITY_22 = 22,
	PRIORITY_23 = 23,
	PRIORITY_24 = 24,
	PRIORITY_25 = 25,
	PRIORITY_26 = 26,
	PRIORITY_27 = 27,
	PRIORITY_28 = 28,
	PRIORITY_29 = 29,
	PRIORITY_30 = 30,
	PRIORITY_31 = 31,
} QueuePriority;

typedef struct QueueItem {
	QUEUE_ITEM_TYPE item;
} QueueItem;

typedef struct Queue {
	/* DON'T CREATE INSTANCES OF THIS TYPE WILL CORRUPT MEMORY, just a container for common methods */
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[0];
} Queue;

typedef struct TaskQueue {
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[TASK_QUEUE_SIZE];
} TaskQueue;

typedef struct MessageQueue {
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[MESSAGE_QUEUE_SIZE];
} MessageQueue;

typedef struct SwitchQueue {
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[SWITCH_QUEUE_SIZE];
} SwitchQueue;

typedef struct TrainSpeedQueue {
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[TRAIN_SPEED_QUEUE_SIZE];
} TrainSpeedQueue;

typedef struct TrainEngineReservationQueue {
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
	unsigned int size;
	QueueItem items[TRAIN_ENGINE_RESERVATION_QUEUE_SIZE];
} TrainEngineReservationQueue;

typedef struct PriorityQueue {
	TaskQueue queues[NUM_PRIORITIES];
	
	// leading bit = 0th priority, trailing bit = 31st priority
	unsigned int queues_with_items;
} PriorityQueue;

void Queue_Initialize(Queue * queue, unsigned int);

int Queue_PushEnd(Queue * queue, QUEUE_ITEM_TYPE item);

QUEUE_ITEM_TYPE Queue_RemoveItem(Queue * queue, QUEUE_ITEM_TYPE item);

QUEUE_ITEM_TYPE Queue_PopStart(Queue * queue);

int Queue_CurrentCount(Queue * queue);

void PriorityQueue_Initialize(PriorityQueue * queue);

int PriorityQueue_Put(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority);

QUEUE_ITEM_TYPE PriorityQueue_Remove(PriorityQueue * queue, QueuePriority p, QUEUE_ITEM_TYPE it);

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue);

QUEUE_ITEM_TYPE PriorityQueue_GetLower(PriorityQueue * queue, QueuePriority min_priority, QueuePriority * next_min_priority);


int Queue_IsValidPriority(QueuePriority priority);

void PriorityQueue_PrintItems(PriorityQueue * queue);

#endif /* QUEUE_H_ */
