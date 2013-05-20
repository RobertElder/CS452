void k_InitKernel();
int k_Create( int priority, void (*code)( ) );
int k_MyTid();
int k_MyParentTid();
void k_Pass();
void k_Exit();

#define KERNEL_STACK_START 0x01500000
