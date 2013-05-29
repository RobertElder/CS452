#include "memory.h"

void strcpy(char *dest, const char *src) {
	// FIXME: I'm not optimal
	int i = 0;
	
	while (1) {
		dest[i] = src[i];
		if (src[i] == '\x00') {
			break;
		} 
		i += 1;
	}
}

int strcmp(const char *s1, const char *s2) {
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
