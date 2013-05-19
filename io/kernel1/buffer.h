#ifndef BUFFER_H_
#define BUFFER_H_
#define BUFFER_SIZE 1000

const int ERR_BUFFER_FULL = -1;

typedef struct Buffer {
	unsigned char array[BUFFER_SIZE];
	unsigned int start;
	unsigned int end;
	unsigned int size;
} Buffer;

void Buffer_Initialize(Buffer * buffer);

// Put a character. Returns 0 if ok.
int Buffer_PutChar(Buffer * buffer, char c);

//  Remove one character from the buffer we created.  Return null on empty buffer.
char Buffer_GetChar(Buffer * buffer);

#endif /* BUFFER_H_ */
