#include "queue.h"

void Queue_Initialize(Queue * queue) {
	queue->start = 0;
}

int Queue_PushEnd(Queue * queue, QUEUE_ITEM_TYPE item) {
	if ((queue->end + 1) % QUEUE_SIZE == queue->start) {
		return ERR_QUEUE_FULL;
	}

	QueueItem queue_item = {item};
	queue->items[queue->end] = queue_item;
	queue->end = (queue->end + 1) % QUEUE_SIZE;

	return 0;
}

QUEUE_ITEM_TYPE Queue_PopStart(Queue * queue) {
	if (queue->start == queue->end) {
		return 0;
	}

	QueueItem queue_item = queue->items[queue->end];
	queue->start = (queue->start + 1) % QUEUE_SIZE;
	return queue_item.item;
}


void PriorityQueue_Initialize(PriorityQueue * queue) {
	Queue_Initialize(&(queue->highest));
	Queue_Initialize(&(queue->high));
	Queue_Initialize(&(queue->normal));
	Queue_Initialize(&(queue->low));
	Queue_Initialize(&(queue->lowest));
}

int PriorityQueue_Put(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority) {
	switch(priority){
	case HIGHEST:
		return Queue_PushEnd(&(queue->highest), item);
	case HIGH:
		return Queue_PushEnd(&(queue->high), item);
	case NORMAL:
		return Queue_PushEnd(&(queue->normal), item);
	case LOW:
		return Queue_PushEnd(&(queue->lowest), item);
	case LOWEST:
		return Queue_PushEnd(&(queue->low), item);
	default:
		return ERR_QUEUE_PRIORITY;
	}
}

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue) {
	QUEUE_ITEM_TYPE item;

	// TODO: this looks messy
	item = Queue_PopStart(&(queue->highest));
	if (item) {
		return item;
	}
	item = Queue_PopStart(&(queue->high));
	if (item) {
		return item;
	}
	item = Queue_PopStart(&(queue->normal));
	if (item) {
		return item;
	}
	item = Queue_PopStart(&(queue->low));
	if (item) {
		return item;
	}
	item = Queue_PopStart(&(queue->lowest));
	if (item) {
		return item;
	}

	return 0;
}