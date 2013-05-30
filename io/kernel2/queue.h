#ifndef QUEUE_H_
#define QUEUE_H_

#define QUEUE_SIZE 50
#define QUEUE_ITEM_TYPE void*

static const int ERR_QUEUE_FULL = -1;
static const int ERR_QUEUE_PRIORITY = -2;

typedef enum QueuePriority {
	HIGHEST=1, HIGH=2, NORMAL=3, LOW=4, LOWEST=5
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
	Queue highest;
	Queue high;
	Queue normal;
	Queue low;
	Queue lowest;
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
