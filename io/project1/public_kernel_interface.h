#include "train.h"
#ifndef PUBLIC_KERNEL_INTERFACE_H_
#define PUBLIC_KERNEL_INTERFACE_H_

#include "va_list_def.h"

static const int ERR_K_INVALID_PRIORITY = -1;
static const int ERR_K_OUT_OF_TD = -2;
static const int ERR_K_DEFAULT = -3;
static const int ERR_INVALID_NAME_SERVER = -1;
static const int ERR_NOT_A_NAME_SERVER = -2;
static const int NAMESERVER_TID = 2;
static const int ERR_K_TID_OUT_OF_RANGE = -1;
static const int ERR_K_TID_DOES_NOT_EXIST = -2;
static const int ERR_K_TASK_NOT_REPLY_BLOCKED = -3;
static const int ERR_K_INSUFFICIENT_SPACE = -4;
static const double TICK_SIZE = 0.70; // milliseconds

typedef enum EventID {
	NULL_EVENT = 0,
	CLOCK_TICK_EVENT,
	UART1_RX_EVENT,
	UART1_TX_EVENT,
	UART2_RX_EVENT,
	UART2_TX_EVENT,
	NUM_EVENTS
} EventID;


void InitKernel();
int Create( int priority, void (*code)( ) );
int MyTid();
int MyParentTid();
void Pass();
void Exit();
int Send(int , char *, int , char *, int );
int Receive( int *, char *, int);
int Reply( int , char *, int );
int RegisterAs( char *name );
int WhoIs( char *name );
int AwaitEvent( int eventid );
int Delay( int ticks );
int Time( );
int DelayUntil( int ticks );
int DelaySeconds( float seconds );
float TimeSeconds();
int DelayUntilSeconds( float seconds );
int Getc( int channel );
int Putc( int channel, char ch );
void PutWord(int channel, int n, char fc, char *bf );
int PutStringFormat(int channel, const char * fmt, va_list va);
int PutString(int channel, const char * fmt, ...);
int PutcAtomic(int channel, unsigned int count, ...);
int PutcAtomicVa(int channel, unsigned int count, va_list va);
int SendTrainCommand(TrainCommand command, char c1, char c2, char * c1_reply, char * c2_reply);
int SetTrainSwitch(SwitchDirectionCode direction_code, char switch_num);
void PrintMessage(const char * fmt, ...);
void PrintMessageFormat(const char * fmt, va_list va);

#endif
