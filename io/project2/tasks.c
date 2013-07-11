#include "priorities.h"
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
#include "uart.h"
#include "ui.h"
#include "ansi.h"
#include "train.h"

void KernelTask_Start() {
	DebugRegisterFunction(&KernelTask_Start,__func__);
	int tid = Create(FIRSTTASK_START_PRIORITY, &FirstTask_Start);
	
	assertf(tid == 1, "FirstTask tid not 1, got %d", tid);
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	DebugRegisterFunction(&FirstTask_Start,__func__);
	int tid;
	
	// System user tasks
	tid = Create(NAMESERVER_START_PRIORITY, &NameServer_Start);
	assert(tid == NAMESERVER_TID, "NameServer tid not 2");
	Pass();

	tid = Create(CLOCKSERVER_START_PRIORITY, &ClockServer_Start);
	assert(tid > 0, "ClockServer tid not positive");
	Pass();
	
	tid = Create(ADMINISTRATORTASK_START_PRIORITY, &AdministratorTask_Start);
	assert(tid > 0, "AdministratorTask tid not positive");
	Pass();
	
	tid = Create(PRIORITY_31, SchedulerWatchdogTask_Start);
	assert(tid > 0, "SchedulerWatchdogTask tid not positive");
	Pass();
	
#ifndef TEST
	tid = Create(UARTBOOTSTRAPTASK_START_PRIORITY, &UARTBootstrapTask_Start);
	assert(tid > 0, "UARTBootstrapTask tid not positive");
	Pass();

	tid = Create(TRAINSERVER_START_PRIORITY, &TrainServer_Start);
	assert(tid > 0, "TrainServer tid not positive");
	Pass();
	
	tid = Create(UISERVER_START_PRIORITY, &UIServer_Start);
	assert(tid > 0, "UIServer_Start tid not positive");
	Pass();
#endif // TEST
	
#ifdef TEST
	// Begin testing tasks
	
	tid = Create(RPSTESTSTART_PRIORITY, &RPSTestStart);
	Pass();
	// 1
	tid = Create(CLOCKCLIENT_START_PRIORITY_3, &ClockClient_Start);
	assertf(tid > 0, "ClockClient tid not positive, got %d", tid);
	Pass();
	
	// 2
	tid = Create(CLOCKCLIENT_START_PRIORITY_4, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	Pass();
	
	// 3
	tid = Create(CLOCKCLIENT_START_PRIORITY_5, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	Pass();
	
	// 4
	tid = Create(CLOCKCLIENT_START_PRIORITY_6, &ClockClient_Start);
	assert(tid > 0, "ClockClient tid not positive");
	Pass();
	
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int source_tid;
	K3Message * receive_message = (K3Message *) receive_buffer;
	K3Message * reply_message = (K3Message *) reply_buffer;
	Pass();
	
	// 1
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 1: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 1: wrong message type");
	int client_1_tid = source_tid;
	Pass();
	
	// 2
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 2: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 2: wrong message type");
	int client_2_tid = source_tid;
	Pass();
	
	// 3
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 3: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 3: wrong message type");
	int client_3_tid = source_tid;
	Pass();
	
	// 4
	Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
	assertf(source_tid > 0, "Receive 4: wrong tid=%d", source_tid);
	assertf(receive_message->message_type == MESSAGE_TYPE_HELLO, "Receive 4: wrong message type");
	int client_4_tid = source_tid;
	Pass();
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	// 1
	reply_message->delay_time = 10;
	reply_message->num_delays = 20;
	Reply(client_1_tid, reply_buffer, MESSAGE_SIZE);
	Pass();
	
	// 2
	reply_message->delay_time = 23;
	reply_message->num_delays = 9;
	Reply(client_2_tid, reply_buffer, MESSAGE_SIZE);
	Pass();
	
	// 3
	reply_message->delay_time = 33;
	reply_message->num_delays = 6;
	Reply(client_3_tid, reply_buffer, MESSAGE_SIZE);
	Pass();
	
	// 4
	reply_message->delay_time = 71;
	reply_message->num_delays = 3;
	Reply(client_4_tid, reply_buffer, MESSAGE_SIZE);
	Pass();
	
	// End testing tasks above
#endif // TEST

	tid = Create(IDLETASK_START_PRIORITY, &IdleTask_Start);
	assertf(tid, "IdleTask tid not postive");
	
	
	Exit();
	
	assert(0, "Shouldn't see me\n");
}

void ClockPrintTask_Start() {
	DebugRegisterFunction(&ClockPrintTask_Start,__func__);
	while (TimeSeconds() < 4) {
		print_current_time();
		DelaySeconds(1);
	}
	
	Exit();
}

void IdleTask_Start(){
	DebugRegisterFunction(&IdleTask_Start,__func__);
	RegisterAs((char*) IDLE_TASK_NAME);

	/* While we are waiting for events, this task and the administrator just send messages back and forth */
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	int admin_tid;
	while (1) {
		admin_tid = WhoIs((char*) ADMINISTRATOR_TASK_NAME);
		
		if (admin_tid) {
			break;
		}

		DelaySeconds(0.2);
	}
	
	while(1){
		Send(admin_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assertf(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, "fail\n");
	
		if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			break;
		}
	}

	Exit();
	assert(0,"Nope.");
}

void AdministratorTask_Start() {
	DebugRegisterFunction(&AdministratorTask_Start,__func__);
	/* The purpose of the administrator is to keep track of when we should shutdown everything in the system */
	int return_code = RegisterAs((char*) ADMINISTRATOR_TASK_NAME);

	assert(return_code == 0, "AdministratorTask_Start failed to register name");

	unsigned int idletask_shutdown_sent = 0;
	unsigned int shutdown_requests = 0;
#ifdef TEST
	unsigned int required_requests = 4;
#else
	unsigned int required_requests = 1;
#endif

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

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
				}else{
					reply_msg->message_type = MESSAGE_TYPE_ACK;
				}
				Reply(source_tid, reply_buffer, MESSAGE_SIZE);
				break;
			}default:{
				assertf(0, "AdministratorTask_Start: unknown message type %d", receive_msg->message_type);
				break;
			}
		}

		Pass();
	}
	
	
	GenericMessage * shutdown_send_message = (GenericMessage *) send_buffer;
	GenericMessage * shutdown_reply_message = (GenericMessage *) reply_buffer;
	shutdown_send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	
#ifndef TEST

// begin ui.c
	Send(WhoIs((char*) UI_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from ui server");
// end ui.c


// begin train.c
	Send(WhoIs((char*) TRAIN_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from train server");
// end train.c

// shutdown io last
// begin uart.c
	Send(WhoIs((char*) KEYBOARD_INPUT_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from keyboard input server");
	Send(WhoIs((char*) SCREEN_OUTPUT_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from screen output server");
	Send(WhoIs((char*) TRAIN_INPUT_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from train input server");
	Send(WhoIs((char*) TRAIN_OUTPUT_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from train output server");
// end uart.c

#endif // TEST

	//  Shutdown the clock server last because it is needed to unblock things waiting on events.
	Send(WhoIs((char*) CLOCK_SERVER_NAME), send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assertf(shutdown_reply_message->message_type == MESSAGE_TYPE_ACK, "AdministratorTask_Start: did not get a ack from clock server");

	NameServerMessage * ns_send_message = (NameServerMessage *) send_buffer;
	NameServerMessage * ns_reply_message = (NameServerMessage *) reply_buffer;
	ns_send_message->message_type = MESSAGE_TYPE_NAME_SERVER_SHUTDOWN;
	
	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assert(ns_reply_message->message_type==MESSAGE_TYPE_ACK, "AdministratorTask_Start didn't get ACK from name server");

	Exit();
}

int overflow(int times){
	int i = 0;
	Pass();
	if(times != 0){
		i = 1 + overflow(times-1);
		return i;
	}
	return i-1;
}
