#ifndef PUBLIC_KERNEL_INTERFACE_H_
#define PUBLIC_KERNEL_INTERFACE_H_

static const int ERR_K_INVALID_PRIORITY = -1;
static const int ERR_K_OUT_OF_TD = -2;
static const int ERR_K_DEFAULT = -3;

void InitKernel();
int Create( int priority, void (*code)( ) );
int MyTid();
int MyParentTid();
void Pass();
void Exit();
int Send(int , char *, int , char *, int );
int Receive( int *, char *, int);
int Reply( int , char *, int );

#endif
