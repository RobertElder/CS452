#include "public_kernel_interface.h"
#include "message.h"
#include "nameserver.h"
#include "robio.h"
#include "clock.h"
#include "ui.h"

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

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];

	send_message = (NameServerMessage *) send_buffer;
	send_message->message_type = MESSAGE_TYPE_REGISTER_AS;
	m_strcpy(send_message->str, name, CLIENT_NAME_SIZE);
	send_message->num = MyTid();

	Send(NAMESERVER_TID, send_buffer, MESSAGE_SIZE, receive_buffer, MESSAGE_SIZE);

	receive_message = (NameServerMessage *) receive_buffer;
	assert(receive_message->message_type == MESSAGE_TYPE_REGISTER_AS_OK, "Didn't get back a register ok message type");
	robprintfbusy((const unsigned char *)"RegisterAs for %s returned OK. tid=%d\n", name, MyTid());


	// TODO: I'm not sure if we ever send a message to the wrong server since
	// it is hard coded. So we never really encounter an error.
	return 0;
}

int WhoIs( char *name ) {
	NameServerMessage * send_message;
	NameServerMessage * receive_message;

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];

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

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];

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

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];

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

	char send_buffer[MESSAGE_SIZE];
	char receive_buffer[MESSAGE_SIZE];

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
	return Time() / 1000.0 * TICK_SIZE;
}

int DelayUntilSeconds( float seconds ) {
	return DelayUntil( seconds * 1000.0 / TICK_SIZE);
}

int Getc( int channel ) {
	// TODO: send a message to the whatever server
	return 0;
}

int Putc( int channel, char ch ) {
	// TODO: send a message to the whatever server
	return 0;
}

int PutString( int channel, const char * message, ...) {
	// TODO: send a message to the whatever server
	
	va_list va;
	va_start(va,message);
	bwformatbusy( (const unsigned char *) message, va );
	va_end(va);
	return 0;
	
	return 0;
}

int Print( const char * message, ...) {
	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	UIMessage* send_message = (UIMessage*) send_buffer;
	UIMessage * reply_message = (UIMessage*) reply_buffer;
	int ui_server_tid = WhoIs((char*) UI_SERVER_NAME);
	
	// TODO: If the UI server is available, query the location to move cursor to a place
	// that won't clutter up the ui
/*	if (ui_server_tid) {
		send_message->message_type = MESSAGE_TYPE_PRINT;
		
		Send(ui_server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK,
			"Print(): didn't get back an ACK message");
		
		ANSI_Cursor(reply_message->row, 1);
	}*/
	
	// TODO put string
	
	// else
	
	// Fallback to busy wait io
	// This should only happen on start up and shutdown
	va_list va;
	va_start(va,message);
	bwformatbusy( (const unsigned char *) message, va );
	va_end(va);
	
	return 0;
}

