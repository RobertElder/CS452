#include "kernel_irq.h"
#include "robio.h"


void irq_handler() {
	robprintfbusy((const unsigned char *)" [INTERRUPT MODE] \n");
	
	//robprintfbusy((const unsigned char *)"Press Enter to continue...");
	//robgetcbusy(COM2);
	
	IRQ_DisableTimerInterrupts();

	// TODO: i'm not sure if we need this
	int * VIC2VectAddr = (int *)0x800C0030;
	int temp = *VIC2VectAddr;
	*VIC2VectAddr = 0;
	
	robprintfbusy((const unsigned char *)"Exit interrupt mode\n");
	
	//IRQ_EnableTimerInterrupts();
	
	asm(
//		"MSR cpsr_c, r2\n"
		"SUBS pc, r14, #4"
	);
}

void IRQ_EnableTimer() {
	// 508000 cycles per second, means a tick (100ms) has 50800 cycles
	unsigned const int cycles_per_tick = 508000 / 1000 * TICK_SIZE;
	robprintfbusy((const unsigned char *)"CYCLES PER TICK=%d\n", cycles_per_tick);
	
	//  Disable the timer before we set the load value
	*timer_ctrl = (*timer_ctrl) ^ ENABLE_MASK;
	*timer_ldr = cycles_per_tick;
	
	//  Turn the timer on enabled, with clock 508khz and periodic mode
	*timer_ctrl = ENABLE_MASK | CLKSEL_MASK | MODE_MASK;
	
}

void IRQ_EnableTimerInterrupts() {
	// Select interrupt type to be IRQ
	*VIC2IntSelect &= 0;
	// Enable the interrupt
	*VIC2IntEnable |= 1 << (TC3OI - 32);
}

void IRQ_DisableTimerInterrupts() {
	*VIC2IntEnClear |= 1 << (TC3OI - 32);
}

void IRQ_EnableInterrupts() {
	int temp;
	asm(
		"MRS %0, cpsr\n"
		"BIC %0, %0, #0x80\n"
		"MSR cpsr_c, %0\n"
		: // output
		: "r"(temp)
	);
}
