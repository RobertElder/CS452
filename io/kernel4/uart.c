#include "uart.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "queue.h"
#include "notifier.h"
#include "private_kernel_interface.h"
#include "scheduler.h"

void UARTErrorCheck(int sts, const char * context){
return;
/// TODO dont ignore this
	assertf(!(sts && FE_MASK), "Framing error detected communicating with %s", context);
	assertf(!(sts && PE_MASK), "Parity error detected communicating with %s", context);
	assertf(!(sts && BE_MASK), "Break error detected communicating with %s", context);
	assertf(!(sts && OE_MASK), "Overrun error detected communicating with %s", context);
}

void UARTBootstrapTask_Start() {
	robprintfbusy((const unsigned char *)"UARTBootstrapTask_Start tid=%d", MyTid());
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
	uart->train_channel.channel = COM1;
	uart->train_channel.speed = 2400;
	Channel_SetSpeed( &uart->terminal_channel);
	Channel_SetSpeed( &uart->train_channel);
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
	KeyboardInputServer server;
	KeyboardInputServer_Initialize(&server);
	int data;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			robprintfbusy((const unsigned char *)
				"KeyboardInputServer_Start shutting down by request.\n");

			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Pump out fake data to get tasks to unblock
			KeyboardInputServer_UnblockQueued(&server);
			
			break;
		case MESSAGE_TYPE_NOTIFIER:
			// From notifier
			data = *UART2DATA & DATA_MASK;

			UARTErrorCheck(*UART2RXSts, "terminal");

			CharBuffer_PutChar(&server.char_buffer, data);
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_DATA:
			// From public_kernel_interface Getc()
			Queue_PushEnd((Queue*) &server.task_queue, (QUEUE_ITEM_TYPE) server.source_tid);
			break;
		default:
			assert(0, "KeyboardInputServer unknown event type");
			break;
		}

		KeyboardInputServer_ReplyQueued(&server);
	}
	
	Exit();
}

void KeyboardInputServer_Initialize(KeyboardInputServer * server) {
	int return_code = RegisterAs((char*)KEYBOARD_INPUT_SERVER_NAME);
	assert(return_code == 0, "KeyboardInputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &KeyboardInputNotifier_Start);
	assert(notifier_tid, "KeyboardInputServer_Start notifier did not start");

	server->state = UARTSS_WAITING;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (CharMessage *) server->reply_buffer;

	CharBuffer_Initialize(&server->char_buffer);
	Queue_Initialize((Queue*) &server->task_queue, TASK_QUEUE_SIZE);
}

void KeyboardInputServer_ReplyQueued(KeyboardInputServer * server) {
	while (1) {
		if (CharBuffer_IsEmpty(&server->char_buffer) || !Queue_CurrentCount((Queue*) &server->task_queue)) {
			break;
		}
		
		char c = CharBuffer_GetChar(&server->char_buffer);
		int tid = (int) Queue_PopStart((Queue*) &server->task_queue);
		server->reply_message->message_type = MESSAGE_TYPE_ACK;
		server->reply_message->chars[0] = c;

		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
	}
}

void KeyboardInputServer_UnblockQueued(KeyboardInputServer * server) {
	while (Queue_CurrentCount((Queue*) &server->task_queue)) {
		char c = 0xff;
		int tid = (int) Queue_PopStart((Queue*) &server->task_queue);
		server->reply_message->message_type = MESSAGE_TYPE_ACK;
		server->reply_message->chars[0] = c;

		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
	}
}

void ScreenOutputServer_Start() {
	int i;
	ScreenOutputServer server;
	ScreenOutputServer_Initialize(&server);

	server.reply_message->message_type = MESSAGE_TYPE_ACK;

	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			robprintfbusy((const unsigned char *)
				"ScreenOutputServer_Start shutting down by request.\n");

			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);

			// Shutdown the notifier as well
			server.reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			Reply(server.notifier_tid, server.reply_buffer, MESSAGE_SIZE);

			break;
		case MESSAGE_TYPE_NOTIFIER:
			// from the notifier
			server.state = UARTSS_READY;
			ScreenOutputServer_SendData(&server);
			break;
		case MESSAGE_TYPE_DATA:
			// from public_kernel_interface Putc()
			for (i = 0; i < server.char_message->count; i++) {
				CharBuffer_PutChar(&server.char_buffer, server.char_message->chars[i]);
			}
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			ScreenOutputServer_SendData(&server);
			break;
		default:
			assert(0, "KeyboardInputServer unknown event type");
			break;
		}
	}
	Exit();
}

void ScreenOutputServer_Initialize(ScreenOutputServer * server) {
	CharBuffer_Initialize(&server->char_buffer);
	server->state = UARTSS_READY;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (GenericMessage *) server->reply_buffer;
	server->char_message = (CharMessage*) server->receive_buffer;
	
	int return_code = RegisterAs((char*) SCREEN_OUTPUT_SERVER_NAME);
	assert(return_code == 0, "ScreenOutputServer_Start failed to register");
	
	server->notifier_tid = Create(HIGH, &ScreenOutputNotifier_Start);
	assert(server->notifier_tid, "ScreenOutputServer_Start notifier did not start");
}

void ScreenOutputServer_SendData(ScreenOutputServer * server) {
	if (server->state != UARTSS_READY) {
		return;
	}
	
	if (!CharBuffer_IsEmpty(&server->char_buffer)) {
		char data = CharBuffer_GetChar(&server->char_buffer);

		*UART2DATA = data;
		server->state = UARTSS_WAITING;
		
		// Tell notifier to start checking again
		Reply(server->notifier_tid, server->reply_buffer, MESSAGE_SIZE);
	}
}

void TrainInputServer_Start() {
	TrainInputServer server;
	TrainInputServer_Initialize(&server);
	char data;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			robprintfbusy((const unsigned char *)
				"TrainInputServer_Start shutting down by request.\n");

			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Pump out fake data to get tasks to unblock
			TrainInputServer_UnblockQueued(&server);
			
			break;
		case MESSAGE_TYPE_NOTIFIER:
			// From notifier
			data = *UART1DATA & DATA_MASK;
			
			UARTErrorCheck(*UART1RXSts, "trains");
			
			CharBuffer_PutChar(&server.char_buffer, data);
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_DATA:
			// From public_kernel_interface Getc()
			Queue_PushEnd((Queue*) &server.task_queue, (QUEUE_ITEM_TYPE) server.source_tid);
			break;
		default:
			assert(0, "TrainInputServer unknown event type");
			break;
		}

		TrainInputServer_ReplyQueued(&server);
	}
	
	Exit();
}

void TrainInputServer_Initialize(TrainInputServer * server) {
	int return_code = RegisterAs((char*)TRAIN_INPUT_SERVER_NAME);
	assert(return_code == 0, "TrainInputServer_Start failed to register");

	int notifier_tid = Create(HIGH, &TrainInputNotifier_Start);
	assert(notifier_tid, "TrainInputServer_Start notifier did not start");

	server->state = UARTSS_WAITING;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (CharMessage *) server->reply_buffer;

	CharBuffer_Initialize(&server->char_buffer);
	Queue_Initialize((Queue*) &server->task_queue, TASK_QUEUE_SIZE);
}

void TrainInputServer_ReplyQueued(TrainInputServer * server) {
	while (1) {
		if (CharBuffer_IsEmpty(&server->char_buffer) || !Queue_CurrentCount((Queue*) &server->task_queue)) {
			break;
		}
		
		char c = CharBuffer_GetChar(&server->char_buffer);
		int tid = (int) Queue_PopStart((Queue*) &server->task_queue);
		server->reply_message->message_type = MESSAGE_TYPE_ACK;
		server->reply_message->chars[0] = c;
	
		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
	}
}

void TrainInputServer_UnblockQueued(TrainInputServer * server) {
	while (Queue_CurrentCount((Queue*) &server->task_queue)) {
		char c = 0xff;
		int tid = (int) Queue_PopStart((Queue*) &server->task_queue);
		server->reply_message->message_type = MESSAGE_TYPE_ACK;
		server->reply_message->chars[0] = c;

		Reply(tid, server->reply_buffer, MESSAGE_SIZE);
	}
}

void TrainOutputServer_Start() {
	int i;
	TrainOutputServer server;
	TrainOutputServer_Initialize(&server);
	
	server.reply_message->message_type = MESSAGE_TYPE_ACK;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);

		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			robprintfbusy((const unsigned char *)
				"TrainOutputServer_Start shutting down by request.\n");

			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Shutdown the notifier as well
			server.reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			Reply(server.notifier_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_NOTIFIER:
			// from the notifier
			server.state = UARTSS_READY;
			TrainOutputServer_SendData(&server);
			break;
		case MESSAGE_TYPE_DATA:
			// from the public_kernel_interface Putc()
			for (i = 0; i < server.char_message->count; i++) {
				CharBuffer_PutChar(&server.char_buffer, server.char_message->chars[i]);
			}
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			TrainOutputServer_SendData(&server);
			break;
		default:
			assert(0, "TrainOutputServer unknown event type");
			break;
		}
	}
	Exit();
}

void TrainOutputServer_Initialize(TrainOutputServer * server) {
	CharBuffer_Initialize(&server->char_buffer);
	server->state = UARTSS_WAITING;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (GenericMessage *) server->reply_buffer;
	server->char_message = (CharMessage*) server->receive_buffer;
	
	int return_code = RegisterAs((char*)TRAIN_OUTPUT_SERVER_NAME);
	assert(return_code == 0, "TrainOutputServer_Start failed to register");

	server->notifier_tid = Create(HIGH, &TrainOutputNotifier_Start);
	assert(server->notifier_tid, "TrainOutputServer_Start notifier did not start");
}

void TrainOutputServer_SendData(TrainOutputServer * server) {
	if (server->state != UARTSS_READY) {
		return;
	}
	
	if ((*UART1Flag & TXBUSY_MASK) || !(*UART1Flag & CTS_MASK)) {
		// Restart the notifier
		server->state = UARTSS_WAITING;
		Reply(server->notifier_tid, server->reply_buffer, MESSAGE_SIZE);
		return;
	}
	
	if (!CharBuffer_IsEmpty(&server->char_buffer)) {
		char data = CharBuffer_GetChar(&server->char_buffer);
		
		//assert(*UART1Flag & CTS_MASK, "TrainOutputServer: CTS not set");
		assert((*UART1Flag & TXBUSY_MASK) == 0, "TrainOutputServer: TXBusy!");
		
		*UART1DATA = data;
		server->state = UARTSS_WAITING;
		
		// Restart the notifier
		Reply(server->notifier_tid, server->reply_buffer, MESSAGE_SIZE);
	}
}
