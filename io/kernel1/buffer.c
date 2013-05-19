#include "buffer.h"

void Buffer_Initialize(Buffer * buffer) {
	buffer->start = 0;
	buffer->end = 0;
	buffer->size = BUFFER_SIZE;
}

int Buffer_PutChar(Buffer * buffer, char c) {
	if ((buffer->end + 1) % buffer->size == buffer->start) {
		return ERR_BUFFER_FULL;
	}

	buffer->array[buffer->end] = c;
	buffer->end = (buffer->end + 1) % buffer->size;

	return 0;
}

char Buffer_GetChar(Buffer * buffer) {
	if (buffer->start == buffer->end) {
		return 0;
	}

	unsigned char c = buffer->array[buffer->end];
	buffer->start = (buffer->start + 1) % buffer->size;
	return c;
}
