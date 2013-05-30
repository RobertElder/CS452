#include "memory.h"

void m_strcpy(char *dest, const char *src, int len) {
	// FIXME: I'm not optimal
	int i = 0;
	
	while (i < len) {
		dest[i] = src[i];
		i += 1;
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
	}
	return 0;
}
