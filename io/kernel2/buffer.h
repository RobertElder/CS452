#ifndef BUFFER_H_
#define BUFFER_H_
#define BUFFER_SIZE 1000

static const int ERR_BUFFER_FULL = -1;
static const int ERR_BUFFER_EMPTY = -2;

typedef struct RingBufferIndex {
	unsigned int start;
	unsigned int end;
	unsigned int size;
} RingBufferIndex;

typedef struct CharBuffer {
	unsigned char array[BUFFER_SIZE];
	RingBufferIndex buffer_index;
} CharBuffer;

void RingBufferIndex_Initialize(RingBufferIndex * rbi, unsigned int size);

// Returns index where to put the item
int RingBufferIndex_Put(RingBufferIndex * rbi);

// Returns index where to get the item
int RingBufferIndex_Get(RingBufferIndex * rbi);

void CharBuffer_Initialize(CharBuffer * buffer);

// Put a character. Returns 0 if ok.
int CharBuffer_PutChar(CharBuffer * buffer, char c);

//  Remove one character from the buffer we created.  Return null on empty buffer.
char CharBuffer_GetChar(CharBuffer * buffer);

#endif /* BUFFER_H_ */
