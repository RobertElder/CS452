#ifndef TASK_H_
#define TASK_H_

#define MESSAGE_SIZE 100

typedef enum MessageType {
	MESSAGE_TYPE_REGISTER_AS = 0,
	MESSAGE_TYPE_WHOIS
} MessageType;

typedef struct NameServerMessage {
	MessageType message_type;
	char * str;
} NameServerMessage;

static const char RPS_SERVER_NAME[] = "rps_server";
static const char SIGN_UP[] = "sign_up";
static const char CHOOSE[] = "choose";
static const char PLAY[] = "play ?"; // ? = ROCK, PAPER, SCISSORS
typedef enum CHOICE {
	ROCK = 'r',
	PAPER = 'p',
	SCISSORS = 's',
	FORFEIT = 'f',
} CHOICE;
static const char RESULT[] = "result ? ?"; // 1? = WIN, LOSE, TIE; 2? = ROCK, PAPER, SCISSORS, FORFEIT
typedef enum OUTCOME {
	WIN = 'w',
	LOSE = 'l',
	TIE = 't',
} OUTCOME;
static const char QUIT[] = "quit";
static const char GOODBYE[] = "goodbye";

void KernelTask_Start();

void FirstTask_Start();

void NameServer_Start();

void RPSServer_Start();

void RPSClient_Start();


#endif
