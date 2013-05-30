#ifndef RPS_H_
#define RPS_H_


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

void RPSServer_Start();

void RPSClient_Start();


#endif /* RPS_H_ */
