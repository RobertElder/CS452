
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"
#include "queue.h"

void asm_SwiCallEntry();


/*
 *  Memory Map:
 *  It looks like what we have to work with is 0x00000000 - 0x01ffffff
 *  -  The program is loaded into 0x00218000
 *  -  Let's start the kernel stack at KERNEL_STACK_START
 *  -  Stacks grow down
 *
 *
 *
 * */

int main(){

	int * first_swi_instruction_address = (int *)(0x8);
	int * swi_call_entry_address = (int *)(0x20);
	//  The first thing on the stack, is going to be the sp value we always want a kernel function to start wtih.
	int * kernel_saved_sp_loc = (int *)(KERNEL_STACK_START);
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
	//  Initialize the value of the saved kernel stack pointer that we will load every time we do an SWI call
	*kernel_saved_sp_loc = (int)(KERNEL_STACK_START - sizeof(KernelState));
	
	//MOV r0, PC;
	//bl robputrbusy(PLT)
	InitKernel();
	
	Create(NORMAL, &FirstTask_Start);
	
	return 0;
	
	Create( 99, (void(*)())52);
	MyTid();
	MyParentTid();
	Pass();
	Exit();
	
	return 0;
}
