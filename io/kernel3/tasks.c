#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"
#include "message.h"
#include "nameserver.h"
#include "rps.h"

void KernelTask_Start() {
	int tid = Create(NORMAL, &FirstTask_Start);
	
	assert(tid == 1, "FirstTask tid not 1");
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	int tid;
	const int num_clients = 3;
	
	tid = Create(NORMAL, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
	
	tid = Create(NORMAL, &RPSServer_Start);
	assert(tid == 3, "RPServer tid not 3");
	
	int i;
	for (i = 0; i < num_clients; i++) {
		tid = Create(NORMAL, &RPSClient_Start);
		assert(tid == 3 + i + 1, "RPSClient tid not");
	}
	
	Exit();
	
	assert(0, "Shouldn't see me\n");
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
