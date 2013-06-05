#include "queue.h"
#include "robio.h"

void Queue_Initialize(Queue * queue) {
	queue->start = 0;
	queue->end = 0;
	queue->current_count = 0;
}

int Queue_PushEnd(Queue * queue, QUEUE_ITEM_TYPE item) {
	if ((queue->end + 1) % QUEUE_SIZE == queue->start) {
		return ERR_QUEUE_FULL;
	}
	
	assert((int)item, "Queue_PushEnd: item=0");

	queue->items[queue->end].item = item;
	queue->end = (queue->end + 1) % QUEUE_SIZE;
	queue->current_count += 1;
	
	return 0;
}

QUEUE_ITEM_TYPE Queue_PopStart(Queue * queue) {
	if (queue->start == queue->end) {
		return 0;
	}

	QUEUE_ITEM_TYPE item = queue->items[queue->start].item;

	assert((int)item, "Queue_PopStart: item=0");

	queue->start = (queue->start + 1) % QUEUE_SIZE;
	queue->current_count -= 1;
	return item;
}

int Queue_CurrentCount(Queue * queue) {
	return queue->current_count;
}

void PriorityQueue_Initialize(PriorityQueue * queue) {
	int i;
	for (i = 0; i < NUM_PRIORITIES; i++) {
		Queue_Initialize(&(queue->queues[i]));
	}
	queue->queues_with_items = 0;
}

int PriorityQueue_Put(PriorityQueue * queue, QUEUE_ITEM_TYPE item, QueuePriority priority) {
	if (!Queue_IsValidPriority(priority)) {
		assertf(0, "PriorityQueue_Put: Unknown priority %d", priority);
		return ERR_QUEUE_PRIORITY;
	}
	
	//robprintfbusy((const unsigned char *)"PQ: put %d at %d\n", item, priority);
	queue->queues_with_items |= 1 << (NUM_PRIORITIES - 1 - priority);
	//PriorityQueue_PrintItems(queue);
	return Queue_PushEnd(&(queue->queues[priority]), item);
}

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue) {
	return PriorityQueue_GetLower(queue, HIGHEST);
}

QUEUE_ITEM_TYPE PriorityQueue_GetLower(PriorityQueue * queue, QueuePriority min_priority) {	
	if (!Queue_IsValidPriority(min_priority)) {
		assertf(0, "PriorityQueue_GetLower: Unknown min_priority %d", min_priority);
		return ERR_QUEUE_PRIORITY;
	}

	int queues_with_items = queue->queues_with_items;
	
	// Make leading bits zeros for higher priorities we don't want to check
	queues_with_items &= (1 << (NUM_PRIORITIES - min_priority)) - 1;

	int priority = __builtin_clz(queues_with_items);
	
	if (priority == NUM_PRIORITIES) {
		// No items in any queue
		return 0;
	}
	
	assertf(Queue_IsValidPriority(priority), "PriorityQueue_GetLower: Got bad priority %d from CLZ", priority);
	assertf(priority >= min_priority, "PriorityQueue_GetLower: Got bad priority %d from CLZ  -- b", priority);
	
	QUEUE_ITEM_TYPE item = Queue_PopStart(&(queue->queues[priority]));
	
	if (item) {
		return item;
	} else {
		//robprintfbusy((const unsigned char *)"PQ: empty %d at %d\n", item, priority);
		queue->queues_with_items ^= 1 << (NUM_PRIORITIES - 1 - priority);
		//PriorityQueue_PrintItems(queue);
		return 0;
	}
}

int Queue_IsValidPriority(QueuePriority priority) {
	if (priority >= 0 && priority <= NUM_PRIORITIES - 1) {
		return 1;
	} else {
		return 0;
	}
}

int PriorityQueue_PrintItems(PriorityQueue * queue) {
	int i;
	int has_item;
	
	robprintfbusy((const unsigned char *)"PQ=%d ", queue);
	
	for (i = 0; i < NUM_PRIORITIES; i++) {
		has_item = queue->queues_with_items & 1 << (NUM_PRIORITIES - 1 - i);
		robprintfbusy((const unsigned char *)"%d=%d ", i, has_item);
	}
	
	robprintfbusy((const unsigned char *)"\n", queue);
}
