#ifndef QUEUE_H_
#define QUEUE_H_

#define QUEUE_SIZE 50
#define ERR_QUEUE_FULL -1
#define ERR_QUEUE_PRIORITY -2
#define QUEUE_ITEM_TYPE int*

typedef enum QueuePriority {
	HIGHEST, HIGH, NORMAL, LOW, LOWEST
} QueuePriority;

typedef struct QueueItem {
	QUEUE_ITEM_TYPE item;
} QueueItem;

typedef struct Queue {
	QueueItem items[QUEUE_SIZE];
	unsigned int start;
	unsigned int end;
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

void PriorityQueue_Initialize(PriorityQueue * queue);

int PriorityQueue_Put(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority);

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue);

#endif /* QUEUE_H_ */
