#ifndef PUBLIC_KERNEL_INTERFACE_H_
#define PUBLIC_KERNEL_INTERFACE_H_

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

#endif
