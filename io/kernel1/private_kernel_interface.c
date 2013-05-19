#include "private_kernel_interface.h"

void asm_KernelExit();

int k_Create( int priority, void (*code)( ) ){
	/* TODO Argument passing has not been thought through yet. */
	asm_KernelExit();
	return 0;
}

int k_MyTid(){
	/* TODO Argument passing has not been thought through yet. */
	asm_KernelExit();
	return 0;
}

int k_MyParentTid(){
	/* TODO Argument passing has not been thought through yet. */
	asm_KernelExit();
}

void k_Pass(){
	/* TODO Argument passing has not been thought through yet. */
	asm_KernelExit();
}

void k_Exit(){
	/* TODO Argument passing has not been thought through yet. */
	asm_KernelExit();
}
