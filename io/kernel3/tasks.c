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
	int tid;
	
	robprintfbusy((const unsigned char *)"FirstTask Start tid=%d\n", MyTid());
	
	// System user tasks
	tid = Create(HIGHEST + 1, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");

	tid = Create(HIGHEST, &ClockServer_Start);
	assert(tid > 0, "ClockServer tid not positive");
	
	tid = Create(HIGHEST + 2, &AdministratorTask_Start);
	assert(tid > 0, "AdministratorTask tid not positive");
	
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
	assertf(tid, "IdleTask tid not postive");
	
	Create(HIGHEST, &RPSTestStart);
	
	//tid = Create(LOW, &ClockPrintTask_Start);
	//assert(tid > 0, "ClockPrintTask_Start tid not positive");
	
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

void IdleTask_Start(){
	RegisterAs((char*) IDLE_TASK_NAME);

	/* While we are waiting for events, this task and the administrator just send messages back and forth */
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	int admin_tid;
	int tid_i = 0;
	while (1) {
		admin_tid = WhoIs((char*) ADMINISTRATOR_TASK_NAME);
		
		if (admin_tid) {
			break;
		}
		
		tid_i++;
		assert(tid_i < 1000, "IdleTask: admin tid not found");
	}
	
	int i = 0;
	while(1){
		if (i > 5000) {
			Send(admin_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
			assertf(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, "fail\n");
		
			if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
				break;
				robprintfbusy((const unsigned char *)"IdleTask_Start: Got shutdown\n" );
			}
			
			i = 0;
		} else {
			Pass();
		}
		
		i++;
	}

	Exit();
	assert(0,"Nope.");
}

void AdministratorTask_Start() {
	int return_code = RegisterAs((char*) ADMINISTRATOR_TASK_NAME);

	assert(return_code == 0, "AdministratorTask_Start failed to register name");

	unsigned int idletask_shutdown_sent = 0;
	unsigned int shutdown_requests = 0;
	unsigned int required_requests = 4;

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];

	GenericMessage * receive_msg = (GenericMessage *) receive_buffer;
	GenericMessage * reply_msg = (GenericMessage *) reply_buffer;

	int source_tid;
	
	//  Wait until all the clients tell us they are done
	while((shutdown_requests < required_requests) || idletask_shutdown_sent == 0) {
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		switch(receive_msg->message_type) {
			case MESSAGE_TYPE_SHUTDOWN:{
				shutdown_requests++;
				reply_msg->message_type = MESSAGE_TYPE_ACK;
				Reply(source_tid, reply_buffer, MESSAGE_SIZE);
				break;
			}case MESSAGE_TYPE_HELLO:{
				if(shutdown_requests == required_requests){
					reply_msg->message_type = MESSAGE_TYPE_SHUTDOWN;
					idletask_shutdown_sent = 1;
					// robprintfbusy((const unsigned char *)"Sending shutdown to idle task %d\n" ,source_tid );
				}else{
					reply_msg->message_type = MESSAGE_TYPE_ACK;
				}
				Reply(source_tid, reply_buffer, MESSAGE_SIZE);
				break;
			}default:{
				assertf(0, "AdministratorTask_Start: unknown message type %d", receive_msg->message_type);
			}
		}

		Pass();
	}
	
	robprintfbusy((const unsigned char *)"AdministratorTask_Start: Got %d shutdowns needed %d, shutdown send %d\n" , shutdown_requests, required_requests, idletask_shutdown_sent);
	
	ClockMessage * clock_send_message = (ClockMessage *) send_buffer;
	ClockMessage * clock_reply_message = (ClockMessage *) reply_buffer;
	clock_send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	
	Send(WhoIs((char*) CLOCK_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(clock_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from clock server");
	
	NameServerMessage * ns_send_message = (NameServerMessage *) send_buffer;
	NameServerMessage * ns_reply_message = (NameServerMessage *) reply_buffer;
	ns_send_message->message_type = MESSAGE_TYPE_NAME_SERVER_SHUTDOWN;
	
	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assert(ns_reply_message->message_type==MESSAGE_TYPE_ACK, "AdministratorTask_Start didn't get ACK from name server");

	robprintfbusy((const unsigned char *)"AdministratorTask Exit\n");
	
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
