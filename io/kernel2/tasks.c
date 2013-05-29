#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"

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
	
	tid = Create(NORMAL, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
	
	tid = Create(NORMAL, &RPSServer_Start);
	assert(tid == 3, "RPServer tid not 3");
	
	int i;
	for (i = 0; i < 5; i++) {
		tid = Create(NORMAL, &RPSClient_Start);
		assert(tid == 3 +i , "RPSClient tid not");
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

void NameServer_Start() {
	// TODO
	// Allocate a static amount of memory on the stack for the registered names
	
	int sender_id;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	NameServerMessage * received_message;

	robprintfbusy((const unsigned char *)"Name server here %d\n", MyTid());

	while(1){
		Receive( &sender_id, receive_buffer, MESSAGE_SIZE);
		received_message = (NameServerMessage *) receive_buffer;

		switch (received_message->message_type) {
			case MESSAGE_TYPE_REGISTER_AS:{
				/*
				if(name already exists){
					overwrite
				}else{
					if(enough space for one more){
						add it
					}else{
						assert(0,"Out of space for registered names in name server.");
					}
				}
				*/
				reply_buffer[0] = 0;
			}case MESSAGE_TYPE_WHOIS:{
				/*
				reply(the task id they asked for);
				*/
			}default:{
				assert(0,"Name server message type not found.");
			}
		}
		Pass();
	}
	assert(0, "Shouldn't see me\n");
}

void RPSServer_Start() {
	robprintfbusy((const unsigned char *)"rps server here %d\n", MyTid());

	int result = RegisterAs((char*) RPS_SERVER_NAME);
	
	assert(result == 0, "RPSServer_Start failed to register name");
	
	// TODO
	assert(0, "Shouldn't see me\n");
}

void RPSClient_Start() {
	robprintfbusy((const unsigned char *)"rps client here %d\n", MyTid());

	RNG rng;
	RNG_Initialize(&rng);
	int server_id = WhoIs((char*) RPS_SERVER_NAME);
	int my_id = MyTid();
	static char buffer[] = "XXXXXXXXXXXXXXXXXXXX";
	static char reply[] = "XXXXXXXXXXXXXXXXXXXX";
	const unsigned int rounds = 5;
	
	// Want to play
	robprintfbusy((const unsigned char *)"Client: %d - I want to play\n", my_id);
	Send(server_id, (char*) SIGN_UP, sizeof(PLAY), reply, sizeof(reply));
	assert(m_strcmp(reply, CHOOSE) == 0, "Client wasn't asked to choose");
	
	int i;
	for (i = 0; i < rounds; i++) {
		m_strcpy(buffer, PLAY);
		
		unsigned int choice = RNG_GetRange(&rng, 0, 2);
		
		switch(choice) {
		case 0:
			buffer[5] = ROCK;
			robprintfbusy((const unsigned char *)"Client: %d - I choose rock\n", my_id);
			break;
		case 1:
			buffer[5] = PAPER;
			robprintfbusy((const unsigned char *)"Client: %d - I choose paper\n", my_id);
			break;
		case 2:
			buffer[5] = SCISSORS;
			robprintfbusy((const unsigned char *)"Client: %d - I choose scissors\n", my_id);
			break;
		default:
			assert(0, "RNG gave client something wrong");
		}
		
		Send(server_id, buffer, sizeof(buffer), reply, sizeof(reply));
		assert(reply[0] == RESULT[0], "Client didn't get a result");
		
		char outcome = reply[7];
		switch (outcome) {
		case WIN:
			robprintfbusy((const unsigned char *)"Client: %d - I won ", my_id);
			break;
		case LOSE:
			robprintfbusy((const unsigned char *)"Client: %d - I lost ", my_id);
			break;
		case TIE:
			robprintfbusy((const unsigned char *)"Client: %d - It was a tie ", my_id);
			break;
		default:
			assert(0, "Client not sure whether its win or lose");
		}
		
		char reason = reply[8];
		switch (reason) {
		case ROCK:
			robprintfbusy((const unsigned char *)" because opponent chose rock\n");
			break;
		case PAPER:
			robprintfbusy((const unsigned char *)" because opponent chose paper\n");
			break;
		case SCISSORS:
			robprintfbusy((const unsigned char *)" because opponent chose scissors\n");
			break;
		case FORFEIT:
			robprintfbusy((const unsigned char *)" because opponent gave up\n");
			break;
		default:
			assert(0, "Client unable to explain why it won/lost");
		}
	}
	
	// Finished playing
	Send(server_id, (char*) QUIT, sizeof(QUIT), reply, sizeof(reply));
	assert(m_strcmp(reply, GOODBYE) == 0, "Client didn't get a goodbye from server");

	Exit();
}
