#include "buffer.h"
#include "ts7200.h"

#ifndef UART_H_
#define UART_H_

typedef struct Channel {
	unsigned int channel;
	unsigned int speed;
	CharBuffer char_buffer;
	
} Channel;

typedef struct UARTBootstrapTask {
	Channel terminal_channel;
	Channel train_channel;
} UARTBootstrapTask;

void UARTBootstrapTask_Start();

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart);

void Channel_SetFifo( Channel * channel, int state );

void Channel_SetSpeed( Channel * channel);

#endif
