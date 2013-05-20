
#include "public_kernel_interface.h"
#include "robio.h"

void asm_SwiCallEntry();

int main(){

	//  Instructions to print out 17:
	// 1100 a0e3 feff ffeb
	// after endianness 0xe3a00011 0xebfffffe

	int * first_swi_instruction_address = (int *)(0x8);
	int * swi_call_entry_address = (int *)(0x20);
	void (*swi_entry)() = asm_SwiCallEntry;
	*swi_call_entry_address = (int)swi_entry;
	// 1110(always) 010 (load/store immediate ) 1(offset based)  0(subtracted from base) 0(word access) 0(not updating base) 1(load) 1111(r15) 1111(r15) 0000 0000 0000 
	//
	/*  From the doc: 'If R15 is specified as register Rn, the value used is the address of the instruction plus eight.
	 *  ' WHAT??? WHY??? I WASTED A WHOLE DAY BECAUSE OF THIS!!!
	 *
	 * */
	*first_swi_instruction_address = 0xE51FF004;
	first_swi_instruction_address++;
	//  Put the address of the fcn here
	*first_swi_instruction_address = (int)&asm_SwiCallEntry;
	
	//MOV r0, PC;
	//bl robputrbusy(PLT)
	Create( 1, 0);
	MyTid();
	MyParentTid();
	Pass();
	Exit();
	return 0;
}
