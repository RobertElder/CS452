#include "public_kernel_interface.h"

int asm_CreateEntry();
int asm_MyTidEntry();
int asm_MyParentTidEntry();
void asm_PassEntry();
void asm_ExitEntry();


int Create( int priority, void (*code)( ) ){
	asm_CreateEntry();
	return 0;
}

int MyTid(){
	asm_MyTidEntry();
	return 0;
}

int MyParentTid(){
	asm_MyParentTidEntry();
	return 0;
}

void Pass(){
	asm_PassEntry();
}

void Exit(){
	asm_ExitEntry();
}
