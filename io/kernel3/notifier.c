#include "notifier.h"
#include "clock.h"
#include "robio.h"
#include "public_kernel_interface.h"

void ClockNotifier_Start() {
	int clock_server_id;
	char reply_buffer[MESSAGE_SIZE];
	char send_buffer[MESSAGE_SIZE];
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
		
		assert(i < 100000, "ClockNotifier: did not get a clock server id");
	}
	
	
	while (1) {
		AwaitEvent(CLOCK_TICK_EVENT);
		
		//robprintfbusy((const unsigned char *)"ClockNotifier TID=%d: Send msg to %d\n", MyTid(), clock_server_id);
		
		Send(clock_server_id, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "ClockNotifier_Start did not get a ACK reply");
	}
	
	robprintfbusy((const unsigned char *)"ClockNotifier TID=%d: exit\n", MyTid());
		
	Exit();
}
