#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"

void FirstTask_Start() {
	while(1){
		robprintfbusy((const unsigned char *)"F1RST TASK!!1\n");
		int tid;
		
		tid = Create(LOW, &GenericTask_Start);
		robprintfbusy((const unsigned char *)"Created: %d\n", tid);
		
		tid = Create(LOW, &GenericTask_Start);
		robprintfbusy((const unsigned char *)"Created: %d\n", tid);
		
		tid = Create(HIGH, &GenericTask_Start);
		robprintfbusy((const unsigned char *)"Created: %d\n", tid);
			
		tid = Create(HIGH, &GenericTask_Start);
		robprintfbusy((const unsigned char *)"Created: %d\n", tid);
		Pass();
	}
}

int overflow(int times){
	robprintfbusy((const unsigned char *)"Doing overflow in task %d with time as %d\n",times, MyTid());
	int i = 0;
	Pass();
	if(times != 0){
		i = 1 + overflow(times-1);
		return i;
	}
	return i-1;
}

void GenericTask_Start() {
	int my_tid = MyTid();
	int my_parent_tid = MyParentTid();
	while(1){
		int i = 1;
		int j = 2;
		int k = 3;
		int l = 4;
		int m = 5;
		int n = 6;
		int o = 7;
		int p = 8;
		int q = 9;
		int r = 10;
		int s = 11;
		int t = 12;
		int u = 13;
		int v = 14;
		int w = 15;
		int x = 16;
		robprintfbusy((const unsigned char *)"INSIDE TASK Before Pass---------------------------- Task ID=%d\n",my_tid);
		robprintfbusy((const unsigned char *)"Task ID=%d, Parent ID=%d\n", my_tid, my_parent_tid);
		Pass();
		overflow(100);
		robprintfbusy((const unsigned char *)"INSIDE TASK After Pass---------------------------- Task ID=%d\n",my_tid);
		robprintfbusy((const unsigned char *)"Task ID=%d, Parent ID=%d\n", my_tid, my_parent_tid);
		assert((i == 1), "Stack must have been corrupted in GenericTask_Start.");
		assert((j == 2), "Stack must have been corrupted in GenericTask_Start.");
		assert((k == 3), "Stack must have been corrupted in GenericTask_Start.");
		assert((l == 4), "Stack must have been corrupted in GenericTask_Start.");
		assert((m == 5), "Stack must have been corrupted in GenericTask_Start.");
		assert((n == 6), "Stack must have been corrupted in GenericTask_Start.");
		assert((o == 7), "Stack must have been corrupted in GenericTask_Start.");
		assert((p == 8), "Stack must have been corrupted in GenericTask_Start.");
		assert((q == 9), "Stack must have been corrupted in GenericTask_Start.");
		assert((r == 10), "Stack must have been corrupted in GenericTask_Start.");
		assert((s == 11), "Stack must have been corrupted in GenericTask_Start.");
		assert((t == 12), "Stack must have been corrupted in GenericTask_Start.");
		assert((u == 13), "Stack must have been corrupted in GenericTask_Start.");
		assert((v == 14), "Stack must have been corrupted in GenericTask_Start.");
		assert((w == 15), "Stack must have been corrupted in GenericTask_Start.");
		assert((x == 16), "Stack must have been corrupted in GenericTask_Start.");
		
		Exit();
	}
}
