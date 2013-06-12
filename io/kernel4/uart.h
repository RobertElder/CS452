#include "buffer.h"

#ifndef UART_H_
#define UART_H_

typedef struct ChannelDescription2 {
	unsigned int channel;
	unsigned int speed;
	CharBuffer char_buffer;
	
} ChannelDescription2;

typedef struct UARTBootstrapTask {
	ChannelDescription2 terminal_channel;
	ChannelDescription2 train_channel;
} UARTBootstrapTask;

void UARTBootstrapTask_Start();

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart);

#endif
