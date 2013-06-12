#ifndef QUEUE_H_
#define QUEUE_H_

#define TASK_QUEUE_SIZE 1570
#define MESSAGE_QUEUE_SIZE 10
#define QUEUE_ITEM_TYPE void*
#define NUM_PRIORITIES 32

static const int ERR_QUEUE_FULL = -1;
static const int ERR_QUEUE_PRIORITY = -2;

typedef enum QueuePriority {
	HIGHEST=0,
	HIGH=8,
	NORMAL=16,
	LOW=24,
	LOWEST=31,
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
