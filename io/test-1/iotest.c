 /*
 * iotest.c
 */

#include "../include/bwio.h"
#include <ts7200.h>

int main( int argc, char* argv[] ) {
	char str[] = "Hello\n\r";
	bwsetfifo( COM2, OFF );
	bwputstr( COM2, str );
	bwputw( COM2, 10, '*', str );
	bwprintf( COM2, "Hello world.\n\r" );
	bwprintf( COM2, "%s world%u.\n\r", "Well, hello", 23 );
	bwprintf( COM2, "%d worlds for %u person.\n\r", -23, 1 );
	bwprintf( COM2, "%x worlds for %d people.\n\r", -23, 723 );
	str[0] = bwgetc( COM2 );
	bwprintf( COM2, "%s", str );
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

	assert(0,"Test...");

	while(1){
		int observed_val = *timer_val;
		if(observed_val > last_timer_value){
			ticks++;
			bwprintf( COM2, "%d ticks.\n\r", ticks );
			bwprintf( COM2, "%d observed.\n\r", observed_val );
		}
		last_timer_value = *timer_val;
	}
	return 0;
}

