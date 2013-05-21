#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"

void asm_KernelExit();

void print_kernel_state(KernelState * k_state){
	robprintfbusy((const unsigned char *)"Max tasks: %d.\n",k_state->max_tasks);
	robprintfbusy((const unsigned char *)"Last User SP value: %x.\n",k_state->user_prod_sp_value);
	robprintfbusy((const unsigned char *)"Last User LR value: %x.\n",k_state->user_prod_lr_value);
}

void k_InitKernel(){
	//  Directly set the kernel state structure values on the stack.
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	k_state->max_tasks = MAX_TASKS;
	k_state->task_counter = 0;

	//  Now print out some useful info
	robprintfbusy((const unsigned char *)"Inside kernel init function. SP is %x\n",k_state->user_prod_sp_value);
	print_kernel_state(k_state);

	PriorityQueue_Initialize(&k_state->task_queue);
	
	robprintfbusy((const unsigned char *)"Leaving k_InitKernel.\n");

	//  Put the LR and SP back so we can switch back to that process.
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	//  Grab the parameters before they are overwritten
	register int *register_0 asm ("r0");
	priority = (int)register_0;
	register int *register_1 asm ("r1");
	code = (void (*)() )register_1;

	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	k_state->task_counter += 1;
	
	if (k_state->task_counter >= k_state->max_tasks) {
		// TODO: return ERR_K_OUT_OF_TD to callee
	}
	if (!Queue_IsValidPriority(priority)) {
		// TODO: return ERR_K_INVALID_PRIORITY to callee
	}

	robprintfbusy((const unsigned char *)"In function k_Create. "
		"Priority is %d, code is %x, new id is %d\n",
		priority, code, k_state->task_counter);
	print_kernel_state(k_state);
	
	TD * td = &(k_state->task_descriptors[k_state->task_counter]);
	TD_Initialize(td, k_state->task_counter, priority, 123456789);
	PriorityQueue_Put(&k_state->task_queue, td, priority);
	
	// TODO: return task id

	robprintfbusy((const unsigned char *)"Leaving k_Create.\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);

	robprintfbusy((const unsigned char *)"In function k_MyTid\n");
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_MyTid\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

int k_MyParentTid(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);

	robprintfbusy((const unsigned char *)"In function k_MyParentTid\n");
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_MyParentTid\n");
	asm_KernelExit();
	return 0; /* Needed to get rid of compiler warnings only.  Execution does not reach here */
}

void k_Pass(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);

	robprintfbusy((const unsigned char *)"In function k_Pass\n");
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_Pass\n");
	asm_KernelExit();
}

void k_Exit(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	robprintfbusy((const unsigned char *)"In function k_Exit\n");
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_Exit\n");
	asm_KernelExit();
}
