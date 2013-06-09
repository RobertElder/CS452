#include "tasks.h"
#include "rps.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"
#include "message.h"
#include "nameserver.h"
#include "clock.h"
#include "ts7200.h"
#include "notifier.h"
#include "rps.h"

void KernelTask_Start() {
	int tid = Create(HIGHEST, &FirstTask_Start);
	
	assertf(tid == 1, "FirstTask tid not 1, got %d", tid);
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
//	Exit();
	int tid;
	
	robprintfbusy((const unsigned char *)"FirstTask Start tid=%d\n", MyTid());
	
	tid = Create(HIGHEST + 1, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
Create(HIGHEST, &RPSTestStart);
	
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
	
	tid = Create(LOWEST, &IdleTask_Start);
	assert(tid > 0, "IdleTask tid not positive");
	
	tid = Create(LOW, &ClockPrintTask_Start);
	assert(tid > 0, "ClockPrintTask_Start tid not positive");
	
	robprintfbusy((const unsigned char *)"FirstTask Exit\n");
	Exit();
	
	assert(0, "Shouldn't see me\n");
}

void ClockPrintTask_Start() {
	while (TimeSeconds() < 4) {
		print_current_time();
		DelaySeconds(1);
	}
	
	robprintfbusy((const unsigned char *)"ClockPrintTask Exit\n");
	
	Exit();
}

void IdleTask_Start() {
	unsigned int i = 0;
	
	while(TimeSeconds() < 5) {
		if (i % 10000 == 0) {
			//robprintfbusy((const unsigned char *)"IdleTask .... i=%d \n", i);
			//robprintfbusy((const unsigned char *)"IdleTask ... timer=%d \n", *timer_val);
		}
		Pass();
		i++;
	}
	
	robprintfbusy((const unsigned char *)"IdleTask begin shutdown\n");
	
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	
	ClockMessage * clock_send_message = (ClockMessage *) send_buffer;
	ClockMessage * clock_reply_message = (ClockMessage *) reply_buffer;
	clock_send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	
	Send(WhoIs((char*) CLOCK_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(clock_reply_message->message_type == MESSAGE_TYPE_ACK, "IdleTask: did not get a ack from clock server");
	
	NameServerMessage * ns_send_message = (NameServerMessage *) send_buffer;
	NameServerMessage * ns_reply_message = (NameServerMessage *) reply_buffer;
	ns_send_message->message_type = MESSAGE_TYPE_NAME_SERVER_SHUTDOWN;
	
	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assert(ns_reply_message->message_type==MESSAGE_TYPE_ACK, "IdleTask didn't get ACK from name server");

	robprintfbusy((const unsigned char *)"IdleTask Exit\n");
	
	Exit();
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
