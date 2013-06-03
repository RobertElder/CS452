#ifndef QUEUE_H_
#define QUEUE_H_

#define QUEUE_SIZE 50
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
	QueueItem items[QUEUE_SIZE];
	unsigned int start;
	unsigned int end;
	unsigned int current_count;
} Queue;

typedef struct PriorityQueue {
	Queue queues[NUM_PRIORITIES];
	
	// leading bit = 0th priority, trailing bit = 31st priority
	unsigned int queues_with_items;
} PriorityQueue;

void Queue_Initialize(Queue * queue);

int Queue_PushEnd(Queue * queue, QUEUE_ITEM_TYPE item);

QUEUE_ITEM_TYPE Queue_PopStart(Queue * queue);

int Queue_CurrentCount(Queue * queue);

void PriorityQueue_Initialize(PriorityQueue * queue);

int PriorityQueue_Put(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority);

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue);

int Queue_IsValidPriority(QueuePriority priority);

#endif /* QUEUE_H_ */
