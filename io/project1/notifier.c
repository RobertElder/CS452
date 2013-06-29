#include "notifier.h"
#include "clock.h"
#include "robio.h"
#include "public_kernel_interface.h"
#include "uart.h"

void ClockNotifier_Start() {
	DebugRegisterFunction(&ClockNotifier_Start,__func__);
	int clock_server_id;
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	ClockMessage * reply_message = (ClockMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	
	send_message->message_type = MESSAGE_TYPE_NOTIFIER;
	send_message->event_id = CLOCK_TICK_EVENT;
	
	robprintfbusy((const unsigned char *)"ClockNotifier TID=%d: start\n", MyTid());
	
	int i = 0;
	while (1) {
		clock_server_id = WhoIs((char*)CLOCK_SERVER_NAME);
		
		if (clock_server_id) {
			break;
		}
		
		i++;
		assert(i < 1000, "ClockNotifier: did not get a clock server id");
	}

	while (1) {
		AwaitEvent(CLOCK_TICK_EVENT);
		
		//Print("ClockNotifier TID=%d: Send msg to %d\n", MyTid(), clock_server_id);
		
		Send(clock_server_id, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK ||
			reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, 
			"ClockNotifier_Start did not get a ACK or SHUTDOWN reply");
		
		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}
	}

	robprintfbusy((const unsigned char *)"ClockNotifier TID=%d: exit\n", MyTid());

	Exit();
}

void KeyboardInputNotifier_Start() {
	DebugRegisterFunction(&KeyboardInputNotifier_Start,__func__);
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	int server_tid = WhoIs((char*) KEYBOARD_INPUT_SERVER_NAME);
	assert(server_tid, "KeyboardInputNotifier failed WhoIs");

	send_message->message_type = MESSAGE_TYPE_NOTIFIER;
	send_message->event_id = UART2_RX_EVENT;
	
	robprintfbusy((const unsigned char *)"KeyboardInputNotifier_Start: tid=%d\n", MyTid());
	
	while (1) {
		AwaitEvent(UART2_RX_EVENT);
//		robprintfbusy((const unsigned char *)"KeyboardInputNotifier_Start: keypressed");
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK,
			"KeyboardInputNotifier didn't get an ACK");
	}

	Exit();
}

void ScreenOutputNotifier_Start() {
	DebugRegisterFunction(&ScreenOutputNotifier_Start,__func__);
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	int server_tid = WhoIs((char*) SCREEN_OUTPUT_SERVER_NAME);
	assert(server_tid, "ScreenOutputNotifier failed WhoIs");

	send_message->message_type = MESSAGE_TYPE_NOTIFIER;
	send_message->event_id = UART2_TX_EVENT;
	(void)reply_message;
	
	robprintfbusy((const unsigned char *)"ScreenOutputNotifier_Start: tid=%d\n", MyTid());
	
	while (1) {
		AwaitEvent(UART2_TX_EVENT);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "ScreenOutputNotifier didn't get an ACK");
	}
	
	robprintfbusy((const unsigned char *)"ScreenOutputNotifier_Start: exit\n");

	Exit();
}

void TrainInputNotifier_Start() {
	DebugRegisterFunction(&TrainInputNotifier_Start,__func__);
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	int server_tid = WhoIs((char*) TRAIN_INPUT_SERVER_NAME);
	assert(server_tid, "TrainInputNotifier failed WhoIs");

	send_message->message_type = MESSAGE_TYPE_NOTIFIER;
	send_message->event_id = UART1_RX_EVENT;
	
	robprintfbusy((const unsigned char *)"TrainInputNotifier_Start: tid=%d\n", MyTid());
	
	while (1) {
		AwaitEvent(UART1_RX_EVENT);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK,
			"TrainInputNotifier didn't get an ACK");
	}

	Exit();
}

void TrainOutputNotifier_Start() {
	DebugRegisterFunction(&TrainOutputNotifier_Start,__func__);
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	int server_tid = WhoIs((char*) TRAIN_OUTPUT_SERVER_NAME);
	assert(server_tid, "TrainOutputNotifier failed WhoIs");

	send_message->message_type = MESSAGE_TYPE_NOTIFIER;
	send_message->event_id = UART1_TX_EVENT;
	
	robprintfbusy((const unsigned char *)"TrainOutputNotifier_Start: tid=%d\n", MyTid());

	while (1) {
		AwaitEvent(UART1_TX_EVENT);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK,
			"TrainOutputNotifier didn't get an ACK");
	}

	Exit();
}

void TrainIONotifier_Start() {
	DebugRegisterFunction(&TrainIONotifier_Start,__func__);
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	NotifyMessage * send_message = (NotifyMessage *) send_buffer;
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	robprintfbusy((const unsigned char *)"TrainIONotifier_Start TID=%d: start\n", MyTid());

	int input_server_id = 0;
	int output_server_id = 0;

	int i = 0;
	while (1) {
		//  Give things a chance to get started.
		DelaySeconds(0.1);
		input_server_id = WhoIs((char*)TRAIN_INPUT_SERVER_NAME);
		output_server_id = WhoIs((char*)TRAIN_OUTPUT_SERVER_NAME);
		
		if (input_server_id && output_server_id) {
			break;
		}
		
		i++;
		assert(i < 1000, "TrainIONotifier_Start: did not get server id");
	}

	while (1) {
		//  Wake up the input and output servers every second so they can timeout IO requests.
		DelaySeconds(1);
		
		Send(input_server_id, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}

		Send(output_server_id, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}
	}

	robprintfbusy((const unsigned char *)"TrainIONotifier_Start TID=%d: exit\n", MyTid());

	Exit();
}


