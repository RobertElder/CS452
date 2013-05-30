
#include <ts7200.h>
#include "robio.h"

void bwui2a( unsigned int num, unsigned int base, char *bf );

void assertf( int expr, const char * message, ...){
	va_list va;
	va_start(va,message);
	if(!expr){
		const char * title = (const char *)"\033[36m\
                                ``,:::::``                                          \n\
                              .@@@@@@@@@@@#`                                        \n\
                             `#@@@@@@@@@@@@#`                                       \n\
                            :@@@@@@@@@@@@@@@@.                                      \n\
                           `+@@@@@@@@@@@@@@@@.                                      \n\
                             ;+@@@@@@@@@@@@#;`                                      \n\
                      ``:::;'+#@@@@@@@@@@@@#+++;::,```                              \n\
               `.,:###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##,,``                        \n\
          `,+##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+,.                    \n\
     `,;'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';,               \n\
 `.;+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@;.`           \n\
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'`         \n\
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,         \n\
,##@@@@@@@@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##+          \n\
  `#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#########@@@@@@@@@@@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@@@@@@@@@#;..` `      `.,'+@@@@@@@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@@@@@+;,`                  `,;@@@@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@@@',`,:.                  `,,`,#@@@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@@#. `;@@@@`               ,@@@@,`.#@@@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@@@:  ,@@+;;@@'             +@+;'#@#` ,#@@@@@@@@@@@@@@#`            \n\
  `#@@@@@@@@@@@@@'`    `  `` `               `     '`  `'@@@@@@@@@@@@@#`            \n\
`+@@@@@@@@@@@@@@:     :'@@@@@#+            .++@@+'':     :@@@@@@@@@@@@@#:`          \n\
@@@@@@@@@@@@@@@:    '+',,:,,:+@#:        :#@@;:,,@@;+.    :@@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@+     ++        ,@@,      .@@:`      `+@`    :@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@+`    @`          '@#      #@+          +@    `+@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@,     ',  .:;;:`           .;   `:;:`    '     ;@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@+`     ,. ,+@@@@@;           ` `;@@@@@#` ;+     .@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@:      @+ +@@@@@@@`         #@ +@@@@@@@+        `'@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@:      `.`+@@@@@@@`          ``@@@@@@@@+#:       :@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@:         ;@@@@@@#'           `,#@@@@@@`.`       :@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@:          `.,.,.  ,.        ,. `.,,..`          :@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@:                 '@@+`     ;@#`                `+@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@`               ;@@@@@;::'+@@@+`               .@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@;             .@@@::@@@@@@@':'@@'              '@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@.          .#@@#.    ````    :@@#:           .@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@#`     ,:@@@#@;``              ,@@@@::      `#@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@@'`     #'```@:@@@+```    `..:,:##'++;     `'@@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@@@+`         ,@  `''@@::+;@#;.,@`         `+@@@@@@@@@@@@@@@@,         \n\
@@@@@@@@@@@@@@@@@+.        `@#              ;@`        .+@@@@@@@@@@@@@@@@@,         \n\
:+@@@@@@@@@@@@@@@@@'`       .@@,.`      `..+@+       `;@@@@@@@@@@@@@@@@';:`         \n\
 `@@@@@@@@@@@@@@@@@@@#.      `@@@@#@.`;##@@@`      `:@@@@@@@@@@@@@@@@@@,            \n\
;'@@@@@@@@@@@@@@@@@@@@@',`     :;#@@@@@@##:     `:'@@@@@@@@@@@@@@@@@@@@+';`         \n\
@@@@@@@@@@@@@@@@@@@@@@@@@@;,``    `....`    `.,;@@@@@@@@@@@@@@@@@@@@@@@@@@:`        \n\
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+';.````.;'+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:        \n\
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`       \n\
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+    \n\
	\033[0m"
	"\n\033[1;4;7mASSERTION FAILURE!!!\033[0m\n";
		robputstrbusy((const unsigned char *)title);
		bwformatbusy( (const unsigned char *)message, va );
		while(1){};
	}
	va_end(va);
}



void assert(int expr, const char * message){
	assertf(expr,message);
	/*
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
		while (1) {};
	}
	*/
}

/*
 * The UARTs are initialized by RedBoot to the following state
 * 	115,200 bps
 * 	8 bits
 * 	no parity
 * 	fifos enabled
 */
void robsetfifo( ChannelDescription * channel, int state ) {
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
	        break;
	}

	*line = buf;

	assert((!(*line & FEN_MASK)),"The FIFO is enabled, and that is bad.\n");
}

void robsetspeed( ChannelDescription * channel) {
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
	}
	//  This will write to the high bytes and make the change apply.
	robsetfifo( channel, OFF);
}

void robchannelerrorcheck( ChannelDescription * channel) {
	int *status;
	switch( channel->channel ) {
	case COM1:
		status = (int *)( UART1_BASE + UART_RSR_OFFSET );
		break;
	case COM2:
		status = (int *)( UART2_BASE + UART_RSR_OFFSET );
		break;
	default:
		assert(0,"Unknown channel in error check.");
		break;
	}

	if(channel->channel == COM1){
		assert(!(*status & FE_MASK), "Framming error on COM1.\n");
		assert(!(*status & PE_MASK), "Parity error on COM1.\n");
		assert(!(*status & BE_MASK), "Break error on COM1.\n");
		assert(!(*status & OE_MASK), "Overrun error on COM1.\n");
	}else{
		assert(!(*status & FE_MASK), "Framming error on COM2.\n");
		assert(!(*status & PE_MASK), "Parity error on COM2.\n");
		assert(!(*status & BE_MASK), "Break error on COM2.\n");
		assert(!(*status & OE_MASK), "Overrun error on COM2.\n");
	}


	//  Clear the status bits
	*status = 0;

}
void robchannelsend( ChannelDescription * channel) {
	if(channel->out_buffer_start == channel->out_buffer_end){
		//  There was no data buffered.
		return;
	}
	int *flags, *data;
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
		assert(0,"Unknown channel in channel send.");
		break;
	}

	int max_times = 100;
	int times = 0;
	while(times < max_times){
		if( (*flags & TXFE_MASK) && !(*flags & TXBUSY_MASK) && ((*flags & CTS_MASK)  || channel->channel == COM2 )){
			*data = channel->output_buffer[channel->out_buffer_start];
			channel->out_buffer_start = (channel->out_buffer_start + 1) % channel->output_buffer_size;
			//  Sent data successfully
			return;
		}
		times++;
	}
}

int robputc( ChannelDescription * channel, char c ) {
	channel->output_buffer[channel->out_buffer_end] = c;
	assert(((channel->out_buffer_end + 1) % channel->output_buffer_size) != channel->out_buffer_start,"The output buffer is full.");
	channel->out_buffer_end = (channel->out_buffer_end + 1) % channel->output_buffer_size;
	return 0;
}

int robputcbusy( const unsigned char c ) {
	int *flags, *data;

	data = (int *)( UART2_BASE + UART_DATA_OFFSET );
	flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );

	while ( (*flags & TXFF_MASK ));
	*data = c;
	return 0;
}

char c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int robputx( ChannelDescription * channel, char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	robputc( channel, chh );
	return robputc( channel, chl );
}

int robputxbusy( const unsigned char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	robputcbusy( chh );
	return robputcbusy( chl );
}

int robputr( ChannelDescription * channel, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) robputx( channel, ch[byte] );
	return robputc( channel, ' ' );
}

int robputrbusy( unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) robputxbusy( ch[byte] );
	return robputcbusy( ' ' );
}

int robputstr( ChannelDescription * channel, char *str ) {
	while( *str ) {
		if( robputc( channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

int robputstrbusy( const unsigned char *str ) {
	while( *str ) {
		if( robputcbusy( *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void robputw( ChannelDescription * channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) robputc( channel, fc );
	while( ( ch = *bf++ ) ) robputc( channel, ch );
}

void robputwbusy( int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) robputcbusy( fc );
	while( ( ch = *bf++ ) ) robputcbusy( ch );
}

unsigned char robtakec( ChannelDescription * channel ) {
	//  Remove one character from the buffer we created.  Return null on empty buffer.
	if(channel->in_buffer_start == channel->in_buffer_end){
		//  There was no data buffered.
		return 0;
	}
	unsigned char c = channel->input_buffer[channel->in_buffer_start];
	channel->in_buffer_start = (channel->in_buffer_start + 1) % channel->input_buffer_size;
	return c;
}

void robgetc( ChannelDescription * channel ) {
	int *flags, *data;

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
		assert(0,"Unknown Channel in getc.");
		break;
	}

	if( (*flags & RXFF_MASK )){
		channel->input_buffer[channel->in_buffer_end] = *data;
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
			robputc( channel, ch );
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
				robputc( channel, va_arg( va, char ) );
				break;
			case 's':
				robputw( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				robputw( channel, w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				robputw( channel, w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				robputw( channel, w, lz, bf );
				break;
			case '%':
				robputc( channel, ch );
				break;
			}
		}
	}
}

void bwformatbusy( const unsigned char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;

	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			robputcbusy( ch );
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
				ch = bwa2i( ch, (char **)&fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				robputcbusy( va_arg( va, char ) );
				break;
			case 's':
				robputwbusy( w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				robputwbusy( w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				robputwbusy( w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				robputwbusy( w, lz, bf );
				break;
			case '%':
				robputcbusy( ch );
				break;
			}
		}
	}
}

void robprintf( ChannelDescription * channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        bwformat( channel, fmt, va );
        va_end(va);
}

void robprintfbusy( const unsigned char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        bwformatbusy( fmt, va );
        va_end(va);
}

char robgetcbusy( int channel ) {
	int *flags, *data;
	unsigned char c;

	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	while ( !( *flags & RXFF_MASK ) ) ;
	c = *data;
	return c;
}
