	.file	"kernel_irq.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.data
	.align	2
	.type	INT_UART2, %object
	.size	INT_UART2, 4
INT_UART2:
	.word	54
	.align	2
	.type	INT_UART1, %object
	.size	INT_UART1, 4
INT_UART1:
	.word	52
	.align	2
	.type	TC3OI, %object
	.size	TC3OI, 4
TC3OI:
	.word	51
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Unexpected situation where interrupt handler is cal"
	.ascii	"led but no vic2 interrupt available\012\000"
	.text
	.align	2
	.global	irq_handler
	.type	irq_handler, %function
irq_handler:
.LFB2:
	.file 1 "kernel_irq.c"
	.loc 1 11 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI0:
	.loc 1 12 0
	ldr	r3, .L8
	.loc 1 11 0
	ldr	sl, .L8+4
	.loc 1 12 0
	ldr	r5, [r3, #0]
.LVL1:
	.loc 1 11 0
.L6:
	add	sl, pc, sl
	.loc 1 13 0
	add	r4, r5, #20992
.LVL2:
	add	r4, r4, #156
	.loc 1 15 0
	mov	r1, r5
	mov	r0, r4
	.loc 1 21 0
	ldr	r6, .L8+8
	.loc 1 15 0
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 18 0
	mov	r0, r4
	ldr	r1, [r4, #4]
	mov	r2, #0
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 21 0
	ldr	r0, [r6, #0]
	.loc 1 23 0
	cmp	r0, #0
	beq	.L2
	.loc 1 24 0
	mov	lr, pc
	bx	r0
	.loc 1 25 0
	mov	r3, #0
	.loc 1 31 0
	mov	r0, r4
	mov	r1, r5
	.loc 1 25 0
	str	r3, [r6, #0]
	.loc 1 31 0
	bl	Scheduler_SetNextTaskState(PLT)
	.loc 1 33 0
	mov	r0, r4
	mov	r1, r5
	.loc 1 35 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 33 0
	b	Scheduler_ScheduleAndSetNextTaskState(PLT)
.L2:
	.loc 1 27 0
	ldr	r1, .L8+12
	add	r1, sl, r1
	bl	assert(PLT)
.L4:
	b	.L4
.L9:
	.align	2
.L8:
	.word	33403036
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	-2146697168
	.word	.LC0(GOTOFF)
.LFE2:
	.size	irq_handler, .-irq_handler
	.align	2
	.global	IRQ_ClearTimerInterrupt
	.type	IRQ_ClearTimerInterrupt, %function
IRQ_ClearTimerInterrupt:
.LFB13:
	.loc 1 139 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL3:
	.loc 1 140 0
	ldr	r3, .L12
	mov	r2, #1
	.loc 1 139 0
	@ lr needed for prologue
	.loc 1 140 0
	str	r2, [r3, #0]
	.loc 1 141 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	-2139029364
.LFE13:
	.size	IRQ_ClearTimerInterrupt, .-IRQ_ClearTimerInterrupt
	.align	2
	.global	IRQ_TimerVIC2Handler
	.type	IRQ_TimerVIC2Handler, %function
IRQ_TimerVIC2Handler:
.LFB3:
	.loc 1 37 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL4:
	str	lr, [sp, #-4]!
.LCFI1:
	.loc 1 38 0
	ldr	r3, .L16
	.loc 1 40 0
	mov	r1, #1
	.loc 1 38 0
	ldr	r0, [r3, #0]
.LVL5:
	.loc 1 40 0
	add	r0, r0, #20992
.LVL6:
	add	r0, r0, #156
	bl	Scheduler_UnblockTasksOnEvent(PLT)
	.loc 1 43 0
	ldr	lr, [sp], #4
	.loc 1 42 0
	b	IRQ_ClearTimerInterrupt(PLT)
.L17:
	.align	2
.L16:
	.word	33403036
.LFE3:
	.size	IRQ_TimerVIC2Handler, .-IRQ_TimerVIC2Handler
	.align	2
	.global	IRQ_UART1TransmitHandler
	.type	IRQ_UART1TransmitHandler, %function
IRQ_UART1TransmitHandler:
.LFB7:
	.loc 1 80 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL7:
	.loc 1 81 0
	ldr	r3, .L20
	.loc 1 83 0
	mov	r1, #3
	.loc 1 81 0
	ldr	r0, [r3, #0]
.LVL8:
	.loc 1 80 0
	@ lr needed for prologue
	.loc 1 83 0
	add	r0, r0, #20992
.LVL9:
	add	r0, r0, #156
	.loc 1 86 0
	.loc 1 83 0
	b	Scheduler_UnblockTasksOnEvent(PLT)
.L21:
	.align	2
.L20:
	.word	33403036
.LFE7:
	.size	IRQ_UART1TransmitHandler, .-IRQ_UART1TransmitHandler
	.align	2
	.global	IRQ_SetUART1Receive
	.type	IRQ_SetUART1Receive, %function
IRQ_SetUART1Receive:
.LFB16:
	.loc 1 177 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL10:
	.loc 1 181 0
	ldr	r1, .L27
	.loc 1 180 0
	movs	r0, r0, asl #16
.LVL11:
	.loc 1 181 0
	ldrne	r3, [r1, #0]
	.loc 1 183 0
	ldreq	r3, [r1, #0]
	.loc 1 181 0
	orrne	r3, r3, #81
	.loc 1 183 0
	biceq	r3, r3, #80
	.loc 1 177 0
	@ lr needed for prologue
	.loc 1 181 0
	strne	r3, [r1, #0]
	.loc 1 183 0
	streq	r3, [r1, #0]
	bx	lr
.L28:
	.align	2
.L27:
	.word	-2138308588
.LFE16:
	.size	IRQ_SetUART1Receive, .-IRQ_SetUART1Receive
	.align	2
	.global	IRQ_UART1RecieveHandler
	.type	IRQ_UART1RecieveHandler, %function
IRQ_UART1RecieveHandler:
.LFB6:
	.loc 1 72 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL12:
	str	lr, [sp, #-4]!
.LCFI2:
	.loc 1 73 0
	ldr	r3, .L31
	.loc 1 75 0
	mov	r1, #2
	.loc 1 73 0
	ldr	r0, [r3, #0]
.LVL13:
	.loc 1 75 0
	add	r0, r0, #20992
.LVL14:
	add	r0, r0, #156
	bl	Scheduler_UnblockTasksOnEvent(PLT)
	.loc 1 77 0
	mov	r0, #0
	.loc 1 78 0
	ldr	lr, [sp], #4
	.loc 1 77 0
	b	IRQ_SetUART1Receive(PLT)
.L32:
	.align	2
.L31:
	.word	33403036
.LFE6:
	.size	IRQ_UART1RecieveHandler, .-IRQ_UART1RecieveHandler
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"CTS asserted, but TXFE not asserted.\012\000"
	.text
	.align	2
	.global	IRQ_UART1Handler
	.type	IRQ_UART1Handler, %function
IRQ_UART1Handler:
.LFB4:
	.loc 1 50 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL15:
	stmfd	sp!, {sl, lr}
.LCFI3:
	.loc 1 51 0
	ldr	r2, .L43
	.loc 1 50 0
	ldr	sl, .L43+4
	.loc 1 51 0
	ldr	r3, [r2, #0]
	.loc 1 50 0
.L41:
	add	sl, pc, sl
	.loc 1 51 0
	tst	r3, #1
	.loc 1 52 0
	ldr	r0, .L43+8
	.loc 1 51 0
	beq	.L34
	.loc 1 52 0
	ldr	r3, [r0, #0]
	.loc 1 53 0
	ldr	r1, .L43+12
	.loc 1 52 0
	tst	r3, #1
	.loc 1 53 0
	add	r1, sl, r1
	.loc 1 52 0
	bne	.L42
.L36:
	.loc 1 60 0
	ldr	r3, .L43
	mov	r2, #0
	str	r2, [r3, #0]
	.loc 1 61 0
	ldmfd	sp!, {sl, pc}
.L34:
	.loc 1 57 0
	ldr	r3, [r2, #0]
	tst	r3, #2
	bne	.L38
	ldr	r3, [r2, #0]
	tst	r3, #8
	beq	.L36
.L38:
	.loc 1 58 0
	bl	IRQ_UART1RecieveHandler(PLT)
	.loc 1 60 0
	ldr	r3, .L43
	mov	r2, #0
	str	r2, [r3, #0]
	.loc 1 61 0
	ldmfd	sp!, {sl, pc}
.L42:
	.loc 1 53 0
	ldr	r0, [r0, #0]
	and	r0, r0, #128
	bl	assert(PLT)
	.loc 1 55 0
	bl	IRQ_UART1TransmitHandler(PLT)
	.loc 1 60 0
	ldr	r3, .L43
	mov	r2, #0
	str	r2, [r3, #0]
	.loc 1 61 0
	ldmfd	sp!, {sl, pc}
.L44:
	.align	2
.L43:
	.word	-2138308580
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	-2138308584
	.word	.LC1(GOTOFF)
.LFE4:
	.size	IRQ_UART1Handler, .-IRQ_UART1Handler
	.align	2
	.global	IRQ_SetUART2Receive
	.type	IRQ_SetUART2Receive, %function
IRQ_SetUART2Receive:
.LFB18:
	.loc 1 197 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL16:
	.loc 1 201 0
	ldr	r1, .L50
	.loc 1 200 0
	movs	r0, r0, asl #16
.LVL17:
	.loc 1 201 0
	ldrne	r3, [r1, #0]
	.loc 1 203 0
	ldreq	r3, [r1, #0]
	.loc 1 201 0
	orrne	r3, r3, #81
	.loc 1 203 0
	biceq	r3, r3, #80
	.loc 1 197 0
	@ lr needed for prologue
	.loc 1 201 0
	strne	r3, [r1, #0]
	.loc 1 203 0
	streq	r3, [r1, #0]
	bx	lr
.L51:
	.align	2
.L50:
	.word	-2138243052
.LFE18:
	.size	IRQ_SetUART2Receive, .-IRQ_SetUART2Receive
	.align	2
	.global	IRQ_UART2RecieveHandler
	.type	IRQ_UART2RecieveHandler, %function
IRQ_UART2RecieveHandler:
.LFB8:
	.loc 1 88 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL18:
	str	lr, [sp, #-4]!
.LCFI4:
	.loc 1 89 0
	ldr	r3, .L54
	.loc 1 91 0
	mov	r1, #4
	.loc 1 89 0
	ldr	r0, [r3, #0]
.LVL19:
	.loc 1 91 0
	add	r0, r0, #20992
.LVL20:
	add	r0, r0, #156
	bl	Scheduler_UnblockTasksOnEvent(PLT)
	.loc 1 93 0
	mov	r0, #0
	.loc 1 94 0
	ldr	lr, [sp], #4
	.loc 1 93 0
	b	IRQ_SetUART2Receive(PLT)
.L55:
	.align	2
.L54:
	.word	33403036
.LFE8:
	.size	IRQ_UART2RecieveHandler, .-IRQ_UART2RecieveHandler
	.align	2
	.global	IRQ_SetUART2Transmit
	.type	IRQ_SetUART2Transmit, %function
IRQ_SetUART2Transmit:
.LFB19:
	.loc 1 207 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL21:
	.loc 1 211 0
	ldr	r1, .L61
	.loc 1 210 0
	movs	r0, r0, asl #16
.LVL22:
	.loc 1 211 0
	ldrne	r3, [r1, #0]
	.loc 1 213 0
	ldreq	r3, [r1, #0]
	.loc 1 211 0
	orrne	r3, r3, #33
	.loc 1 213 0
	biceq	r3, r3, #32
	.loc 1 207 0
	@ lr needed for prologue
	.loc 1 211 0
	strne	r3, [r1, #0]
	.loc 1 213 0
	streq	r3, [r1, #0]
	bx	lr
.L62:
	.align	2
.L61:
	.word	-2138243052
.LFE19:
	.size	IRQ_SetUART2Transmit, .-IRQ_SetUART2Transmit
	.align	2
	.global	IRQ_UART2TransmitHandler
	.type	IRQ_UART2TransmitHandler, %function
IRQ_UART2TransmitHandler:
.LFB9:
	.loc 1 96 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL23:
	str	lr, [sp, #-4]!
.LCFI5:
	.loc 1 97 0
	ldr	r3, .L65
	.loc 1 99 0
	mov	r1, #5
	.loc 1 97 0
	ldr	r0, [r3, #0]
.LVL24:
	.loc 1 99 0
	add	r0, r0, #20992
.LVL25:
	add	r0, r0, #156
	bl	Scheduler_UnblockTasksOnEvent(PLT)
	.loc 1 101 0
	mov	r0, #0
	.loc 1 102 0
	ldr	lr, [sp], #4
	.loc 1 101 0
	b	IRQ_SetUART2Transmit(PLT)
.L66:
	.align	2
.L65:
	.word	33403036
.LFE9:
	.size	IRQ_UART2TransmitHandler, .-IRQ_UART2TransmitHandler
	.align	2
	.global	IRQ_UART2Handler
	.type	IRQ_UART2Handler, %function
IRQ_UART2Handler:
.LFB5:
	.loc 1 63 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL26:
	str	lr, [sp, #-4]!
.LCFI6:
	.loc 1 64 0
	ldr	r2, .L75
	ldr	r3, [r2, #0]
	tst	r3, #4
	bne	.L74
	.loc 1 66 0
	ldr	r3, [r2, #0]
	tst	r3, #2
	bne	.L71
	ldr	r3, [r2, #0]
	tst	r3, #8
	beq	.L70
.L71:
	.loc 1 67 0
	bl	IRQ_UART2RecieveHandler(PLT)
.L70:
	.loc 1 69 0
	ldr	r3, .L75
	mov	r2, #0
	str	r2, [r3, #0]
	.loc 1 70 0
	ldr	pc, [sp], #4
.L74:
	.loc 1 65 0
	bl	IRQ_UART2TransmitHandler(PLT)
	.loc 1 69 0
	ldr	r3, .L75
	mov	r2, #0
	str	r2, [r3, #0]
	.loc 1 70 0
	ldr	pc, [sp], #4
.L76:
	.align	2
.L75:
	.word	-2138243044
.LFE5:
	.size	IRQ_UART2Handler, .-IRQ_UART2Handler
	.align	2
	.global	IRQ_EnableTimer
	.type	IRQ_EnableTimer, %function
IRQ_EnableTimer:
.LFB10:
	.loc 1 104 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL27:
	.loc 1 109 0
	ldr	r1, .L79
	.loc 1 110 0
	ldr	r0, .L79+4
	.loc 1 109 0
	ldr	r3, [r1, #0]
	.loc 1 113 0
	mov	r2, #200
	.loc 1 109 0
	eor	r3, r3, #128
	str	r3, [r1, #0]
	.loc 1 110 0
	ldr	r3, .L79+8
	.loc 1 104 0
	@ lr needed for prologue
	.loc 1 110 0
	str	r0, [r3, #0]
	.loc 1 113 0
	str	r2, [r1, #0]
	.loc 1 114 0
	bx	lr
.L80:
	.align	2
.L79:
	.word	-2139029368
	.word	355
	.word	-2139029376
.LFE10:
	.size	IRQ_EnableTimer, .-IRQ_EnableTimer
	.align	2
	.global	IRQ_EnableTimerVIC2
	.type	IRQ_EnableTimerVIC2, %function
IRQ_EnableTimerVIC2:
.LFB11:
	.loc 1 116 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	str	sl, [sp, #-4]!
.LCFI7:
	ldr	sl, .L84
	.loc 1 120 0
	ldr	r3, .L84+4
	.loc 1 116 0
.L83:
	add	sl, pc, sl
	.loc 1 118 0
	ldr	r2, .L84+8
	.loc 1 120 0
	ldr	ip, [sl, r3]
	ldr	r0, .L84+12
	.loc 1 118 0
	mov	r3, #0
	ldr	r1, [r2, #0]
	str	r3, [r2, #0]
	.loc 1 120 0
	ldr	r1, [r0, #0]
	ldr	r3, [ip, #0]
	mov	r2, #1
	sub	r3, r3, #32
	orr	r1, r1, r2, asl r3
	.loc 1 124 0
	ldr	r3, .L84+16
	.loc 1 120 0
	str	r1, [r0, #0]
	.loc 1 124 0
	ldr	r2, .L84+20
	ldr	r1, [sl, r3]
	.loc 1 116 0
	@ lr needed for prologue
	.loc 1 124 0
	str	r1, [r2, #0]
	.loc 1 129 0
	ldr	r3, [ip, #0]
	add	r2, r2, #256
	sub	r3, r3, #32
	orr	r3, r3, #32
	str	r3, [r2, #0]
	.loc 1 130 0
	ldmfd	sp!, {sl}
	bx	lr
.L85:
	.align	2
.L84:
	.word	_GLOBAL_OFFSET_TABLE_-(.L83+8)
	.word	TC3OI(GOT)
	.word	-2146697204
	.word	-2146697200
	.word	IRQ_TimerVIC2Handler(GOT)
	.word	-2146696960
.LFE11:
	.size	IRQ_EnableTimerVIC2, .-IRQ_EnableTimerVIC2
	.align	2
	.global	IRQ_DisableTimerVIC2
	.type	IRQ_DisableTimerVIC2, %function
IRQ_DisableTimerVIC2:
.LFB12:
	.loc 1 132 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	stmfd	sp!, {r4, sl, lr}
.LCFI8:
	ldr	sl, .L89
	.loc 1 134 0
	ldr	r3, .L89+4
	.loc 1 132 0
.L88:
	add	sl, pc, sl
	.loc 1 134 0
	ldr	lr, .L89+8
	ldr	r4, [sl, r3]
	ldr	r1, [lr, #0]
	ldr	r3, [r4, #0]
	mov	ip, #1
	sub	r3, r3, #32
	mov	r3, ip, asl r3
	.loc 1 134 0
	mvn	r3, r3
	and	r1, r1, r3
	.loc 1 135 0
	ldr	r0, .L89+12
	.loc 1 134 0
	str	r1, [lr, #0]
	.loc 1 135 0
	ldr	r2, [r0, #0]
	ldr	r3, [r4, #0]
	sub	r3, r3, #32
	orr	r2, r2, ip, asl r3
	str	r2, [r0, #0]
	.loc 1 137 0
	ldmfd	sp!, {r4, sl, pc}
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	TC3OI(GOT)
	.word	-2146697200
	.word	-2146697196
.LFE12:
	.size	IRQ_DisableTimerVIC2, .-IRQ_DisableTimerVIC2
	.align	2
	.global	IRQ_SetupUARTInterrupts
	.type	IRQ_SetupUARTInterrupts, %function
IRQ_SetupUARTInterrupts:
.LFB14:
	.loc 1 143 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	stmfd	sp!, {sl, lr}
.LCFI9:
	ldr	sl, .L94
	.loc 1 147 0
	ldr	r3, .L94+4
	.loc 1 143 0
.L93:
	add	sl, pc, sl
	.loc 1 147 0
	ldr	r1, .L94+8
	ldr	ip, [sl, r3]
	ldr	r2, [r1, #0]
	ldr	r3, [ip, #0]
	mov	r0, #1
	sub	r3, r3, #32
	orr	r2, r2, r0, asl r3
	.loc 1 148 0
	ldr	r3, .L94+12
	.loc 1 147 0
	str	r2, [r1, #0]
	.loc 1 148 0
	ldr	lr, [sl, r3]
	ldr	r2, [r1, #0]
	ldr	r3, [lr, #0]
	sub	r3, r3, #32
	orr	r2, r2, r0, asl r3
	.loc 1 152 0
	ldr	r3, .L94+16
	.loc 1 148 0
	str	r2, [r1, #0]
	.loc 1 152 0
	ldr	r1, [sl, r3]
	ldr	r2, .L94+20
	str	r1, [r2, #0]
	.loc 1 154 0
	ldr	r3, [ip, #0]
	.loc 1 157 0
	ldr	r1, .L94+24
	.loc 1 154 0
	sub	r3, r3, #32
	orr	r3, r3, #32
	add	r2, r2, #256
	.loc 1 157 0
	ldr	r0, [sl, r1]
	.loc 1 154 0
	str	r3, [r2], #-252
	.loc 1 157 0
	str	r0, [r2, #0]
	.loc 1 159 0
	ldr	r3, [lr, #0]
	add	r2, r2, #256
	sub	r3, r3, #32
	orr	r3, r3, #32
	str	r3, [r2, #0]
	.loc 1 161 0
	ldmfd	sp!, {sl, pc}
.L95:
	.align	2
.L94:
	.word	_GLOBAL_OFFSET_TABLE_-(.L93+8)
	.word	INT_UART1(GOT)
	.word	-2146697200
	.word	INT_UART2(GOT)
	.word	IRQ_UART1Handler(GOT)
	.word	-2146696956
	.word	IRQ_UART2Handler(GOT)
.LFE14:
	.size	IRQ_SetupUARTInterrupts, .-IRQ_SetupUARTInterrupts
	.align	2
	.global	IRQ_DisableUARTInterrupts
	.type	IRQ_DisableUARTInterrupts, %function
IRQ_DisableUARTInterrupts:
.LFB15:
	.loc 1 163 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL31:
	@ lr needed for prologue
	.loc 1 175 0
	bx	lr
.LFE15:
	.size	IRQ_DisableUARTInterrupts, .-IRQ_DisableUARTInterrupts
	.align	2
	.global	IRQ_SetUART1Transmit
	.type	IRQ_SetUART1Transmit, %function
IRQ_SetUART1Transmit:
.LFB17:
	.loc 1 187 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL32:
	.loc 1 191 0
	ldr	r1, .L103
	.loc 1 190 0
	movs	r0, r0, asl #16
.LVL33:
	.loc 1 191 0
	ldrne	r3, [r1, #0]
	.loc 1 193 0
	ldreq	r3, [r1, #0]
	.loc 1 191 0
	orrne	r3, r3, #8
	.loc 1 193 0
	biceq	r3, r3, #8
	.loc 1 187 0
	@ lr needed for prologue
	.loc 1 191 0
	strne	r3, [r1, #0]
	.loc 1 193 0
	streq	r3, [r1, #0]
	bx	lr
.L104:
	.align	2
.L103:
	.word	-2138308588
.LFE17:
	.size	IRQ_SetUART1Transmit, .-IRQ_SetUART1Transmit
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x14
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x5
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI1-.LFB3
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI2-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI3-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI4-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI5-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI6-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI7-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI8-.LFB12
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI9-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.align	2
.LEFDE34:
	.file 2 "kernel_state.h"
	.file 3 "scheduler.h"
	.file 4 "task_descriptor.h"
	.file 5 "queue.h"
	.file 6 "public_kernel_interface.h"
	.file 7 "train.h"
	.file 8 "buffer.h"
	.file 9 "kernel_irq.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0xd35
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF203
	.byte	0x1
	.4byte	.LASF204
	.4byte	.LASF205
	.uleb128 0x2
	.4byte	0xf2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x5
	.byte	0xe
	.uleb128 0x3
	.4byte	.LASF0
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF1
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF2
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF3
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF4
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF5
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF6
	.sleb128 6
	.uleb128 0x3
	.4byte	.LASF7
	.sleb128 7
	.uleb128 0x3
	.4byte	.LASF8
	.sleb128 8
	.uleb128 0x3
	.4byte	.LASF9
	.sleb128 9
	.uleb128 0x3
	.4byte	.LASF10
	.sleb128 10
	.uleb128 0x3
	.4byte	.LASF11
	.sleb128 11
	.uleb128 0x3
	.4byte	.LASF12
	.sleb128 12
	.uleb128 0x3
	.4byte	.LASF13
	.sleb128 13
	.uleb128 0x3
	.4byte	.LASF14
	.sleb128 14
	.uleb128 0x3
	.4byte	.LASF15
	.sleb128 15
	.uleb128 0x3
	.4byte	.LASF16
	.sleb128 16
	.uleb128 0x3
	.4byte	.LASF17
	.sleb128 17
	.uleb128 0x3
	.4byte	.LASF18
	.sleb128 18
	.uleb128 0x3
	.4byte	.LASF19
	.sleb128 19
	.uleb128 0x3
	.4byte	.LASF20
	.sleb128 20
	.uleb128 0x3
	.4byte	.LASF21
	.sleb128 21
	.uleb128 0x3
	.4byte	.LASF22
	.sleb128 22
	.uleb128 0x3
	.4byte	.LASF23
	.sleb128 23
	.uleb128 0x3
	.4byte	.LASF24
	.sleb128 24
	.uleb128 0x3
	.4byte	.LASF25
	.sleb128 25
	.uleb128 0x3
	.4byte	.LASF26
	.sleb128 26
	.uleb128 0x3
	.4byte	.LASF27
	.sleb128 27
	.uleb128 0x3
	.4byte	.LASF28
	.sleb128 28
	.uleb128 0x3
	.4byte	.LASF29
	.sleb128 29
	.uleb128 0x3
	.4byte	.LASF30
	.sleb128 30
	.uleb128 0x3
	.4byte	.LASF31
	.sleb128 31
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x5
	.byte	0x2f
	.4byte	0x25
	.uleb128 0x5
	.4byte	0x118
	.4byte	.LASF33
	.byte	0x4
	.byte	0x5
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x5
	.byte	0x32
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x5
	.byte	0x33
	.4byte	0xfd
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x4
	.byte	0x7
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x4
	.byte	0x7
	.uleb128 0x9
	.4byte	0x187
	.4byte	.LASF36
	.2byte	0x1898
	.byte	0x5
	.byte	0x3e
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x5
	.byte	0x3f
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x5
	.byte	0x40
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x5
	.byte	0x41
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x5
	.byte	0x42
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.byte	0x43
	.4byte	0x187
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.4byte	0x198
	.4byte	0x11a
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x621
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x5
	.byte	0x44
	.4byte	0x133
	.uleb128 0x5
	.4byte	0x1f6
	.4byte	.LASF42
	.byte	0x38
	.byte	0x5
	.byte	0x46
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x5
	.byte	0x47
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x5
	.byte	0x48
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x5
	.byte	0x49
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4a
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.byte	0x4b
	.4byte	0x1f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.4byte	0x206
	.4byte	0x11a
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x9
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x5
	.byte	0x4c
	.4byte	0x1a3
	.uleb128 0xe
	.4byte	0x23f
	.4byte	.LASF43
	.4byte	0x31304
	.byte	0x5
	.byte	0x5e
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x5
	.byte	0x5f
	.4byte	0x23f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x5
	.byte	0x62
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x31300
	.byte	0x0
	.uleb128 0xb
	.4byte	0x24f
	.4byte	0x198
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x1f
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x5
	.byte	0x63
	.4byte	0x211
	.uleb128 0xf
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF46
	.byte	0x1
	.byte	0x8
	.uleb128 0x10
	.byte	0x4
	.4byte	0x261
	.uleb128 0x10
	.byte	0x4
	.4byte	0x274
	.uleb128 0x11
	.4byte	0x261
	.uleb128 0x8
	.4byte	.LASF47
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.4byte	0x2b7
	.4byte	.LASF48
	.byte	0x4
	.byte	0x6
	.byte	0x13
	.uleb128 0x3
	.4byte	.LASF49
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF50
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF51
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF52
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF53
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF54
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF55
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF48
	.byte	0x6
	.byte	0x1b
	.4byte	0x280
	.uleb128 0x2
	.4byte	0x2f9
	.4byte	.LASF56
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	.LASF57
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF58
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF59
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF60
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF61
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF62
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF63
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF56
	.byte	0x4
	.byte	0xf
	.4byte	0x2c2
	.uleb128 0x5
	.4byte	0x41a
	.4byte	.LASF64
	.byte	0x80
	.byte	0x4
	.byte	0x11
	.uleb128 0xa
	.ascii	"id\000"
	.byte	0x4
	.byte	0x12
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x4
	.byte	0x13
	.4byte	0x2f9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x4
	.byte	0x14
	.4byte	0xf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x4
	.byte	0x15
	.4byte	0x206
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x4
	.byte	0x16
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x4
	.byte	0x17
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x4
	.byte	0x18
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x4
	.byte	0x19
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x4
	.byte	0x1a
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x4
	.byte	0x1b
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x4
	.byte	0x1c
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x4
	.byte	0x1d
	.4byte	0x268
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x4
	.byte	0x1e
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x4
	.byte	0x1f
	.4byte	0x268
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x4
	.byte	0x20
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0x4
	.byte	0x21
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x4
	.byte	0x22
	.4byte	0x2b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x4
	.byte	0x23
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x4
	.byte	0x24
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x25a
	.uleb128 0x12
	.ascii	"TD\000"
	.byte	0x4
	.byte	0x25
	.4byte	0x304
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF84
	.byte	0x2
	.byte	0xc
	.4byte	0x43c
	.uleb128 0xe
	.4byte	0x50b
	.4byte	.LASF84
	.4byte	0x684b0
	.byte	0x2
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF85
	.byte	0x2
	.byte	0x13
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF86
	.byte	0x2
	.byte	0x14
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x2
	.byte	0x15
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x2
	.byte	0x16
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x2
	.byte	0x17
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.4byte	.LASF90
	.byte	0x2
	.byte	0x18
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.4byte	.LASF91
	.byte	0x2
	.byte	0x19
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.4byte	.LASF92
	.byte	0x2
	.byte	0x1a
	.4byte	0x6c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.4byte	.LASF93
	.byte	0x2
	.byte	0x1b
	.4byte	0x6d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x79c
	.uleb128 0x6
	.4byte	.LASF94
	.byte	0x2
	.byte	0x1c
	.4byte	0x6b8
	.byte	0x4
	.byte	0x23
	.uleb128 0x529c
	.uleb128 0x6
	.4byte	.LASF95
	.byte	0x2
	.byte	0x1d
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a4
	.uleb128 0x6
	.4byte	.LASF96
	.byte	0x2
	.byte	0x1e
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a8
	.uleb128 0x6
	.4byte	.LASF97
	.byte	0x2
	.byte	0x1f
	.4byte	0x25a
	.byte	0x4
	.byte	0x23
	.uleb128 0x684ac
	.byte	0x0
	.uleb128 0x5
	.4byte	0x534
	.4byte	.LASF98
	.byte	0x8
	.byte	0x3
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x3
	.byte	0x11
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF99
	.byte	0x3
	.byte	0x12
	.4byte	0x26e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF98
	.byte	0x3
	.byte	0x13
	.4byte	0x50b
	.uleb128 0xe
	.4byte	0x669
	.4byte	.LASF100
	.4byte	0x63208
	.byte	0x3
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF101
	.byte	0x3
	.byte	0x16
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF102
	.byte	0x3
	.byte	0x18
	.4byte	0x669
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF103
	.byte	0x3
	.byte	0x19
	.4byte	0x66f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF104
	.byte	0x3
	.byte	0x1a
	.4byte	0x680
	.byte	0x4
	.byte	0x23
	.uleb128 0x31188
	.uleb128 0x6
	.4byte	.LASF105
	.byte	0x3
	.byte	0x1b
	.4byte	0x24f
	.byte	0x4
	.byte	0x23
	.uleb128 0x31dd0
	.uleb128 0x6
	.4byte	.LASF106
	.byte	0x3
	.byte	0x1d
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d4
	.uleb128 0x6
	.4byte	.LASF107
	.byte	0x3
	.byte	0x1e
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d8
	.uleb128 0x6
	.4byte	.LASF108
	.byte	0x3
	.byte	0x1f
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630dc
	.uleb128 0x6
	.4byte	.LASF109
	.byte	0x3
	.byte	0x20
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e0
	.uleb128 0x6
	.4byte	.LASF110
	.byte	0x3
	.byte	0x21
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e4
	.uleb128 0x6
	.4byte	.LASF111
	.byte	0x3
	.byte	0x22
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e8
	.uleb128 0x6
	.4byte	.LASF112
	.byte	0x3
	.byte	0x23
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630ec
	.uleb128 0x6
	.4byte	.LASF113
	.byte	0x3
	.byte	0x24
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f0
	.uleb128 0x6
	.4byte	.LASF114
	.byte	0x3
	.byte	0x25
	.4byte	0x698
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f4
	.uleb128 0x6
	.4byte	.LASF115
	.byte	0x3
	.byte	0x26
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x6310c
	.uleb128 0x6
	.4byte	.LASF116
	.byte	0x3
	.byte	0x27
	.4byte	0x6a8
	.byte	0x4
	.byte	0x23
	.uleb128 0x63110
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x3
	.byte	0x28
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x63200
	.uleb128 0x6
	.4byte	.LASF117
	.byte	0x3
	.byte	0x29
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x63204
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x420
	.uleb128 0xb
	.4byte	0x680
	.4byte	0x420
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x622
	.byte	0x0
	.uleb128 0xb
	.4byte	0x691
	.4byte	0x691
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x622
	.byte	0x0
	.uleb128 0x8
	.4byte	.LASF118
	.byte	0x2
	.byte	0x5
	.uleb128 0xb
	.4byte	0x6a8
	.4byte	0x125
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.4byte	0x6b8
	.4byte	0x534
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x1d
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF100
	.byte	0x3
	.byte	0x2a
	.4byte	0x53f
	.uleb128 0xb
	.4byte	0x6d4
	.4byte	0x125
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x1df
	.byte	0x0
	.uleb128 0xb
	.4byte	0x6e5
	.4byte	0x42a
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x4aff
	.byte	0x0
	.uleb128 0x13
	.4byte	0x722
	.byte	0x1
	.4byte	.LASF121
	.byte	0x1
	.byte	0xb
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF119
	.byte	0x1
	.byte	0xc
	.4byte	0x722
	.byte	0x1
	.byte	0x55
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xd
	.4byte	0x728
	.byte	0x1
	.byte	0x54
	.uleb128 0x15
	.4byte	.LASF120
	.byte	0x1
	.byte	0x15
	.4byte	0x734
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x431
	.uleb128 0x10
	.byte	0x4
	.4byte	0x6b8
	.uleb128 0x16
	.byte	0x1
	.4byte	0x25a
	.uleb128 0x10
	.byte	0x4
	.4byte	0x72e
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF127
	.byte	0x1
	.byte	0x8b
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	0x774
	.byte	0x1
	.4byte	.LASF122
	.byte	0x1
	.byte	0x25
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x1
	.byte	0x26
	.4byte	0x722
	.4byte	.LLST0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x79b
	.byte	0x1
	.4byte	.LASF123
	.byte	0x1
	.byte	0x50
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x1
	.byte	0x51
	.4byte	0x722
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x19
	.4byte	0x7ce
	.byte	0x1
	.4byte	.LASF124
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x1
	.byte	0xb1
	.4byte	0x691
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LASF125
	.byte	0x1
	.byte	0xb2
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x7d4
	.uleb128 0x1b
	.4byte	0x25a
	.uleb128 0x13
	.4byte	0x800
	.byte	0x1
	.4byte	.LASF126
	.byte	0x1
	.byte	0x48
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x1
	.byte	0x49
	.4byte	0x722
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF128
	.byte	0x1
	.byte	0x32
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	0x846
	.byte	0x1
	.4byte	.LASF129
	.byte	0x1
	.byte	0xc5
	.byte	0x1
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x1
	.byte	0xc5
	.4byte	0x691
	.4byte	.LLST4
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.byte	0xc6
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x13
	.4byte	0x86d
	.byte	0x1
	.4byte	.LASF132
	.byte	0x1
	.byte	0x58
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x1
	.byte	0x59
	.4byte	0x722
	.4byte	.LLST5
	.byte	0x0
	.uleb128 0x19
	.4byte	0x8a0
	.byte	0x1
	.4byte	.LASF133
	.byte	0x1
	.byte	0xcf
	.byte	0x1
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x1
	.byte	0xcf
	.4byte	0x691
	.4byte	.LLST6
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.byte	0xd0
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x13
	.4byte	0x8c7
	.byte	0x1
	.4byte	.LASF134
	.byte	0x1
	.byte	0x60
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF119
	.byte	0x1
	.byte	0x61
	.4byte	0x722
	.4byte	.LLST7
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF135
	.byte	0x1
	.byte	0x3f
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	0x8fd
	.byte	0x1
	.4byte	.LASF136
	.byte	0x1
	.byte	0x68
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x15
	.4byte	.LASF137
	.byte	0x1
	.byte	0x6a
	.4byte	0x8fd
	.byte	0x0
	.uleb128 0x11
	.4byte	0x125
	.uleb128 0x13
	.4byte	0x930
	.byte	0x1
	.4byte	.LASF138
	.byte	0x1
	.byte	0x74
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x15
	.4byte	.LASF139
	.byte	0x1
	.byte	0x7b
	.4byte	0x7ce
	.uleb128 0x15
	.4byte	.LASF140
	.byte	0x1
	.byte	0x80
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF141
	.byte	0x1
	.byte	0x84
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	0x987
	.byte	0x1
	.4byte	.LASF142
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x15
	.4byte	.LASF143
	.byte	0x1
	.byte	0x97
	.4byte	0x7ce
	.uleb128 0x15
	.4byte	.LASF144
	.byte	0x1
	.byte	0x99
	.4byte	0x7ce
	.uleb128 0x15
	.4byte	.LASF145
	.byte	0x1
	.byte	0x9c
	.4byte	0x7ce
	.uleb128 0x15
	.4byte	.LASF146
	.byte	0x1
	.byte	0x9e
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF147
	.byte	0x1
	.byte	0xa3
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	0x9cd
	.byte	0x1
	.4byte	.LASF148
	.byte	0x1
	.byte	0xbb
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x1
	.byte	0xbb
	.4byte	0x691
	.4byte	.LLST8
	.uleb128 0x15
	.4byte	.LASF125
	.byte	0x1
	.byte	0xbc
	.4byte	0x7ce
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF149
	.byte	0x5
	.byte	0xb
	.4byte	0x9d9
	.sleb128 -1
	.uleb128 0x11
	.4byte	0x25a
	.uleb128 0x1c
	.4byte	.LASF150
	.byte	0x5
	.byte	0xc
	.4byte	0x9d9
	.sleb128 -2
	.uleb128 0xb
	.4byte	0x9fa
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF151
	.byte	0x7
	.byte	0xb
	.4byte	0xa09
	.4byte	.LASF152
	.uleb128 0x11
	.4byte	0x9ea
	.uleb128 0xb
	.4byte	0xa1e
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF153
	.byte	0x7
	.byte	0xc
	.4byte	0xa2d
	.4byte	.LASF154
	.uleb128 0x11
	.4byte	0xa0e
	.uleb128 0xb
	.4byte	0xa42
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF155
	.byte	0x7
	.byte	0xd
	.4byte	0xa51
	.4byte	.LASF156
	.uleb128 0x11
	.4byte	0xa32
	.uleb128 0xb
	.4byte	0xa66
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF157
	.byte	0x7
	.byte	0xe
	.4byte	0xa75
	.4byte	.LASF158
	.uleb128 0x11
	.4byte	0xa56
	.uleb128 0x1e
	.4byte	.LASF159
	.byte	0x7
	.byte	0x10
	.4byte	0x9d9
	.byte	0x10
	.uleb128 0xb
	.4byte	0xa9c
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF160
	.byte	0x7
	.byte	0x6d
	.4byte	0xaa7
	.uleb128 0x11
	.4byte	0xa86
	.uleb128 0x1c
	.4byte	.LASF161
	.byte	0x6
	.byte	0x7
	.4byte	0x9d9
	.sleb128 -1
	.uleb128 0x1c
	.4byte	.LASF162
	.byte	0x6
	.byte	0x8
	.4byte	0x9d9
	.sleb128 -2
	.uleb128 0x1c
	.4byte	.LASF163
	.byte	0x6
	.byte	0x9
	.4byte	0x9d9
	.sleb128 -3
	.uleb128 0x1c
	.4byte	.LASF164
	.byte	0x6
	.byte	0xa
	.4byte	0x9d9
	.sleb128 -1
	.uleb128 0x1c
	.4byte	.LASF165
	.byte	0x6
	.byte	0xb
	.4byte	0x9d9
	.sleb128 -2
	.uleb128 0x1e
	.4byte	.LASF166
	.byte	0x6
	.byte	0xc
	.4byte	0x9d9
	.byte	0x2
	.uleb128 0x1c
	.4byte	.LASF167
	.byte	0x6
	.byte	0xd
	.4byte	0x9d9
	.sleb128 -1
	.uleb128 0x1c
	.4byte	.LASF168
	.byte	0x6
	.byte	0xe
	.4byte	0x9d9
	.sleb128 -2
	.uleb128 0x1c
	.4byte	.LASF169
	.byte	0x6
	.byte	0xf
	.4byte	0x9d9
	.sleb128 -3
	.uleb128 0x1c
	.4byte	.LASF170
	.byte	0x6
	.byte	0x10
	.4byte	0x9d9
	.sleb128 -4
	.uleb128 0x1f
	.4byte	.LASF171
	.byte	0x6
	.byte	0x11
	.4byte	0xb38
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x11
	.4byte	0x279
	.uleb128 0xb
	.4byte	0xb53
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF172
	.byte	0x4
	.byte	0x27
	.4byte	0xb5e
	.uleb128 0x11
	.4byte	0xb3d
	.uleb128 0x1c
	.4byte	.LASF173
	.byte	0x8
	.byte	0x5
	.4byte	0x9d9
	.sleb128 -1
	.uleb128 0x1c
	.4byte	.LASF174
	.byte	0x8
	.byte	0x6
	.4byte	0x9d9
	.sleb128 -2
	.uleb128 0x1c
	.4byte	.LASF175
	.byte	0x9
	.byte	0xd
	.4byte	0xb8b
	.sleb128 -2139029376
	.uleb128 0x11
	.4byte	0x7ce
	.uleb128 0x1c
	.4byte	.LASF176
	.byte	0x9
	.byte	0xe
	.4byte	0xb8b
	.sleb128 -2139029372
	.uleb128 0x1c
	.4byte	.LASF177
	.byte	0x9
	.byte	0xf
	.4byte	0xb8b
	.sleb128 -2139029368
	.uleb128 0x1c
	.4byte	.LASF178
	.byte	0x9
	.byte	0x10
	.4byte	0xb8b
	.sleb128 -2139029364
	.uleb128 0x14
	.4byte	.LASF179
	.byte	0x9
	.byte	0x11
	.4byte	0xbd1
	.byte	0x5
	.byte	0x3
	.4byte	TC3OI
	.uleb128 0x11
	.4byte	0x7d4
	.uleb128 0x1e
	.4byte	.LASF180
	.byte	0x9
	.byte	0x12
	.4byte	0xbd1
	.byte	0x17
	.uleb128 0x1e
	.4byte	.LASF181
	.byte	0x9
	.byte	0x13
	.4byte	0xbd1
	.byte	0x18
	.uleb128 0x1e
	.4byte	.LASF182
	.byte	0x9
	.byte	0x14
	.4byte	0xbd1
	.byte	0x19
	.uleb128 0x1e
	.4byte	.LASF183
	.byte	0x9
	.byte	0x15
	.4byte	0xbd1
	.byte	0x1a
	.uleb128 0x14
	.4byte	.LASF184
	.byte	0x9
	.byte	0x16
	.4byte	0xbd1
	.byte	0x5
	.byte	0x3
	.4byte	INT_UART1
	.uleb128 0x14
	.4byte	.LASF185
	.byte	0x9
	.byte	0x17
	.4byte	0xbd1
	.byte	0x5
	.byte	0x3
	.4byte	INT_UART2
	.uleb128 0x1c
	.4byte	.LASF186
	.byte	0x9
	.byte	0x18
	.4byte	0xb8b
	.sleb128 -2138308580
	.uleb128 0x1c
	.4byte	.LASF187
	.byte	0x9
	.byte	0x19
	.4byte	0xb8b
	.sleb128 -2138243044
	.uleb128 0x1c
	.4byte	.LASF188
	.byte	0x9
	.byte	0x1a
	.4byte	0xb8b
	.sleb128 -2146762752
	.uleb128 0x1c
	.4byte	.LASF189
	.byte	0x9
	.byte	0x1b
	.4byte	0xb8b
	.sleb128 -2146762740
	.uleb128 0x1c
	.4byte	.LASF190
	.byte	0x9
	.byte	0x1c
	.4byte	0xb8b
	.sleb128 -2146762736
	.uleb128 0x1c
	.4byte	.LASF191
	.byte	0x9
	.byte	0x1d
	.4byte	0xb8b
	.sleb128 -2146762704
	.uleb128 0x1c
	.4byte	.LASF192
	.byte	0x9
	.byte	0x1e
	.4byte	0xb8b
	.sleb128 -2146762732
	.uleb128 0x1c
	.4byte	.LASF193
	.byte	0x9
	.byte	0x1f
	.4byte	0xb8b
	.sleb128 -2146762728
	.uleb128 0x1c
	.4byte	.LASF194
	.byte	0x9
	.byte	0x20
	.4byte	0xb8b
	.sleb128 -2146762724
	.uleb128 0x1c
	.4byte	.LASF195
	.byte	0x9
	.byte	0x21
	.4byte	0xb8b
	.sleb128 -2146697216
	.uleb128 0x1c
	.4byte	.LASF196
	.byte	0x9
	.byte	0x22
	.4byte	0xb8b
	.sleb128 -2146697204
	.uleb128 0x1c
	.4byte	.LASF197
	.byte	0x9
	.byte	0x23
	.4byte	0xb8b
	.sleb128 -2146697200
	.uleb128 0x1c
	.4byte	.LASF198
	.byte	0x9
	.byte	0x24
	.4byte	0xb8b
	.sleb128 -2146697168
	.uleb128 0x1c
	.4byte	.LASF199
	.byte	0x9
	.byte	0x25
	.4byte	0xb8b
	.sleb128 -2146697196
	.uleb128 0x1c
	.4byte	.LASF200
	.byte	0x9
	.byte	0x26
	.4byte	0xb8b
	.sleb128 -2146697192
	.uleb128 0x1c
	.4byte	.LASF201
	.byte	0x9
	.byte	0x27
	.4byte	0xb8b
	.sleb128 -2146697188
	.uleb128 0x1c
	.4byte	.LASF202
	.byte	0x1
	.byte	0x9
	.4byte	0xb8b
	.sleb128 -2138308584
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x15
	.byte	0x0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x1d0
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xd39
	.4byte	0x6e5
	.ascii	"irq_handler\000"
	.4byte	0x73a
	.ascii	"IRQ_ClearTimerInterrupt\000"
	.4byte	0x74d
	.ascii	"IRQ_TimerVIC2Handler\000"
	.4byte	0x774
	.ascii	"IRQ_UART1TransmitHandler\000"
	.4byte	0x79b
	.ascii	"IRQ_SetUART1Receive\000"
	.4byte	0x7d9
	.ascii	"IRQ_UART1RecieveHandler\000"
	.4byte	0x800
	.ascii	"IRQ_UART1Handler\000"
	.4byte	0x813
	.ascii	"IRQ_SetUART2Receive\000"
	.4byte	0x846
	.ascii	"IRQ_UART2RecieveHandler\000"
	.4byte	0x86d
	.ascii	"IRQ_SetUART2Transmit\000"
	.4byte	0x8a0
	.ascii	"IRQ_UART2TransmitHandler\000"
	.4byte	0x8c7
	.ascii	"IRQ_UART2Handler\000"
	.4byte	0x8da
	.ascii	"IRQ_EnableTimer\000"
	.4byte	0x902
	.ascii	"IRQ_EnableTimerVIC2\000"
	.4byte	0x930
	.ascii	"IRQ_DisableTimerVIC2\000"
	.4byte	0x943
	.ascii	"IRQ_SetupUARTInterrupts\000"
	.4byte	0x987
	.ascii	"IRQ_DisableUARTInterrupts\000"
	.4byte	0x99a
	.ascii	"IRQ_SetUART1Transmit\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF178:
	.ascii	"timer_clear\000"
.LASF111:
	.ascii	"num_receive_blocked\000"
.LASF135:
	.ascii	"IRQ_UART2Handler\000"
.LASF69:
	.ascii	"stack_pointer\000"
.LASF92:
	.ascii	"memory_blocks_status\000"
.LASF203:
	.ascii	"GNU C 4.0.2\000"
.LASF88:
	.ascii	"user_proc_spsr\000"
.LASF161:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF124:
	.ascii	"IRQ_SetUART1Receive\000"
.LASF71:
	.ascii	"entry_point\000"
.LASF147:
	.ascii	"IRQ_DisableUARTInterrupts\000"
.LASF39:
	.ascii	"current_count\000"
.LASF106:
	.ascii	"num_ready\000"
.LASF10:
	.ascii	"PRIORITY_10\000"
.LASF11:
	.ascii	"PRIORITY_11\000"
.LASF12:
	.ascii	"PRIORITY_12\000"
.LASF13:
	.ascii	"PRIORITY_13\000"
.LASF14:
	.ascii	"PRIORITY_14\000"
.LASF15:
	.ascii	"PRIORITY_15\000"
.LASF16:
	.ascii	"PRIORITY_16\000"
.LASF18:
	.ascii	"PRIORITY_18\000"
.LASF19:
	.ascii	"PRIORITY_19\000"
.LASF34:
	.ascii	"unsigned int\000"
.LASF79:
	.ascii	"send_to_tid\000"
.LASF96:
	.ascii	"redboot_lr_value\000"
.LASF107:
	.ascii	"num_active\000"
.LASF64:
	.ascii	"TaskDescriptor\000"
.LASF17:
	.ascii	"PRIORITY_17\000"
.LASF156:
	.ascii	"TrSTmr\000"
.LASF171:
	.ascii	"TICK_SIZE\000"
.LASF167:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF20:
	.ascii	"PRIORITY_20\000"
.LASF21:
	.ascii	"PRIORITY_21\000"
.LASF22:
	.ascii	"PRIORITY_22\000"
.LASF23:
	.ascii	"PRIORITY_23\000"
.LASF24:
	.ascii	"PRIORITY_24\000"
.LASF26:
	.ascii	"PRIORITY_26\000"
.LASF28:
	.ascii	"PRIORITY_28\000"
.LASF29:
	.ascii	"PRIORITY_29\000"
.LASF109:
	.ascii	"num_send_blocked\000"
.LASF172:
	.ascii	"TASK_STATE_NAMES\000"
.LASF188:
	.ascii	"VIC1BaseAddress\000"
.LASF63:
	.ascii	"EVENT_BLOCKED\000"
.LASF129:
	.ascii	"IRQ_SetUART2Receive\000"
.LASF31:
	.ascii	"PRIORITY_31\000"
.LASF74:
	.ascii	"entry_mode\000"
.LASF100:
	.ascii	"Scheduler\000"
.LASF99:
	.ascii	"function_name\000"
.LASF60:
	.ascii	"SEND_BLOCKED\000"
.LASF27:
	.ascii	"PRIORITY_27\000"
.LASF121:
	.ascii	"irq_handler\000"
.LASF170:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF186:
	.ascii	"UART1IntIDIntClr\000"
.LASF55:
	.ascii	"NUM_EVENTS\000"
.LASF101:
	.ascii	"max_tasks\000"
.LASF163:
	.ascii	"ERR_K_DEFAULT\000"
.LASF120:
	.ascii	"vic2fcn\000"
.LASF80:
	.ascii	"event_id\000"
.LASF159:
	.ascii	"LIGHTS_MASK\000"
.LASF130:
	.ascii	"enable\000"
.LASF138:
	.ascii	"IRQ_EnableTimerVIC2\000"
.LASF202:
	.ascii	"UART1Flag\000"
.LASF41:
	.ascii	"items\000"
.LASF30:
	.ascii	"PRIORITY_30\000"
.LASF87:
	.ascii	"user_proc_return_value\000"
.LASF84:
	.ascii	"KernelState\000"
.LASF189:
	.ascii	"VIC1IntSelect\000"
.LASF68:
	.ascii	"parent_id\000"
.LASF45:
	.ascii	"queues_with_items\000"
.LASF36:
	.ascii	"TaskQueue\000"
.LASF108:
	.ascii	"num_zombie\000"
.LASF25:
	.ascii	"PRIORITY_25\000"
.LASF196:
	.ascii	"VIC2IntSelect\000"
.LASF85:
	.ascii	"user_proc_sp_value\000"
.LASF43:
	.ascii	"PriorityQueue\000"
.LASF73:
	.ascii	"return_value\000"
.LASF94:
	.ascii	"scheduler\000"
.LASF72:
	.ascii	"spsr_register\000"
.LASF112:
	.ascii	"num_event_blocked\000"
.LASF103:
	.ascii	"task_descriptors\000"
.LASF46:
	.ascii	"char\000"
.LASF204:
	.ascii	"kernel_irq.c\000"
.LASF52:
	.ascii	"UART1_TX_EVENT\000"
.LASF177:
	.ascii	"timer_ctrl\000"
.LASF198:
	.ascii	"VIC2VectAddr\000"
.LASF56:
	.ascii	"TaskState\000"
.LASF67:
	.ascii	"messages\000"
.LASF199:
	.ascii	"VIC2IntEnClear\000"
.LASF44:
	.ascii	"queues\000"
.LASF76:
	.ascii	"reply_len\000"
.LASF193:
	.ascii	"VIC1SoftInt\000"
.LASF57:
	.ascii	"READY\000"
.LASF75:
	.ascii	"receive_msg\000"
.LASF122:
	.ascii	"IRQ_TimerVIC2Handler\000"
.LASF132:
	.ascii	"IRQ_UART2RecieveHandler\000"
.LASF180:
	.ascii	"UART1RXINTR1\000"
.LASF187:
	.ascii	"UART2IntIDIntClr\000"
.LASF91:
	.ascii	"memory_stack_top\000"
.LASF131:
	.ascii	"UART2Ctrl\000"
.LASF148:
	.ascii	"IRQ_SetUART1Transmit\000"
.LASF181:
	.ascii	"UART1TXINTR1\000"
.LASF201:
	.ascii	"VIC2SoftIntClear\000"
.LASF165:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF48:
	.ascii	"EventID\000"
.LASF1:
	.ascii	"PRIORITY_1\000"
.LASF40:
	.ascii	"size\000"
.LASF4:
	.ascii	"PRIORITY_4\000"
.LASF5:
	.ascii	"PRIORITY_5\000"
.LASF6:
	.ascii	"PRIORITY_6\000"
.LASF50:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF160:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF37:
	.ascii	"item\000"
.LASF35:
	.ascii	"long unsigned int\000"
.LASF95:
	.ascii	"redboot_sp_value\000"
.LASF153:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF192:
	.ascii	"VIC1IntEnClear\000"
.LASF114:
	.ascii	"has_tasks_event_blocked\000"
.LASF32:
	.ascii	"QueuePriority\000"
.LASF33:
	.ascii	"QueueItem\000"
.LASF184:
	.ascii	"INT_UART1\000"
.LASF185:
	.ascii	"INT_UART2\000"
.LASF62:
	.ascii	"REPLY_BLOCKED\000"
.LASF191:
	.ascii	"VIC1VectAddr\000"
.LASF173:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF128:
	.ascii	"IRQ_UART1Handler\000"
.LASF190:
	.ascii	"VIC1IntEnable\000"
.LASF54:
	.ascii	"UART2_TX_EVENT\000"
.LASF0:
	.ascii	"PRIORITY_0\000"
.LASF113:
	.ascii	"num_tasks\000"
.LASF102:
	.ascii	"current_task_descriptor\000"
.LASF2:
	.ascii	"PRIORITY_2\000"
.LASF7:
	.ascii	"PRIORITY_7\000"
.LASF142:
	.ascii	"IRQ_SetupUARTInterrupts\000"
.LASF8:
	.ascii	"PRIORITY_8\000"
.LASF51:
	.ascii	"UART1_RX_EVENT\000"
.LASF176:
	.ascii	"timer_val\000"
.LASF205:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF58:
	.ascii	"ACTIVE\000"
.LASF118:
	.ascii	"short int\000"
.LASF166:
	.ascii	"NAMESERVER_TID\000"
.LASF116:
	.ascii	"function_mappings\000"
.LASF97:
	.ascii	"redboot_spsr_value\000"
.LASF154:
	.ascii	"TCmSvr\000"
.LASF66:
	.ascii	"priority\000"
.LASF70:
	.ascii	"link_register\000"
.LASF150:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF119:
	.ascii	"k_state\000"
.LASF168:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF3:
	.ascii	"PRIORITY_3\000"
.LASF136:
	.ascii	"IRQ_EnableTimer\000"
.LASF104:
	.ascii	"inited_td\000"
.LASF38:
	.ascii	"start\000"
.LASF81:
	.ascii	"schedule_timestamp\000"
.LASF9:
	.ascii	"PRIORITY_9\000"
.LASF93:
	.ascii	"memory_blocks\000"
.LASF162:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF61:
	.ascii	"RECEIVE_BLOCKED\000"
.LASF157:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF123:
	.ascii	"IRQ_UART1TransmitHandler\000"
.LASF174:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF49:
	.ascii	"NULL_EVENT\000"
.LASF194:
	.ascii	"VIC1SoftIntClear\000"
.LASF77:
	.ascii	"reply_msg\000"
.LASF179:
	.ascii	"TC3OI\000"
.LASF78:
	.ascii	"origin_tid\000"
.LASF139:
	.ascii	"VIC2VectAddr0\000"
.LASF143:
	.ascii	"VIC2VectAddr1\000"
.LASF145:
	.ascii	"VIC2VectAddr2\000"
.LASF83:
	.ascii	"unsigned char\000"
.LASF133:
	.ascii	"IRQ_SetUART2Transmit\000"
.LASF82:
	.ascii	"scheduled_counter\000"
.LASF140:
	.ascii	"VIC2VectCntl0\000"
.LASF144:
	.ascii	"VIC2VectCntl1\000"
.LASF146:
	.ascii	"VIC2VectCntl2\000"
.LASF110:
	.ascii	"num_reply_blocked\000"
.LASF90:
	.ascii	"user_proc_entry_mode\000"
.LASF149:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF164:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF197:
	.ascii	"VIC2IntEnable\000"
.LASF98:
	.ascii	"FunctionMapping\000"
.LASF65:
	.ascii	"state\000"
.LASF125:
	.ascii	"UART1Ctrl\000"
.LASF152:
	.ascii	"TrnSvr\000"
.LASF89:
	.ascii	"last_kernel_sp_value\000"
.LASF53:
	.ascii	"UART2_RX_EVENT\000"
.LASF137:
	.ascii	"cycles_per_tick\000"
.LASF175:
	.ascii	"timer_ldr\000"
.LASF158:
	.ascii	"TrSwMr\000"
.LASF182:
	.ascii	"UART2RXINTR2\000"
.LASF200:
	.ascii	"VIC2SoftInt\000"
.LASF155:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF105:
	.ascii	"task_queue\000"
.LASF183:
	.ascii	"UART2TXINTR2\000"
.LASF59:
	.ascii	"ZOMBIE\000"
.LASF151:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF47:
	.ascii	"double\000"
.LASF42:
	.ascii	"MessageQueue\000"
.LASF126:
	.ascii	"IRQ_UART1RecieveHandler\000"
.LASF115:
	.ascii	"functions_registered\000"
.LASF127:
	.ascii	"IRQ_ClearTimerInterrupt\000"
.LASF169:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF141:
	.ascii	"IRQ_DisableTimerVIC2\000"
.LASF195:
	.ascii	"VIC2BaseAddress\000"
.LASF117:
	.ascii	"watchdog_feed_counter\000"
.LASF86:
	.ascii	"user_proc_lr_value\000"
.LASF134:
	.ascii	"IRQ_UART2TransmitHandler\000"
	.ident	"GCC: (GNU) 4.0.2"
