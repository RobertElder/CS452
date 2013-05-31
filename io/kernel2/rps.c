#include "rps.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "random.h"
#include "memory.h"
#include "queue.h"

void RPSServer_Start() {
	robprintfbusy((const unsigned char *)"rps server here %d\n", MyTid());

	int result = RegisterAs((char*) RPS_SERVER_NAME);

	assert(result == 0, "RPSServer_Start failed to register name");

	ChannelDescription terminal_channel;
	terminal_channel.channel = COM2;
	terminal_channel.speed = 115200;
	robsetspeed( &terminal_channel);

	RPSServer server;
	RPSServer_Initialize(&server);

	while(1) {
		RPSServer_ProcessMessage(&server);
	}

	assert(0, "Shouldn't see me\n");
}

void RPSServer_Initialize(RPSServer * server) {
	server->tid = MyTid();
	Queue_Initialize(&server->player_tid_queue);
	server->player_1_tid = 0;
	server->player_2_tid = 0;

	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		server->signed_in_players[i] = 0;
	}
}

void RPSServer_ProcessMessage(RPSServer * server) {
	robprintfbusy((const unsigned char *)"RPS Server process message\n");

	RPSMessage * receive_message;
	RPSMessage * reply_message;
	int source_tid;
	Receive(&source_tid, server->receive_buffer, MESSAGE_SIZE);
	receive_message = (RPSMessage*)server->receive_buffer;
	int return_code;

	switch (receive_message->message_type) {
	case MESSAGE_TYPE_SIGN_UP:
		robprintfbusy((const unsigned char *)"RPS Server received sign up request from %d\n", source_tid);

		Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)source_tid);
		server->signed_in_players[source_tid] = 1;

		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_SIGN_UP_OK;
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assertf(return_code == 0, "RPSServer couldn't send SIGN_UP_OK to client. Got err=%d. Source TID=%d", return_code, source_tid);
		break;
	case MESSAGE_TYPE_QUIT:
		robprintfbusy((const unsigned char *)"RPS Server received quit request from %d\n", source_tid);

		server->signed_in_players[source_tid] = 0;

		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_GOODBYE;
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "RPSServer couldn't send GOODBYE to client");

		break;
	default:
		assert(0, "RPSServer: Unknown message type from client");
		break;
	}

	if (Queue_CurrentCount(&server->player_tid_queue) >= 2) {
		RPSServer_SelectPlayers(server);

		if (!server->player_1_tid || !server->player_2_tid) {
			return;
		}

		robprintfbusy((const unsigned char *)"Server: We got players! P1=%d, P2=%d\n", server->player_1_tid, server->player_2_tid);

		RPSServer_ReceiveChoices(server);
		RPSServer_SendResult(server);

		Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)server->player_1_tid);
		Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)server->player_2_tid);

		robprintfbusy((const unsigned char *)"RPSServer=%d Press any key to continue\n", MyTid());
		robgetcbusy(COM2);
	}
}

void RPSServer_SelectPlayers(RPSServer * server) {
	while (Queue_CurrentCount(&server->player_tid_queue)) {
		server->player_1_tid = (int) Queue_PopStart(&server->player_tid_queue);

		if (server->signed_in_players[server->player_1_tid]) {
			// Yay, found player 1!
			break;
		} else {
			// Player 1 has quit
			server->player_1_tid = 0;
		}
	}

	while (Queue_CurrentCount(&server->player_tid_queue)) {
		server->player_2_tid = (int) Queue_PopStart(&server->player_tid_queue);

		if (server->signed_in_players[server->player_1_tid]) {
			// Yay, found player 2!
			break;
		} else {
			// Player 2 has quit
			server->player_2_tid = 0;
		}
	}
}

void RPSServer_ReceiveChoices(RPSServer * server) {
	RPSMessage * reply_message;
	RPSMessage * send_message;
	int return_code;

	send_message = (RPSMessage *) server->send_buffer;
	send_message->message_type = MESSAGE_TYPE_CHOOSE;

	robprintfbusy((const unsigned char *)"RPS Server sending P1 %d to choose\n", server->player_1_tid);

	return_code = Send(server->player_1_tid, server->send_buffer, MESSAGE_SIZE,
			server->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "Failed to send CHOOSE message to player 1");

	reply_message = (RPSMessage *) server->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_PLAY, "Failed to receive PLAY message from player 1");
	server->player_1_choice = reply_message->choice;

	robprintfbusy((const unsigned char *)"RPS Server sending P2 %d to choose\n", server->player_2_tid);

	return_code = Send(server->player_2_tid, server->send_buffer, MESSAGE_SIZE,
			server->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "Failed to send CHOOSE message to player 2");

	reply_message = (RPSMessage *) server->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_PLAY, "Failed to receive PLAY message from player 2");
	server->player_2_choice = reply_message->choice;
}

void RPSServer_SendResult(RPSServer * server) {
	RPSMessage * send_message;
	RPSMessage * reply_message;
	RPS_OUTCOME player_1_outcome;
	RPS_OUTCOME player_2_outcome;
	int return_code;
	int winner = get_who_won(server->player_1_choice, server->player_2_choice);

	if (winner == 0) {
		player_1_outcome = TIE;
		player_2_outcome = TIE;
	} else if (winner == 1) {
		player_1_outcome = WIN;
		player_2_outcome = LOSE;
	} else {
		player_1_outcome = LOSE;
		player_2_outcome = WIN;
	}

	send_message = (RPSMessage *) server->send_buffer;
	send_message->message_type = MESSAGE_TYPE_RESULT;
	send_message->outcome = player_1_outcome;
	send_message->choice = server->player_2_choice;

	robprintfbusy((const unsigned char *)"RPS Server replying P1 %d with result\n", server->player_1_tid);

	return_code = Send(server->player_1_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "Failed to send RESULT message to player 1");

	reply_message = (RPSMessage *) server->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "Client didn't acknowledge server");


	send_message = (RPSMessage *) server->send_buffer;
	send_message->message_type = MESSAGE_TYPE_RESULT;
	send_message->outcome = player_2_outcome;
	send_message->choice = server->player_1_choice;

	robprintfbusy((const unsigned char *)"RPS Server replying P2 %d with result\n", server->player_2_tid);

	return_code = Send(server->player_2_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "Failed to send RESULT message to player 2");

	reply_message = (RPSMessage *) server->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "Client didn't acknowledge server");

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

	assert(reply_message->message_type == MESSAGE_TYPE_SIGN_UP_OK, "Client didn't sign up successfully");

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
	RPSMessage * receive_message;
	int source_tid;
	int return_code;

	RPS_CHOICE choice = int_to_rps_choice(RNG_GetRange(&client->rng, 0, 2));

	receive_message = (RPSMessage *) client->receive_buffer;
	Receive(&source_tid, client->receive_buffer, MESSAGE_SIZE);

	assert(receive_message->message_type == MESSAGE_TYPE_CHOOSE, "RPSClient: Expceted a message from server to tell us to choose");

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

	reply_message = (RPSMessage * ) client->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_PLAY;
	reply_message->choice = choice;
	return_code = Reply(client->server_id, client->reply_buffer, MESSAGE_SIZE);

	assert(return_code == 0, "RPSClient: Couldn't reply with PLAY and our choice");

	receive_message = (RPSMessage *) client->receive_buffer;
	Receive(&source_tid, client->receive_buffer, MESSAGE_SIZE);
	assert(receive_message->message_type == MESSAGE_TYPE_RESULT, "Client didn't get a RESULT message");

	RPS_OUTCOME outcome = receive_message->outcome;
	RPS_CHOICE reason = receive_message->choice;

	reply_message = (RPSMessage * ) client->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	return_code = Reply(client->server_id, client->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "RPSClient: Couldn't reply with an ACK of outcome");

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


int get_who_won(RPS_CHOICE player_1_choice, RPS_CHOICE player_2_choice) {
	if (player_1_choice == ROCK) {
		switch(player_2_choice) {
		case ROCK:
			return 0;
		case PAPER:
			return 2;
		case SCISSORS:
			return 1;
		case FORFEIT:
			return 1;
		}
	} else if (player_1_choice == PAPER) {
		switch(player_2_choice) {
		case ROCK:
			return 1;
		case PAPER:
			return 0;
		case SCISSORS:
			return 2;
		case FORFEIT:
			return 1;
		}
	} else if (player_1_choice == SCISSORS) {
		switch(player_2_choice) {
		case ROCK:
			return 2;
		case PAPER:
			return 1;
		case SCISSORS:
			return 0;
		case FORFEIT:
			return 1;
		}
	} else {
		// player_1_choice == FORFEIT
		switch(player_2_choice) {
		case FORFEIT:
			return 0;
		default:
			return 2;
		}
	}

	assert(0, "get_who_won: Unable to determine who won");
	return -1;
}
