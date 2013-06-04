#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"
#include "message.h"
#include "nameserver.h"
#include "clock.h"

void KernelTask_Start() {
	int tid = Create(NORMAL, &FirstTask_Start);
	
	assert(tid == 1, "FirstTask tid not 1");
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	int tid;
	const int num_clients = 4;
	
	robprintfbusy((const unsigned char *)"FirstTask Start\n");
	
	tid = Create(NORMAL, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
	
	tid = Create(NORMAL, &ClockServer_Start);
	assert(tid == 3, "RPServer tid not 3");
	
	// 1
	tid = Create(3, &ClockClient_Start);
	assert(tid == 4, "ClockClient tid not 4");
	
	// 2
	tid = Create(4, &ClockClient_Start);
	assert(tid == 5, "ClockClient tid not 5");
	
	// 3
	tid = Create(5, &ClockClient_Start);
	assert(tid == 6, "ClockClient tid not 6");
	
	// 4
	tid = Create(6, &ClockClient_Start);
	assert(tid == 7, "ClockClient tid not 7");
	
	
	robprintfbusy((const unsigned char *)"FirstTask begin receive\n");
	
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	K3Message * receive_message = (K3Message *) receive_buffer;
	K3Message * reply_message = (K3Message *) reply_buffer;
	
	// 1
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid == 4, "Receive 1: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 1: wrong message type");
	
	// 2
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid == 5, "Receive 2: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 2: wrong message type");
	
	// 3
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid == 6, "Receive 3: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 3: wrong message type");
	
	// 4
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid == 7, "Receive 4: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 4: wrong message type");
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	// 1
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(source_tid, reply_buffer, MESSAGE_SIZE);
	
	// 2
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(source_tid, reply_buffer, MESSAGE_SIZE);
	
	// 3
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(source_tid, reply_buffer, MESSAGE_SIZE);
	
	// 4
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(source_tid, reply_buffer, MESSAGE_SIZE);
	
	robprintfbusy((const unsigned char *)"FirstTask Exit");
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
