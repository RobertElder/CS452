#include "private_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"

void asm_KernelExit();

void k_InitKernel(){
	//  Directly set the kernel state structure values on the stack.
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	k_state->max_tasks = 300;
	//  Now initialize the stack pointer to the correct value
	register int *current_kernel_stack_pointer asm ("r13");
	//  The kernel state struct is stored at the base of the kernel stack.
	*current_kernel_stack_pointer = KERNEL_STACK_START - sizeof(KernelState);
	robputstrbusy((const unsigned char *)"Current kernel stack pointer:\n");
	robputrbusy(*current_kernel_stack_pointer);
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	robprintfbusy((const unsigned char *)"Max tasks is %d.\n",k_state->max_tasks);
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_Create\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_MyTid\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_MyParentTid\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_Pass\n");
	asm_KernelExit();
}

void k_Exit(){
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_Exit\n");
	asm_KernelExit();
}
