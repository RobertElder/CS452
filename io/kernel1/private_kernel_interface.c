#include "private_kernel_interface.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "kernel_state.h"

void asm_KernelExit();

void print_kernel_state(KernelState * k_state){
	robprintfbusy((const unsigned char *)"---- Kernel State ----.\n");
	robprintfbusy((const unsigned char *)"Max tasks: %d.\n",k_state->max_tasks);
	robprintfbusy((const unsigned char *)"Last User SP value: %x.\n",k_state->user_proc_sp_value);
	robprintfbusy((const unsigned char *)"Last User LR value: %x.\n",k_state->user_proc_lr_value);
}

/* TODO:  Calling a kernel function from inside another kernel function is not supported. */

void first_user_proc(){
	while(1){
		robprintfbusy((const unsigned char *)"Inside first user proc.\n");
		Create(83, (void*)9);
	}
}

void * get_stack_base(unsigned int task_id){
	assert(task_id == 3,"Unimplemented.");
	return (void*)0x01400000;
}

void k_InitKernel(){
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	robprintfbusy((const unsigned char *)"In function k_InitKernel\n");
	print_kernel_state(k_state);
	//  Directly set the kernel state structure values on the stack.
	k_state->max_tasks = 4;
	k_state->current_task_descriptor = &(k_state->task_descriptors[0]);
	k_state->current_task_descriptor->link_register = (void *)&first_user_proc;
	k_state->current_task_descriptor->stack_pointer = get_stack_base(3);

	robprintfbusy((const unsigned char *)"Leaving k_InitKernel.\n");
	//  Set the currently saved process LR and SP to the new process so we can context switch into it when we do asm_KernelExit.
	k_state->user_proc_sp_value = k_state->current_task_descriptor->stack_pointer;
	k_state->user_proc_lr_value = k_state->current_task_descriptor->link_register;
	print_kernel_state(k_state);
	asm_KernelExit();
}

int k_Create( int priority, void (*code)( ) ){
	//  Grab the parameters before they are overwritten
	register int *register_0 asm ("r0");
	priority = (int)register_0;
	register int *register_1 asm ("r1");
	code = (void (*)() )register_1;

	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	void * temp_sp = k_state->user_proc_sp_value;
	void * temp_lr = k_state->user_proc_lr_value;

	robprintfbusy((const unsigned char *)"In function k_Create. Priority is %d, code is %x\n",priority, code);
	print_kernel_state(k_state);
	robprintfbusy((const unsigned char *)"Leaving k_Create.\n");
	k_state->user_proc_sp_value = temp_sp;
	k_state->user_proc_lr_value = temp_lr;
	print_kernel_state(k_state);
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
