#include "kernel_state.h"
#include "ts7200.h"

#ifndef KERNEL_IRQ_H_
#define KERNEL_IRQ_H_

#define INTERRUPT_MIS 0x1
#define INTERRUPT_RIS 0x2
#define INTERRUPT_TIS 0x4
#define INTERRUPT_RTIS 0x8

volatile static int * const UART1DATA = (int*) (UART1_BASE + UART_DATA_OFFSET);
volatile static int * const UART2DATA = (int*) (UART2_BASE + UART_DATA_OFFSET);
volatile static int * const UART1Flag = (int*) (UART1_BASE + UART_FLAG_OFFSET);
volatile static int * const UART2Flag = (int*) (UART2_BASE + UART_FLAG_OFFSET);
volatile static int * const timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
volatile static int * const timer_val = (int*)(TIMER3_BASE + VAL_OFFSET);
volatile static int * const timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
volatile static int * const timer_clear = (int*)(TIMER3_BASE + CLR_OFFSET);
volatile static const int TC3OI = 51;
volatile static const int UART1RXINTR1 = 23;
volatile static const int UART1TXINTR1 = 24;
volatile static const int UART2RXINTR2 = 25;
volatile static const int UART2TXINTR2 = 26;
volatile static const int INT_UART1 = 52;
volatile static const int INT_UART2 = 54;
volatile static int * const UART1IntIDIntClr = (int *)0x808C001C;
volatile static int * const UART2IntIDIntClr = (int *)0x808D001C;
volatile static int * const VIC1BaseAddress = (int *) 0x800B0000;
volatile static int * const VIC1IntSelect = (int *)0x800B000C;
volatile static int * const VIC1IntEnable = (int *)0x800B0010;
volatile static int * const VIC1VectAddr = (int *)0x800B0030;
volatile static int * const VIC1IntEnClear = (int *)0x800B0014;
volatile static int * const VIC1SoftInt = (int*) 0x800B0018;
volatile static int * const VIC1SoftIntClear = (int*) 0x800B001C;
volatile static int * const VIC2BaseAddress = (int *) 0x800C0000;
volatile static int * const VIC2IntSelect = (int *)0x800C000C;
volatile static int * const VIC2IntEnable = (int *)0x800C0010;
volatile static int * const VIC2VectAddr = (int *)0x800C0030;
volatile static int * const VIC2IntEnClear = (int *)0x800C0014;
volatile static int * const VIC2SoftInt = (int*) 0x800C0018;
volatile static int * const VIC2SoftIntClear = (int*) 0x800C001C;

void irq_handler();

void IRQ_TimerVIC2Handler();

void IRQ_UART1RecieveHandler();

void IRQ_UART1TransmitHandler();

void IRQ_UART2RecieveHandler();

void IRQ_UART2TransmitHandler();

void IRQ_EnableTimer();

void IRQ_EnableTimerVIC2();

void IRQ_DisableTimerVIC2();

void IRQ_ClearTimerInterrupt();

void IRQ_SetupUARTInterrupts();

void IRQ_DisableUARTInterrupts();

void IRQ_SetUART1Receive(short enable);
void IRQ_SetUART1Transmit(short enable);
void IRQ_SetUART2Receive(short enable);
void IRQ_SetUART2Transmit(short enable);

#endif
