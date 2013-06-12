#include "uart.h"
#include "robio.h"

void UART_Initialize(UART * uart) {
	uart->terminal_channel.channel = COM2;
	uart->terminal_channel.speed = 115200;
	robsetspeed( &uart->terminal_channel);
}
