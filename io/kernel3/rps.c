#include "rps.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"
#include "random.h"
#include "memory.h"
#include "queue.h"
#include "nameserver.h"


void RPSTestStart() {
	int tid;
	const int num_clients = 50;

	//tid = Create(NORMAL, &NameServer_Start);
	//assert(tid == 2, "NameServer tid not 2");

	tid = Create(NORMAL, &RPSServer_Start);
	//assert(tid == 3, "RPServer tid not 3");

	int i;
	for (i = 0; i < num_clients; i++) {
		tid = Create(LOW, &RPSClient_Start);
		//assert(tid == 3 + i + 1, "RPSClient tid not");
	}

	Exit();

	assert(0, "Shouldn't see me\n");
}

void RPSServer_Start() {
	robprintfbusy((const unsigned char *)"RPSServer created tid=%d\n", MyTid());

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

		if (!server.running) {
			break;
		}
	}

	robprintfbusy((const unsigned char *)"About to call exit from rpsserver.\n");
	Exit();

	assert(0, "Shouldn't see me\n");
}

void RPSServer_Initialize(RPSServer * server) {
	server->tid = MyTid();
	Queue_Initialize(&server->player_tid_queue);
	server->player_1_tid = 0;
	server->player_2_tid = 0;
	server->player_1_choice = NO_CHOICE;
	server->player_2_choice = NO_CHOICE;
	server->running = 1;
	server->games_played = 0;
	server->state = WAITING_FOR_PLAYERS;
	server->num_signed_in = 0;
	RNG_Initialize(&server->rng, MyTid());

	int i;
	for (i = 0; i < MAX_TASKS + 1; i++) {
		server->signed_in_players[i] = 0;
	}
}

void RPSServer_ProcessMessage(RPSServer * server) {
	RPSMessage * receive_message;
	int source_tid;
	
	assert(server->num_signed_in < 1000000, "num signed in underflow");
	assert(server->running == 1, "not running");
	
	Receive(&source_tid, server->receive_buffer, MESSAGE_SIZE);
	receive_message = (RPSMessage*)server->receive_buffer;

	switch (receive_message->message_type) {
	case MESSAGE_TYPE_SIGN_UP:
		RPSServer_HandleSignup(server, receive_message, source_tid);
		break;
	case MESSAGE_TYPE_QUIT:
		RPSServer_HandleQuit(server, receive_message, source_tid);
		break;
	case MESSAGE_TYPE_PLAY:
		RPSServer_HandlePlay(server, receive_message, source_tid);
		break;
	default:
		assert(0, "RPSServer: Unknown message type from client");
		break;
	}
	
	if (server->state == WAITING_FOR_PLAYERS) {
		RPSServer_SelectPlayers(server);
	}

	if (server->num_signed_in == 0 && server->state == SHUTDOWN) {
		server->running = 0;
	}
	assert(server->num_signed_in < 1000000, "num signed in underflow");
	//robprintfbusy((const unsigned char *)"Server: Num signed in=%d\n", server->num_signed_in);
	
//	Pass();
}

void RPSServer_SelectPlayers(RPSServer * server) {
	if (Queue_CurrentCount(&server->player_tid_queue) <= 1) {
		//robprintfbusy((const unsigned char *)"Server: There's only %d person in queue.\n", Queue_CurrentCount(&server->player_tid_queue));
		return;
	}

	while (Queue_CurrentCount(&server->player_tid_queue)) {
		server->player_1_tid = (int) Queue_PopStart(&server->player_tid_queue);

		if (server->signed_in_players[server->player_1_tid]) {
			// Yay, found player 1!
			Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)server->player_1_tid);
			
			// Attempt at shuffling
			if (RNG_GetFloat(&server->rng) > 0.75) {
				break;
			}
		} else {
			// Player 1 has quit
			server->player_1_tid = 0;
		}
	}
	
	while (Queue_CurrentCount(&server->player_tid_queue)) {
		server->player_2_tid = (int) Queue_PopStart(&server->player_tid_queue);

		if (server->signed_in_players[server->player_2_tid]) {
			// Yay, found player 2!
			Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)server->player_2_tid);
			break;
		} else {
			// Player 2 has quit
			server->player_2_tid = 0;
		}
	}

	if (server->player_1_tid == server->player_2_tid) {
		server->player_1_tid = 0;
		server->player_2_tid = 0;
		return;
	}


	if (!server->player_1_tid || !server->player_2_tid) {
		server->player_1_tid = 0;
		server->player_2_tid = 0;
		return;
	}

	server->state = WAITING_FOR_CHOICES;
}

void RPSServer_ReplyResult(RPSServer * server, int source_tid) {
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
	
	if (source_tid == server->player_1_tid) {
		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_RESULT;
		reply_message->outcome = player_1_outcome;
		reply_message->choice = server->player_2_choice;

		return_code = Reply(server->player_1_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "Failed to reply RESULT message to player 1");
		
		server->player_1_tid = 0;
	} else if (source_tid == server->player_2_tid) {

		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_RESULT;
		reply_message->outcome = player_2_outcome;
		reply_message->choice = server->player_1_choice;

		return_code = Reply(server->player_2_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "Failed to send RESULT message to player 2");
		server->player_2_tid = 0;
	} else {
		// Ping back wait
		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_WAIT;
		reply_message->delay_time = RNG_GetRange(&server->rng, 1, 3);
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "RPSServer couldn't send WAIT to client");
	}
	
	if (!server->player_1_tid && !server->player_2_tid) {
		server->player_1_choice = NO_CHOICE;
		server->player_2_choice = NO_CHOICE;
		server->state  =WAITING_FOR_PLAYERS;
	}

	//robprintfbusy((const unsigned char *)"Server: ***** P1=%d chose %d, P2=%d chose %d *****\n", server->player_1_tid, server->player_1_choice, server->player_2_tid, server->player_2_choice);
}


void RPSServer_HandleSignup(RPSServer * server, RPSMessage * message, int source_tid) {
	//robprintfbusy((const unsigned char *)"RPSServer: Received sign up request from %d\n", source_tid);

	Queue_PushEnd(&server->player_tid_queue, (QUEUE_ITEM_TYPE)source_tid);
	server->signed_in_players[source_tid] = 1;
	server->num_signed_in += 1;

	RPSMessage * reply_message = (RPSMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_SIGN_UP_OK;
	int return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	assertf(return_code == 0, "RPSServer couldn't send SIGN_UP_OK to client. Got err=%d. Source TID=%d", return_code, source_tid);
}

void RPSServer_HandleQuit(RPSServer * server, RPSMessage * message, int source_tid) {
	//robprintfbusy((const unsigned char *)"Server: Received quit request from %d\n", source_tid);
	int return_code;

	RPSMessage * reply_message = (RPSMessage *) server->reply_buffer;
	server->signed_in_players[source_tid] = 0;
	server->num_signed_in -= 1;
	server->player_1_tid = 0;
	server->player_2_tid = 0;
	server->state = SHUTDOWN;

	reply_message = (RPSMessage *) server->reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_GOODBYE;
	robprintfbusy((const unsigned char *)"Server: Telling %d goodbye message\n", source_tid);
	return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
	assert(return_code == 0, "RPSServer couldn't send GOODBYE to client");

	robprintfbusy((const unsigned char *)"Server: We are shutting down\n");
}

void RPSServer_HandlePlay(RPSServer * server, RPSMessage * message, int source_tid) {
	int return_code;
	RPSMessage * reply_message = (RPSMessage *) server->reply_buffer;

	if (server->state == SHUTDOWN) {
		server->signed_in_players[source_tid] = 0;
		server->num_signed_in -= 1;
		reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
		robprintfbusy((const unsigned char *)"Server: Telling %d that have shutdown\n", source_tid);
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "RPSServer couldn't send SHUTDOWN to client");
	} else if (server->state == WAITING_FOR_CHOICES) {
	
		// Grab choices from the ones we are interested in
		if (source_tid == server->player_1_tid) {
			server->player_1_choice = message->choice;
		} else if (source_tid == server->player_2_tid) {
			server->player_2_choice = message->choice;
		}
		
		if (server->player_1_choice != NO_CHOICE && server->player_2_choice != NO_CHOICE) {
			server->state = GOT_CHOICES;
			// We can play now!
			robprintfbusy((const unsigned char *)"Server: We got players! P1=%d, P2=%d\n", server->player_1_tid, server->player_2_tid);
			server->games_played += 1;
			server->state = SENDING_RESULTS;
		}
		
		// Ping back wait
		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_WAIT;
		reply_message->delay_time = 0;
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "RPSServer couldn't send WAIT to client");
		
		
	} else if (server->state == SENDING_RESULTS 
	&& (source_tid == server->player_1_tid || source_tid == server->player_2_tid)) {
		RPSServer_ReplyResult(server, source_tid);
	} else {
		// Not ready yet for playing
		reply_message = (RPSMessage *) server->reply_buffer;
		reply_message->message_type = MESSAGE_TYPE_WAIT;
		reply_message->delay_time = RNG_GetRange(&server->rng, 1, 3);
		return_code = Reply(source_tid, server->reply_buffer, MESSAGE_SIZE);
		assert(return_code == 0, "RPSServer couldn't send WAIT to client");
	}
}


void RPSClient_Start() {
	robprintfbusy((const unsigned char *)"RPSClient created, tid=%d\n", MyTid());
	RPSClient client;
	RPSClient_Initialize(&client);

	// Want to play
	//robprintfbusy((const unsigned char *)"Client: %d - I want to play\n", client.tid);

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
		Pass();
		if (!client.running) {
			robprintfbusy((const unsigned char *)"Client: %d - Quiting due to server shutdown\n", client.tid);
			Exit();
		}
	}

	RPSClient_Quit(&client);

	Exit();
}

void RPSClient_Initialize(RPSClient * client) {
	client->tid = MyTid();
	RNG_Initialize(&client->rng, client->tid);
	client->server_id = WhoIs((char*) RPS_SERVER_NAME);
	client->num_rounds_to_play = 4;
	client->running = 1;
}


void RPSClient_PlayARound(RPSClient * client) {
	RPSMessage * send_message;
	RPSMessage * reply_message;

	RPS_CHOICE choice = int_to_rps_choice(RNG_GetRange(&client->rng, 0, 2));

	send_message = (RPSMessage * ) client->send_buffer;
	send_message->message_type = MESSAGE_TYPE_PLAY;
	send_message->choice = choice;

	int counter = 0;
	while (1) {
		Send(client->server_id, client->send_buffer, MESSAGE_SIZE, client->reply_buffer, MESSAGE_SIZE);
		//robprintfbusy((const unsigned char *)"Sending message to play from %d to %d.\n",MyTid(),client->server_id);

		reply_message = (RPSMessage *) client->reply_buffer;

		if (reply_message->message_type == MESSAGE_TYPE_RESULT) {
			break;
		} else if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			client->running = 0;
			return;
		}
		
		assertf(reply_message->message_type == MESSAGE_TYPE_WAIT,
				"Client wasn't told to wait. Got=%d, TID=%d", reply_message->message_type, client->tid);
				
		if (reply_message->delay_time) {
			Delay(reply_message->delay_time);
		}

		counter +=1;
		assertf(counter < 1000, "Forever Alone: TID=%d hasn't played in a while", client->tid);
	}

	switch(choice) {
	case ROCK:
		//robprintfbusy((const unsigned char *)"Client: %d - I choose rock\n", client->tid);
		break;
	case PAPER:
		//robprintfbusy((const unsigned char *)"Client: %d - I choose paper\n", client->tid);
		break;
	case SCISSORS:
		//robprintfbusy((const unsigned char *)"Client: %d - I choose scissors\n", client->tid);
		break;
	default:
		assert(0, "RNG gave client something wrong");
		break;
	}

	RPS_OUTCOME outcome = reply_message->outcome;
	RPS_CHOICE reason = reply_message->choice;

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

void RPSClient_Quit(RPSClient * client) {
	// Finished playing
	RPSMessage * send_message = (RPSMessage *) client->send_buffer;
	RPSMessage * reply_message = (RPSMessage *) client->reply_buffer;
	send_message->message_type = MESSAGE_TYPE_QUIT;
	Send(client->server_id, client->send_buffer, MESSAGE_SIZE, client->reply_buffer,MESSAGE_SIZE);
	reply_message = (RPSMessage *) client->reply_buffer;
	assert(reply_message->message_type == MESSAGE_TYPE_GOODBYE, "Client didn't get a goodbye from server");
	robprintfbusy((const unsigned char *)"Client: %d - I decided to quit.\n", client->tid);
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
		case NO_CHOICE:
			assert(0, "get_who_won: shouldn't get here");
			return -1;
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
		case NO_CHOICE:
			assert(0, "get_who_won: shouldn't get here");
			return -1;
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
		case NO_CHOICE:
			assert(0, "get_who_won: shouldn't get here");
			return -1;
		}
	} else {
		// player_1_choice == FORFEIT
		switch(player_2_choice) {
		case NO_CHOICE:
			assert(0, "get_who_won: shouldn't get here");
			return -1;
		case FORFEIT:
			return 0;
		default:
			return 2;
		}
	}

	assert(0, "get_who_won: Unable to determine who won");
	return -1;
}
