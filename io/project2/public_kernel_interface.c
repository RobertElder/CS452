#include "public_kernel_interface.h"
#include "message.h"
#include "nameserver.h"
#include "robio.h"
#include "clock.h"
#include "ui.h"
#include "uart.h"

void asm_KernelInitEntry();
int asm_CreateEntry();
int asm_MyTidEntry();
int asm_MyParentTidEntry();
void asm_PassEntry();
void asm_ExitEntry();
int asm_SendEntry();
int asm_ReceiveEntry();
int asm_ReplyEntry();
int asm_AwaitEventEntry();

void InitKernel(){
	asm_KernelInitEntry();
}

int Create( int priority, void (*code)( ) ){
	return asm_CreateEntry(priority, code);
}

int MyTid(){
	return asm_MyTidEntry();
}

int MyParentTid(){
	return asm_MyParentTidEntry();
}

void Pass(){
	asm_PassEntry();
}

void Exit(){
	asm_ExitEntry();
}

int Send(int tid, char *msg, int msglen, char *reply, int replylen){
	return asm_SendEntry(tid, msg, msglen, reply, replylen);
}

int Receive( int *tid, char *msg, int msglen ){
	return asm_ReceiveEntry(tid, msg, msglen);
}

int Reply( int tid, char *reply, int replylen ){
	return asm_ReplyEntry(tid, reply, replylen);
}

int RegisterAs( char *name ) {
	NameServerMessage * send_message;
	NameServerMessage * receive_message;

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

	send_message = (NameServerMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_REGISTER_AS;
	m_strcpy(send_message->str, name, CLIENT_NAME_SIZE);
	send_message->num = MyTid();

	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (NameServerMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_REGISTER_AS_OK, "Didn't get back a register ok message type");


	// TODO: I'm not sure if we ever send a message to the wrong server since
	// it is hard coded. So we never really encounter an error.
	return 0;
}

int WhoIs( char *name ) {
	NameServerMessage * send_message;
	NameServerMessage * receive_message;

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

	send_message = (NameServerMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_WHOIS;
	m_strcpy(send_message->str, name, CLIENT_NAME_SIZE);

	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (NameServerMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_WHOIS_REPLY, "Didn't get back a whois reply message type");

	// TODO: I'm not sure if we ever send a message to the wrong server since
	// it is hard coded. So we never really encounter an error.
	return receive_message->num;
}

//int AwaitEvent( int eventid, char *event, int eventlen ) {
// or 
int AwaitEvent( int eventid ) {
	return asm_AwaitEventEntry();
}

int Delay( int ticks ) {
	int clock_tid = WhoIs((char *)CLOCK_SERVER_NAME);
	ClockMessage * send_message;
	ClockMessage * receive_message;

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

	send_message = (ClockMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_DELAY_REQUEST;
	send_message->num = ticks;

	Send(clock_tid, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (ClockMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_DELAY_REPLY, "Didn't get back TIME_DELAY_REPLY message type");

	return 0;
}

int DelayUntil( int ticks ) {
	int clock_tid = WhoIs((char *)CLOCK_SERVER_NAME);
	ClockMessage * send_message;
	ClockMessage * receive_message;

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

	send_message = (ClockMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_DELAY_UNTIL_REQUEST;
	send_message->num = ticks;

	Send(clock_tid, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (ClockMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_DELAY_UNTIL_REPLY, "Didn't get back TIME_DELAY_UNTIL_REPLY message type");

	return 0;
}

int Time( ) {
	int clock_tid = WhoIs((char *)CLOCK_SERVER_NAME);
	ClockMessage * send_message;
	ClockMessage * receive_message;

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));

	send_message = (ClockMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_TIME_REQUEST;

	Send(clock_tid, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (ClockMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_TIME_REPLY, "Didn't get back TIME_REPLY message type");

	return receive_message->num;
}


int DelaySeconds( float seconds ) {
	return Delay(seconds * 1000.0 / TICK_SIZE);
}

float TimeSeconds() {
	return (float)Time() / (float)1000.0 * TICK_SIZE;
}

int DelayUntilSeconds( float seconds ) {
	return DelayUntil( seconds * 1000.0 / TICK_SIZE);
}

int Getc( int channel ) {
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int server_tid;
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	CharMessage * reply_message = (CharMessage *) reply_buffer;
	send_message->message_type = MESSAGE_TYPE_DATA;
	
	if (channel == COM1) {
		server_tid = WhoIs((char*) TRAIN_INPUT_SERVER_NAME);
	} else if (channel == COM2) {
		server_tid = WhoIs((char*) KEYBOARD_INPUT_SERVER_NAME);
	} else {
		assert(0, "Getc: unknown channel");
		return 0; // TODO return error code
	}
	
	assert(server_tid, "Getc: whois failed");
	
	Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK,
		"Puc: Did not get ACK message from output server");
	
	return reply_message->chars[0];
}

int Putc( int channel, char ch ) {
	return PutcAtomic(channel, 1, ch);
}

void PutWord(int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) Putc( channel, fc );
	while( ( ch = *bf++ ) ) Putc( channel, ch );
}

int PutStringFormat( int channel, const char * fmt, va_list va) {
	char bf[12];
	char ch, lz;
	int w;
	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			Putc(COM2, ch);
		else {
			lz = 0; w = 0;
			ch = *(fmt++);
			switch ( ch ) {
			case '0':
				lz = 1; ch = *(fmt++);
				break;
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				ch = bwa2i( ch, (char **) &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return 0;
			case 'c':
				Putc(COM2, va_arg( va, char ));
				break;
			case 's':
				PutWord( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				PutWord( channel, w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				PutWord( channel, w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				PutWord( channel, w, lz, bf );
				break;
			case '%':
				Putc( channel, ch );
				break;
			}
		}
	}
	return 0;
}

int PutString( int channel, const char * fmt, ...) {
	va_list va;
	va_start(va,fmt);
	PutStringFormat(channel, fmt, va);
	va_end(va);
	return 0;
}

int PutcAtomic(int channel, unsigned int count, ...) {
	va_list va;
	va_start(va,count);
	PutcAtomicVa(channel, count, va);
	va_end(va);
	return 0;
}

int PutcAtomicVa(int channel, unsigned int count, va_list va) {
	assert(count <= CHAR_MESSAGE_CONTENT_SIZE, "PutcAtomicVa: count too big");
	
	assert(sizeof(CharMessage) <= MESSAGE_SIZE, "CharMessage: too big");
	
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int server_tid;
	CharMessage * send_message = (CharMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	send_message->message_type = MESSAGE_TYPE_DATA;
	
	if (channel == COM1) {
		server_tid = WhoIs((char*) TRAIN_OUTPUT_SERVER_NAME);
	} else if (channel == COM2) {
		server_tid = WhoIs((char*) SCREEN_OUTPUT_SERVER_NAME);
	} else {
		assert(0, "Putc: unknown channel");
		return 0; // TODO return error code
	}
	
	assertf(server_tid, "Putc: whois failed for COM%d", channel);
	
	int i;
	for (i = 0; i < count; i++) {
		send_message->chars[i] = va_arg( va, char );
	}
	
	send_message->count = count;
	
	Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK,
		"Puc: Did not get ACK message from output server");
	
	return 0;
}

int SendTrainCommand(TrainCommand command, char c1, char c2, char * c1_reply, char * c2_reply) {
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int server_tid = WhoIs((char*) TRAIN_COMMAND_SERVER_NAME);
	
	assert(server_tid, "SendTrainCommand: whois failed");
	
	TrainCommandMessage * send_message = (TrainCommandMessage*) send_buffer;
	TrainCommandMessage * reply_message = (TrainCommandMessage*) reply_buffer;
	
	send_message->message_type = MESSAGE_TYPE_TRAIN_COMMAND;
	send_message->command = command;
	send_message->c1 = c1;
	send_message->c2 = c2;
	
	Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK,
		"SendTrainCommand: Did not get ACK message from train server");
	
	if (c1_reply) {
		*c1_reply = reply_message->c1;
	}
	if (c2_reply) {
		*c2_reply = reply_message->c2;
	}
	
	return 0;
}

int SetTrainSwitch(SwitchDirectionCode direction_code, char switch_num) {
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
	
	assert(server_tid, "SetTrainSwitch: whois failed");
	
	TrainCommandMessage * send_message = (TrainCommandMessage*) send_buffer;
	TrainCommandMessage * reply_message = (TrainCommandMessage*) reply_buffer;
	
	send_message->message_type = MESSAGE_TYPE_SET_SWITCH;
	send_message->command = TRAIN_SWITCH;
	send_message->c1 = direction_code;
	send_message->c2 = switch_num;
	
	Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK,
		"SetTrainSwitch: Did not get ACK message from train server");
		
	return 0;
}

void PrintMessage(const char * fmt, ...) {
	va_list va;
	va_start(va,fmt);
	PrintMessageFormat(fmt, va);
	va_end(va);
}

void PrintMessageFormat(const char * fmt, va_list va) {
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	int server_tid = WhoIs((char*) UI_PRINT_TASK_NAME);
	
	if (server_tid) {
		UIPrintMessage * send_message = (UIPrintMessage *) send_buffer;
		GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	
		send_message->message_type = MESSAGE_TYPE_UI_PRINT_MESSAGE;
		send_message->message = fmt;
		send_message->va = va;
	
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
	
		assert(reply_message->message_type == MESSAGE_TYPE_ACK,
			"PrintMessageFormat: Did not get ACK message from ui server");
	} else {
		PutStringFormat(COM2, fmt, va);
	}
}
