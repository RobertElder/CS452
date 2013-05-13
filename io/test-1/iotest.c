 /*
 * iotest.c
 */

#include "../include/bwio.h"
#include <ts7200.h>



int handle_command(ChannelDescription * terminal_channel, unsigned char * command_buffer, unsigned int * command_buffer_pos){
	int arg1 = 0;
	int arg2 = 0;
	if(command_buffer[0] == 'q'){
		return 1;
	}else if(command_buffer[0] == 't' && command_buffer[1] == 'r'){
		assert(0,"stuff\n");
		//bwa2i(0,&(command_buffer[3]),10,&arg1);
		//bwprintf(terminal_channel,"arg1 %d\n",arg1);
	}
	//  Reset the command buffer
	command_buffer[0] = 0;
	*command_buffer_pos = 0;
	return 0;
}

void print_channel_info(ChannelDescription * terminal_channel,ChannelDescription * ch){
	unsigned int bytes_used = ch->out_buffer_start <= ch->out_buffer_end ? ch->out_buffer_end - ch->out_buffer_start : ch->out_buffer_end + (ch->output_buffer_size - ch->out_buffer_start);

	int *status;
	if(ch->channel == COM1){
		status = (int *)( UART1_BASE + UART_RSR_OFFSET );
		bwprintf( terminal_channel, "COM1");
	}else if(ch->channel == COM2){
		status = (int *)( UART2_BASE + UART_RSR_OFFSET );
		bwprintf( terminal_channel, "COM2");
	}

	int frame_error = *status & FE_MASK;
	int parity_error = *status & FE_MASK;
	int break_error = *status & FE_MASK;
	int overrun_error = *status & FE_MASK;

	bwprintf( terminal_channel, " running at speed %d baud.  %d of %d bytes used.", ch->speed, bytes_used, ch->output_buffer_size );
	bwprintf( terminal_channel, " FE: %d, PE: %d, BE: %d, OE: %d.\n", frame_error, parity_error, break_error, overrun_error );
}

void print_loop_timing(ChannelDescription * terminal_channel, unsigned int observed_val, unsigned int last_timer_value, unsigned int cycles_per_tick, unsigned int max_time){
	bwprintf( terminal_channel, "Timer observed: %d\n", observed_val );
	bwprintf( terminal_channel, "Last Timer: %d\n", last_timer_value );
	unsigned int diff = observed_val > last_timer_value ? (cycles_per_tick - observed_val) + last_timer_value : last_timer_value - observed_val;
	bwprintf( terminal_channel, "Time in loop: max: %dus, last: %dus.\n", (int)((double)max_time/((double)cycles_per_tick/(double)100000)), (int)((double)diff/((double)cycles_per_tick/(double)100000)));
}

void print_formatted_time(ChannelDescription * terminal_channel, unsigned int ticks){
	unsigned int ticks_in_hour = 60 * 60 * 10;
	unsigned int ticks_in_minute = 60 * 10;
	unsigned int ticks_in_second = 10;
	unsigned int hours = ticks / ticks_in_hour;
	unsigned int minutes = (ticks - (hours * ticks_in_hour)) / ticks_in_minute;
	unsigned int seconds = (ticks - (hours * ticks_in_hour) - (minutes * ticks_in_minute)) / ticks_in_second;
	unsigned int tenth_seconds = ticks % ticks_in_second;
	bwprintf( terminal_channel, "System up time: ");
	if(hours < 10){
		bwprintf( terminal_channel, "0%d", hours);
	}else{
		bwprintf( terminal_channel, "%d", hours);
	}
	bwprintf( terminal_channel, ":");
	if(minutes < 10){
		bwprintf( terminal_channel, "0%d", minutes);
	}else{
		bwprintf( terminal_channel, "%d", minutes);
	}
	bwprintf( terminal_channel, ":");
	if(seconds < 10){
		bwprintf( terminal_channel, "0%d", seconds);
	}else{
		bwprintf( terminal_channel, "%d", seconds);
	}
	bwprintf( terminal_channel, ":%d", tenth_seconds);
	bwprintf( terminal_channel, ".\n");
}

int main( int argc, char* argv[] ) {
	unsigned int max_time = 0;

	int * timer_ldr = (TIMER3_BASE + LDR_OFFSET);
	int * timer_val = (TIMER3_BASE + VAL_OFFSET);
	int * timer_ctrl = (TIMER3_BASE + CRTL_OFFSET);

	unsigned int terminal_output_buffer_size = 10000;
	unsigned int terminal_input_buffer_size = 100;
	unsigned int train_controller_output_buffer_size = 1000;
	unsigned int train_controller_input_buffer_size = 100;
	unsigned char terminal_output_buffer[terminal_output_buffer_size];
	unsigned char terminal_input_buffer[terminal_input_buffer_size];
	unsigned char train_controller_output_buffer[train_controller_output_buffer_size];
	unsigned char train_controller_input_buffer[train_controller_input_buffer_size];

	// 508000 cycles per second, means a tick (100ms) has 50800 cycles
	unsigned int cycles_per_tick = 50800;
	int last_timer_value = cycles_per_tick;
	int ticks = 0;

	//  Use simple ring buffers for the output to the two UARTs
	ChannelDescription terminal_channel;
	terminal_channel.channel = COM2;
	terminal_channel.speed = 115200;
	terminal_channel.out_buffer_start = 0;
	terminal_channel.out_buffer_end = 0;
	terminal_channel.in_buffer_start = 0;
	terminal_channel.in_buffer_end = 0;
	terminal_channel.output_buffer_size = terminal_output_buffer_size;
	terminal_channel.output_buffer = terminal_output_buffer;
	terminal_channel.input_buffer_size = terminal_input_buffer_size;
	terminal_channel.input_buffer = terminal_input_buffer;

	ChannelDescription train_controller_channel;
	train_controller_channel.channel = COM1;
	train_controller_channel.speed = 2400;
	train_controller_channel.out_buffer_start = 0;
	train_controller_channel.out_buffer_end = 0;
	train_controller_channel.in_buffer_start = 0;
	train_controller_channel.in_buffer_end = 0;
	train_controller_channel.output_buffer_size = train_controller_output_buffer_size;
	train_controller_channel.output_buffer = train_controller_output_buffer;
	train_controller_channel.input_buffer_size = train_controller_input_buffer_size;
	train_controller_channel.input_buffer = train_controller_input_buffer;

	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;

	bwsetspeed( &terminal_channel);
	bwsetspeed( &train_controller_channel);

	unsigned char command_buffer[200];
	unsigned int command_buffer_pos = 0;
	command_buffer[0] = 0;

	while(1){
		int * line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
		assert((!(*line & FEN_MASK)),"The FIFO is enabled in main, and that is bad.\n");
		int observed_val = *timer_val;
		//  Output any information about errors.
		//bwchannelerrorcheck(&terminal_channel);
		//bwchannelerrorcheck(&train_controller_channel);
		//  Send some of the data in the output buffers
		bwchannelsend(&terminal_channel);
		bwchannelsend(&train_controller_channel);
		//  Get any data that is available
		bwgetc(&terminal_channel);
		bwgetc(&train_controller_channel);
		unsigned char c = bwtakec(&terminal_channel);
		if(c){
			//  Store the data in our command buffer
			command_buffer[command_buffer_pos] = c;
			command_buffer[command_buffer_pos+1] = 0;
			command_buffer_pos++;
			if(c == '\r' || c == '\n'){
				if(handle_command(&terminal_channel, command_buffer, &command_buffer_pos)){
					return 0;
				}
			}
			assert(command_buffer_pos < 190, "Command too big.");
		}

		unsigned int diff = observed_val > last_timer_value ? (cycles_per_tick - observed_val) + last_timer_value : last_timer_value - observed_val;
		if(diff > max_time)
			max_time = diff;
		if(observed_val > last_timer_value){
			if(ticks % 10 == 0){
				//bwputc( &train_controller_channel, '\xA');
				//bwputc( &train_controller_channel, '\x32');
				//bwputc( &train_controller_channel, '\xA');
				//bwputc( &train_controller_channel, '\x2D');
			}
			ticks++;
			//  Clear the screen
			bwprintf( &terminal_channel, "\x1B""[2J");
			print_formatted_time(&terminal_channel, ticks);
			print_loop_timing(&terminal_channel, observed_val, last_timer_value, cycles_per_tick, max_time);
			print_channel_info(&terminal_channel,&terminal_channel);
			print_channel_info(&terminal_channel,&train_controller_channel);
			bwprintf( &terminal_channel, command_buffer);
		}
		last_timer_value = observed_val;
	}
	return 0;
}

