#include "public_kernel_interface.h"

// Don't optimize this file
// Problems with 5-th argument
// Optimized function calls just do a branch and the arguments are not
// pushed onto the stack.
// swi_kernel_interface.s expects arguments to be pushed onto the stack

int asm_SendEntry();

int Send(int tid, char *msg, int msglen, char *reply, int replylen){
	return asm_SendEntry(tid, msg, msglen, reply, replylen);
}

