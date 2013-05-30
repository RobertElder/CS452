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
	/*m_strcpy(buffer, PLAY);

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
	 * */
}
