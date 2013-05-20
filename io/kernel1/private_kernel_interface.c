#include "private_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"

void asm_KernelExit();

void print_kernel_state(KernelState * k_state){
	robprintfbusy((const unsigned char *)"Max tasks: %d.\n",k_state->max_tasks);
	robprintfbusy((const unsigned char *)"Last Kernel SP value: %x.\n",k_state->last_kernel_sp);
}

void k_InitKernel(){
	//  Now initialize the kernel stack pointer to the correct value
	//  The kernel state struct is stored at the base of the kernel stack, account for this.
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int)(KERNEL_STACK_START - sizeof(KernelState));

	//  Directly set the kernel state structure values on the stack.
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	k_state->max_tasks = 4;
	k_state->last_kernel_sp = (void*)*current_kernel_stack_pointer;

	//  Now print out some useful info
	robprintfbusy((const unsigned char *)"Inside kernel init function. SP is %x\n",*current_kernel_stack_pointer);
	print_kernel_state(k_state);
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int )k_state->last_kernel_sp;
	robprintfbusy((const unsigned char *)"In function k_Create. Priority is %d, code is %x\n",priority, code);
	print_kernel_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int )k_state->last_kernel_sp;
	robprintfbusy((const unsigned char *)"In function k_MyTid\n");
	print_kernel_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int )k_state->last_kernel_sp;
	robprintfbusy((const unsigned char *)"In function k_MyParentTid\n");
	print_kernel_state(k_state);
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int )k_state->last_kernel_sp;
	robprintfbusy((const unsigned char *)"In function k_Pass\n");
	print_kernel_state(k_state);
	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = (KernelState *) KERNEL_STACK_START;
	register int *current_kernel_stack_pointer asm ("r13");
        *current_kernel_stack_pointer = (int )k_state->last_kernel_sp;
	robprintfbusy((const unsigned char *)"In function k_Exit\n");
	print_kernel_state(k_state);
	asm_KernelExit();
}
