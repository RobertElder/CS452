void k_InitKernel();
int k_Create( int priority, void (*code)( ) );
int k_MyTid();
int k_MyParentTid();
void k_Pass();
void k_Exit();

#define KERNEL_STACK_START 0x01500000
#define KERNEL_STACK_SIZE 0x00100000
#define USER_TASKS_STACK_START (0x01500000 - 0x00100000)
#define USER_TASK_STACK_SIZE 0x00010000
