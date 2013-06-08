
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"
#include "tasks.h"
#include "queue.h"
#include "ts7200.h"
#include "kernel_irq.h"

void asm_SwiCallEntry();
void asm_IrqCallEntry();
void asm_SetUpIRQStack();
void asm_TimerIRQEntry();

extern int _KernelStackBase;

/*
        MOV r0, PC;
        bl robputrbusy(PLT)
 *
 * */

int main(){
	int * swi_call_entry_address = (int *)(0x28); // SWI jump to address
	*swi_call_entry_address = (int)&asm_SwiCallEntry;
	
	int * irq_call_entry_address = (int *)(0x38);
	* irq_call_entry_address = (int)&asm_TimerIRQEntry;

	//  The first thing on the stack, is going to be the sp value we always want a kernel function to start wtih.
	int * kernel_saved_sp_loc = (int *)(KERNEL_STACK_START);
	//  Initialize the value of the saved kernel stack pointer that we will load every time we do an SWI call
	*kernel_saved_sp_loc = (int)(KERNEL_STACK_START - sizeof(KernelState));

	int * kernel_stack_base = (int *)(&_KernelStackBase);
	*kernel_stack_base = KERNEL_STACK_START;

	asm_SetUpIRQStack();
	
	InitKernel();
	
	return 0;
}


