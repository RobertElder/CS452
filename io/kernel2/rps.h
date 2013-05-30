#include "message.h"
#include "random.h"
#include "queue.h"
#include "kernel_state.h"

#ifndef RPS_H_
#define RPS_H_

static const char RPS_SERVER_NAME[] = "rps_server";

typedef enum RPS_CHOICE {
	ROCK = 0,
	PAPER = 1,
	SCISSORS = 2,
	FORFEIT = 3,
} RPS_CHOICE;

typedef enum RPS_OUTCOME {
	WIN = 0,
	LOSE = 1,
	TIE = 2,
} RPS_OUTCOME;

typedef struct RPSMessage {
	MessageType message_type;
	RPS_CHOICE choice;
	RPS_OUTCOME outcome;
} RPSMessage;

typedef struct RPSServer {
	int tid;
	char receive_buffer[MESSAGE_SIZE];
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	Queue player_tid_queue;
	int player_1_tid;
	int player_2_tid;
	RPS_CHOICE player_1_choice;
	RPS_CHOICE player_2_choice;
	short signed_in_players[MAX_TASKS + 1];
} RPSServer;

typedef struct RPSClient {
	int tid;
	char reply_buffer[MESSAGE_SIZE];
	char send_buffer[MESSAGE_SIZE];
	RNG rng;
	int server_id;
	unsigned int num_rounds_to_play;
} RPSClient;

void RPSServer_Start();

void RPSServer_Initialize(RPSServer * server);

void RPSServer_ProcessMessage(RPSServer * server);

void RPSServer_SelectPlayers(RPSServer * server);

void RPSServer_SendChoose(RPSServer * server);

void RPSServer_SendResult(RPSServer * server);

void RPSClient_Start();

void RPSClient_Initialize(RPSClient * client);

void RPSClient_PlayARound(RPSClient * client);

RPS_CHOICE int_to_rps_choice(int num);

int get_who_won(RPS_CHOICE player_1_choice, RPS_CHOICE player_2_choice);

#endif /* RPS_H_ */
