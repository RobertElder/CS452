#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"

void KernelTask_Start() {
	int tid = Create(NORMAL, &FirstTask_Start);
	
	assert(tid == 1, "FirstTask tid not 1");
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	int tid;

	int aaa = Send(1, (char *)2, 3, (char*)4, 383);
	int bbb = Receive( (int *)1, (char *)2, 3);
	int ccc = Reply( 1, (char *)2, 3);
	assertf((8 == aaa),"rtn is wrong it is %d",aaa);
	assertf((7 == bbb),"rtn is wrong it is %d",bbb);
	assertf((6 == ccc),"rtn is wrong it is %d",ccc);
	
	
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

void NameServer_Start() {
	// TODO
}

void RPSServer_Start() {
	int result = RegisterAs(RPS_SERVER_NAME);
	
	assert(result == 0, "RPSServer_Start failed to register name");
	
	// TODO
}

void RPSClient_Start() {
	int server_tid = WhoIs(RPS_SERVER_NAME);

	// TODO perform a set of requests that adequately tests the RPS server,
	
	// TODO send a quit request when they have finished playing, and

	Exit();
}
