#include "robio.h"

#ifndef UART_H_
#define UART_H_

typedef struct UART {
	ChannelDescription terminal_channel;
	ChannelDescription train_channel;
} UART;

void UART_Initialize(UART * uart);

#endif
