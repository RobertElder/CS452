
#include "public_kernel_interface.h"

void asm_SwiCallEntry();

int main(){
	int * first_swi_instruction_address = (int *)(0x8);
	int * swi_call_entry_address = (int *)(0x20);
	void (*swi_entry)() = asm_SwiCallEntry;
	*swi_call_entry_address = (int)swi_entry;
	//  Encodes the instruction for ldr  pc, [pc, #0x18]
	*first_swi_instruction_address = 0xE59FF018;
	//Create( 1, 0);
	return 0;
}
