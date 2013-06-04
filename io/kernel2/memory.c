#include "memory.h"
#include "robio.h"

void m_strcpy(char *dest, const char *src, int len) {
	// FIXME: I'm not optimal
	unsigned int i = 0;
	unsigned int temp;
	
	while (i < len) {
		if (len - i < 4) {
			dest[i] = src[i];
			i += 1;
		} else {
			// Copy word
			asm (
				"LDR %3, [%1, +%0]\n"
				"STR %3, [%2, +%0]\n"
				: // output
				:"r"(i), "r"(src), "r"(dest), "r"(temp) // input
			);
			i += 4;
		}

		assert(i < 100000, "m_strcpy has been running for a really long time");
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
