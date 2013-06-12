#ifndef ROBIO_H_
#define ROBIO_H_
typedef char *va_list;

#define __va_argsiz(t)	\
		(((sizeof(t) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))

#define va_start(ap, pN) ((ap) = ((va_list) __builtin_next_arg(pN)))

#define va_end(ap)	((void)0)

#define va_arg(ap, t)	\
		 (((ap) = (ap) + __va_argsiz(t)), *((t*) (void*) ((ap) - __va_argsiz(t))))

#define COM1	0
#define COM2	1

#define ON	1
#define	OFF	0

typedef struct ChannelDescription{
	unsigned int channel;
	unsigned int speed;
	//  Start points to the index of the first character to remove.  If end is the same as start, the buffer is empty.
	unsigned int out_buffer_start;
	//  End points to the index where the next character will be placed.
	unsigned int out_buffer_end;
	unsigned int in_buffer_start;
	unsigned int in_buffer_end;
	unsigned int output_buffer_size;
	unsigned int input_buffer_size;
	unsigned char * output_buffer;
	unsigned char * input_buffer;
}ChannelDescription;

void robsetfifo( ChannelDescription * channel, int state );

void robsetspeed( ChannelDescription * channel);

void robchannelsend( ChannelDescription * channel );

void robchannelerrorcheck( ChannelDescription * channel );

int robputc( ChannelDescription * channel, char c );


unsigned char robtakec( ChannelDescription * channel );

void robgetc( ChannelDescription * channel );

int robputx( ChannelDescription * channel, char c );


int robputstr( ChannelDescription * channel, char *str );


int robputr( ChannelDescription * channel, unsigned int reg );


void robputw( ChannelDescription * channel, int n, char fc, char *bf );


void robprintf( ChannelDescription * channel, char *format, ... );

/* Busy wait io functions for debugging */

void bwformatbusy( const unsigned char *fmt, va_list va );
int robputcbusy( const unsigned char c );
int robputxbusy( const unsigned char c );
int robputstrbusy( const unsigned char *str );
int robputrbusy( unsigned int reg );
void robputwbusy( int n, char fc, char *bf );
void robprintfbusy( const unsigned char *format, ... );
void assertf( int expr, const char * message, ...);
void assert( int expr, const char * message);
char robgetcbusy(int channel);

void set_led(int value);

#endif
