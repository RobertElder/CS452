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
	
	tid = Create(NORMAL, &SecondTask_Start);
	assert(tid == 2, "second task tid not 2");
	
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	TestMessage * receive_message = (TestMessage *) receive_buffer;
	TestMessage * reply_message = (TestMessage *) reply_buffer;
	int source_tid;

	while (1) {
		Receive(&source_tid, receive_buffer,MESSAGE_SIZE);
		assert(source_tid == 2, "Source tid wasnt 2");

		if (receive_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}

		assert(receive_message->message_type == MESSAGE_TYPE_PLAY, "1st task didn't get PLAY message");
		robprintfbusy((const unsigned char *)"First: received\n");
		reply_message->message_type = MESSAGE_TYPE_ACK;
		Reply(2, reply_buffer, MESSAGE_SIZE);
		robprintfbusy((const unsigned char *)"First: replied\n");
		Pass();
	}
	
	robprintfbusy((const unsigned char *)"First: received shutdown\n");
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(2, reply_buffer, MESSAGE_SIZE);
	robprintfbusy((const unsigned char *)"First: replied\n");
	robprintfbusy((const unsigned char *)"First: shutdown\n");
	
	Exit();
	
	assert(0, "Shouldn't see me\n");
}

void SecondTask_Start() {
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	TestMessage * send_message = (TestMessage *) send_buffer;
	TestMessage * reply_message = (TestMessage *) reply_buffer;
	unsigned int count = 0;
	while (count < 100) {
		send_message->message_type = MESSAGE_TYPE_PLAY;
		Send(1, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "second task didn't get an ACK message");
		robprintfbusy((const unsigned char *)"Second: sent\n");
		Pass();
		count ++;
	}

	send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	Send(1, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "second task didn't get an ACK message");
	robprintfbusy((const unsigned char *)"Second: shutdown\n");

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
