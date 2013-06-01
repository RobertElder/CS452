#include "tasks.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "queue.h"
#include "memory.h"
#include "random.h"
#include "message.h"
#include "nameserver.h"
#include "rps.h"


void print_loop_timing(ChannelDescription * terminal_channel, unsigned int observed_val, unsigned int last_timer_value, unsigned int cycles_per_tick, unsigned int max_time){
	robprintfbusy( "Timer observed: %d\n", observed_val );
	robprintfbusy( "Last Timer: %d\n", last_timer_value );
	unsigned int diff = observed_val > last_timer_value ? (cycles_per_tick - observed_val) + last_timer_value : last_timer_value - observed_val;
	robprintfbusy( "Time in loop: max: %dus, last: %dus.\n", (int)((double)max_time/((double)cycles_per_tick/(double)100000)), (int)((double)diff/((double)cycles_per_tick/(double)100000)));
}

unsigned int max_time = 0;

int * timer_ldr = (TIMER3_BASE + LDR_OFFSET);
int * timer_val = (TIMER3_BASE + VAL_OFFSET);
int * timer_ctrl = (TIMER3_BASE + CRTL_OFFSET);


// 508000 cycles per second, means a tick (100ms) has 50800 cycles
unsigned int cycles_per_tick = 50800;
int last_timer_value = cycles_per_tick;
int ticks = 0;


//  Disable the timer before we set the load value
*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
*timer_ldr = cycles_per_tick;
//  Turn the timer on enabled, with clock 508khz and periodic mode
*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;



//  On send
int observed_val = *timer_val;

//  On finished:
unsigned int diff = observed_val > last_timer_value ? (cycles_per_tick - observed_val) + last_timer_value : last_timer_value - observed_val;
if(diff > max_time)
	max_time = diff;
if(observed_val > last_timer_value){
	ticks++;
	print_loop_timing(&terminal_channel, observed_val, last_timer_value, cycles_per_tick, max_time);
}

void KernelTask_Start() {
	int tid = Create(NORMAL, &FirstTask_Start);
	
	assert(tid == 1, "FirstTask tid not 1");
	
	Exit();
	assert(0, "Shouldn't see me\n");
}

void FirstTask_Start() {
	int tid;
	const int num_clients = 3;
	
	tid = Create(NORMAL, &NameServer_Start);
	assert(tid == 2, "NameServer tid not 2");
	
	tid = Create(NORMAL, &RPSServer_Start);
	assert(tid == 3, "RPServer tid not 3");
	
	int i;
	for (i = 0; i < num_clients; i++) {
		tid = Create(NORMAL, &RPSClient_Start);
		assert(tid == 3 + i + 1, "RPSClient tid not");
	}
	
	Exit();
	
	assert(0, "Shouldn't see me\n");
}

int overflow(int times){
	robprintfbusy((const unsigned char *)"Doing overflow in task %d with time as %d\n",times, MyTid());
	int i = 0;
	Pass();
	if(times != 0){
		i = 1 + overflow(times-1);
		return i;
	}
	return i-1;
}
