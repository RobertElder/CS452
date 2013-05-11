/*
 * bwio.h
 */

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
	//  Start points to the index of the first character to remove.  If end is the same as start, the buffer is empty.
	unsigned int out_buffer_start;
	//  End points to the index where the next character will be placed.
	unsigned int out_buffer_end;
	unsigned int buffer_size;
	unsigned char * buffer;
}ChannelDescription;

int bwsetfifo( ChannelDescription * channel, int state );

int bwsetspeed( ChannelDescription * channel, int speed );

int bwputc( ChannelDescription * channel, char c );

int bwgetc( ChannelDescription * channel );

int bwputx( ChannelDescription * channel, char c );

int bwputstr( ChannelDescription * channel, char *str );

int bwputr( ChannelDescription * channel, unsigned int reg );

void bwputw( ChannelDescription * channel, int n, char fc, char *bf );

void bwprintf( ChannelDescription * channel, char *format, ... );

void assert( int expr, const char * message);
