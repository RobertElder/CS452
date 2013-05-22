#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"

void FirstTask_Start() {
	//while(1){
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
	//}
	
	while(1){
	Pass();
	}
}

void GenericTask_Start() {
	int my_tid = MyTid();
	int my_parent_tid = MyParentTid();
	//while(1){
		//robprintfbusy((const unsigned char *)"INSIDE TASK Before Pass---------------------------- Task ID=%d\n",my_tid);
		robprintfbusy((const unsigned char *)"Task ID=%d, Parent ID=%d\n", my_tid, my_parent_tid);
		Pass();
		//robprintfbusy((const unsigned char *)"INSIDE TASK After Pass---------------------------- Task ID=%d\n",my_tid);
		robprintfbusy((const unsigned char *)"Task ID=%d, Parent ID=%d\n", my_tid, my_parent_tid);
		
		Exit();
	//}
}
