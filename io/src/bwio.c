/*
 * bwio.c - busy-wait I/O routines for diagnosis
 *
 * Specific to the TS-7200 ARM evaluation board
 *
 */

#include <ts7200.h>
#include "../include/bwio.h"

void bwui2a( unsigned int num, unsigned int base, char *bf );

void assert(int expr, const char * message){
	if(!expr){
		const char * title = "ASSERTION FAILURE!!!\n";
		int i = 0;
		while(title[i]){
			int *flags, *data;
			flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
			data = (int *)( UART2_BASE + UART_DATA_OFFSET );

			while( ( *flags & TXFF_MASK ) );
			*data = title[i];
			i++;
		}
		i = 0;
		while(message[i]){
			int *flags, *data;
			flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
			data = (int *)( UART2_BASE + UART_DATA_OFFSET );

			while( ( *flags & TXFF_MASK ) );
			*data = message[i];
			i++;
		}

		while(1){};
	}
}

void busy_wait_print(const char * message){
	int i = 0;
	while(message[i]){
		int *flags, *data;
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );

		while( ( *flags & TXFF_MASK ) );
		*data = message[i];
		i++;
	}
}

/*
 * The UARTs are initialized by RedBoot to the following state
 * 	115,200 bps
 * 	8 bits
 * 	no parity
 * 	fifos enabled
 */
int bwsetfifo( ChannelDescription * channel, int state ) {
	int *line, buf;
	switch( channel->channel ) {
	case COM1:
		line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	        break;
	case COM2:
	        line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	        break;
	default:
		assert(0,"Unknown Channel.");
	        return -1;
	        break;
	}
	buf = *line;
	buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
	//  2 stop bits, 8 bit words, no parity, no beak
	buf = buf & STP2_MASK & WLEN_MASK & ~PEN_MASK & ~BRK_MASK;
	while(!(*line & buf)){
		*line = buf;
	}

	assert(FEN_MASK	& 0x10,"fen corrupted.\n");
	assert(UART_LCRH_OFFSET & 0x8,"lcrh corrupted.\n");
	assert(UART1_BASE & 0x808c0000,"uart1 corrupted.\n");
	assert(!(buf & FEN_MASK),"buf has fifo enabled.\n");
	assert((*line & buf),"Line is different than buf.\n");
	assert(!(*line & FEN_MASK),"The FIFO is enabled, and that is bad.\n");
	return 0;
}

int bwsetspeed( ChannelDescription * channel) {
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
		assert(0,"Unknown Channel.");
		return -1;
	}
	switch( channel->speed ) {
	case 115200:
		*mid = 0x0;
		*low = 0x3;
		return 0;
	case 2400:
		*mid = 0x0;
		*low = 0xBF;
		return 0;
	default:
		assert(0,"Unknown speed.");
		return -1;
	}
	//  This will write to the high bytes and make the change apply.
	bwsetfifo( channel, OFF);
}

void bwchannelerrorcheck( ChannelDescription * channel) {
	int *status;
	switch( channel->channel ) {
	case COM1:
		status = (int *)( UART1_BASE + UART_RSR_OFFSET );
		break;
	case COM2:
		status = (int *)( UART2_BASE + UART_RSR_OFFSET );
		break;
	default:
		assert(0,"Unknown channel.");
		break;
	}
	if(channel->channel == COM1){
		if ((*status & FE_MASK)) busy_wait_print("Framming error on COM1.\n");
		if ((*status & PE_MASK)) busy_wait_print("Parity error on COM1.\n");
		if ((*status & BE_MASK)) busy_wait_print("Break error on COM1.\n");
		if ((*status & OE_MASK)) busy_wait_print("Overrun error on COM1.\n");
	}else{
		if ((*status & FE_MASK)) busy_wait_print("Framming error on COM2.\n");
		if ((*status & PE_MASK)) busy_wait_print("Parity error on COM2.\n");
		if ((*status & BE_MASK)) busy_wait_print("Break error on COM2.\n");
		if ((*status & OE_MASK)) busy_wait_print("Overrun error on COM2.\n");
	}
	//  Clear the status bits
	*status = 0;

}
void bwchannelsend( ChannelDescription * channel) {
	if(channel->out_buffer_start == channel->out_buffer_end){
		//  There was no data buffered.
		return;
	}
	int *flags, *data, *modemsts;
	switch( channel->channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		modemsts = (int *)( UART1_BASE + UART_MDMSTS_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		modemsts = (int *)( UART2_BASE + UART_MDMSTS_OFFSET );
		break;
	default:
		assert(0,"Unknown channel.");
		break;
	}

	int max_times = 100;
	int times = 0;
	while(times < max_times){
		if( !(*flags & TXFF_MASK ) && !(*flags & RXFF_MASK ) && !(*flags & TXBUSY_MASK) && ((*flags & CTS_MASK)  || channel->channel == COM2 )){
			*data = channel->output_buffer[channel->out_buffer_start];
			/*
			if(channel->channel == COM1){
				int * ff = (int *)( UART2_BASE + UART_FLAG_OFFSET );
				int * dd = (int *)( UART2_BASE + UART_DATA_OFFSET );
				int i = 0;
				const char * msg = "Sending to train: ";
				char buff[12];
				while(msg[i]){
					while( (*ff & TXFF_MASK )){};
					*dd = msg[i];
					i++;
				}
				i = 0;
				bwui2a( channel->buffer[channel->out_buffer_start], 10, buff);
				while(buff[i]){
					while( (*ff & TXFF_MASK )){};
					*dd = buff[i];
					i++;
				}
				while( (*ff & TXFF_MASK )){};
				*dd = '\n';
			}
			*/
			channel->out_buffer_start = (channel->out_buffer_start + 1) % channel->output_buffer_size;
			//  Sent data successfully
			return;
		}
		times++;
	}
}

int bwputc( ChannelDescription * channel, char c ) {
	channel->output_buffer[channel->out_buffer_end] = c;
	assert(((channel->out_buffer_end + 1) % channel->output_buffer_size) != channel->out_buffer_start,"The output buffer is full.");
	channel->out_buffer_end = (channel->out_buffer_end + 1) % channel->output_buffer_size;
	return 0;
}

char c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int bwputx( ChannelDescription * channel, char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	bwputc( channel, chh );
	return bwputc( channel, chl );
}

int bwputr( ChannelDescription * channel, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) bwputx( channel, ch[byte] );
	return bwputc( channel, ' ' );
}

int bwputstr( ChannelDescription * channel, char *str ) {
	while( *str ) {
		if( bwputc( channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void bwputw( ChannelDescription * channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) bwputc( channel, fc );
	while( ( ch = *bf++ ) ) bwputc( channel, ch );
}

unsigned char bwtakec( ChannelDescription * channel ) {
	//  Remove one character from the buffer we created.  Return null on empty buffer.
	if(channel->in_buffer_start == channel->in_buffer_end){
		//  There was no data buffered.
		return '\0';
	}
	unsigned char c = channel->input_buffer[channel->in_buffer_start];
	channel->in_buffer_start = (channel->in_buffer_start + 1) % channel->input_buffer_size;
	return c;
}

void bwgetc( ChannelDescription * channel ) {
	int *flags, *data;
	unsigned char c;

	switch( channel->channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		assert(0,"Unknown Channel.");
		return;
		break;
	}

	//  TODO figure out why this condition is possible even though FIFO is disabled
	  assert(!( !(*flags & RXFE_MASK ) && !(*flags & RXFF_MASK )),"It not (empty or full)");

	if( (*flags & RXFF_MASK )){
		c = *data;
		const char * msg = ".....................";
		unsigned char * cc = (unsigned char *)msg;
		cc[3] = c;
		assert(0,msg);
		channel->input_buffer[channel->in_buffer_end] = c;
		assert(((channel->in_buffer_end + 1) % channel->input_buffer_size) != channel->in_buffer_start,"The input buffer is full.");
		channel->in_buffer_end = (channel->in_buffer_end + 1) % channel->input_buffer_size;
	}
}

int bwa2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char bwa2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = bwa2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void bwui2a( unsigned int num, unsigned int base, char *bf ) {
	int n = 0;
	int dgt;
	unsigned int d = 1;
	
	while( (num / d) >= base ) d *= base;
	while( d != 0 ) {
		dgt = num / d;
		num %= d;
		d /= base;
		if( n || dgt > 0 || d == 0 ) {
			*bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
			++n;
		}
	}
	*bf = 0;
}

void bwi2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	bwui2a( num, 10, bf );
}

void bwformat ( ChannelDescription * channel, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			bwputc( channel, ch );
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
				ch = bwa2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				bwputc( channel, va_arg( va, char ) );
				break;
			case 's':
				bwputw( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				bwputw( channel, w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				bwputw( channel, w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				bwputw( channel, w, lz, bf );
				break;
			case '%':
				bwputc( channel, ch );
				break;
			}
		}
	}
}

void bwprintf( ChannelDescription * channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        bwformat( channel, fmt, va );
        va_end(va);
}

