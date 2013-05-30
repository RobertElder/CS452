#include "message.h"
#include "random.h"

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


typedef struct RPSClient {
	int tid;
	char reply_buffer[MESSAGE_SIZE];
	char send_buffer[MESSAGE_SIZE];
	RNG rng;
	int server_id;
	unsigned int num_rounds_to_play;
} RPSClient;

void RPSServer_Start();

void RPSClient_Start();

void RPSClient_Initialize(RPSClient * client);

void RPSClient_PlayARound(RPSClient * client);

#endif /* RPS_H_ */
