#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"
#include "message.h"
#include "nameserver.h"
#include "clock.h"
#include "notifier.h"
#include "rps.h"

void KernelTask_Start() {
	int tid = Create(HIGHEST, &FirstTask_Start);
	
	assert(tid == 1, "FirstTask tid not 1");
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	int tid;
	const int num_clients = 4;
	
	robprintfbusy((const unsigned char *)"FirstTask Start\n");
	
	tid = Create(HIGHEST + 1, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
	
	tid = Create(HIGHEST + 1, &ClockServer_Start);
	assert(tid > 0, "ClockServer tid not positive");
	
	tid = Create(HIGHEST, ClockNotifier_Start);
	assert(tid > 0, "ClockNotifier tid not positive");
	
	// 1
	tid = Create(3, &ClockClient_Start);
	assertf(tid > 0, "ClockClient tid not positive, got %d", tid);
	
	// 2
	tid = Create(4, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	
	// 3
	tid = Create(5, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	
	// 4
	tid = Create(6, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	
	
	robprintfbusy((const unsigned char *)"FirstTask begin receive\n");
	
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	K3Message * receive_message = (K3Message *) receive_buffer;
	K3Message * reply_message = (K3Message *) reply_buffer;
	
	// 1
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 1: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 1: wrong message type");
	int client_1_tid = source_tid;
	
	// 2
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 2: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 2: wrong message type");
	int client_2_tid = source_tid;
	
	// 3
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 3: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 3: wrong message type");
	int client_3_tid = source_tid;
	
	// 4
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 4: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 4: wrong message type");
	int client_4_tid = source_tid;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	// 1
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(client_1_tid, reply_buffer, MESSAGE_SIZE);
	
	// 2
	reply_message->delay_time = 23;
	reply_message->num_delays = 9;
	Reply(client_2_tid, reply_buffer, MESSAGE_SIZE);
	
	// 3
	reply_message->delay_time = 33;
	reply_message->num_delays = 6;
	Reply(client_3_tid, reply_buffer, MESSAGE_SIZE);
	
	// 4
	reply_message->delay_time = 71;
	reply_message->num_delays = 3;
	Reply(client_4_tid, reply_buffer, MESSAGE_SIZE);
	
	robprintfbusy((const unsigned char *)"FirstTask Exit\n");
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
