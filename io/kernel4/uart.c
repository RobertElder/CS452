#include "uart.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "queue.h"


void UARTBootstrapTask_Start() {
	Print("UARTBootstrapTask_Start tid=%d", MyTid());
	// TODO It seems like the buffers are supposed to be on user space but where???
	UARTBootstrapTask uart;
	
	UARTBootstrapTask_Initialize(&uart);
	
	int tid;
	
	tid = Create(NORMAL, &KeyboardInputServer_Start);
	assert(tid, "KeyboardInputServer create failed");
	
	tid = Create(NORMAL, &KeyboardOutputServer_Start);
	assert(tid, "KeyboardOutputServer create failed");
	
	tid = Create(NORMAL, &TrainInputServer_Start);
	assert(tid, "TrainInputServer create failed");
	
	tid = Create(NORMAL, &TrainOutputServer_Start);
	assert(tid, "TrainOutputServer create failed");
	
	Exit();
}

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart) {
	uart->terminal_channel.channel = COM2;
	uart->terminal_channel.speed = 115200;
	CharBuffer_Initialize(&uart->train_channel.char_buffer);
	CharBuffer_Initialize(&uart->terminal_channel.char_buffer);
	Channel_SetSpeed( &uart->terminal_channel);
}


void Channel_SetFifo( Channel * channel, int state ) {
	int *line, buf;
	switch( channel->channel ) {
	case COM1:
		line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
		buf = *line;
		buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
		//  2 stop bits, 8 bit words, no parity, no beak
		buf = (((buf | STP2_MASK) | WLEN_MASK) & (~PEN_MASK)) & (~BRK_MASK);
		break;
	case COM2:
		line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
		buf = *line;
		buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
		break;
	default:
		assert(0,"Unknown Channel in set fifo.");
		break;
	}

	*line = buf;

	assert((!(*line & FEN_MASK)),"The FIFO is enabled, and that is bad.\n");
}

void Channel_SetSpeed( Channel * channel) {
	int *mid, *low;
	switch( channel->channel ) {
	case COM1:
		mid = (int *)( UART1_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
		break;
	case COM2:
		mid = (int *)( UART2_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART2_BASE + UART_LCRL_OFFSET );
		break;
	default:
		assert(0,"Unknown Channel in robsetspeed.");
		break;
	}
	switch( channel->speed ) {
	case 115200:
		*mid = 0x0;
		*low = 0x3;
		break;
	case 2400:
		*mid = 0x0;
		*low = 0xBF;
		break;
	default:
		assert(0,"Unknown speed.");
		break;
	}
	//  This will write to the high bytes and make the change apply.
	Channel_SetFifo( channel, OFF);
}

void KeyboardInputServer_Start() {
	//TODO do something
	Exit();
}

void KeyboardOutputServer_Start() {
	//TODO do something
	Exit();
}

void TrainInputServer_Start() {
	//TODO do something
	Exit();
}

void TrainOutputServer_Start() {
	//TODO do something
	Exit();
}
