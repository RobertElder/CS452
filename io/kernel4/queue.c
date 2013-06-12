#include "queue.h"
#include "robio.h"

void Queue_Initialize(Queue * queue, unsigned int size) {
	queue->start = 0;
	queue->end = 0;
	queue->current_count = 0;
	queue->size = size;
}

int Queue_PushEnd(Queue * queue, QUEUE_ITEM_TYPE item) {
	if ((queue->end + 1) % queue->size == queue->start) {
		assertf(0,"Queue is full. Size is %d.\n",queue->size);
		return ERR_QUEUE_FULL;
	}
	
	assert((int)item, "Queue_PushEnd: item=0");

	queue->items[queue->end].item = item;
	queue->end = (queue->end + 1) % queue->size;
	queue->current_count += 1;
	
	return 0;
}

QUEUE_ITEM_TYPE Queue_PopStart(Queue * queue) {
	if (queue->start == queue->end) {
		return 0;
	}

	QUEUE_ITEM_TYPE item = queue->items[queue->start].item;

	assert((int)item, "Queue_PopStart: item=0");

	queue->start = (queue->start + 1) % queue->size;
	queue->current_count -= 1;
	return item;
}

int Queue_CurrentCount(Queue * queue) {
	return queue->current_count;
}


QUEUE_ITEM_TYPE Queue_RemoveItem(Queue * queue, QUEUE_ITEM_TYPE item){
	assert(0,"This function has a bug in it because I though we needed it but I guess not.  Gonna leave it here just in case.");

	/*  !!! THIS FUNCTION WILL ONLY WORK AS LONG AS QUEUEITEM ONLY CONTAINS QUEUE ITEM TYPE !!! */
	assert(sizeof(QUEUE_ITEM_TYPE) == sizeof(QueueItem),"Precondition violated.");
	/*  This function will remove an arbitrary element from the queue by 
	 *  figuring out its index via pointer math, then putting the last element
	 *  in the queue into its position.  Pretty scary eh?
	 *  */
	QUEUE_ITEM_TYPE buffer_start = &(queue->items[0].item);
	int item_index = (item - buffer_start) / sizeof(QUEUE_ITEM_TYPE);
	assertf(item_index >= 0 && item_index < queue->size, "Attempting to remove item %d from queue of size %d.\n", item_index, queue->size);

	assert(queue->start != queue->end, "Attempting to remove item from empty queue.\n");

	//  Modulus math with negatives is not well defined, avoid negatives.
	if(item_index == queue->start && queue->start == (queue->end + (queue->size -1)) % queue->size){
		//  There was only one item in the queue.
		queue->end = queue->start;
	}else{
		//  Otherwise there must be more than one item in the queue.
		queue->items[item_index].item = queue->items[queue->end].item;
		queue->end = (queue->end + (queue->size -1)) % queue->size;
	}
	queue->current_count -= 1;
	return item;
}

void PriorityQueue_Initialize(PriorityQueue * queue) {
	int i;
	for (i = 0; i < NUM_PRIORITIES; i++) {
		Queue_Initialize((Queue*)&(queue->queues[i]),TASK_QUEUE_SIZE);
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
	return Queue_PushEnd((Queue*)&(queue->queues[priority]), item);
}

QUEUE_ITEM_TYPE PriorityQueue_Get(PriorityQueue * queue) {
	return PriorityQueue_GetLower(queue, HIGHEST, 0);
}

QUEUE_ITEM_TYPE PriorityQueue_Remove(PriorityQueue * queue, QueuePriority p, QUEUE_ITEM_TYPE it) {
	QUEUE_ITEM_TYPE item = Queue_RemoveItem((Queue*)&(queue->queues[p]), it);

	if (!item) {
		queue->queues_with_items ^= 1 << (NUM_PRIORITIES - 1 - p);
	}
	return item;
}

QUEUE_ITEM_TYPE PriorityQueue_GetLower(PriorityQueue * queue, QueuePriority min_priority, QueuePriority * next_min_priority) {
	if (!Queue_IsValidPriority(min_priority)) {
		assertf(0, "PriorityQueue_GetLower: Unknown min_priority %d", min_priority);
		return (QUEUE_ITEM_TYPE) ERR_QUEUE_PRIORITY;
	}

	int queues_with_items = queue->queues_with_items;
	
	// Make leading bits zeros for higher priorities we don't want to check
	queues_with_items &= (1 << (NUM_PRIORITIES - min_priority)) - 1;

	int priority = __builtin_clz(queues_with_items);
	
	if (next_min_priority) {
		*next_min_priority = priority;
	}
	
	if (priority == NUM_PRIORITIES) {
		// No items in any queue
		return 0;
	}
	
	assertf(Queue_IsValidPriority(priority), "PriorityQueue_GetLower: Got bad priority %d from CLZ", priority);
	assertf(priority >= min_priority, "PriorityQueue_GetLower: Got bad priority %d from CLZ  -- b", priority);
	
	QUEUE_ITEM_TYPE item = Queue_PopStart((Queue*)&(queue->queues[priority]));
	
	if (!item) {
		queue->queues_with_items ^= 1 << (NUM_PRIORITIES - 1 - priority);
	}
	return item;
}

int Queue_IsValidPriority(QueuePriority priority) {
	if (priority >= 0 && priority <= NUM_PRIORITIES - 1) {
		return 1;
	} else {
		return 0;
	}
}

void PriorityQueue_PrintItems(PriorityQueue * queue) {
	int i;
	int has_item;
	
	robprintfbusy((const unsigned char *)"PQ=%d ", queue);
	
	for (i = 0; i < NUM_PRIORITIES; i++) {
		has_item = queue->queues_with_items & 1 << (NUM_PRIORITIES - 1 - i);
		robprintfbusy((const unsigned char *)"%d=%d ", i, has_item);
	}
	
	robprintfbusy((const unsigned char *)"\n", queue);
}
