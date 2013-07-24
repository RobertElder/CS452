#include "priorities.h"
#include "uart.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "queue.h"
#include "notifier.h"
#include "private_kernel_interface.h"
#include "scheduler.h"

volatile static int * const UART1Flag = (int*) (UART1_BASE + UART_FLAG_OFFSET);

void UARTErrorCheck(int sts, const char * context){
	assertf(!(sts & FE_MASK), "Framing error detected communicating with %s", context);
	assertf(!(sts & PE_MASK), "Parity error detected communicating with %s", context);
	assertf(!(sts & BE_MASK), "Break error detected communicating with %s", context);
	assertf(!(sts & OE_MASK), "Overrun error detected communicating with %s", context);
}

void UARTBootstrapTask_Start() {
	DebugRegisterFunction(&UARTBootstrapTask_Start,__func__);
	UARTBootstrapTask uart;
	UARTBootstrapTask_Initialize(&uart);
	
	int tid;
	
	tid = Create(KEYBOARDINPUTSERVER_START_PRIORITY, &KeyboardInputServer_Start);
	assert(tid, "KeyboardInputServer create failed");
	
	tid = Create(SCREENOUTPUTSERVER_START_PRIORITY, &ScreenOutputServer_Start);
	assert(tid, "ScreenOutputServer create failed");
	
	tid = Create(TRAININPUTSERVER_START_PRIORITY, &TrainInputServer_Start);
	assert(tid, "TrainInputServer create failed");
	
	tid = Create(TRAINOUTPUTSERVER_START_PRIORITY, &TrainOutputServer_Start);
	assert(tid, "TrainOutputServer create failed");

	tid = Create(TRAINIONOTIFIER_START_PRIORITY, &TrainIONotifier_Start);
	assert(tid, "TrainIONotifier_Start create failed");
	
	Exit();
}

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart) {
	uart->terminal_channel.channel = COM2;
	uart->terminal_channel.speed = 115200;
	uart->train_channel.channel = COM1;
	uart->train_channel.speed = 2400;
	Channel_SetSpeed( &uart->terminal_channel);
	Channel_SetFifo( &uart->terminal_channel, ON);
	Channel_SetSpeed( &uart->train_channel);
	Channel_SetFifo( &uart->train_channel, OFF);
}


void Channel_SetFifo( Channel * channel, int state ) {
	volatile int *line;
	volatile int buf;
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
	
	if (state == OFF) {
		assert((!(*line & FEN_MASK)),"The FIFO is enabled, and that is bad.\n");
	}
}

void Channel_SetSpeed( Channel * channel) {
	volatile int *mid;
	volatile int *low;
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
	//Channel_SetFifo( channel, OFF);
}

void KeyboardInputServer_Start() {
	DebugRegisterFunction(&KeyboardInputServer_Start,__func__);
	KeyboardInputServer server;
	KeyboardInputServer_Initialize(&server);
	volatile int data;

	//  Clear any errors
	*UART2RXSts = 0;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Pump out fake data to get tasks to unblock
			KeyboardInputServer_UnblockQueued(&server);
			
			break;
		case MESSAGE_TYPE_NOTIFIER:
			// From notifier
			data = *UART2DATA & DATA_MASK;
			if(data == ('z' & 31)){
				KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
				Scheduler_PrintTDCounts(&k_state->scheduler);
			} else if (data == ('c' & 31)) {
				KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
				Scheduler_Halt(&k_state->scheduler);
			}
			
			if (*UART2RXSts & OE_MASK) {
				// Ignore and drop the characters
				*UART2RXSts = 0;
			}

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
	DebugRegisterFunction(&KeyboardInputServer_Initialize,__func__);
	int return_code = RegisterAs((char*)KEYBOARD_INPUT_SERVER_NAME);
	assert(return_code == 0, "KeyboardInputServer_Start failed to register");

	int notifier_tid = Create(KEYBOARDINPUTNOTIFIER_START_PRIORITY, &KeyboardInputNotifier_Start);
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
	DebugRegisterFunction(&ScreenOutputServer_Start,__func__);
	int i;
	ScreenOutputServer server;
	ScreenOutputServer_Initialize(&server);

	server.reply_message->message_type = MESSAGE_TYPE_ACK;
	server.notifier_reply_blocked = 0;

	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);

			// Shutdown the notifier as well
			server.reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			Reply(server.notifier_tid, server.reply_buffer, MESSAGE_SIZE);

			break;
		case MESSAGE_TYPE_NOTIFIER:
			// from the notifier
			server.state = UARTSS_READY;
			server.notifier_reply_blocked = 1;
			ScreenOutputServer_SendData(&server);
			break;
		case MESSAGE_TYPE_DATA:
			// from public_kernel_interface Putc()
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			for (i = 0; i < server.char_message->count; i++) {
				CharBuffer_PutChar(&server.char_buffer, server.char_message->chars[i]);
			}
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
	
	server->notifier_tid = Create(SCREENOUTPUTNOTIFIER_START_PRIORITY, &ScreenOutputNotifier_Start);
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
		if(server->notifier_reply_blocked){
			server->notifier_reply_blocked = 0;
			Reply(server->notifier_tid, server->reply_buffer, MESSAGE_SIZE);
		}
	}
}

void TrainInputServer_Start() {
	DebugRegisterFunction(&TrainInputServer_Start,__func__);
	TrainInputServer server;
	TrainInputServer_Initialize(&server);
	volatile char data;
	server.seconds_passed = 0;
	/* 
	 * Make the timeout for input larger than output so we know if
	 * we didn't receive data because we didn't request it
	 */
	server.seconds_timeout = 6;

	// Read up any garbage
	data = *UART1DATA & DATA_MASK;
	//  Clear any errors
	*UART1RXSts = 0;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Pump out fake data to get tasks to unblock
			TrainInputServer_UnblockQueued(&server);
			
			break;
		case MESSAGE_TYPE_NOTIFIER:
			//  Reset the timeout
			server.seconds_passed = 0;
			// From notifier
#ifdef TRAINS
			assert((*UART1Flag & TXBUSY_MASK) == 0, "TrainOutputServer: TXBusy!");
			assert((!(*UART1Flag & RXFE_MASK)), "TrainOutputServer: RXFE on read!");
			data = *UART1DATA & DATA_MASK;
			
			UARTErrorCheck(*UART1RXSts, "trains");
			
			CharBuffer_PutChar(&server.char_buffer, data);
#endif
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_HELLO:
			//  If there are things blocked on input, count seconds.
#ifdef TRAINS
			if(Queue_CurrentCount((Queue*)&server.task_queue) > 0)
				server.seconds_passed++;
			assert(server.seconds_passed < server.seconds_timeout, "Timeout receiving data from train.");
#endif
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_DATA:
			// From public_kernel_interface Getc()
#ifdef TRAINS
			Queue_PushEnd((Queue*) &server.task_queue, (QUEUE_ITEM_TYPE) server.source_tid);
#else
			DelaySeconds(0.1);
			server.reply_message->message_type = MESSAGE_TYPE_ACK;
			server.reply_message->chars[0] = 0;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
#endif
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

	int notifier_tid = Create(TRAININPUTNOTIFIER_START_PRIORITY, &TrainInputNotifier_Start);
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
		//  We sent data to someone, reset timeout
		server->seconds_passed = 0;
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
	DebugRegisterFunction(&TrainOutputServer_Start,__func__);
	int i;
	TrainOutputServer server;
	TrainOutputServer_Initialize(&server);
	server.seconds_passed = 0;
	server.seconds_timeout = 3;
	
	server.reply_message->message_type = MESSAGE_TYPE_ACK;
	server.notifier_reply_blocked = 0;
	
	while (server.state != UARTSS_SHUTDOWN) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);

		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin task
			server.state = UARTSS_SHUTDOWN;
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			// Shutdown the notifier as well
			server.reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			Reply(server.notifier_tid, server.reply_buffer, MESSAGE_SIZE);
			break;
		case MESSAGE_TYPE_NOTIFIER:
			// from the notifier
			server.state = UARTSS_READY;
			server.notifier_reply_blocked = 1;
			TrainOutputServer_SendData(&server);
			break;
		case MESSAGE_TYPE_DATA:
			// from the public_kernel_interface Putc()
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
#ifdef TRAINS
			for (i = 0; i < server.char_message->count; i++) {
				CharBuffer_PutChar(&server.char_buffer, server.char_message->chars[i]);
			}
			TrainOutputServer_SendData(&server);
#else
			(void) i;
#endif
			break;
		case MESSAGE_TYPE_HELLO:
			//  If there are characters to send, increment count
#ifdef TRAINS
			if (!CharBuffer_IsEmpty(&server.char_buffer))
				server.seconds_passed++;
			assert(server.seconds_passed < server.seconds_timeout, "Timeout sending data to train.");
#endif
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
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

	server->notifier_tid = Create(TRAINOUTPUTNOTIFIER_START_PRIORITY, &TrainOutputNotifier_Start);
	assert(server->notifier_tid, "TrainOutputServer_Start notifier did not start");
}

void TrainOutputServer_SendData(TrainOutputServer * server) {
	if (!CharBuffer_IsEmpty(&server->char_buffer)) {
		if(server->state == UARTSS_READY){
			char data = CharBuffer_GetChar(&server->char_buffer);
			
			assert(*UART1Flag & CTS_MASK, "TrainOutputServer: CTS not set");
			assert(*UART1Flag & TXFE_MASK, "TrainOutputServer: TXFE not set");
			//assert((*UART1Flag & TXBUSY_MASK) == 0, "TrainOutputServer: TXBusy!");
			
			*UART1DATA = data;
			server->state = UARTSS_WAITING;
			server->seconds_passed = 0;
		}
	
		if(server->notifier_reply_blocked){
			server->notifier_reply_blocked = 0;
			// Restart the notifier
			Reply(server->notifier_tid, server->reply_buffer, MESSAGE_SIZE);
		}
	}
}
