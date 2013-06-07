#include "kernel_state.h"
#include "ts7200.h"

#ifndef KERNEL_IRQ_H_
#define KERNEL_IRQ_H_

static int * const timer_ldr = (int*)(TIMER3_BASE + LDR_OFFSET);
static int * const timer_val = (int*)(TIMER3_BASE + VAL_OFFSET);
static int * const timer_ctrl = (int*)(TIMER3_BASE + CRTL_OFFSET);
static const int TC3OI = 51;
static int * const VIC2BaseAddress = (int *) 0x800C0000;
static int * const VIC2IntSelect = (int *)0x800C000C;
static int * const VIC2IntEnable = (int *)0x800C0010;
static int * const VIC2VectAddr = (int *)0x800C0030;
static int * const VIC2IntEnClear = (int *)0x800C0014;

void irq_handler();

void IRQ_EnableTimer();

void IRQ_EnableTimerInterrupts();

void IRQ_DisableTimerInterrupts();

void IRQ_EnableInterrupts();

#endif
