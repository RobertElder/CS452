#include "kernel_irq.h"
#include "robio.h"
#include "ts7200.h"


void irq_handler() {
	asm(
		"@ i need a stack space :)\n"
		"LDR SP, =0x0150f000\n"
	
		"@ r8_irq is banked so we use it to not clobber r8_usr\n"
		"@ Switch to system mode\n"
		"MRS r8, cpsr\n"
		"BIC r8, r8, #0x1f @ Modify by removing current mode\n"
		"ORR r8, r8, #0b11111\n"
		"MSR cpsr, r8\n"
	
		"@ Save user state\n"
//		"mov ip, sp\n"
		"stmfd sp!, {r0-r10, lr, ip}\n"
	
		"@ Switch to supervisor mode\n"
		"MRS r0, cpsr\n"
		"BIC r0, r0, #0x1f @ Modify by removing current mode\n"
		"ORR r0, r0, #0b10011\n"
		"MSR cpsr, r0\n"
	);

	//set_led(LED_BOTH);
	robprintfbusy((const unsigned char *)"\033[33m[INTERRUPT MODE] \n");
	
//	robprintfbusy((const unsigned char *)"Press Enter to continue...");
//	robgetcbusy(COM2);
	
	// TODO: i'm not sure if we need this
	/*int * VIC2VectAddr = (int *)0x800C0030;
	int temp = *VIC2VectAddr;
	*VIC2VectAddr = 0;
	*/
	
	IRQ_ClearTimerInterrupt();
	
	robprintfbusy((const unsigned char *)" [Exit interrupt mode]\033[0m\n");
	//set_led(LED_GREEN);
	
	asm(
		"@ Switch to system mode\n"
		"MRS r8, cpsr\n"
		"BIC r8, r8, #0x1f @ Modify by removing current mode\n"
		"ORR r8, r8, #0b11111\n"
		"MSR cpsr, r8\n"
		
		"@ Enable back interrupts\n"
		"MRS r8, cpsr\n"
		"BIC r8, r8, #0x80\n"
		"MSR cpsr, r8\n"
	
		"ldmfd sp!, {r0-r10, lr, ip}\n"
		"SUBS pc, r14, #4\n"
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
	//*VIC2SoftInt |= 1 << (TC3OI - 32);
	// Enable vector for this interrupt
	//int * VIC2VectCntl0 = (int*)0x800C0200;
	//*VIC2VectCntl0 = (TC3OI - 32) + 5;
}

void IRQ_DisableTimerInterrupts() {
	*VIC2IntEnClear |= 1 << (TC3OI - 32);
	//*VIC2SoftIntClear |= 1 << (TC3OI - 32);
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
