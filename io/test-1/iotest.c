 /*
 * iotest.c
 */

#include "../include/bwio.h"
#include <ts7200.h>

int main( int argc, char* argv[] ) {
	int * timer_ldr = (TIMER3_BASE + LDR_OFFSET);
	int * timer_val = (TIMER3_BASE + VAL_OFFSET);
	int * timer_ctrl = (TIMER3_BASE + CRTL_OFFSET);

	unsigned int terminal_buf_size = 1000;
	unsigned int train_controller_buf_size = 1000;
	unsigned char terminal_output_buffer[terminal_buf_size];
	unsigned char train_controller_output_buffer[train_controller_buf_size];

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
	terminal_channel.buffer_size = terminal_buf_size;
	terminal_channel.buffer = terminal_output_buffer;

	ChannelDescription train_controller_channel;
	train_controller_channel.channel = COM1;
	train_controller_channel.speed = 2400;
	train_controller_channel.out_buffer_start = 0;
	train_controller_channel.out_buffer_end = 0;
	train_controller_channel.buffer_size = train_controller_buf_size;
	train_controller_channel.buffer = train_controller_output_buffer;

	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;

	bwsetspeed( &terminal_channel);
	bwsetspeed( &train_controller_channel);

	while(1){
		int observed_val = *timer_val;
		bwchannelerrorcheck(&terminal_channel);
		bwchannelerrorcheck(&train_controller_channel);
		bwchannelsend(&terminal_channel);
		bwchannelsend(&train_controller_channel);
		bwchannelsend(&train_controller_channel);
		bwchannelsend(&train_controller_channel);
		if(observed_val > last_timer_value){
			if(ticks % 10 == 0){
				bwputc( &train_controller_channel, '\xA');
				bwputc( &train_controller_channel, '\x32');
				bwputc( &train_controller_channel, '\xA');
				bwputc( &train_controller_channel, '\x2D');
			}
			ticks++;
			//bwprintf( &terminal_channel, "%d ticks.\n", ticks );
			//bwprintf( &terminal_channel, "observed: %d\n", observed_val );
			//bwprintf( &terminal_channel, "last_timer: %d\n", last_timer_value );
			//unsigned int diff = observed_val > last_timer_value ? (cycles_per_tick - observed_val) + last_timer_value : last_timer_value - observed_val;
			//bwprintf( &terminal_channel, "Time in polling loop: about %d microseconds.\n", (int)((double)diff/((double)cycles_per_tick/(double)100000)));
		}
		last_timer_value = observed_val;
	}
	return 0;
}

