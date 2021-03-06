#ifndef MEMORY_H_
#define MEMORY_H_

// Returns length of string, does not include null terminator
int m_strlen(const char *src);

void m_strcpy(char *dest, const char *src, int len);
int m_strcmp(const char *s1, const char *s2);
void * request_memory(unsigned char *, unsigned char *);
void release_memory(unsigned char *, unsigned char *, void *);
int validate_memory();

#define NUM_MEMORY_BLOCKS 480
#define MEMORY_BLOCK_SIZE sizeof(KernelMessage)
#define SANITY_BYTE_SIZE 4

#endif
