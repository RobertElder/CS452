 /*
 * iotest.c
 */

#include "../include/bwio.h"
#include <ts7200.h>

int main( int argc, char* argv[] ) {
	//  Use simple ring buffers for the output to the two UARTs
	unsigned int buf_size = 10;
	unsigned char output_buffer[buf_size];
	ChannelDescription c;
	c.channel = COM2;
	c.out_buffer_start = 0;
	c.out_buffer_end = 0;
	c.buffer_size = buf_size;
	c.buffer = output_buffer;


	char str[] = "Hello\n\r";
	bwsetfifo( &c, OFF );
	bwputstr( &c, str );
	bwputw( &c, 10, '*', str );
	bwprintf( &c, "Hello world.\n\r" );

	int * timer_ldr = (TIMER3_BASE + LDR_OFFSET);
	int * timer_val = (TIMER3_BASE + VAL_OFFSET);
	int * timer_ctrl = (TIMER3_BASE + CRTL_OFFSET);
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	// 508000 cycles per second
	*timer_ldr = 50800;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;

	int last_timer_value = 50800;
	int ticks = 0;

	while(1){
		int observed_val = *timer_val;
		if(observed_val > last_timer_value){
			ticks++;
			bwprintf( &c, "%d ticks.\n\r", ticks );
			bwprintf( &c, "%d observed.\n\r", observed_val );
		}
		last_timer_value = *timer_val;
	}
	return 0;
}

