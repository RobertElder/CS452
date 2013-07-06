	.file	"kern.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata
	.align	2
	.type	ERR_QUEUE_FULL, %object
	.size	ERR_QUEUE_FULL, 4
ERR_QUEUE_FULL:
	.word	-1
	.align	2
	.type	ERR_QUEUE_PRIORITY, %object
	.size	ERR_QUEUE_PRIORITY, 4
ERR_QUEUE_PRIORITY:
	.word	-2
	.align	2
	.type	TRAIN_SERVER_NAME, %object
	.size	TRAIN_SERVER_NAME, 7
TRAIN_SERVER_NAME:
	.ascii	"TrnSvr\000"
	.align	2
	.type	TRAIN_COMMAND_SERVER_NAME, %object
	.size	TRAIN_COMMAND_SERVER_NAME, 7
TRAIN_COMMAND_SERVER_NAME:
	.ascii	"TCmSvr\000"
	.align	2
	.type	TRAIN_SERVER_TIMER_NAME, %object
	.size	TRAIN_SERVER_TIMER_NAME, 7
TRAIN_SERVER_TIMER_NAME:
	.ascii	"TrSTmr\000"
	.align	2
	.type	TRAIN_SWITCH_MASTER_NAME, %object
	.size	TRAIN_SWITCH_MASTER_NAME, 7
TRAIN_SWITCH_MASTER_NAME:
	.ascii	"TrSwMr\000"
	.align	2
	.type	LIGHTS_MASK, %object
	.size	LIGHTS_MASK, 4
LIGHTS_MASK:
	.word	16
	.type	TRAIN_ENGINE_STATE_NAMES, %object
	.size	TRAIN_ENGINE_STATE_NAMES, 120
TRAIN_ENGINE_STATE_NAMES:
	.ascii	"Idle\000"
	.space	15
	.ascii	"Finding Position\000"
	.space	3
	.ascii	"Found Start Posn\000"
	.space	3
	.ascii	"Running\000"
	.space	12
	.ascii	"At Destination\000"
	.space	5
	.ascii	"Calibrate Speed\000"
	.space	4
	.align	2
	.type	ERR_K_INVALID_PRIORITY, %object
	.size	ERR_K_INVALID_PRIORITY, 4
ERR_K_INVALID_PRIORITY:
	.word	-1
	.align	2
	.type	ERR_K_OUT_OF_TD, %object
	.size	ERR_K_OUT_OF_TD, 4
ERR_K_OUT_OF_TD:
	.word	-2
	.align	2
	.type	ERR_K_DEFAULT, %object
	.size	ERR_K_DEFAULT, 4
ERR_K_DEFAULT:
	.word	-3
	.align	2
	.type	ERR_INVALID_NAME_SERVER, %object
	.size	ERR_INVALID_NAME_SERVER, 4
ERR_INVALID_NAME_SERVER:
	.word	-1
	.align	2
	.type	ERR_NOT_A_NAME_SERVER, %object
	.size	ERR_NOT_A_NAME_SERVER, 4
ERR_NOT_A_NAME_SERVER:
	.word	-2
	.align	2
	.type	NAMESERVER_TID, %object
	.size	NAMESERVER_TID, 4
NAMESERVER_TID:
	.word	2
	.align	2
	.type	ERR_K_TID_OUT_OF_RANGE, %object
	.size	ERR_K_TID_OUT_OF_RANGE, 4
ERR_K_TID_OUT_OF_RANGE:
	.word	-1
	.align	2
	.type	ERR_K_TID_DOES_NOT_EXIST, %object
	.size	ERR_K_TID_DOES_NOT_EXIST, 4
ERR_K_TID_DOES_NOT_EXIST:
	.word	-2
	.align	2
	.type	ERR_K_TASK_NOT_REPLY_BLOCKED, %object
	.size	ERR_K_TASK_NOT_REPLY_BLOCKED, 4
ERR_K_TASK_NOT_REPLY_BLOCKED:
	.word	-3
	.align	2
	.type	ERR_K_INSUFFICIENT_SPACE, %object
	.size	ERR_K_INSUFFICIENT_SPACE, 4
ERR_K_INSUFFICIENT_SPACE:
	.word	-4
	.align	2
	.type	TICK_SIZE, %object
	.size	TICK_SIZE, 8
TICK_SIZE:
	.word	1072064102
	.word	1717986918
	.type	TASK_STATE_NAMES, %object
	.size	TASK_STATE_NAMES, 140
TASK_STATE_NAMES:
	.ascii	"\033[37mready\033[0m\000"
	.space	5
	.ascii	"\033[32mactive\033[0m\000"
	.space	4
	.ascii	"\033[34mzombie\033[0m\000"
	.space	4
	.ascii	"\033[35msend_b\033[0m\000"
	.space	4
	.ascii	"\033[31mrecv_b\033[0m\000"
	.space	4
	.ascii	"\033[36mreply_b\033[0m\000"
	.space	3
	.ascii	"\033[33mevent_b\033[0m\000"
	.space	3
	.align	2
	.type	ERR_BUFFER_FULL, %object
	.size	ERR_BUFFER_FULL, 4
ERR_BUFFER_FULL:
	.word	-1
	.align	2
	.type	ERR_BUFFER_EMPTY, %object
	.size	ERR_BUFFER_EMPTY, 4
ERR_BUFFER_EMPTY:
	.word	-2
	.align	2
	.type	ADMINISTRATOR_TASK_NAME, %object
	.size	ADMINISTRATOR_TASK_NAME, 6
ADMINISTRATOR_TASK_NAME:
	.ascii	"Admin\000"
	.align	2
	.type	IDLE_TASK_NAME, %object
	.size	IDLE_TASK_NAME, 5
IDLE_TASK_NAME:
	.ascii	"Idle\000"
	.align	2
	.type	UART1DATA, %object
	.size	UART1DATA, 4
UART1DATA:
	.word	-2138308608
	.align	2
	.type	UART2DATA, %object
	.size	UART2DATA, 4
UART2DATA:
	.word	-2138243072
	.align	2
	.type	UART1Flag, %object
	.size	UART1Flag, 4
UART1Flag:
	.word	-2138308584
	.align	2
	.type	UART2Flag, %object
	.size	UART2Flag, 4
UART2Flag:
	.word	-2138243048
	.align	2
	.type	timer_ldr, %object
	.size	timer_ldr, 4
timer_ldr:
	.word	-2139029376
	.align	2
	.type	timer_val, %object
	.size	timer_val, 4
timer_val:
	.word	-2139029372
	.align	2
	.type	timer_ctrl, %object
	.size	timer_ctrl, 4
timer_ctrl:
	.word	-2139029368
	.align	2
	.type	timer_clear, %object
	.size	timer_clear, 4
timer_clear:
	.word	-2139029364
	.data
	.align	2
	.type	TC3OI, %object
	.size	TC3OI, 4
TC3OI:
	.word	51
	.align	2
	.type	UART1RXINTR1, %object
	.size	UART1RXINTR1, 4
UART1RXINTR1:
	.word	23
	.align	2
	.type	UART1TXINTR1, %object
	.size	UART1TXINTR1, 4
UART1TXINTR1:
	.word	24
	.align	2
	.type	UART2RXINTR2, %object
	.size	UART2RXINTR2, 4
UART2RXINTR2:
	.word	25
	.align	2
	.type	UART2TXINTR2, %object
	.size	UART2TXINTR2, 4
UART2TXINTR2:
	.word	26
	.align	2
	.type	INT_UART1, %object
	.size	INT_UART1, 4
INT_UART1:
	.word	52
	.align	2
	.type	INT_UART2, %object
	.size	INT_UART2, 4
INT_UART2:
	.word	54
	.section	.rodata
	.align	2
	.type	UART1IntIDIntClr, %object
	.size	UART1IntIDIntClr, 4
UART1IntIDIntClr:
	.word	-2138308580
	.align	2
	.type	UART2IntIDIntClr, %object
	.size	UART2IntIDIntClr, 4
UART2IntIDIntClr:
	.word	-2138243044
	.align	2
	.type	VIC1BaseAddress, %object
	.size	VIC1BaseAddress, 4
VIC1BaseAddress:
	.word	-2146762752
	.align	2
	.type	VIC1IntSelect, %object
	.size	VIC1IntSelect, 4
VIC1IntSelect:
	.word	-2146762740
	.align	2
	.type	VIC1IntEnable, %object
	.size	VIC1IntEnable, 4
VIC1IntEnable:
	.word	-2146762736
	.align	2
	.type	VIC1VectAddr, %object
	.size	VIC1VectAddr, 4
VIC1VectAddr:
	.word	-2146762704
	.align	2
	.type	VIC1IntEnClear, %object
	.size	VIC1IntEnClear, 4
VIC1IntEnClear:
	.word	-2146762732
	.align	2
	.type	VIC1SoftInt, %object
	.size	VIC1SoftInt, 4
VIC1SoftInt:
	.word	-2146762728
	.align	2
	.type	VIC1SoftIntClear, %object
	.size	VIC1SoftIntClear, 4
VIC1SoftIntClear:
	.word	-2146762724
	.align	2
	.type	VIC2BaseAddress, %object
	.size	VIC2BaseAddress, 4
VIC2BaseAddress:
	.word	-2146697216
	.align	2
	.type	VIC2IntSelect, %object
	.size	VIC2IntSelect, 4
VIC2IntSelect:
	.word	-2146697204
	.align	2
	.type	VIC2IntEnable, %object
	.size	VIC2IntEnable, 4
VIC2IntEnable:
	.word	-2146697200
	.align	2
	.type	VIC2VectAddr, %object
	.size	VIC2VectAddr, 4
VIC2VectAddr:
	.word	-2146697168
	.align	2
	.type	VIC2IntEnClear, %object
	.size	VIC2IntEnClear, 4
VIC2IntEnClear:
	.word	-2146697196
	.align	2
	.type	VIC2SoftInt, %object
	.size	VIC2SoftInt, 4
VIC2SoftInt:
	.word	-2146697192
	.align	2
	.type	VIC2SoftIntClear, %object
	.size	VIC2SoftIntClear, 4
VIC2SoftIntClear:
	.word	-2146697188
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.file 1 "kern.c"
	.loc 1 27 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
.LCFI0:
	stmfd	sp!, {sl, fp, ip, lr, pc}
.LCFI1:
	sub	fp, ip, #4
.LCFI2:
	sub	sp, sp, #24
.LCFI3:
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	.loc 1 28 0
	mov	r3, #40
	str	r3, [fp, #-40]
	.loc 1 29 0
	ldr	r3, .L4+4
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]
	.loc 1 31 0
	mov	r3, #56
	str	r3, [fp, #-36]
	.loc 1 32 0
	ldr	r3, .L4+8
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	.loc 1 35 0
	ldr	r3, .L4+12
	str	r3, [fp, #-32]
	.loc 1 38 0
	ldr	r2, [fp, #-32]
	ldr	r3, .L4+16
	str	r3, [r2, #0]
	.loc 1 40 0
	ldr	r3, .L4+20
	ldr	r3, [sl, r3]
	str	r3, [fp, #-28]
	.loc 1 41 0
	ldr	r2, [fp, #-28]
	ldr	r3, .L4+12
	str	r3, [r2, #0]
	.loc 1 43 0
	ldr	r3, .L4+24
	ldr	r3, [sl, r3]
	str	r3, [fp, #-24]
	.loc 1 44 0
	ldr	r2, [fp, #-24]
	ldr	r3, .L4+12
	str	r3, [r2, #0]
	.loc 1 46 0
	ldr	r3, .L4+28
	ldr	r3, [sl, r3]
	str	r3, [fp, #-20]
	.loc 1 47 0
	ldr	r2, [fp, #-20]
	ldr	r3, .L4+32
	str	r3, [r2, #0]
	.loc 1 49 0
	bl	asm_SetUpIRQStack(PLT)
	.loc 1 53 0
	bl	InitKernel(PLT)
	.loc 1 55 0
	mov	r3, #0
	.loc 1 56 0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	asm_SwiCallEntry(GOT)
	.word	asm_TimerIRQEntry(GOT)
	.word	33403036
	.word	32975852
	.word	_KernelStackBase(GOT)
	.word	_KernelStackBase2(GOT)
	.word	_TimerIRQStackBase(GOT)
	.word	32873452
.LFE2:
	.size	main, .-main
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
	.byte	0xd
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x8e
	.uleb128 0x2
	.byte	0x8d
	.uleb128 0x3
	.byte	0x8b
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE0:
	.file 2 "queue.h"
	.file 3 "train.h"
	.file 4 "public_kernel_interface.h"
	.file 5 "task_descriptor.h"
	.file 6 "buffer.h"
	.file 7 "tasks.h"
	.file 8 "test_uart.h"
	.file 9 "kernel_irq.h"
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x8dc
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.ascii	"GNU C 4.0.2\000"
	.byte	0x1
	.ascii	"kern.c\000"
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
	.uleb128 0x2
	.ascii	"unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.ascii	"long unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.ascii	"char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.ascii	"double\000"
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.ascii	"unsigned char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.byte	0x4
	.4byte	0x74
	.uleb128 0x2
	.ascii	"short int\000"
	.byte	0x2
	.byte	0x5
	.uleb128 0x4
	.4byte	0x184
	.byte	0x1
	.ascii	"main\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x74
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5b
	.uleb128 0x5
	.ascii	"swi_call_entry_address\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -40
	.uleb128 0x5
	.ascii	"irq_call_entry_address\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -36
	.uleb128 0x5
	.ascii	"kernel_saved_sp_loc\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -32
	.uleb128 0x5
	.ascii	"kernel_stack_base\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -28
	.uleb128 0x5
	.ascii	"kernel_stack_base2\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -24
	.uleb128 0x5
	.ascii	"timerirq_stack_base\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x9e
	.byte	0x2
	.byte	0x7b
	.sleb128 -20
	.byte	0x0
	.uleb128 0x5
	.ascii	"ERR_QUEUE_FULL\000"
	.byte	0x2
	.byte	0xb
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_QUEUE_FULL
	.uleb128 0x6
	.4byte	0x74
	.uleb128 0x5
	.ascii	"ERR_QUEUE_PRIORITY\000"
	.byte	0x2
	.byte	0xc
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_QUEUE_PRIORITY
	.uleb128 0x7
	.4byte	0x1d5
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x6
	.byte	0x0
	.uleb128 0x5
	.ascii	"TRAIN_SERVER_NAME\000"
	.byte	0x3
	.byte	0xb
	.4byte	0x1f4
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_NAME
	.uleb128 0x6
	.4byte	0x1c5
	.uleb128 0x7
	.4byte	0x209
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x6
	.byte	0x0
	.uleb128 0x5
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
	.byte	0x3
	.byte	0xc
	.4byte	0x230
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_COMMAND_SERVER_NAME
	.uleb128 0x6
	.4byte	0x1f9
	.uleb128 0x7
	.4byte	0x245
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x6
	.byte	0x0
	.uleb128 0x5
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
	.byte	0x3
	.byte	0xd
	.4byte	0x26a
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_TIMER_NAME
	.uleb128 0x6
	.4byte	0x235
	.uleb128 0x7
	.4byte	0x27f
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x6
	.byte	0x0
	.uleb128 0x5
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
	.byte	0x3
	.byte	0xe
	.4byte	0x2a5
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SWITCH_MASTER_NAME
	.uleb128 0x6
	.4byte	0x26f
	.uleb128 0x5
	.ascii	"LIGHTS_MASK\000"
	.byte	0x3
	.byte	0x10
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	LIGHTS_MASK
	.uleb128 0x7
	.4byte	0x2d9
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x5
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
	.byte	0x3
	.byte	0x6d
	.4byte	0x2ff
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_ENGINE_STATE_NAMES
	.uleb128 0x6
	.4byte	0x2c3
	.uleb128 0x5
	.ascii	"ERR_K_INVALID_PRIORITY\000"
	.byte	0x4
	.byte	0x7
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_INVALID_PRIORITY
	.uleb128 0x5
	.ascii	"ERR_K_OUT_OF_TD\000"
	.byte	0x4
	.byte	0x8
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_OUT_OF_TD
	.uleb128 0x5
	.ascii	"ERR_K_DEFAULT\000"
	.byte	0x4
	.byte	0x9
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_DEFAULT
	.uleb128 0x5
	.ascii	"ERR_INVALID_NAME_SERVER\000"
	.byte	0x4
	.byte	0xa
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_INVALID_NAME_SERVER
	.uleb128 0x5
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
	.byte	0x4
	.byte	0xb
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_NOT_A_NAME_SERVER
	.uleb128 0x5
	.ascii	"NAMESERVER_TID\000"
	.byte	0x4
	.byte	0xc
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	NAMESERVER_TID
	.uleb128 0x5
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
	.byte	0x4
	.byte	0xd
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_TID_OUT_OF_RANGE
	.uleb128 0x5
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
	.byte	0x4
	.byte	0xe
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_TID_DOES_NOT_EXIST
	.uleb128 0x5
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
	.byte	0x4
	.byte	0xf
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_TASK_NOT_REPLY_BLOCKED
	.uleb128 0x5
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
	.byte	0x4
	.byte	0x10
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_K_INSUFFICIENT_SPACE
	.uleb128 0x5
	.ascii	"TICK_SIZE\000"
	.byte	0x4
	.byte	0x11
	.4byte	0x475
	.byte	0x5
	.byte	0x3
	.4byte	TICK_SIZE
	.uleb128 0x6
	.4byte	0x83
	.uleb128 0x7
	.4byte	0x490
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x6
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.ascii	"TASK_STATE_NAMES\000"
	.byte	0x5
	.byte	0x27
	.4byte	0x4ae
	.byte	0x5
	.byte	0x3
	.4byte	TASK_STATE_NAMES
	.uleb128 0x6
	.4byte	0x47a
	.uleb128 0x5
	.ascii	"ERR_BUFFER_FULL\000"
	.byte	0x6
	.byte	0x5
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_BUFFER_FULL
	.uleb128 0x5
	.ascii	"ERR_BUFFER_EMPTY\000"
	.byte	0x6
	.byte	0x6
	.4byte	0x1a0
	.byte	0x5
	.byte	0x3
	.4byte	ERR_BUFFER_EMPTY
	.uleb128 0x7
	.4byte	0x4fe
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x5
	.byte	0x0
	.uleb128 0x5
	.ascii	"ADMINISTRATOR_TASK_NAME\000"
	.byte	0x7
	.byte	0x6
	.4byte	0x523
	.byte	0x5
	.byte	0x3
	.4byte	ADMINISTRATOR_TASK_NAME
	.uleb128 0x6
	.4byte	0x4ee
	.uleb128 0x7
	.4byte	0x538
	.4byte	0x7b
	.uleb128 0x8
	.4byte	0x5f
	.byte	0x4
	.byte	0x0
	.uleb128 0x5
	.ascii	"IDLE_TASK_NAME\000"
	.byte	0x7
	.byte	0x7
	.4byte	0x554
	.byte	0x5
	.byte	0x3
	.4byte	IDLE_TASK_NAME
	.uleb128 0x6
	.4byte	0x528
	.uleb128 0x5
	.ascii	"UART1DATA\000"
	.byte	0x8
	.byte	0x6
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART1DATA
	.uleb128 0x6
	.4byte	0x575
	.uleb128 0x3
	.byte	0x4
	.4byte	0x57b
	.uleb128 0x9
	.4byte	0x74
	.uleb128 0x5
	.ascii	"UART2DATA\000"
	.byte	0x8
	.byte	0x7
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART2DATA
	.uleb128 0x5
	.ascii	"UART1Flag\000"
	.byte	0x8
	.byte	0x8
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART1Flag
	.uleb128 0x5
	.ascii	"UART2Flag\000"
	.byte	0x8
	.byte	0x9
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART2Flag
	.uleb128 0x5
	.ascii	"timer_ldr\000"
	.byte	0x9
	.byte	0xd
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	timer_ldr
	.uleb128 0x5
	.ascii	"timer_val\000"
	.byte	0x9
	.byte	0xe
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	timer_val
	.uleb128 0x5
	.ascii	"timer_ctrl\000"
	.byte	0x9
	.byte	0xf
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	timer_ctrl
	.uleb128 0x5
	.ascii	"timer_clear\000"
	.byte	0x9
	.byte	0x10
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	timer_clear
	.uleb128 0x5
	.ascii	"TC3OI\000"
	.byte	0x9
	.byte	0x11
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	TC3OI
	.uleb128 0x6
	.4byte	0x57b
	.uleb128 0x5
	.ascii	"UART1RXINTR1\000"
	.byte	0x9
	.byte	0x12
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	UART1RXINTR1
	.uleb128 0x5
	.ascii	"UART1TXINTR1\000"
	.byte	0x9
	.byte	0x13
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	UART1TXINTR1
	.uleb128 0x5
	.ascii	"UART2RXINTR2\000"
	.byte	0x9
	.byte	0x14
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	UART2RXINTR2
	.uleb128 0x5
	.ascii	"UART2TXINTR2\000"
	.byte	0x9
	.byte	0x15
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	UART2TXINTR2
	.uleb128 0x5
	.ascii	"INT_UART1\000"
	.byte	0x9
	.byte	0x16
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	INT_UART1
	.uleb128 0x5
	.ascii	"INT_UART2\000"
	.byte	0x9
	.byte	0x17
	.4byte	0x637
	.byte	0x5
	.byte	0x3
	.4byte	INT_UART2
	.uleb128 0x5
	.ascii	"UART1IntIDIntClr\000"
	.byte	0x9
	.byte	0x18
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART1IntIDIntClr
	.uleb128 0x5
	.ascii	"UART2IntIDIntClr\000"
	.byte	0x9
	.byte	0x19
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	UART2IntIDIntClr
	.uleb128 0x5
	.ascii	"VIC1BaseAddress\000"
	.byte	0x9
	.byte	0x1a
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1BaseAddress
	.uleb128 0x5
	.ascii	"VIC1IntSelect\000"
	.byte	0x9
	.byte	0x1b
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1IntSelect
	.uleb128 0x5
	.ascii	"VIC1IntEnable\000"
	.byte	0x9
	.byte	0x1c
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1IntEnable
	.uleb128 0x5
	.ascii	"VIC1VectAddr\000"
	.byte	0x9
	.byte	0x1d
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1VectAddr
	.uleb128 0x5
	.ascii	"VIC1IntEnClear\000"
	.byte	0x9
	.byte	0x1e
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1IntEnClear
	.uleb128 0x5
	.ascii	"VIC1SoftInt\000"
	.byte	0x9
	.byte	0x1f
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1SoftInt
	.uleb128 0x5
	.ascii	"VIC1SoftIntClear\000"
	.byte	0x9
	.byte	0x20
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC1SoftIntClear
	.uleb128 0x5
	.ascii	"VIC2BaseAddress\000"
	.byte	0x9
	.byte	0x21
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2BaseAddress
	.uleb128 0x5
	.ascii	"VIC2IntSelect\000"
	.byte	0x9
	.byte	0x22
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2IntSelect
	.uleb128 0x5
	.ascii	"VIC2IntEnable\000"
	.byte	0x9
	.byte	0x23
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2IntEnable
	.uleb128 0x5
	.ascii	"VIC2VectAddr\000"
	.byte	0x9
	.byte	0x24
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2VectAddr
	.uleb128 0x5
	.ascii	"VIC2IntEnClear\000"
	.byte	0x9
	.byte	0x25
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2IntEnClear
	.uleb128 0x5
	.ascii	"VIC2SoftInt\000"
	.byte	0x9
	.byte	0x26
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2SoftInt
	.uleb128 0x5
	.ascii	"VIC2SoftIntClear\000"
	.byte	0x9
	.byte	0x27
	.4byte	0x570
	.byte	0x5
	.byte	0x3
	.4byte	VIC2SoftIntClear
	.uleb128 0xa
	.ascii	"_KernelStackBase\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x74
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.ascii	"_KernelStackBase2\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x74
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.ascii	"_TimerIRQStackBase\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x74
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x6
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x17
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8e0
	.4byte	0xb1
	.ascii	"main\000"
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
	.ident	"GCC: (GNU) 4.0.2"
