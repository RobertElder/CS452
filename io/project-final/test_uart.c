#include "test_uart.h"

#define MAX_STATES 100

#define FIN_SEND -1
#define FIN_TAKE -2

typedef struct timestamp{
	unsigned int ticks;
	unsigned int timer;
} timestamp;


void print_flags(volatile int flags, timestamp time){
	robprintfbusy((const unsigned char *)"%d.  T=%d\n",
		flags,
		(time.ticks * 508000 + (508000 - time.timer))
	);
}

unsigned int diff(timestamp current, timestamp last){
	return (current.ticks * 508000 + (508000 - current.timer)) - (last.ticks * 508000 + (508000 - last.timer));
}

void print_flags1(timestamp time2, timestamp time1){
	robprintfbusy((const unsigned char *)"delta is %d\n",
		diff(time2, time1)
	);
}


void service_timer(unsigned int current, unsigned int last, unsigned int * ticks){
	if(current > last){
		*ticks = *ticks + 1;
	}
}

void stall(int ticks){
	unsigned int cycles_per_tick = 508000;
	int * timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
	int * timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;
	volatile int * timer_val = (int*)(TIMER3_BASE + VAL_OFFSET);
	//  Stall for a bit
	while(*timer_val > (cycles_per_tick - ticks)){};
}

void set_switch(int switch_number, char code){
	char switch_code = (code == 'S') ? 33 : 34;

	volatile int flags;
	while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
		flags = *UART1Flag;
	}

	*UART1DATA = switch_code;

	while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
		flags = *UART1Flag;
	}

	*UART1DATA = switch_number;

	stall(100000);

	while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
		flags = *UART1Flag;
	}
	//  Turn off
	*UART1DATA = 32;
	stall(100000);
}


void move_train(int speed, int train){
	volatile int flags;
	while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
		flags = *UART1Flag;
	}

	*UART1DATA = speed;

	while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
		flags = *UART1Flag;
	}

	*UART1DATA = train;
}

void do_setup(){
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

	unsigned int cycles_per_tick = 508000;
	int * timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
	int * timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;
}

void dummy_query(){
	volatile int flags;

	volatile int in_data = 0;

	if(!(RXFE_MASK & flags)){
		in_data = *UART1DATA;
	}

	int i = 0;
	while(i < 1){
		while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
			flags = *UART1Flag;
		}

		/* Request some sensor data and look a the results */
		*UART1DATA = 194;
		while(1){
			flags = *UART1Flag;
			if(!(RXFE_MASK & flags)){
				break;
			}
		}

		in_data = *UART1DATA;

		while(1){
			flags = *UART1Flag;
			if(!(RXFE_MASK & flags)){
				break;
			}
		}

		in_data = *UART1DATA;
		i++;
	}
}

int test_orientation(){

	unsigned int cycles_per_tick = 508000;
	int * timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
	int * timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;
	volatile int states[MAX_STATES];
	volatile timestamp times[MAX_STATES];

	volatile int state_number = 0;

	volatile int flags;

	int i = 0;

	volatile int in_data = 0;

	timestamp last_ten;
	last_ten.ticks = 0;
	last_ten.timer = 508000;
	timestamp last_thirteen;
	last_thirteen.ticks = 0;
	last_thirteen.timer = 508000;

	int * timer_val = (int*)(TIMER3_BASE + VAL_OFFSET);
	unsigned int last_timer = 508000;

	unsigned int ticks = 0;

	int samples = 6;

	while(state_number < (samples * 2)){
		while(!(CTS_MASK & flags && !(TXBUSY_MASK & flags))){
			flags = *UART1Flag;
			unsigned int sample = *timer_val;
			service_timer(sample, last_timer, &ticks);
			last_timer = sample;
		}

		/* Request some sensor data and look a the results */
		*UART1DATA = 194;
		while(1){
			flags = *UART1Flag;
			if(!(RXFE_MASK & flags)){
				break;
			}
			unsigned int sample = *timer_val;
			service_timer(sample, last_timer, &ticks);
			last_timer = sample;
		}

		in_data = *UART1DATA;

		if(in_data){
			//32 is B
			if(in_data & 16){
				unsigned int sample = *timer_val;
				service_timer(sample, last_timer, &ticks);
				last_timer = sample;

				timestamp now;
				now.ticks = ticks;
				now.timer = sample;

				if(diff(now, last_thirteen) > 50000){
					states[state_number] = in_data;
					times[state_number] = now;
					state_number++;
				}else{
					//robprintfbusy((const unsigned char *)"%d.\n",diff(now, last_thirteen));
				}

				last_thirteen = now;
			}
		}

		while(1){
			flags = *UART1Flag;
			if(!(RXFE_MASK & flags)){
				break;
			}
			unsigned int sample = *timer_val;
			service_timer(sample, last_timer, &ticks);
			last_timer = sample;
		}

		in_data = *UART1DATA;

		if(in_data){
			// B 15 
			if(in_data & 2){
				unsigned int sample = *timer_val;
				service_timer(sample, last_timer, &ticks);
				last_timer = sample;

				timestamp now;
				now.ticks = ticks;
				now.timer = sample;

				if(diff(now, last_ten) > 50000){
					states[state_number] = in_data;
					times[state_number] = now;
					state_number++;
				}else{
					//robprintfbusy((const unsigned char *)"%d.\n",diff(now, last_ten));
				}

				last_ten = now;
			}

		}
	}

	int num = 0;
	int sum = 0;
	for(i = 0; i < state_number -1; i++){
		//print_flags(states[i], times[i]);
		if(states[i] == 16 && states[i+1] == 2){
			//print_flags1(times[i+1],times[i]);
			sum += diff(times[i+1],times[i]);
			num++;
		}

	}

	int first_average = sum/num;

	num = 0;
	sum = 0;
	for(i = 0; i < state_number -1; i++){
		if(states[i] == 16 && states[i+1] == 2){
			print_flags1(times[i+1],times[i]);
			int difference = diff(times[i+1],times[i]);
			if((first_average - difference) < 100000){
				sum += difference;
				num++;
			}
		}
	}

	return (sum / num);
}

void TEST_UART(){

	int train_num  = 47;
	do_setup();
	set_switch(9,'C');
	set_switch(14,'C');
	set_switch(13,'C');
	set_switch(154,'S');
	set_switch(153,'C');
	move_train(14,train_num);
	//  Get rid of bogus sensor data
	int rtn1 = test_orientation();
	robprintfbusy((const unsigned char *)"average was %d.\n", rtn1);
	set_switch(13,'S');
	stall(500000);
	stall(500000);
	stall(500000);
	stall(500000);
	stall(100000);
	move_train(0,train_num);
	stall(500000);
	set_switch(10,'C');
	set_switch(13,'C');
	move_train(15,train_num);
	stall(300000);
	move_train(14,train_num);
	//  Get rid of bogus sensor data
	int rtn2 = test_orientation();
	robprintfbusy((const unsigned char *)"average was %d.\n", rtn2);
	move_train(0,train_num);
	while(1){};
}
