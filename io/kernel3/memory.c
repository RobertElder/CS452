#include "memory.h"
#include "robio.h"

void m_strcpy(char *dest, const char *src, int len) {
	// FIXME: I'm not optimal
	unsigned int i = 0;
	const int num_octets = 16;
	int * dest_addr = (int *) dest;
	int * src_addr = (int *) src;
	
	assert((int) dest % 4 == 0, "m_strcpy: dest not word aligned");
	assert((int) src % 4 == 0, "m_strcpy: src not word aligned");
	assert((int) dest_addr % 4 == 0, "m_strcpy: dest not word aligned 2");
	assert((int) src_addr % 4 == 0, "m_strcpy: src not word aligned 2");
	
	assert((int)dest_addr == (int) dest, "m_strcpy: not same dest");
	assert((int)src_addr == (int) src, "m_strcpy: not same src");
	
	while (i < len) {
		if (len - i < num_octets) {
			dest[i] = src[i];
			i += 1;
		} else {
			// Copy 4 words at a time
			robprintfbusy((const unsigned char *)"m_str_cpy before %d %x %x\n", i, src_addr, dest_addr);
			asm (
				"STMfd sp!, {r0-r3}\n"
				"LDMia %[src]!, {r0-r3}\n"
				"STMia %[dest]!, {r0-r3}\n"
				"LDMfd sp!, {r0-r3}\n"
				: [src]"+r"(src_addr), [dest]"+r"(dest_addr) // output
				: // input
				: "lr", "sp", "ip", "pc", "fp", "r0","r1","r2", "r3" // clobber
			);
			
			/*asm(
				"LDMfd sp!, {r0, r1, r2}\n"
				"LDMia */
			
			/*dest[i] = src[i];
			dest[i+1] = src[i+1];
			dest[i+2] = src[i+2];
			dest[i+3] = src[i+3];*/
			/*dest[i+4] = src[i+4];
			dest[i+5] = src[i+5];
			dest[i+6] = src[i+6];
			dest[i+7] = src[i+7];
			dest[i+8] = src[i+8];
			dest[i+9] = src[i+9];
			dest[i+10] = src[i+10];
			dest[i+11] = src[i+11];*/
			
			
			/*asm (
				"LDR %3, [%1, +%0]\n"
				"STR %3, [%2, +%0]\n"
 				: // output
				:"r"(i), "r"(src), "r"(dest), "r"(temp1) // input
			);*/

			//robprintfbusy((const unsigned char *)"m_str_cpy %d %x %x\n", i, *src_addr, *dest_addr);
			//robprintfbusy((const unsigned char *)"m_str_cpy %d %x %x\n", i + 4, *(src_addr+4), *(dest_addr+4));
			//robprintfbusy((const unsigned char *)"m_str_cpy %d %x %x\n", i + 8, *(src_addr+8), *(dest_addr+8));
			
			//assert(*src_addr == *dest_addr, "asdfasdf");
		//	assert(*(src_addr+4) == *(dest_addr + 4), "asdfj32809324");
		//	assert(*(src_addr+8) == *(dest_addr + 8), "a324324fsfsa fs09324");
			//src_addr += num_octets;
			//dest_addr += num_octets;
			i += num_octets;
			robprintfbusy((const unsigned char *)"m_str_cpy after %d %x %x\n", i, src_addr, dest_addr);
		}

		assert(i < 100000, "m_strcpy has been running for a really long time");
	}
	
	// Why does the 5-th byte not copied correctly???
	/*for (i = 0; i < 20;i++) {
	robprintfbusy((const unsigned char *)"m_strcpy= %x %x\n", src[i], dest[i]);
	}*/
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
