#include "uart.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "queue.h"
#include "notifier.h"
#include "private_kernel_interface.h"
#include "scheduler.h"

void UARTBootstrapTask_Start() {
	robprintfbusy((const unsigned char *)"UARTBootstrapTask_Start tid=%d", MyTid());
	// TODO It seems like the buffers are supposed to be on user space but where???
	UARTBootstrapTask uart;
	
	UARTBootstrapTask_Initialize(&uart);
	
	int tid;
	
	tid = Create(NORMAL, &KeyboardInputServer_Start);
	assert(tid, "KeyboardInputServer create failed");
	
	tid = Create(NORMAL, &ScreenOutputServer_Start);
	assert(tid, "ScreenOutputServer create failed");
	
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
		return;
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
		return;
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
		return;
	}
	//  This will write to the high bytes and make the change apply.
	Channel_SetFifo( channel, OFF);
}

void KeyboardInputServer_Start() {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	GenericMessage * receive_message = (GenericMessage *) receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;

	int return_code = RegisterAs((char*)KEYBOARD_INPUT_SERVER_NAME);
	assert(return_code == 0, "KeyboardInputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &KeyboardInputNotifier_Start);
	assert(notifier_tid, "KeyboardInputServer_Start notifier did not start");
	
	while (1) {
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		Reply(source_tid, reply_buffer, MESSAGE_SIZE);
		if(receive_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"KeyboardInputServer_Start shutting down by request.\n");
			break;
		}
		//TODO
		// get characters from device
		int * UART2DATA = (int*) (UART2_BASE + UART_DATA_OFFSET);
		char data = *UART2DATA & DATA_MASK;
		robprintfbusy((const unsigned char *)"KeyPressed=%d", data);

		Scheduler_PrintTDCounts(&(*((KernelState **) KERNEL_STACK_START))->scheduler);
		// send to ui server
	}
	
	Exit();
}

void ScreenOutputServer_Start() {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	GenericMessage * receive_message = (GenericMessage *) receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;

	int return_code = RegisterAs((char*) SCREEN_OUTPUT_SERVER_NAME);
	assert(return_code == 0, "ScreenOutputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &ScreenOutputNotifier_Start);
	assert(notifier_tid, "ScreenOutputServer_Start notifier did not start");
	
	while (1) {
		//DelaySeconds(1);
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		Reply(source_tid, reply_buffer, MESSAGE_SIZE);
		if(receive_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"ScreenOutputServer_Start shutting down by request.\n");
			break;
		}
		//TODO
		// recieve message
		// send charcters from the buffer to device
	}
	Exit();
}

void TrainInputServer_Start() {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	GenericMessage * receive_message = (GenericMessage *) receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;

	int return_code = RegisterAs((char*)TRAIN_INPUT_SERVER_NAME);
	assert(return_code == 0, "TrainInputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &TrainInputNotifier_Start);
	assert(notifier_tid, "TrainInputServer_Start notifier did not start");
	
	while (1) {
		//DelaySeconds(1);
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		Reply(source_tid, reply_buffer, MESSAGE_SIZE);
		if(receive_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"TrainInputServer_Start shutting down by request.\n");
			break;
		}
		//TODO
		// receive message
		// get characters from device
		// send to train server which will process the data
	}
	Exit();
}

void TrainOutputServer_Start() {
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	GenericMessage * receive_message = (GenericMessage *) receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	int return_code = RegisterAs((char*)TRAIN_OUTPUT_SERVER_NAME);
	assert(return_code == 0, "TrainOutputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &TrainOutputNotifier_Start);
	assert(notifier_tid, "TrainOutputServer_Start notifier did not start");
	
	while (1) {
		//DelaySeconds(1);
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		Reply(source_tid, reply_buffer, MESSAGE_SIZE);
		if(receive_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"TrainOutputServer_Start shutting down by request.\n");
			break;
		}
		//TODO 
		// receive message
		// send charcters from the buffer to the device
	}
	Exit();
}
