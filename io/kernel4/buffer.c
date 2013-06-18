#include "buffer.h"
#include "robio.h"

void RingBufferIndex_Initialize(RingBufferIndex * rbi, unsigned int size) {
	rbi->start = 0;
	rbi->end = 0;
	rbi->size = size;
}

int RingBufferIndex_Put(RingBufferIndex * rbi) {
	if ((rbi->end + 1) % rbi->size == rbi->start) {
		return ERR_BUFFER_FULL;
	}
	int index = rbi->end;

	rbi->end = (rbi->end + 1) % rbi->size;

	return index;
}

// Returns index where to get the item
int RingBufferIndex_Get(RingBufferIndex * rbi) {
	if (rbi->start == rbi->end) {
		return ERR_BUFFER_EMPTY;
	}

	int index = rbi->start;
	rbi->start = (rbi->start + 1) % rbi->size;
	return index;
}

void CharBuffer_Initialize(CharBuffer * buffer) {
	RingBufferIndex_Initialize(&buffer->buffer_index, BUFFER_SIZE);
}

int CharBuffer_PutChar(CharBuffer * buffer, char c) {
	int index = RingBufferIndex_Put(&buffer->buffer_index);

	if (index == ERR_BUFFER_FULL) {
		assert(0, "CharBuffer_PutChar: buffer is full");
		return ERR_BUFFER_FULL;
	}

	buffer->array[index] = c;

	return 0;
}

unsigned char CharBuffer_GetChar(CharBuffer * buffer) {
	int index = RingBufferIndex_Get(&buffer->buffer_index);

	if (index == ERR_BUFFER_EMPTY) {
		assert(0, "CharBuffer_GetChar: empty!");
		return ERR_BUFFER_EMPTY;
	}

	return buffer->array[index];
}

short CharBuffer_IsEmpty(CharBuffer * buffer) {
	return (buffer->buffer_index.start == buffer->buffer_index.end);
}
