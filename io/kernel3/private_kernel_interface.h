void k_InitKernel();
int k_Create( int priority, void (*code)( ) );
int k_MyTid();
int k_MyParentTid();
void k_Pass();
void k_Exit();
int k_Send(int tid, char *msg, int msglen, char *reply, int replylen);
int k_Receive(int *tid, char *msg, int msglen);
int k_Reply(int tid, char *reply, int replylen);

void * get_stack_base(unsigned int task_id);
void print_memory_status();

#define TIMER_INTERRUPTS_ENABLED 1

/*  We need to leave room for the redboot stack to grow down.
 *  each time somebody executes a program, redboot pushes 0x50 onto the
 *  stack, but does not pop it off.  If you don't reset the board, the redboot
 *  stack will eventually grow down into all of memory.
 *  */
#define KERNEL_STACK_START (0x01fdcfdc - (0x50 * 100))
#define KERNEL_STACK_SIZE (sizeof(KernelState) + 1024 * 100)
#define TIMER_IRQ_STACK_START (KERNEL_STACK_START - KERNEL_STACK_SIZE)
#define TIMER_IRQ_STACK_SIZE 0x0080000
#define USER_TASKS_STACK_START (TIMER_IRQ_STACK_START - KERNEL_STACK_SIZE)
#define USER_TASK_STACK_SIZE 0x00010000
