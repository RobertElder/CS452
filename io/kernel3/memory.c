#include "memory.h"
#include "robio.h"

void m_strcpy(char *dest, const char *src, int len) {
	// FIXME: I'm not optimal
	unsigned int i = 0;
	unsigned int temp1 = 0xdeadbeef;
	unsigned int temp2 = 0xdeadbeef;
	void * dest_addr = (void *) dest_addr;
	void * src_addr = (void *) src_addr;
	
	assert((int) dest % 4 == 0, "m_strcpy: dest not word aligned");
	assert((int) src % 4 == 0, "m_strcpy: src not word aligned");
	
	while (i < len) {
		if (len - i < 4) {
			dest[i] = src[i];
			i += 1;
		} else {
			// Copy 2 words at a time
			asm (
				"LDMia %0, {%2, %3}\n"
				"STMia %1, {%2, %3}\n"
				: // output
				:"r"(src_addr), "r"(dest_addr), "r"(temp1), "r"(temp2) // input
			);
			
			/*asm (
				"LDR %3, [%1, +%0]\n"
				"STR %3, [%2, +%0]\n"
 				: // output
				:"r"(i), "r"(src), "r"(dest), "r"(temp1) // input
			);*/

			src_addr += 8;
			dest_addr += 8;
			i += 8;
			robprintfbusy((const unsigned char *)"m_str_cpy %d %d %d\n", i, src_addr, dest_addr);
		}

		assert(i < 100000, "m_strcpy has been running for a really long time");
	}
	
	// Why does the 5-th byte not copied correctly???
	for (i = 0; i < 20;i++) {
	robprintfbusy((const unsigned char *)"m_strcpy= %x %x\n", src[i], dest[i]);
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
	
	int i = 0;
	
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
