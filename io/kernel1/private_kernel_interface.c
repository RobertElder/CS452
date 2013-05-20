#include "private_kernel_interface.h"
#include "robio.h"

void asm_KernelExit();

int k_Create( int priority, void (*code)( ) ){
	/* TODO Argument passing has not been thought through yet. */
	robputstrbusy((const unsigned char *)"In function k_Create.\n");
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
