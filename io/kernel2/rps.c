#include "rps.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "random.h"
#include "memory.h"

void RPSServer_Start() {
	robprintfbusy((const unsigned char *)"rps server here %d\n", MyTid());

	int result = RegisterAs((char*) RPS_SERVER_NAME);

	assert(result == 0, "RPSServer_Start failed to register name");

	// TODO
	assert(0, "Shouldn't see me\n");
}

void RPSClient_Start() {
	robprintfbusy((const unsigned char *)"rps client here %d\n", MyTid());
	RPSClient client;
	RPSClient_Initialize(&client);

	// Want to play
	robprintfbusy((const unsigned char *)"Client: %d - I want to play\n", client.tid);

	RPSMessage * send_message;
	RPSMessage * reply_message;

	send_message = (RPSMessage *) client.send_buffer;
	send_message->message_type= MESSAGE_TYPE_SIGN_UP;
	Send(client.server_id, client.send_buffer, MESSAGE_SIZE, client.reply_buffer,MESSAGE_SIZE);
	reply_message = (RPSMessage *) client.reply_buffer;

	assert(reply_message->message_type == MESSAGE_TYPE_CHOOSE, "Client wasn't asked to choose");

	int i;
	for (i = 0; i < client.num_rounds_to_play; i++) {
		RPSClient_PlayARound(&client);
	}

	// Finished playing
	send_message->message_type = MESSAGE_TYPE_QUIT;
	Send(client.server_id, client.send_buffer, MESSAGE_SIZE, client.reply_buffer,MESSAGE_SIZE);
	reply_message = (RPSMessage *) client.reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_GOODBYE, "Client didn't get a goodbye from server");

	Exit();
}

void RPSClient_Initialize(RPSClient * client) {
	client->tid = MyTid();
	RNG_Initialize(&client->rng);
	client->server_id = WhoIs((char*) RPS_SERVER_NAME);
	client->num_rounds_to_play = 5;
}

void RPSClient_PlayARound(RPSClient * client) {
	RPSMessage * send_message;
	RPSMessage * reply_message;

	RPS_CHOICE choice = int_to_rps_choice(RNG_GetRange(&client->rng, 0, 2));

	switch(choice) {
	case ROCK:
		robprintfbusy((const unsigned char *)"Client: %d - I choose rock\n", client->tid);
		break;
	case PAPER:
		robprintfbusy((const unsigned char *)"Client: %d - I choose paper\n", client->tid);
		break;
	case SCISSORS:
		robprintfbusy((const unsigned char *)"Client: %d - I choose scissors\n", client->tid);
		break;
	default:
		assert(0, "RNG gave client something wrong");
		break;
	}

	send_message->message_type = MESSAGE_TYPE_PLAY;
	send_message->choice = choice;
	Send(client->server_id, client->send_buffer, MESSAGE_SIZE, client->reply_buffer, MESSAGE_SIZE);
	reply_message = (RPSMessage *) client->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_RESULT, "Client didn't get a result");

	RPS_OUTCOME outcome = reply_message->outcome;
	switch (outcome) {
	case WIN:
		robprintfbusy((const unsigned char *)"Client: %d - I won ", client->tid);
		break;
	case LOSE:
		robprintfbusy((const unsigned char *)"Client: %d - I lost ", client->tid);
		break;
	case TIE:
		robprintfbusy((const unsigned char *)"Client: %d - It was a tie ", client->tid);
		break;
	default:
		assert(0, "Client not sure whether its win or lose");
		break;
	}

	RPS_CHOICE reason = reply_message->choice;
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
		break;
	}
}


RPS_CHOICE int_to_rps_choice(int num) {
	switch(num){
	case 0:
		return ROCK;
	case 1:
		return PAPER;
	case 2:
		return SCISSORS;
	case 3:
		return FORFEIT;
	default:
		assert(0, "Unknown int to rps choice");
		return -1;
	}
}
