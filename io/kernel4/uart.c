#include "uart.h"
#include "robio.h"
#include "public_kernel_interface.h"


void UARTBootstrapTask_Start() {
	// It seems like the buffers are supposed to be on user space
	UARTBootstrapTask uart;
	
	UARTBootstrapTask_Initialize(&uart);
	// TODO: start up servers and notifiers
	Exit();
}

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart) {
	uart->terminal_channel.channel = COM2;
	uart->terminal_channel.speed = 115200;
	CharBuffer_Initialize(&uart->train_channel.char_buffer);
	CharBuffer_Initialize(&uart->terminal_channel.char_buffer);
	robsetspeed( &uart->terminal_channel);
}
