#include "kernel_irq.h"
#include "robio.h"
#include "ts7200.h"
#include "scheduler.h"
#include "kernel_state.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"

void irq_handler() {
//	robprintfbusy((const unsigned char *)"Press Enter to continue...");
//	robgetcbusy(COM2);
	
	// TODO: i'm not sure if we need this
	int * VIC2VectAddr = (int *)0x800C0030;
	//int temp = *VIC2VectAddr;
	*VIC2VectAddr = 0;
	
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	Scheduler_UnblockTasksOnEvent(&k_state->scheduler, CLOCK_TICK_EVENT);
	
	//robprintfbusy((const unsigned char *)"\n[Exit interrupt mode]\033[0m\n");
	set_led(LED_GREEN);
	IRQ_ClearTimerInterrupt();
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

void IRQ_EnableTimerVIC2() {
	
	// Select interrupt type to be IRQ
	*VIC2IntSelect &= 0;
	// Enable the interrupt
	*VIC2IntEnable |= 1 << (TC3OI - 32);
	// *VIC2SoftInt |= 1 << (TC3OI - 32);
	// Enable vector for this interrupt
	//int * VIC2VectCntl0 = (int*)0x800C0200;
	// *VIC2VectCntl0 = (TC3OI - 32) + 5;
	
}

void IRQ_DisableTimerVIC2() {
	
	*VIC2IntEnClear |= 1 << (TC3OI - 32);
	// *VIC2SoftIntClear |= 1 << (TC3OI - 32);
	
}

void IRQ_ClearTimerInterrupt() {
	
	*timer_clear = 1;
	
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
