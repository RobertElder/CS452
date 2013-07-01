#include "test_uart.h"

#define MAX_STATES 100

#define FIN_SEND -1
#define FIN_TAKE -2


void print_flags(volatile int flags, int time){
	if(flags == FIN_SEND){
		robprintfbusy((const unsigned char *)"Finished sending byte.\n");
		return;
	}

	if(flags == FIN_TAKE){
		robprintfbusy((const unsigned char *)"Finished taking byte.\n");
		return;
	}

	robprintfbusy((const unsigned char *)"CTS: %d, DCD: %d, DSR: %d, TXBUSY: %d, RXFE: %d, TXFF: %d, RXFF: %d, TXFE: %d.  T=%d\n",
		flags & CTS_MASK,
		flags & DCD_MASK,
		flags & DSR_MASK,
		flags & TXBUSY_MASK,
		flags & RXFE_MASK,
		flags & TXFF_MASK,
		flags & RXFF_MASK,
		flags & TXFE_MASK,
		time
	);
}

void TEST_UART(){
	volatile int states[MAX_STATES];
	volatile int times[MAX_STATES];

	volatile int state_number = 0;

	volatile int *mid1, *mid2, *low1, *low2;
	mid1 = (int *)( UART1_BASE + UART_LCRM_OFFSET );
	low1 = (int *)( UART1_BASE + UART_LCRL_OFFSET );

	mid2 = (int *)( UART2_BASE + UART_LCRM_OFFSET );
	low2 = (int *)( UART2_BASE + UART_LCRL_OFFSET );

	*mid1 = 0x0;
	*low1 = 0xBF;

	*mid2 = 0x0;
	*low2 = 0x3;

	volatile int *line1, *line2, buf1, buf2;

	line1 = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	buf1 = *line1;
	buf1 = buf1 & ~FEN_MASK;
	//  2 stop bits, 8 bit words, no parity, no beak
	buf1 = (((buf1 | STP2_MASK) | WLEN_MASK) & (~PEN_MASK)) & (~BRK_MASK);

	line2 = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	buf2 = *line2;
	buf2 = buf2 & ~FEN_MASK;

	*line1 = buf1;
	*line2 = buf2;

	assert((!(*line1 & FEN_MASK)),"The FIFO1 is enabled, and that is bad.\n");
	assert((!(*line2 & FEN_MASK)),"The FIFO2 is enabled, and that is bad.\n");

	volatile int flags;
	flags = *UART1Flag;
	states[0] = flags;
	state_number++;



	unsigned int cycles_per_tick = 508000;
	int * timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
	int * timer_val = (int*)(TIMER3_BASE + VAL_OFFSET);
	int * timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;

	int i = 0;
	int j = 0;

	volatile int in_data;

	for(j = 0; j < 1; j++){
		while(!(CTS_MASK & flags)){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
		}
		i = 0;
		/* Request some sensor data and look a the results */
		*UART1DATA = 133;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_SEND;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if(!(RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
		i = 0;
		in_data = *UART1DATA;
		while(1){
			flags = *UART1Flag;
			if(flags != states[state_number - 1]){
				states[state_number] = flags;
				times[state_number] = *timer_val;
				state_number++;
			}
			i++;
			if((RXFE_MASK & flags)){
				states[state_number] = FIN_TAKE;
				times[state_number] = *timer_val;
				state_number++;
				break;
			}
		}
	}

	for(i = 0; i < state_number; i++){
		print_flags(states[i], times[i]);
	}

	while(1){};

}
