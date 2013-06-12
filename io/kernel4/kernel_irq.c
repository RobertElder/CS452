#include "kernel_irq.h"
#include "robio.h"
#include "ts7200.h"
#include "scheduler.h"
#include "kernel_state.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"

void irq_handler() {
	int * VIC2VectAddr = (int *)0x800C0030;
	int (*function)(void) = (int (*)(void)) *VIC2VectAddr;
	
	function();
	
	*VIC2VectAddr = 0;
}

void IRQ_TimerVIC2Handler() {
	KernelState * k_state = *((KernelState **) KERNEL_STACK_START);
	
	Scheduler_UnblockTasksOnEvent(&k_state->scheduler, CLOCK_TICK_EVENT);

	IRQ_ClearTimerInterrupt();
}

void IRQ_UART1RecieveHandler() {
	Print("IRQ_UART1RecieveHandler\n");
}

void IRQ_UART1TransmitHandler() {
	Print("IRQ_UART1TransmitHandler\n");
}

void IRQ_UART2RecieveHandler() {
	Print("IRQ_UART2RecieveHandler\n");
}

void IRQ_UART2TransmitHandler() {
	Print("IRQ_UART2TransmitHandler\n");
}

void IRQ_EnableTimer() {
	// 508000 cycles per second, means a tick (100ms) has 50800 cycles
	unsigned const int cycles_per_tick = 508000 / 1000 * TICK_SIZE;
	Print("CYCLES PER TICK=%d\n", cycles_per_tick);
	
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
	
	// Set the address of the handler on VIC2-0
	int * VIC2VectAddr0 = (int*) 0x800C0100;
	*VIC2VectAddr0 = (int) &IRQ_TimerVIC2Handler;
	
	// Enable vectored interrupt on VIC2-0 by setting the source number
	// and the enable bit (5)
	int * VIC2VectCntl0 = (int*)0x800C0200;
	*VIC2VectCntl0 = (TC3OI - 32) | 1 << 5;
}

void IRQ_DisableTimerVIC2() {
	//  Doing both of these things at the same time is the only way I can actually disable the timer interrupts.	
	*VIC2IntEnable &= (0xFFFFFFFF ^(1 << (TC3OI - 32)));
	*VIC2IntEnClear |= 1 << (TC3OI - 32);
}

void IRQ_ClearTimerInterrupt() {
	*timer_clear = 1;
}

void IRQ_EnableUARTInterrupts() {
	*VIC1IntEnable |= 1 << UART1RXINTR1;
	*VIC1IntEnable |= 1 << UART1TXINTR1;
	*VIC1IntEnable |= 1 << UART2RXINTR2;
	*VIC1IntEnable |= 1 << UART2TXINTR2;
	
	// UART 1 Receive on VIC1-1
	int * VIC1VectAddr1 = (int*) 0x800B0104;
	*VIC1VectAddr1 = (int) &IRQ_UART1RecieveHandler;
	int * VIC1VectCntl1 = (int*) 0x800B0204;
	*VIC1VectCntl1 = UART1RXINTR1 | 1 << 5;
	
	// UART 1 Transmit on VIC1-2
	int * VIC1VectAddr2 = (int*) 0x800B0108;
	*VIC1VectAddr2 = (int) &IRQ_UART1TransmitHandler;
	int * VIC1VectCntl2 = (int*) 0x800B0208;
	*VIC1VectCntl2 = UART1TXINTR1 | 1 << 5;
	
	// UART 2 Receive on VIC1-3
	int * VIC1VectAddr3 = (int*) 0x800B010C;
	*VIC1VectAddr3 = (int) &IRQ_UART2RecieveHandler;
	int * VIC1VectCntl3 = (int*) 0x800B020C;
	*VIC1VectCntl3 = UART2RXINTR2 | 1 << 5;
	
	// UART 2 Transmit on VIC1-4
	int * VIC1VectAddr4 = (int*) 0x800B0110;
	*VIC1VectAddr4 = (int) &IRQ_UART2TransmitHandler;
	int * VIC1VectCntl4 = (int*) 0x800B0210;
	*VIC1VectCntl4 = UART2TXINTR2 | 1 << 5;
}
