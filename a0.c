#include "ts7200.h"


#define BUFFER_SIZE 1000

struct Buffer {
	char data[ BUFFER_SIZE];
	unsigned int head;
	unsigned int tail;
};


int debug_error_num = 0;


// copied from bwio
void itoa(unsigned int num, char *bf, unsigned int base) {
	int n = 0;
	int dgt;
	unsigned int d = 1;

	while ((num / d) >= base)
		d *= base;
	while (d != 0) {
		dgt = num / d;
		num %= d;
		d /= base;
		if (n || dgt > 0 || d == 0) {
			*bf++ = dgt + (dgt < 10 ? '0' : 'a' - 10);
			++n;
		}
	}
	*bf = 0;
}

// copied from bwio
int bwsetspeed( int channel, int speed ) {
	int *high, *low;
	switch( channel ) {
	case COM1:
		high = (int *)( UART1_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
	        break;
	case COM2:
		high = (int *)( UART2_BASE + UART_LCRM_OFFSET );
		low = (int *)( UART2_BASE + UART_LCRL_OFFSET );
	        break;
	default:
	        return -1;
	        break;
	}
	switch( speed ) {
	case 115200:
		*high = 0x0;
		*low = 0x3;
		return 0;
	case 2400:
		*high = 0x0;
		*low = 0x90;
		return 0;
	default:
		return -1;
	}
}

// Disables FIFO mode
void disable_fifo() {
	int * line;
	int buf;
	
	line = (int *) (UART1_BASE + UART_LCRH_OFFSET);
	buf = *line;
	buf = buf & ~FEN_MASK;
	*line = buf;
	
	line = (int *) (UART2_BASE + UART_LCRH_OFFSET);
	buf = *line;
	buf = buf & ~FEN_MASK;
	*line = buf;
}

// Sends a character to the thing if possible
int send_char(int channel, struct Buffer * buffer) {
	int *flags, *data;

	switch (channel) {
	case COM1:
		flags = (int *) (UART1_BASE + UART_FLAG_OFFSET);
		data = (int *) (UART1_BASE + UART_DATA_OFFSET);
		break;
	case COM2:
		flags = (int *) (UART2_BASE + UART_FLAG_OFFSET);
		data = (int *) (UART2_BASE + UART_DATA_OFFSET);
		break;
	default:
		return -1;
		break;
	}

	if (*flags & TXFF_MASK) {
		return 0;
	}
	
	if (buffer->head < buffer->tail && buffer->tail != 0) {
		char char_val = buffer->data[buffer->head];
		*data = char_val;
		buffer->head = buffer->head + 1;
	} else {
		buffer->head = 0;
		buffer->tail = 0;
	}

	return 0;
}

// Recv a char if its possible
int recv_char(int channel, struct Buffer * buffer) {

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
	if ( !( *flags & RXFF_MASK ) ) {
		return 0;
	}
	
	c = *data;
	
	buffer->data[buffer->tail] = c;
	buffer->tail = buffer->tail + 1;
	
	return 0;
}


// Puts a char into the buffer
int put_char(struct Buffer * buffer, char c) {
	if (buffer->tail >= BUFFER_SIZE) {
		return -1;
	}

	buffer->data[buffer->tail] = c;
	buffer->tail = buffer->tail + 1;

	return 0;
}

// Puts a string into the buffer
int put_str(struct Buffer * buffer, char*str) {
	while (*str) {
		if (put_char(buffer, (char) *str))
			return -1;
		str++;
	}
	return 0;
}

// Sets up the timer so 0.1s can be detected
void set_timer() {
	int * line;
	int val;

	// Timer is ticked 2000 per 1s, 200 per 0.1s, 20 per 0.01s
	line = (int *) (TIMER3_BASE + LDR_OFFSET);
	*line = 200;

	line = (int *) (TIMER3_BASE + CRTL_OFFSET);
	val = *line;
	//val = val & ~CLKSEL_MASK; // 1=>508kHz, 0=>2kHz;
	val = ENABLE_MASK | MODE_MASK;
	*line = val;

}

// Checks if the timer interval has been elapsed
int check_timer(int * last_timer) {
	int * line = (int *) (TIMER3_BASE + VAL_OFFSET);
	int now = *line;

	if (now > *last_timer) {
		*last_timer = now;
		return 1;
	}

	*last_timer = now;
	return 0;
}

// Prints out the clock
void print_clock(struct Buffer * term_output_buffer, int current_time) {
	int time = current_time * 100;
	int ms = time % 1000;
	time /= 1000;
	int sec = time % 60;
	time /= 60;
	int min = time % 60;

	char buffer[5];
	
	put_str(term_output_buffer, "\033[K");
	put_str(term_output_buffer, "TIME: ");
	itoa(min, buffer, 10);
	put_str(term_output_buffer, buffer);
	put_str(term_output_buffer, "m : ");
	itoa(sec, buffer, 10);
	put_str(term_output_buffer, buffer);
	put_str(term_output_buffer, "s : ");
	itoa(ms, buffer, 10);
	put_str(term_output_buffer, buffer);
	put_str(term_output_buffer, "ms\n");
}

// Prints out a table of switch positions
void print_switches() {

}

// Prints out triggered sensors
void print_sensors() {

}


int main(int argc, char* argv[]) {
	struct Buffer term_output_buffer = {};
	term_output_buffer.head = 0;
	term_output_buffer.tail = 0;
	
	struct Buffer train_output_buffer = {};
	train_output_buffer.head = 0;
	train_output_buffer.tail = 0;
	
	struct Buffer term_input_buffer = {};
	term_input_buffer.head = 0;
	term_input_buffer.tail = 0;
	
	struct Buffer train_input_buffer = {};
	train_input_buffer.head = 0;
	train_input_buffer.tail = 0;
	
	int current_time = 0; // in ticks
	int last_timer = 0;
	int debug_counter = 0;
	
	bwsetspeed(COM1, 2400);
	disable_fifo();
	set_timer();
	
	put_char(&term_output_buffer, '-');
	put_char(&term_output_buffer, '>');
	
	put_str(&term_output_buffer, "hello world\n");
	
	//clear scr
	put_str(&term_output_buffer, "\033[2J" );
	
	
	while (1) {
		int interval_passed = check_timer(&last_timer);
		
		if (debug_counter % 100000 == 0) {
			put_str(&term_output_buffer, "\033[10;2H");
			put_char(&term_output_buffer, 'X');
			
			/*put_char(&train_output_buffer, 'L');
			put_char(&train_output_buffer, 45);
			put_char(&train_output_buffer, 'S');
			put_char(&train_output_buffer, 2);
			put_char(&train_output_buffer, '\r');
			put_char(&train_output_buffer, '\r');*/
			put_char(&train_output_buffer, 2);
			put_char(&train_output_buffer, 45);
			
		} else if (debug_counter % 100000 == 50000){
			put_str(&term_output_buffer, "\033[10;2H");
			put_char(&term_output_buffer, '.');
		}
		
		if (interval_passed) {
			// Move to 1,1
			put_str(&term_output_buffer, "\033[H");
		
			current_time += 1;
			
			print_clock(&term_output_buffer, current_time);
		}
		
		send_char(COM1, &train_output_buffer);
		send_char(COM2, &term_output_buffer);
		//recv_char(COM1, &train_input_buffer);
		//recv_char(COM2, &term_input_buffer);
		
		debug_counter += 1;
		
		if (debug_error_num == 123) {return 123;}
	}

	return 0;
}

