#include "memory.h"
#include "message.h"
#include "kernel_state.h"
#include "private_kernel_interface.h"
#include "robio.h"

void m_strcpy(char *dest, const char *src, int len) {
	// FIXME: I'm not optimal
	unsigned int i = 0;
	const int num_octets_small = 8;
	const int num_octets_big = 32;
	int * dest_addr = (int *) dest;
	int * src_addr = (int *) src;
	
//	assert((int) dest % 4 == 0, "m_strcpy: dest not word aligned");
//	assert((int) src % 4 == 0, "m_strcpy: src not word aligned");
	assert((int) dest_addr % 4 == 0, "m_strcpy: dest not word aligned 2");
	assert((int) src_addr % 4 == 0, "m_strcpy: src not word aligned 2");
	assert(len >= 0, "m_strcpy: len must not be negative");
	assert(len < 1000, "m_strcpy: len is unusually large");
	
//	assert((int)dest_addr == (int) dest, "m_strcpy: not same dest");
//	assert((int)src_addr == (int) src, "m_strcpy: not same src");
	
	int remaining;
	
	while (i < len) {
		remaining = len - i;
		
		if (remaining < num_octets_small) {
			dest[i] = src[i];
			i += 1;
		} else if (remaining < num_octets_big) {
			// Copy 2 words at a time
			asm (
				"STMfd sp!, {r0-r1}\n"
				"LDMia %[src]!, {r0-r1}\n"
				"STMia %[dest]!, {r0-r1}\n"
				"LDMfd sp!, {r0-r1}\n"
				: [src]"+r"(src_addr), [dest]"+r"(dest_addr) // output
				: // input
				: "lr", "sp", "ip", "pc", "fp", "r0","r1" // clobber
			);
			i += num_octets_small;
		} else {
			// Copy 8 words at a time
			asm (
				"STMfd sp!, {r0-r7}\n"
				"LDMia %[src]!, {r0-r7}\n"
				"STMia %[dest]!, {r0-r7}\n"
				"LDMfd sp!, {r0-r7}\n"
				: [src]"+r"(src_addr), [dest]"+r"(dest_addr) // output
				: // input
				: "lr", "sp", "ip", "pc", "fp", "r0","r1","r2", "r3", 
					"r4", "r5", "r6", "r7" // clobber
			);
			i += num_octets_big;
		}
	}
}


int m_strlen(const char * str) {
	// FIXME: I'm not optimal
	int i = 0;
	
	while (1) {
		if (str[i] == '\x00') {
			return i;
		} 
		i += 1;

		assert(i < 100000, "m_strlen has been running for a really long time");
	}
}

int m_strcmp(const char *s1, const char *s2) {
	// FIXME: I'm probably not optimal
	
	int word_i = 0;
	int i = 0;
	int * word_s1;
	int * word_s2;
	
	while (1) {
		word_s1 = (int*)s1 + word_i;
		word_s2 = (int*)s2 + word_i;
		
		if (*word_s1 != * word_s2) {
			break;
		}
		
		word_i += 4;
		i += 4;
	}
	
	while (1) {
		if (s1[i] != s2[i]) {
			return -1;
		}
		if (s1[i] == '\x00' || s2[i] == '\x00') {
			break;
		}
		i += 1;

		assert(i < 100000, "m_strcmp has been running for a really long time");
	}
	return 0;
}

void * request_memory(unsigned char * statuses, unsigned char * blocks){
	int i;
	for(i = 0; i < NUM_MEMORY_BLOCKS; i++){
		if(statuses[i] == 0){
			statuses[i] = 1;
			// Safety byte
			blocks[i * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE) + MEMORY_BLOCK_SIZE] = 42;
			return &(blocks[i * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE)]);
		}
	}
	assert(0,"Out of memory.");
	return 0;
}

void release_memory(unsigned char * statuses, unsigned char * blocks, void * old_block){
	//  TODO add better checks here
	int block_size = MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE;
	assert((((int)old_block - (int)blocks)) % block_size == 0,"Trying to deallocate memory block with invalid address.\n");
	int index = (((int)old_block - (int)blocks)) / block_size;
	assert(statuses[index] == 1, "Attempting to de-allocate a memory block that is not allocated.\n");
	statuses[index] = 0;
	char s = blocks[index * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE) + MEMORY_BLOCK_SIZE]; 
	assertf(s == 42, "Sanity check byte value was %d, but should have been 42.  A task must be writing past the end of the memory block.",s);
	return;
}

int validate_memory(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	int i;
	for(i = 0; i < NUM_MEMORY_BLOCKS; i++){
		if(k_state->memory_blocks_status[i] == 1){
			robprintfbusy((unsigned const char *)"Checking memory block %d, %x\n", i, &k_state->memory_blocks[i * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE)]);
			assert(k_state->memory_blocks[i * (MEMORY_BLOCK_SIZE + SANITY_BYTE_SIZE) + MEMORY_BLOCK_SIZE] == 42,"Memory integrity check failed.");
			return 1;
		}
	}
	return 0;
}


