	.file	"scheduler.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.data
	.align	1
	.type	SchedulerWatchdogEnabled, %object
	.size	SchedulerWatchdogEnabled, 2
SchedulerWatchdogEnabled:
	.short	1
	.section	.rodata
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
	.text
	.align	2
	.global	Scheduler_Initialize
	.type	Scheduler_Initialize, %function
Scheduler_Initialize:
.LFB2:
	.file 1 "scheduler.c"
	.loc 1 15 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	.loc 1 16 0
	ldr	r3, .L12
	.loc 1 17 0
	ldr	r2, .L12+4
	.loc 1 15 0
	stmfd	sp!, {r4, r5, lr}
.LCFI0:
	.loc 1 15 0
	mov	r5, r0
	.loc 1 17 0
	mov	r4, #0
	.loc 1 18 0
	add	r0, r0, #203776
.LVL1:
	.loc 1 16 0
	str	r3, [r5, #0]
	.loc 1 17 0
	str	r4, [r5, r2]
	.loc 1 18 0
	add	r0, r0, #464
	bl	PriorityQueue_Initialize(PLT)
	.loc 1 19 0
	ldr	r3, .L12+8
	.loc 1 20 0
	ldr	r2, .L12+12
	.loc 1 19 0
	str	r4, [r5, r3]
	.loc 1 20 0
	str	r4, [r5, r2]
	.loc 1 21 0
	add	r3, r3, #12
	.loc 1 22 0
	sub	r2, r2, #4
	.loc 1 21 0
	str	r4, [r5, r3]
	.loc 1 22 0
	str	r4, [r5, r2]
	.loc 1 23 0
	add	r3, r3, #12
	.loc 1 24 0
	sub	r2, r2, #12
	.loc 1 23 0
	str	r4, [r5, r3]
	.loc 1 24 0
	str	r4, [r5, r2]
	.loc 1 25 0
	sub	r3, r3, #16
	.loc 1 26 0
	add	r2, r2, #52
	.loc 1 28 0
	add	r1, r5, #200704
	.loc 1 25 0
	str	r4, [r5, r3]
	.loc 1 26 0
	str	r4, [r5, r2]
	.loc 1 27 0
	add	r3, r3, #296
	.loc 1 28 0
	add	r2, r2, #244
	ldr	r0, .L12+16
	.loc 1 27 0
	str	r4, [r5, r3]
	.loc 1 28 0
	str	r4, [r5, r2]
	add	r1, r1, #392
.L2:
.LVL2:
	.loc 1 31 0
	add	r4, r4, #1
	.loc 1 32 0
	mov	r3, #0	@ movhi
	.loc 1 31 0
	cmp	r4, r0
	.loc 1 32 0
	strh	r3, [r1], #2	@ movhi
	.loc 1 31 0
	bne	.L2
	add	r0, r5, #405504
	mov	r3, #0
.LVL3:
	add	r0, r0, #244
	mov	r2, r3
.LVL4:
.L4:
	.loc 1 34 0
	add	r3, r3, #1
	cmp	r3, #6
	.loc 1 35 0
	str	r2, [r0], #4
	.loc 1 34 0
	bne	.L4
	.loc 1 37 0
	ldmfd	sp!, {r4, r5, pc}
.L13:
	.align	2
.L12:
	.word	1570
	.word	405744
	.word	405716
	.word	405736
	.word	1571
.LFE2:
	.size	Scheduler_Initialize, .-Scheduler_Initialize
	.align	2
	.global	GetRegisteredFunctionName
	.type	GetRegisteredFunctionName, %function
GetRegisteredFunctionName:
.LFB4:
	.loc 1 48 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	str	lr, [sp, #-4]!
.LCFI1:
	.loc 1 50 0
	ldr	r3, .L25
	ldr	lr, [r0, r3]
	cmp	lr, #0
	beq	.L16
	.loc 1 51 0
	ldr	r3, .L25+4
	ldr	r2, [r0, r3]
	cmp	r1, r2
	addne	ip, r0, #405504
	moveq	r2, #0
.LVL6:
	addne	ip, ip, #272
	movne	r2, #0
	bne	.L18
	.loc 1 52 0
	ldr	r3, .L25+8
	add	r2, r0, r2, asl #3
.LVL7:
	ldr	r0, [r2, r3]
.LVL8:
	ldr	pc, [sp], #4
.LVL9:
.L18:
	.loc 1 50 0
	add	r2, r2, #1
	cmp	lr, r2
	beq	.L16
	.loc 1 51 0
	ldr	r3, [ip, #8]!
	cmp	r1, r3
	bne	.L18
	.loc 1 52 0
	ldr	r3, .L25+8
	add	r2, r0, r2, asl #3
.LVL10:
	ldr	r0, [r2, r3]
.LVL11:
	ldr	pc, [sp], #4
.LVL12:
.L16:
	.loc 1 50 0
	mov	r0, #0
.LVL13:
	ldr	pc, [sp], #4
.L26:
	.align	2
.L25:
	.word	405772
	.word	405776
	.word	405780
.LFE4:
	.size	GetRegisteredFunctionName, .-GetRegisteredFunctionName
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"There are too many debug function names registered."
	.ascii	"\000"
	.align	2
.LC1:
	.ascii	"Attempting to register the function named %s twice."
	.ascii	"\000"
	.text
	.align	2
	.global	DebugRegisterFunction
	.type	DebugRegisterFunction, %function
DebugRegisterFunction:
.LFB3:
	.loc 1 39 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI2:
	.loc 1 40 0
	ldr	r3, .L30
	.loc 1 41 0
	ldr	r5, .L30+4
	.loc 1 40 0
	ldr	r4, [r3, #0]
.LVL15:
	.loc 1 39 0
	ldr	sl, .L30+8
	.loc 1 41 0
	ldr	r2, [r4, r5]
	.loc 1 39 0
	mov	r6, r1
	.loc 1 41 0
	ldr	r1, .L30+12
.LVL16:
	.loc 1 39 0
.L29:
	add	sl, pc, sl
	mov	r7, r0
	.loc 1 41 0
	add	r1, sl, r1
	cmp	r2, #29
	movhi	r0, #0
	movls	r0, #1
.LVL17:
	bl	assert(PLT)
	.loc 1 42 0
	add	r0, r4, #20992
	mov	r1, r7
	add	r0, r0, #156
	bl	GetRegisteredFunctionName(PLT)
	ldr	r1, .L30+16
	mov	r2, r6
	add	r1, sl, r1
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	assertf(PLT)
	.loc 1 43 0
	ldr	r2, [r4, r5]
	.loc 1 44 0
	ldr	r3, .L30+20
	.loc 1 45 0
	add	r1, r2, #1
	.loc 1 43 0
	add	r2, r4, r2, asl #3
	.loc 1 44 0
	str	r6, [r2, r3]
	.loc 1 43 0
	sub	r3, r3, #4
	.loc 1 45 0
	str	r1, [r4, r5]
	.loc 1 43 0
	str	r7, [r2, r3]
	.loc 1 46 0
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L31:
	.align	2
.L30:
	.word	33403036
	.word	426920
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	426928
.LFE3:
	.size	DebugRegisterFunction, .-DebugRegisterFunction
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"User task id %d has stack underflow. SP is %x, but "
	.ascii	"shouldn't be more than %x.\000"
	.align	2
.LC3:
	.ascii	"User task id %d has stack overflow. SP is %x, but s"
	.ascii	"houldn't be less than %x.\000"
	.text
	.align	2
	.global	validate_stack_value
	.type	validate_stack_value, %function
validate_stack_value:
.LFB7:
	.loc 1 143 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL18:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI3:
	ldr	sl, .L35
	mov	r4, r0
.L34:
	add	sl, pc, sl
	sub	sp, sp, #4
.LCFI4:
.LVL19:
	.loc 1 144 0
	ldr	r0, [r0, #0]
.LVL20:
	bl	get_stack_base(PLT)
	.loc 1 146 0
	ldr	r3, [r4, #72]
	ldr	r1, .L35+4
	ldr	r2, [r4, #0]
	.loc 1 144 0
	mov	r5, r0
	.loc 1 146 0
	add	r1, sl, r1
	cmp	r0, r3
	movlt	r0, #0
	movge	r0, #1
	str	r5, [sp, #0]
	bl	assertf(PLT)
	.loc 1 153 0
	ldr	r3, [r4, #72]
	ldr	r1, .L35+8
	.loc 1 145 0
	sub	r5, r5, #65536
.LVL21:
	.loc 1 153 0
	ldr	r2, [r4, #0]
	cmp	r5, r3
	movgt	r0, #0
	movle	r0, #1
	add	r1, sl, r1
	str	r5, [sp, #0]
	bl	assertf(PLT)
	.loc 1 161 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, sl, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
.LFE7:
	.size	validate_stack_value, .-validate_stack_value
	.align	2
	.global	Scheduler_SaveCurrentTaskState
	.type	Scheduler_SaveCurrentTaskState, %function
Scheduler_SaveCurrentTaskState:
.LFB8:
	.loc 1 163 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL22:
	stmfd	sp!, {r4, r5, lr}
.LCFI5:
	.loc 1 163 0
	mov	r5, r0
	.loc 1 165 0
	ldr	r0, [r0, #4]
.LVL23:
	.loc 1 163 0
	mov	r4, r1
	.loc 1 165 0
	bl	validate_stack_value(PLT)
.LVL24:
	.loc 1 166 0
	ldr	r3, [r5, #4]
	.loc 1 168 0
	ldr	r2, [r4, #12]
	.loc 1 166 0
	ldr	r0, [r4, #0]
	.loc 1 168 0
	str	r2, [r3, #84]
	.loc 1 169 0
	ldr	r1, [r4, #20]
	.loc 1 167 0
	ldr	r2, [r4, #4]
	.loc 1 169 0
	str	r1, [r3, #92]
	.loc 1 166 0
	str	r0, [r3, #72]
	.loc 1 167 0
	str	r2, [r3, #76]
	.loc 1 170 0
	ldmfd	sp!, {r4, r5, pc}
.LFE8:
	.size	Scheduler_SaveCurrentTaskState, .-Scheduler_SaveCurrentTaskState
	.align	2
	.global	Scheduler_IsInitedTid
	.type	Scheduler_IsInitedTid, %function
Scheduler_IsInitedTid:
.LFB11:
	.loc 1 215 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL25:
	stmfd	sp!, {r4, r5, lr}
.LCFI6:
	.loc 1 215 0
	mov	r5, r0
	.loc 1 216 0
	mov	r0, r1
.LVL26:
	.loc 1 215 0
	mov	r4, r1
	.loc 1 216 0
	bl	is_tid_in_range(PLT)
.LVL27:
	cmp	r0, #0
	.loc 1 220 0
	add	r2, r5, r4, asl #1
	.loc 1 216 0
	beq	.L40
	.loc 1 220 0
	ldr	r3, .L45
	mov	r0, #1
	ldrsh	r2, [r2, r3]
	cmp	r2, #0
	ldmnefd	sp!, {r4, r5, pc}
.L40:
	mov	r0, #0
	.loc 1 225 0
	ldmfd	sp!, {r4, r5, pc}
.L46:
	.align	2
.L45:
	.word	201096
.LFE11:
	.size	Scheduler_IsInitedTid, .-Scheduler_IsInitedTid
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"\033[1mScheduler_PrintTDCounts\033[0m\012\000"
	.align	2
.LC5:
	.ascii	" NUM_TASKS = %d\012\000"
	.align	2
.LC6:
	.ascii	" 0. READY = %d\012\000"
	.align	2
.LC7:
	.ascii	" 1. ACTIVE = %d\012\000"
	.align	2
.LC8:
	.ascii	" 2. ZOMBIE = %d\012\000"
	.align	2
.LC9:
	.ascii	" 3. SEND_BLOCKED = %d\012\000"
	.align	2
.LC10:
	.ascii	" 4. RECEIVE_BLOCKED = %d\012\000"
	.align	2
.LC11:
	.ascii	" 5. REPLY_BLOCKED = %d\012\000"
	.align	2
.LC12:
	.ascii	" 6. EVENT_BLOCKED = %d\012\000"
	.align	2
.LC13:
	.ascii	" TDs: \012\000"
	.global	__floatsisf
	.global	__addsf3
	.global	__divsf3
	.global	__mulsf3
	.global	__fixsfsi
	.align	2
.LC14:
	.ascii	" %d: %s  (%s->%d) P=%d C=%d (%d%%) T=%d\012\000"
	.align	2
.LC15:
	.ascii	" %d: %s  (%x->%d) P=%d C=%d (%d%%) T=%d\012\000"
	.align	2
.LC16:
	.ascii	"    End Print\012\000"
	.text
	.align	2
	.global	Scheduler_PrintTDCounts
	.type	Scheduler_PrintTDCounts, %function
Scheduler_PrintTDCounts:
.LFB14:
	.loc 1 338 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL28:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI7:
	ldr	sl, .L64
	mov	r8, r0
	.loc 1 339 0
	ldr	r0, .L64+4
.LVL29:
	.loc 1 338 0
.L61:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI8:
.LVL30:
	.loc 1 339 0
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 340 0
	ldr	r3, .L64+8
	ldr	r0, .L64+12
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 341 0
	ldr	r3, .L64+16
	ldr	r0, .L64+20
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 342 0
	ldr	r3, .L64+24
	ldr	r0, .L64+28
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 343 0
	ldr	r3, .L64+32
	ldr	r0, .L64+36
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 344 0
	ldr	r3, .L64+40
	ldr	r0, .L64+44
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 345 0
	ldr	r3, .L64+48
	ldr	r0, .L64+52
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 346 0
	ldr	r3, .L64+56
	ldr	r0, .L64+60
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 347 0
	ldr	r3, .L64+64
	ldr	r0, .L64+68
	ldr	r1, [r8, r3]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 349 0
	ldr	r0, .L64+72
	ldr	r1, .L64+76
	add	r0, sl, r0
	str	r1, [sp, #28]
	bl	robprintfbusy(PLT)
	ldr	r3, .L64+80
	mov	r5, r8
	str	r3, [sp, #20]
	ldr	r3, .L64+84
	mov	r6, #0
.LVL31:
	ldr	r3, [sl, r3]
	str	r3, [sp, #24]
	b	.L48
.LVL32:
.L49:
	.loc 1 352 0
	ldr	r3, .L64+88
	add	r6, r6, #1
	cmp	r6, r3
	add	r5, r5, #128
	beq	.L62
.L48:
	.loc 1 353 0
	mov	r0, r8
	mov	r1, r6
	bl	Scheduler_IsInitedTid(PLT)
	cmp	r0, #0
	beq	.L49
.LBB2:
	.loc 1 354 0
	ldr	r1, [r5, #88]
	mov	r0, r8
	bl	GetRegisteredFunctionName(PLT)
	.loc 1 355 0
	ldr	r7, [r5, #132]
.LBE2:
	.loc 1 338 0
	add	r1, r5, #88
.LBB3:
	.loc 1 355 0
	cmp	r7, #0
	.loc 1 354 0
	mov	fp, r0
.LBE3:
	.loc 1 338 0
	str	r1, [sp, #32]
.LBB4:
	.loc 1 355 0
	blt	.L52
	mov	r0, r7
	bl	__floatsisf(PLT)
	ldr	r3, .L64+92
	mov	r4, r0
	ldr	r3, [r8, r3]
	cmp	r3, #0
	blt	.L54
.L63:
	mov	r0, r3
	bl	__floatsisf(PLT)
.L53:
	mov	r1, r0
	mov	r0, r4
	bl	__divsf3(PLT)
	ldr	r1, .L64+96
	bl	__mulsf3(PLT)
	bl	__fixsfsi(PLT)
	.loc 1 356 0
	cmp	fp, #0
	.loc 1 355 0
	mov	r9, r0
	.loc 1 356 0
	beq	.L55
	.loc 1 357 0
	ldr	r2, [r5, #12]
	ldr	r3, [sp, #24]
	ldr	r1, [sp, #28]
	ldr	lr, [r5, #120]
	ldr	ip, [r5, #16]
	ldr	r4, [r5, #128]
	add	r2, r2, r2, asl #2
	add	r2, r3, r2, asl #2
	add	r0, sl, r1
	mov	r3, fp
	mov	r1, r6
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r7, [sp, #8]
	str	r9, [sp, #12]
	str	r4, [sp, #16]
	bl	robprintfbusy(PLT)
.LBE4:
	.loc 1 352 0
	ldr	r3, .L64+88
	add	r6, r6, #1
	cmp	r6, r3
	add	r5, r5, #128
	bne	.L48
.L62:
	.loc 1 384 0
	ldr	r0, .L64+100
	add	r0, sl, r0
	.loc 1 385 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 384 0
	b	robprintfbusy(PLT)
.L52:
.LBB5:
	.loc 1 355 0
	and	r0, r7, #1
	orr	r0, r0, r7, lsr #1
	bl	__floatsisf(PLT)
	mov	r1, r0
	bl	__addsf3(PLT)
	ldr	r3, .L64+92
	mov	r4, r0
	ldr	r3, [r8, r3]
	cmp	r3, #0
	bge	.L63
.L54:
	and	r0, r3, #1
	orr	r0, r0, r3, lsr #1
	bl	__floatsisf(PLT)
	mov	r1, r0
	bl	__addsf3(PLT)
	b	.L53
.L55:
	.loc 1 369 0
	ldr	r1, [sp, #32]
	ldr	r2, [r5, #12]
	ldr	r3, [r1, #0]
	ldr	r1, [sp, #24]
	add	r2, r2, r2, asl #2
	add	r2, r1, r2, asl #2
	ldr	r1, [sp, #20]
	ldr	ip, [r5, #120]
	ldr	lr, [r5, #16]
	ldr	r4, [r5, #128]
	add	r0, sl, r1
	mov	r1, r6
	stmia	sp, {ip, lr}	@ phole stm
	str	r7, [sp, #8]
	str	r9, [sp, #12]
	str	r4, [sp, #16]
	bl	robprintfbusy(PLT)
	b	.L49
.L65:
	.align	2
.L64:
	.word	_GLOBAL_OFFSET_TABLE_-(.L61+8)
	.word	.LC4(GOTOFF)
	.word	405744
	.word	.LC5(GOTOFF)
	.word	405716
	.word	.LC6(GOTOFF)
	.word	405720
	.word	.LC7(GOTOFF)
	.word	405724
	.word	.LC8(GOTOFF)
	.word	405728
	.word	.LC9(GOTOFF)
	.word	405736
	.word	.LC10(GOTOFF)
	.word	405732
	.word	.LC11(GOTOFF)
	.word	405740
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	TASK_STATE_NAMES(GOT)
	.word	1571
	.word	406016
	.word	1120403456
	.word	.LC16(GOTOFF)
.LBE5:
.LFE14:
	.size	Scheduler_PrintTDCounts, .-Scheduler_PrintTDCounts
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"\033[0;1m ***** WATCHDOG *****\033[0m\012\000"
	.text
	.align	2
	.global	Scheduler_SetNextTaskState
	.type	Scheduler_SetNextTaskState, %function
Scheduler_SetNextTaskState:
.LFB9:
	.loc 1 172 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI9:
	.loc 1 173 0
	ldr	ip, .L79
	.loc 1 175 0
	ldr	r6, [r0, #4]
	.loc 1 173 0
	ldr	r3, [r0, ip]
	.loc 1 172 0
	ldr	sl, .L79+4
	.loc 1 173 0
	add	r3, r3, #1
	.loc 1 175 0
	cmp	r6, #0
	.loc 1 172 0
.L76:
	add	sl, pc, sl
	mov	r7, r0
	.loc 1 173 0
	str	r3, [r0, ip]
	.loc 1 172 0
	mov	r5, r1
	.loc 1 175 0
	beq	.L77
.LVL34:
	.loc 1 185 0
	ldr	r3, [r6, #88]
	.loc 1 191 0
	ldr	r0, [r6, #80]
.LVL35:
	.loc 1 185 0
	str	r3, [r1, #8]
	.loc 1 186 0
	ldr	r2, [r6, #84]
	.loc 1 183 0
	ldr	lr, [r6, #72]
	.loc 1 186 0
	str	r2, [r1, #12]
	.loc 1 187 0
	ldr	r3, [r6, #92]
	.loc 1 184 0
	ldr	r4, [r6, #76]
	.loc 1 187 0
	str	r3, [r1, #20]
	.loc 1 191 0
	ldr	r3, .L79+8
	.loc 1 189 0
	ldr	r1, [r6, #124]
	.loc 1 191 0
	ldr	r2, [sl, r3]
	.loc 1 188 0
	ldr	ip, [r7, ip]
	.loc 1 189 0
	add	r1, r1, #1
	.loc 1 191 0
	cmp	r0, r2
	.loc 1 183 0
	str	lr, [r5, #0]
	.loc 1 184 0
	str	r4, [r5, #4]
	.loc 1 188 0
	str	ip, [r6, #120]
	.loc 1 189 0
	str	r1, [r6, #124]
	.loc 1 191 0
	beq	.L78
	.loc 1 198 0
	ldr	r3, .L79+12
	.loc 1 200 0
	ldr	r1, .L79+16
	.loc 1 198 0
	ldr	r2, [r7, r3]
	add	r2, r2, #1
	.loc 1 200 0
	cmp	r2, r1
	.loc 1 198 0
	str	r2, [r7, r3]
	.loc 1 200 0
	ldmlsfd	sp!, {r4, r5, r6, r7, sl, pc}
	.loc 1 201 0
	ldr	r3, .L79+20
	add	r4, sl, r3
	mov	r0, r4
	bl	robprintfbusy(PLT)
	.loc 1 202 0
	mov	r0, r7
	bl	Scheduler_PrintTDCounts(PLT)
	.loc 1 203 0
	mov	r0, r4
	bl	robprintfbusy(PLT)
.L74:
	b	.L74
.L78:
	.loc 1 194 0
	ldr	r3, .L79+24
	ldr	r2, .L79+28
	ldr	r1, .L79+32
	ldr	r0, [r7, r3]
	ldr	r3, [r7, r2]
	ldr	ip, [r7, r1]
	add	r2, r2, #16
	add	r3, r3, r0
	ldr	lr, [r7, r2]
	sub	r2, r2, #4
	ldr	r1, [r7, r2]
	add	r3, r3, ip
	add	r3, r3, lr
	add	r3, r3, r1
	adds	r0, r0, r3
	.loc 1 192 0
	ldr	r3, .L79+12
	mov	r2, #0
	str	r2, [r7, r3]
	.loc 1 194 0
	.loc 1 195 0
	ldreq	r3, .L79+36
	ldreq	r2, [sl, r3]
	streqh	r0, [r2, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.LVL36:
.L77:
	.loc 1 177 0
	ldr	r3, .L79+40
	.loc 1 178 0
	ldr	r2, .L79+44
	.loc 1 177 0
	ldr	r0, [r1, r3]
.LVL37:
	.loc 1 180 0
	add	r3, r3, #8
	.loc 1 178 0
	ldr	r1, [r1, r2]
	.loc 1 180 0
	ldr	r2, [r5, r3]
	.loc 1 181 0
	str	r6, [r5, #20]
	.loc 1 177 0
	stmia	r5, {r0, r1}	@ phole stm
	.loc 1 180 0
	str	r2, [r5, #12]
	.loc 1 179 0
	str	r6, [r5, #8]
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L80:
	.align	2
.L79:
	.word	406016
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	SchedulerWatchdogTask_Start(GOT)
	.word	406020
	.word	1000000
	.word	.LC17(GOTOFF)
	.word	405740
	.word	405716
	.word	405736
	.word	SchedulerWatchdogEnabled(GOT)
	.word	427172
	.word	427176
.LFE9:
	.size	Scheduler_SetNextTaskState, .-Scheduler_SetNextTaskState
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"priority queue full\000"
	.align	2
.LC19:
	.ascii	"priority queue wrong priority\000"
	.text
	.align	2
	.global	safely_add_task_to_priority_queue
	.type	safely_add_task_to_priority_queue, %function
safely_add_task_to_priority_queue:
.LFB16:
	.loc 1 398 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL38:
	stmfd	sp!, {r4, sl, lr}
.LCFI10:
	ldr	sl, .L84
.L83:
	add	sl, pc, sl
	.loc 1 399 0
	bl	PriorityQueue_Put(PLT)
.LVL39:
	.loc 1 400 0
	ldr	r1, .L84+4
	.loc 1 399 0
	mov	r4, r0
.LVL40:
	.loc 1 400 0
	add	r1, sl, r1
	adds	r0, r0, #1
	movne	r0, #1
	bl	assert(PLT)
	.loc 1 401 0
	ldr	r1, .L84+8
	adds	r0, r4, #2
	movne	r0, #1
	add	r1, sl, r1
	.loc 1 402 0
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 401 0
	b	assert(PLT)
.L85:
	.align	2
.L84:
	.word	_GLOBAL_OFFSET_TABLE_-(.L83+8)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
.LFE16:
	.size	safely_add_task_to_priority_queue, .-safely_add_task_to_priority_queue
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"A ready task is becomming %s. task: %d\012\000"
	.align	2
.LC21:
	.ascii	"Scheduler_ChangePriority: invalid old state\000"
	.align	2
.LC22:
	.ascii	"We are send blocking an %s task: %d\012\000"
	.align	2
.LC23:
	.ascii	"We are reply blocking an %s task: %d\012\000"
	.align	2
.LC24:
	.ascii	"We are receive blocking an %s task: %d\012\000"
	.align	2
.LC25:
	.ascii	"We are event blocking an %s task: %d\012\000"
	.align	2
.LC26:
	.ascii	"Scheduler_ChangePriority: invalid new state\000"
	.text
	.align	2
	.global	Scheduler_ChangeTDState
	.type	Scheduler_ChangeTDState, %function
Scheduler_ChangeTDState:
.LFB13:
	.loc 1 262 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL41:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI11:
	ldr	sl, .L121
	.loc 1 263 0
	ldr	r3, [r1, #4]
	.loc 1 262 0
.L118:
	add	sl, pc, sl
	mov	r5, r1
	.loc 1 262 0
	mov	r4, r0
	mov	r6, r2
	.loc 1 263 0
	cmp	r3, #6
	addls	pc, pc, r3, asl #2
	b	.L87
	.p2align 2
.L95:
	b	.L88
	b	.L89
	b	.L90
	b	.L91
	b	.L92
	b	.L93
	b	.L94
.LVL42:
.L87:
	.loc 1 287 0
	ldr	r1, .L121+4
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.LVL43:
.L96:
	.loc 1 291 0
	cmp	r6, #6
	addls	pc, pc, r6, asl #2
	b	.L97
	.p2align 2
.L105:
	b	.L98
	b	.L99
	b	.L100
	b	.L101
	b	.L102
	b	.L103
	b	.L104
.L97:
	.loc 1 330 0
	ldr	r1, .L121+8
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL44:
.L98:
	.loc 1 293 0
	ldr	r3, [r5, #4]
	cmp	r3, #0
	bne	.L119
.L106:
	.loc 1 297 0
	ldr	r2, .L121+12
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 297 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L99:
	.loc 1 300 0
	ldr	r2, .L121+16
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 300 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L100:
	.loc 1 327 0
	ldr	r2, .L121+20
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 327 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L101:
	.loc 1 303 0
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L109
	.loc 1 304 0
	add	r1, r3, r3, asl #2
	ldr	r3, .L121+24
	mov	r0, #0
	ldr	r2, [sl, r3]
	ldr	r3, [r5, #0]
	add	r2, r2, r1, asl #2
	ldr	r1, .L121+28
	add	r1, sl, r1
	bl	assertf(PLT)
.LVL45:
.L109:
	.loc 1 306 0
	ldr	r2, .L121+32
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 306 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L102:
	.loc 1 315 0
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L113
	.loc 1 316 0
	add	r1, r3, r3, asl #2
	ldr	r3, .L121+24
	mov	r0, #0
	ldr	r2, [sl, r3]
	ldr	r3, [r5, #0]
	add	r2, r2, r1, asl #2
	ldr	r1, .L121+36
	add	r1, sl, r1
	bl	assertf(PLT)
.LVL46:
.L113:
	.loc 1 318 0
	ldr	r2, .L121+40
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 318 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L103:
	.loc 1 309 0
	ldr	r3, [r5, #4]
	cmp	r3, #4
	cmpne	r3, #1
	bne	.L120
.L111:
	.loc 1 312 0
	ldr	r2, .L121+44
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 312 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L104:
	.loc 1 321 0
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L115
	.loc 1 322 0
	add	r1, r3, r3, asl #2
	ldr	r3, .L121+24
	mov	r0, #0
	ldr	r2, [sl, r3]
	ldr	r3, [r5, #0]
	add	r2, r2, r1, asl #2
	ldr	r1, .L121+48
	add	r1, sl, r1
	bl	assertf(PLT)
.LVL47:
.L115:
	.loc 1 324 0
	ldr	r2, .L121+52
	.loc 1 334 0
	str	r6, [r5, #4]
	.loc 1 324 0
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 335 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL48:
.L94:
	.loc 1 281 0
	ldr	r2, .L121+52
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL49:
.L93:
	.loc 1 275 0
	ldr	r2, .L121+44
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL50:
.L92:
	.loc 1 278 0
	ldr	r2, .L121+40
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL51:
.L91:
	.loc 1 272 0
	ldr	r2, .L121+32
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL52:
.L90:
	.loc 1 284 0
	ldr	r2, .L121+20
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL53:
.L89:
	.loc 1 269 0
	ldr	r2, .L121+16
	ldr	r3, [r0, r2]
	sub	r3, r3, #1
	str	r3, [r0, r2]
	b	.L96
.LVL54:
.L88:
	.loc 1 265 0
	ldr	r3, .L121+24
	add	r1, r2, r2, asl #2
	cmp	r2, #1
	movne	r0, #0
	moveq	r0, #1
	ldr	r2, [sl, r3]
	ldr	r3, [r5, #0]
	add	r2, r2, r1, asl #2
	ldr	r1, .L121+56
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 266 0
	ldr	r2, .L121+12
	ldr	r3, [r4, r2]
	sub	r3, r3, #1
	str	r3, [r4, r2]
	b	.L96
.LVL55:
.L119:
	.loc 1 295 0
	add	r0, r4, #203776
	add	r0, r0, #464
	mov	r1, r5
	ldr	r2, [r5, #8]
	bl	safely_add_task_to_priority_queue(PLT)
	b	.L106
.LVL56:
.L120:
	.loc 1 310 0
	add	r1, r3, r3, asl #2
	ldr	r3, .L121+24
	mov	r0, #0
	ldr	r2, [sl, r3]
	ldr	r3, [r5, #0]
	add	r2, r2, r1, asl #2
	ldr	r1, .L121+60
	add	r1, sl, r1
	bl	assertf(PLT)
	b	.L111
.L122:
	.align	2
.L121:
	.word	_GLOBAL_OFFSET_TABLE_-(.L118+8)
	.word	.LC21(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	405716
	.word	405720
	.word	405724
	.word	TASK_STATE_NAMES(GOT)
	.word	.LC22(GOTOFF)
	.word	405728
	.word	.LC24(GOTOFF)
	.word	405736
	.word	405732
	.word	.LC25(GOTOFF)
	.word	405740
	.word	.LC20(GOTOFF)
	.word	.LC23(GOTOFF)
.LFE13:
	.size	Scheduler_ChangeTDState, .-Scheduler_ChangeTDState
	.section	.rodata.str1.4
	.align	2
.LC27:
	.ascii	"Lost transmit event so outputserver will deadlock.\000"
	.text
	.align	2
	.global	Scheduler_UnblockTasksOnEvent
	.type	Scheduler_UnblockTasksOnEvent, %function
Scheduler_UnblockTasksOnEvent:
.LFB15:
	.loc 1 387 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL57:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI12:
	mov	ip, r1
	.loc 1 388 0
	ldr	r5, .L129
	add	r4, r0, ip, asl #2
	.loc 1 387 0
	ldr	sl, .L129+4
	.loc 1 388 0
	ldr	r3, [r4, r5]
.LVL58:
	.loc 1 390 0
	ldr	r1, .L129+8
.LVL59:
	.loc 1 393 0
	mov	r2, #0
	.loc 1 387 0
.L128:
	add	sl, pc, sl
	.loc 1 389 0
	cmp	r3, r2
	.loc 1 390 0
	add	r1, sl, r1
	.loc 1 393 0
	add	lr, r0, #8
	.loc 1 389 0
	bne	.L124
	.loc 1 390 0
	subs	r0, ip, #3
	movne	r0, #1
.LVL60:
	.loc 1 396 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 390 0
	b	assert(PLT)
.LVL61:
.L124:
	.loc 1 393 0
	add	r1, lr, r3, asl #7
	bl	Scheduler_ChangeTDState(PLT)
.LVL62:
	.loc 1 394 0
	mov	r3, #0
	str	r3, [r4, r5]
	.loc 1 396 0
	ldmfd	sp!, {r4, r5, sl, pc}
.L130:
	.align	2
.L129:
	.word	405748
	.word	_GLOBAL_OFFSET_TABLE_-(.L128+8)
	.word	.LC27(GOTOFF)
.LFE15:
	.size	Scheduler_UnblockTasksOnEvent, .-Scheduler_UnblockTasksOnEvent
	.section	.rodata.str1.4
	.align	2
.LC28:
	.ascii	"Task %d is %s but it is in the ready queue.\012\000"
	.align	2
.LC29:
	.ascii	"Unknown task state: %d for tid=%d.\000"
	.align	2
.LC30:
	.ascii	"Scheduler ran more than %d times, probably a bug.\000"
	.align	2
.LC31:
	.ascii	"\033[44;37mNo tasks in queue!\033[0m\012\000"
	.align	2
.LC32:
	.ascii	"Number of ready tasks is not zero. Count=%d\000"
	.align	2
.LC33:
	.ascii	"Number of active tasks is not zero. Count=%d\000"
	.text
	.align	2
	.global	Scheduler_ScheduleNextTask
	.type	Scheduler_ScheduleNextTask, %function
Scheduler_ScheduleNextTask:
.LFB6:
	.loc 1 72 0
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL63:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI13:
	sub	sp, sp, #4
.LCFI14:
.LVL64:
	.loc 1 74 0
	mov	r1, #0
.LVL65:
	.loc 1 72 0
	ldr	sl, .L152
	.loc 1 74 0
	add	r9, sp, #4
	add	r7, r0, #203776
	ldr	fp, .L152+4
	.loc 1 72 0
	mov	r8, r0
	.loc 1 74 0
	str	r1, [r9, #-4]!
	add	r7, r7, #464
	mov	r6, r1
.LVL66:
	.loc 1 72 0
.L149:
	add	sl, pc, sl
.LVL67:
.L132:
	.loc 1 74 0
	mov	r5, #0
	b	.L133
.LVL68:
.L139:
.LBB6:
.LBB7:
	.loc 1 89 0
	cmp	r3, #2
	.loc 1 92 0
	mov	r1, r4
	mov	r2, r3
	mov	r0, r8
	.loc 1 89 0
	beq	.L150
.LVL69:
	.loc 1 94 0
	ldr	r1, .L152+8
.LVL70:
	mov	r2, r3
	add	r1, sl, r1
	ldr	r3, [r4, #0]
	mov	r0, #0
.LVL71:
	bl	assertf(PLT)
.L141:
	.loc 1 97 0
	ldr	r1, .L152+12
	ldr	r0, .L152+16
	.loc 1 96 0
	add	r6, r6, #1
	.loc 1 97 0
	cmp	r6, r0
	movgt	r0, #0
	movle	r0, #1
	ldr	r2, .L152+20
	add	r1, sl, r1
	bl	assertf(PLT)
.LBE7:
	.loc 1 78 0
	ldr	r3, .L152+24
	add	r5, r5, #1
	cmp	r5, r3
	beq	.L134
	ldr	r1, [sp, #0]
.LVL72:
.L133:
.LBB8:
	.loc 1 79 0
	mov	r2, r9
	mov	r0, r7
	bl	PriorityQueue_GetLower(PLT)
.LVL73:
	.loc 1 81 0
	subs	r4, r0, #0
	.loc 1 88 0
	add	r1, sl, fp
	mov	r0, #0
	.loc 1 81 0
	beq	.L134
	.loc 1 84 0
	ldr	r3, [r4, #4]
	cmp	r3, r0
	.loc 1 88 0
	add	lr, r3, r3, asl #2
	.loc 1 87 0
	sub	r2, r3, #3
	.loc 1 84 0
	beq	.L151
	.loc 1 87 0
	cmp	r2, #3
	bhi	.L139
	.loc 1 88 0
	ldr	ip, .L152+28
	ldr	r2, [r4, #0]
	ldr	r3, [sl, ip]
	add	r3, r3, lr, asl #2
	bl	assertf(PLT)
	b	.L141
.LVL74:
.L150:
	.loc 1 92 0
	bl	Scheduler_ChangeTDState(PLT)
.LVL75:
	b	.L141
.L134:
.LBE8:
	.loc 1 100 0
	ldr	r1, [sp, #0]
	add	r3, r1, #1
.LBE6:
	.loc 1 76 0
	cmp	r3, #31
.LBB9:
	.loc 1 100 0
	mov	r1, r3
	str	r3, [sp, #0]
.LBE9:
	.loc 1 76 0
	ble	.L132
	.loc 1 103 0
	ldr	r0, .L152+32
	.loc 1 116 0
	mov	r4, #0
	.loc 1 103 0
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 106 0
	bl	IRQ_ClearTimerInterrupt(PLT)
	.loc 1 107 0
	bl	IRQ_DisableTimerVIC2(PLT)
	.loc 1 108 0
	bl	IRQ_DisableUARTInterrupts(PLT)
	.loc 1 111 0
	mov	r0, r8
	bl	Scheduler_PrintTDCounts(PLT)
	.loc 1 114 0
	ldr	r3, .L152+36
	ldr	r1, .L152+40
	ldr	r2, [r8, r3]
	add	r1, sl, r1
.LVL76:
	cmp	r2, r4
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
	.loc 1 116 0
	ldr	r3, .L152+44
	ldr	r1, .L152+48
	ldr	r2, [r8, r3]
	add	r1, sl, r1
	cmp	r2, r4
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
	b	.L138
.LVL77:
.L151:
.LBB10:
.LBB11:
	.loc 1 85 0
	mov	r0, r8
	mov	r1, r4
	mov	r2, #1
	bl	Scheduler_ChangeTDState(PLT)
.L138:
.LBE11:
.LBE10:
	.loc 1 141 0
	mov	r0, r4
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L153:
	.align	2
.L152:
	.word	_GLOBAL_OFFSET_TABLE_-(.L149+8)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	50303
	.word	50304
	.word	1572
	.word	TASK_STATE_NAMES(GOT)
	.word	.LC31(GOTOFF)
	.word	405716
	.word	.LC32(GOTOFF)
	.word	405720
	.word	.LC33(GOTOFF)
.LFE6:
	.size	Scheduler_ScheduleNextTask, .-Scheduler_ScheduleNextTask
	.align	2
	.global	Scheduler_ScheduleAndSetNextTaskState
	.type	Scheduler_ScheduleAndSetNextTaskState, %function
Scheduler_ScheduleAndSetNextTaskState:
.LFB10:
	.loc 1 210 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL78:
	stmfd	sp!, {r4, r5, lr}
.LCFI15:
	.loc 1 210 0
	mov	r5, r0
	mov	r4, r1
	.loc 1 211 0
	bl	Scheduler_ScheduleNextTask(PLT)
.LVL79:
	.loc 1 212 0
	mov	r1, r4
	.loc 1 211 0
	str	r0, [r5, #4]
	.loc 1 212 0
	mov	r0, r5
	.loc 1 213 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 212 0
	b	Scheduler_SetNextTaskState(PLT)
.LFE10:
	.size	Scheduler_ScheduleAndSetNextTaskState, .-Scheduler_ScheduleAndSetNextTaskState
	.section	.rodata.str1.4
	.align	2
.LC34:
	.ascii	"out of tds\000"
	.align	2
.LC35:
	.ascii	"invalid priority\000"
	.align	2
.LC36:
	.ascii	"Attempted to create a new task, but this task's sta"
	.ascii	"ck space goes down to %x, but the kernel ends at %x"
	.ascii	".  This means we the stack will overwrite the kerne"
	.ascii	"l.  There are currently %d tasks.\012\000"
	.text
	.align	2
	.global	Scheduler_CreateAndScheduleNewTask
	.type	Scheduler_CreateAndScheduleNewTask, %function
Scheduler_CreateAndScheduleNewTask:
.LFB12:
	.loc 1 227 0
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL80:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI16:
	.loc 1 230 0
	ldr	fp, .L165
	.loc 1 227 0
	mov	r8, r0
	ldr	sl, .L165+4
	.loc 1 230 0
	ldr	lr, [r8, fp]
	ldr	ip, [r8, #0]
	.loc 1 227 0
	mov	r7, r1
	.loc 1 231 0
	ldr	r1, .L165+8
.LVL81:
	.loc 1 227 0
.L163:
	add	sl, pc, sl
	.loc 1 230 0
	cmp	lr, ip
	.loc 1 227 0
	sub	sp, sp, #20
.LCFI17:
.LVL82:
	.loc 1 231 0
	mov	r0, #0
.LVL83:
	mvn	r4, #1
.LVL84:
	.loc 1 227 0
	mov	r9, r2
	.loc 1 231 0
	add	r1, sl, r1
	.loc 1 227 0
	mov	r6, r3
	.loc 1 230 0
	bcs	.L164
.LVL85:
	.loc 1 233 0
	mov	r0, r2
	bl	Queue_IsValidPriority(PLT)
	.loc 1 234 0
	ldr	r1, .L165+12
.LBB12:
	.loc 1 240 0
	add	r2, r8, #8
.LBE12:
	.loc 1 233 0
	cmp	r0, #0
.LBB13:
	.loc 1 240 0
	str	r2, [sp, #12]
.LBE13:
	.loc 1 234 0
	add	r1, sl, r1
	mvn	r4, #0
	.loc 1 233 0
	bne	.L160
.LVL86:
.L164:
	.loc 1 234 0
	bl	assert(PLT)
.LVL87:
.L159:
	.loc 1 254 0
	mov	r0, r8
	mov	r1, r7
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 256 0
	ldr	r3, [r8, #4]
	.loc 1 257 0
	mov	r0, r8
	mov	r1, r3
	mov	r2, #0
	.loc 1 256 0
	str	r4, [r3, #88]
	.loc 1 257 0
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 259 0
	mov	r0, r8
	mov	r1, r7
	.loc 1 260 0
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 259 0
	b	Scheduler_ScheduleAndSetNextTaskState(PLT)
.LVL88:
.L160:
.LBB14:
	.loc 1 238 0
	ldr	r3, [r8, #4]
	.loc 1 237 0
	ldr	r4, [r8, fp]
.LVL89:
	.loc 1 238 0
	ldr	r3, [r3, #0]
	.loc 1 241 0
	mov	r0, r4
	.loc 1 238 0
	str	r3, [sp, #16]
.LVL90:
	.loc 1 241 0
	bl	get_stack_base(PLT)
	.loc 1 242 0
	ldr	r1, .L165+16
	.loc 1 241 0
	sub	r2, r0, #65280
.LVL91:
	.loc 1 242 0
	ldr	r3, [sl, r1]
	ldr	r1, .L165+20
	ldr	ip, [r8, fp]
	.loc 1 241 0
	sub	r2, r2, #252
	.loc 1 242 0
	cmp	r2, r3
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	str	ip, [sp, #0]
	bl	assertf(PLT)
.LVL92:
	.loc 1 244 0
	mov	r0, r4
	bl	get_stack_base(PLT)
	.loc 1 240 0
	ldr	r2, [sp, #12]
	mov	r3, r4, asl #7
	add	r5, r2, r3
.LVL93:
	.loc 1 244 0
	mov	r1, r4
	.loc 1 240 0
	str	r3, [sp, #8]
	.loc 1 244 0
	str	r0, [sp, #0]
	ldr	r3, [sp, #16]
	mov	r0, r5
	mov	r2, r9
	str	r6, [sp, #4]
	bl	TD_Initialize(PLT)
	.loc 1 247 0
	ldr	ip, .L165+24
	.loc 1 245 0
	ldr	r2, [r8, fp]
	.loc 1 247 0
	ldr	r1, [r8, ip]
	.loc 1 246 0
	ldr	r3, .L165+28
	.loc 1 245 0
	add	r2, r2, #1
	.loc 1 247 0
	add	r1, r1, #1
	.loc 1 246 0
	add	r4, r8, r4, asl #1
.LVL94:
	.loc 1 245 0
	str	r2, [r8, fp]
	.loc 1 249 0
	add	r0, r8, #203776
	.loc 1 246 0
	mov	r2, #1	@ movhi
	strh	r2, [r4, r3]	@ movhi
	.loc 1 247 0
	str	r1, [r8, ip]
	.loc 1 249 0
	mov	r2, r9
	add	r0, r0, #464
	mov	r1, r5
	bl	safely_add_task_to_priority_queue(PLT)
	.loc 1 251 0
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #8]
	ldr	r4, [r3, r2]
.LVL95:
	b	.L159
.L166:
	.align	2
.L165:
	.word	405744
	.word	_GLOBAL_OFFSET_TABLE_-(.L163+8)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	_EndOfProgram(GOT)
	.word	.LC36(GOTOFF)
	.word	405716
	.word	201096
.LBE14:
.LFE12:
	.size	Scheduler_CreateAndScheduleNewTask, .-Scheduler_CreateAndScheduleNewTask
	.align	2
	.global	Scheduler_InitAndSetKernelTask
	.type	Scheduler_InitAndSetKernelTask, %function
Scheduler_InitAndSetKernelTask:
.LFB5:
	.loc 1 57 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL96:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI18:
	ldr	sl, .L170
	.loc 1 58 0
	add	r6, r0, #8
.LVL97:
	.loc 1 57 0
	mov	r5, r0
	sub	sp, sp, #8
.LCFI19:
.LVL98:
.L169:
	add	sl, pc, sl
	.loc 1 60 0
	str	r6, [r0, #4]
	.loc 1 64 0
	mov	r0, #0
.LVL99:
	.loc 1 57 0
	mov	r7, r1
	.loc 1 64 0
	bl	get_stack_base(PLT)
.LVL100:
	.loc 1 64 0
	ldr	ip, .L170+4
	str	r0, [sp, #0]
	ldr	r4, [sl, ip]
	mov	r0, r6
	mov	r1, #0
	mov	r2, #31
	mov	r3, #99
	str	r4, [sp, #4]
	bl	TD_Initialize(PLT)
	.loc 1 67 0
	ldr	ip, .L170+8
	.loc 1 66 0
	ldr	r1, .L170+12
	.loc 1 67 0
	ldr	r2, [r5, ip]
	.loc 1 66 0
	ldr	r3, [r5, r1]
	.loc 1 67 0
	add	r2, r2, #1
	.loc 1 66 0
	add	r3, r3, #1
	.loc 1 68 0
	add	r0, r5, #203776
	.loc 1 66 0
	str	r3, [r5, r1]
	.loc 1 67 0
	str	r2, [r5, ip]
	.loc 1 68 0
	mov	r1, r6
	add	r0, r0, #464
	mov	r2, #31
	bl	safely_add_task_to_priority_queue(PLT)
	.loc 1 69 0
	mov	r0, r5
	mov	r1, r7
	.loc 1 70 0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
	.loc 1 69 0
	b	Scheduler_ScheduleAndSetNextTaskState(PLT)
.L171:
	.align	2
.L170:
	.word	_GLOBAL_OFFSET_TABLE_-(.L169+8)
	.word	KernelTask_Start(GOT)
	.word	405744
	.word	405716
.LFE5:
	.size	Scheduler_InitAndSetKernelTask, .-Scheduler_InitAndSetKernelTask
	.section	.rodata
	.align	2
	.type	__func__.2467, %object
	.size	__func__.2467, 28
__func__.2467:
	.ascii	"SchedulerWatchdogTask_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC37:
	.ascii	"\033[0;1m * Watchdog exit *\033[0m\012\000"
	.text
	.align	2
	.global	SchedulerWatchdogTask_Start
	.type	SchedulerWatchdogTask_Start, %function
SchedulerWatchdogTask_Start:
.LFB17:
	.loc 1 404 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL101:
	stmfd	sp!, {r4, sl, lr}
.LCFI20:
	ldr	sl, .L179
	.loc 1 405 0
	ldr	r3, .L179+4
	ldr	r2, .L179+8
	.loc 1 404 0
.L177:
	add	sl, pc, sl
	.loc 1 405 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	.loc 1 407 0
	ldr	r3, .L179+12
	ldr	r3, [sl, r3]
	ldrsh	r2, [r3, #0]
	cmp	r2, #0
	bne	.L178
.L173:
	.loc 1 411 0
	ldr	r0, .L179+16
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 413 0
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 412 0
	b	Exit(PLT)
.L178:
	mov	r4, r3
.L174:
	.loc 1 408 0
	bl	Pass(PLT)
	.loc 1 407 0
	ldrsh	r3, [r4, #0]
	cmp	r3, #0
	bne	.L174
	b	.L173
.L180:
	.align	2
.L179:
	.word	_GLOBAL_OFFSET_TABLE_-(.L177+8)
	.word	SchedulerWatchdogTask_Start(GOT)
	.word	__func__.2467(GOT)
	.word	SchedulerWatchdogEnabled(GOT)
	.word	.LC37(GOTOFF)
.LFE17:
	.size	SchedulerWatchdogTask_Start, .-SchedulerWatchdogTask_Start
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
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI1-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x5
	.byte	0x84
	.uleb128 0x6
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI3-.LFB7
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x85
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x14
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI5-.LFB8
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI6-.LFB11
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI7-.LFB14
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x48
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI9-.LFB9
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x5
	.byte	0x84
	.uleb128 0x6
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI10-.LFB16
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI11-.LFB13
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
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI12-.LFB15
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x85
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x4
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI13-.LFB6
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x28
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI15-.LFB10
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI16-.LFB12
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x38
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI18-.LFB5
	.byte	0xe
	.uleb128 0x18
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x87
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x5
	.byte	0x84
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x20
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI20-.LFB17
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE30:
	.file 2 "scheduler.h"
	.file 3 "task_descriptor.h"
	.file 4 "queue.h"
	.file 5 "public_kernel_interface.h"
	.file 6 "kernel_state.h"
	.file 7 "train.h"
	.file 8 "buffer.h"
	.file 9 "tasks.h"
	.file 10 "rps.h"
	.file 11 "clock.h"
	.file 12 "kernel_irq.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL4-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL19-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL27-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL30-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL64-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL74-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL75-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL74-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL77-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST30:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL79-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST31:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL79-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST32:
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -20
	.4byte	.LVL82-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST33:
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL83-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST34:
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL81-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST35:
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL85-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST36:
	.4byte	.LVL80-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL85-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST37:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL89-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL95-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST38:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST39:
	.4byte	.LVL87-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 16
	.4byte	.LVL90-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST40:
	.4byte	.LVL87-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL93-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST41:
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST42:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -8
	.4byte	.LVL98-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST43:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL99-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST44:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL100-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL100-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x1010
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF218
	.byte	0x1
	.4byte	.LASF219
	.4byte	.LASF220
	.uleb128 0x2
	.4byte	0xf2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x4
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
	.byte	0x4
	.byte	0x2f
	.4byte	0x25
	.uleb128 0x5
	.4byte	0x118
	.4byte	.LASF33
	.byte	0x4
	.byte	0x4
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
	.byte	0x3e
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x4
	.byte	0x3f
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x4
	.byte	0x40
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x4
	.byte	0x41
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x4
	.byte	0x42
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x4
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
	.byte	0x4
	.byte	0x44
	.4byte	0x133
	.uleb128 0x5
	.4byte	0x1f6
	.4byte	.LASF42
	.byte	0x38
	.byte	0x4
	.byte	0x46
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x4
	.byte	0x47
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x4
	.byte	0x48
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x4
	.byte	0x49
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x4
	.byte	0x4a
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x4
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
	.byte	0x4
	.byte	0x4c
	.4byte	0x1a3
	.uleb128 0xe
	.4byte	0x23f
	.4byte	.LASF43
	.4byte	0x31304
	.byte	0x4
	.byte	0x5e
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x4
	.byte	0x5f
	.4byte	0x23f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x5
	.byte	0x1b
	.4byte	0x280
	.uleb128 0x2
	.4byte	0x2f9
	.4byte	.LASF56
	.byte	0x4
	.byte	0x3
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
	.byte	0x3
	.byte	0xf
	.4byte	0x2c2
	.uleb128 0x5
	.4byte	0x41a
	.4byte	.LASF64
	.byte	0x80
	.byte	0x3
	.byte	0x11
	.uleb128 0xa
	.ascii	"id\000"
	.byte	0x3
	.byte	0x12
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x3
	.byte	0x13
	.4byte	0x2f9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x3
	.byte	0x14
	.4byte	0xf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x3
	.byte	0x15
	.4byte	0x206
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x3
	.byte	0x16
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x3
	.byte	0x17
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x3
	.byte	0x18
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x3
	.byte	0x19
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x3
	.byte	0x1a
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x3
	.byte	0x1b
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x3
	.byte	0x1c
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x3
	.byte	0x1d
	.4byte	0x268
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x3
	.byte	0x1e
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x3
	.byte	0x1f
	.4byte	0x268
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x3
	.byte	0x20
	.4byte	0x41a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0x3
	.byte	0x21
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x3
	.byte	0x22
	.4byte	0x2b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x3
	.byte	0x23
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x3
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
	.byte	0x3
	.byte	0x25
	.4byte	0x304
	.uleb128 0x8
	.4byte	.LASF83
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF84
	.byte	0x6
	.byte	0xc
	.4byte	0x43c
	.uleb128 0xe
	.4byte	0x50b
	.4byte	.LASF84
	.4byte	0x684b0
	.byte	0x6
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF85
	.byte	0x6
	.byte	0x13
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF86
	.byte	0x6
	.byte	0x14
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x6
	.byte	0x15
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x6
	.byte	0x16
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x6
	.byte	0x17
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.4byte	.LASF90
	.byte	0x6
	.byte	0x18
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.4byte	.LASF91
	.byte	0x6
	.byte	0x19
	.4byte	0x25a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.4byte	.LASF92
	.byte	0x6
	.byte	0x1a
	.4byte	0x6c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.4byte	.LASF93
	.byte	0x6
	.byte	0x1b
	.4byte	0x6d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x79c
	.uleb128 0x6
	.4byte	.LASF94
	.byte	0x6
	.byte	0x1c
	.4byte	0x6b8
	.byte	0x4
	.byte	0x23
	.uleb128 0x529c
	.uleb128 0x6
	.4byte	.LASF95
	.byte	0x6
	.byte	0x1d
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a4
	.uleb128 0x6
	.4byte	.LASF96
	.byte	0x6
	.byte	0x1e
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a8
	.uleb128 0x6
	.4byte	.LASF97
	.byte	0x6
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
	.byte	0x2
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x2
	.byte	0x11
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF99
	.byte	0x2
	.byte	0x12
	.4byte	0x26e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF98
	.byte	0x2
	.byte	0x13
	.4byte	0x50b
	.uleb128 0xe
	.4byte	0x669
	.4byte	.LASF100
	.4byte	0x63208
	.byte	0x2
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF101
	.byte	0x2
	.byte	0x16
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF102
	.byte	0x2
	.byte	0x18
	.4byte	0x669
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF103
	.byte	0x2
	.byte	0x19
	.4byte	0x66f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF104
	.byte	0x2
	.byte	0x1a
	.4byte	0x680
	.byte	0x4
	.byte	0x23
	.uleb128 0x31188
	.uleb128 0x6
	.4byte	.LASF105
	.byte	0x2
	.byte	0x1b
	.4byte	0x24f
	.byte	0x4
	.byte	0x23
	.uleb128 0x31dd0
	.uleb128 0x6
	.4byte	.LASF106
	.byte	0x2
	.byte	0x1d
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d4
	.uleb128 0x6
	.4byte	.LASF107
	.byte	0x2
	.byte	0x1e
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d8
	.uleb128 0x6
	.4byte	.LASF108
	.byte	0x2
	.byte	0x1f
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630dc
	.uleb128 0x6
	.4byte	.LASF109
	.byte	0x2
	.byte	0x20
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e0
	.uleb128 0x6
	.4byte	.LASF110
	.byte	0x2
	.byte	0x21
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e4
	.uleb128 0x6
	.4byte	.LASF111
	.byte	0x2
	.byte	0x22
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e8
	.uleb128 0x6
	.4byte	.LASF112
	.byte	0x2
	.byte	0x23
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630ec
	.uleb128 0x6
	.4byte	.LASF113
	.byte	0x2
	.byte	0x24
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f0
	.uleb128 0x6
	.4byte	.LASF114
	.byte	0x2
	.byte	0x25
	.4byte	0x698
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f4
	.uleb128 0x6
	.4byte	.LASF115
	.byte	0x2
	.byte	0x26
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x6310c
	.uleb128 0x6
	.4byte	.LASF116
	.byte	0x2
	.byte	0x27
	.4byte	0x6a8
	.byte	0x4
	.byte	0x23
	.uleb128 0x63110
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x2
	.byte	0x28
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x63200
	.uleb128 0x6
	.4byte	.LASF117
	.byte	0x2
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
	.byte	0x2
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
	.4byte	0x71a
	.byte	0x1
	.4byte	.LASF119
	.byte	0x1
	.byte	0xf
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xf
	.4byte	0x71a
	.4byte	.LLST0
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x1e
	.4byte	0x25a
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x6b8
	.uleb128 0x16
	.4byte	0x766
	.byte	0x1
	.4byte	.LASF120
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.4byte	0x26e
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0x30
	.4byte	0x71a
	.4byte	.LLST2
	.uleb128 0x17
	.4byte	.LASF121
	.byte	0x1
	.byte	0x30
	.4byte	0x118
	.byte	0x1
	.byte	0x51
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x31
	.4byte	0x25a
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x13
	.4byte	0x7aa
	.byte	0x1
	.4byte	.LASF122
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF121
	.byte	0x1
	.byte	0x27
	.4byte	0x118
	.4byte	.LLST4
	.uleb128 0x14
	.4byte	.LASF123
	.byte	0x1
	.byte	0x27
	.4byte	0x26e
	.4byte	.LLST5
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x1
	.byte	0x28
	.4byte	0x7aa
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x431
	.uleb128 0x19
	.4byte	0x7f0
	.byte	0x1
	.4byte	.LASF125
	.byte	0x1
	.byte	0x8f
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LLST6
	.uleb128 0x1a
	.ascii	"td\000"
	.byte	0x1
	.byte	0x8f
	.4byte	0x669
	.4byte	.LLST7
	.uleb128 0x1b
	.4byte	.LASF126
	.byte	0x1
	.byte	0x90
	.4byte	0x25a
	.uleb128 0x18
	.4byte	.LASF127
	.byte	0x1
	.byte	0x91
	.4byte	0x25a
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x13
	.4byte	0x827
	.byte	0x1
	.4byte	.LASF128
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xa3
	.4byte	0x71a
	.4byte	.LLST8
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0xa3
	.4byte	0x7aa
	.4byte	.LLST9
	.byte	0x0
	.uleb128 0x16
	.4byte	0x862
	.byte	0x1
	.4byte	.LASF129
	.byte	0x1
	.byte	0xd7
	.byte	0x1
	.4byte	0x25a
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xd7
	.4byte	0x71a
	.4byte	.LLST10
	.uleb128 0x1a
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x25a
	.4byte	.LLST11
	.byte	0x0
	.uleb128 0x1c
	.4byte	0x8bb
	.byte	0x1
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x152
	.byte	0x1
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LLST12
	.uleb128 0x1d
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x152
	.4byte	0x71a
	.4byte	.LLST13
	.uleb128 0x1e
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x15f
	.4byte	0x25a
	.byte	0x1
	.byte	0x56
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x20
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x162
	.4byte	0x26e
	.byte	0x1
	.byte	0x5b
	.uleb128 0x20
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x163
	.4byte	0x25a
	.byte	0x1
	.byte	0x59
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x8f2
	.byte	0x1
	.4byte	.LASF132
	.byte	0x1
	.byte	0xac
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xac
	.4byte	0x71a
	.4byte	.LLST14
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0xac
	.4byte	0x7aa
	.4byte	.LLST15
	.byte	0x0
	.uleb128 0x21
	.4byte	0x94a
	.byte	0x1
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x18e
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x18e
	.4byte	0x94a
	.4byte	.LLST16
	.uleb128 0x1d
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x18e
	.4byte	0x118
	.4byte	.LLST17
	.uleb128 0x1d
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x18e
	.4byte	0xf2
	.4byte	.LLST18
	.uleb128 0x20
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x18f
	.4byte	0x25a
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x24f
	.uleb128 0x21
	.4byte	0x999
	.byte	0x1
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x106
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x106
	.4byte	0x71a
	.4byte	.LLST19
	.uleb128 0x22
	.ascii	"td\000"
	.byte	0x1
	.2byte	0x106
	.4byte	0x669
	.4byte	.LLST20
	.uleb128 0x1d
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x106
	.4byte	0x2f9
	.4byte	.LLST21
	.byte	0x0
	.uleb128 0x21
	.4byte	0x9e3
	.byte	0x1
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x183
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1d
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x183
	.4byte	0x71a
	.4byte	.LLST22
	.uleb128 0x1d
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x183
	.4byte	0x2b7
	.4byte	.LLST23
	.uleb128 0x23
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x184
	.4byte	0x125
	.4byte	.LLST24
	.byte	0x0
	.uleb128 0x24
	.4byte	0xa60
	.byte	0x1
	.4byte	.LASF140
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	0x669
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST25
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0x48
	.4byte	0x71a
	.4byte	.LLST26
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0x48
	.4byte	0x7aa
	.4byte	.LLST27
	.uleb128 0x18
	.4byte	.LASF141
	.byte	0x1
	.byte	0x49
	.4byte	0x25a
	.byte	0x1
	.byte	0x56
	.uleb128 0x25
	.4byte	.LASF142
	.byte	0x1
	.byte	0x4a
	.4byte	0x25a
	.4byte	.LLST28
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x28
	.uleb128 0x26
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x25a
	.byte	0x1
	.byte	0x55
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x48
	.uleb128 0x15
	.ascii	"td\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x669
	.4byte	.LLST29
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0xa97
	.byte	0x1
	.4byte	.LASF143
	.byte	0x1
	.byte	0xd2
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xd2
	.4byte	0x71a
	.4byte	.LLST30
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0xd2
	.4byte	0x7aa
	.4byte	.LLST31
	.byte	0x0
	.uleb128 0x19
	.4byte	0xb3d
	.byte	0x1
	.4byte	.LASF144
	.byte	0x1
	.byte	0xe3
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LLST32
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0xe3
	.4byte	0x71a
	.4byte	.LLST33
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0xe3
	.4byte	0x7aa
	.4byte	.LLST34
	.uleb128 0x14
	.4byte	.LASF66
	.byte	0x1
	.byte	0xe3
	.4byte	0x25a
	.4byte	.LLST35
	.uleb128 0x14
	.4byte	.LASF145
	.byte	0x1
	.byte	0xe3
	.4byte	0xb44
	.4byte	.LLST36
	.uleb128 0x15
	.ascii	"rtn\000"
	.byte	0x1
	.byte	0xe4
	.4byte	0x25a
	.4byte	.LLST37
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x68
	.uleb128 0x25
	.4byte	.LASF146
	.byte	0x1
	.byte	0xed
	.4byte	0x25a
	.4byte	.LLST38
	.uleb128 0x25
	.4byte	.LASF68
	.byte	0x1
	.byte	0xee
	.4byte	0x25a
	.4byte	.LLST39
	.uleb128 0x15
	.ascii	"td\000"
	.byte	0x1
	.byte	0xf0
	.4byte	0x669
	.4byte	.LLST40
	.uleb128 0x25
	.4byte	.LASF147
	.byte	0x1
	.byte	0xf1
	.4byte	0x25a
	.4byte	.LLST41
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.4byte	0xb44
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0xb3d
	.uleb128 0x19
	.4byte	0xba5
	.byte	0x1
	.4byte	.LASF148
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST42
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.byte	0x39
	.4byte	0x71a
	.4byte	.LLST43
	.uleb128 0x14
	.4byte	.LASF124
	.byte	0x1
	.byte	0x39
	.4byte	0x7aa
	.4byte	.LLST44
	.uleb128 0x18
	.4byte	.LASF149
	.byte	0x1
	.byte	0x3a
	.4byte	0x669
	.byte	0x1
	.byte	0x56
	.uleb128 0x1b
	.4byte	.LASF150
	.byte	0x1
	.byte	0x3d
	.4byte	0x25a
	.uleb128 0x1b
	.4byte	.LASF139
	.byte	0x1
	.byte	0x3e
	.4byte	0x25a
	.byte	0x0
	.uleb128 0x29
	.4byte	0xbce
	.byte	0x1
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x194
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x2a
	.4byte	.LASF152
	.4byte	0xbde
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2467
	.byte	0x0
	.uleb128 0xb
	.4byte	0xbde
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x1b
	.byte	0x0
	.uleb128 0x11
	.4byte	0xbce
	.uleb128 0x2b
	.4byte	.LASF153
	.byte	0x4
	.byte	0xb
	.4byte	0xbef
	.sleb128 -1
	.uleb128 0x11
	.4byte	0x25a
	.uleb128 0x2b
	.4byte	.LASF154
	.byte	0x4
	.byte	0xc
	.4byte	0xbef
	.sleb128 -2
	.uleb128 0xb
	.4byte	0xc10
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF155
	.byte	0x7
	.byte	0xb
	.4byte	0xc1f
	.4byte	.LASF156
	.uleb128 0x11
	.4byte	0xc00
	.uleb128 0xb
	.4byte	0xc34
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF157
	.byte	0x7
	.byte	0xc
	.4byte	0xc43
	.4byte	.LASF158
	.uleb128 0x11
	.4byte	0xc24
	.uleb128 0xb
	.4byte	0xc58
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF159
	.byte	0x7
	.byte	0xd
	.4byte	0xc67
	.4byte	.LASF160
	.uleb128 0x11
	.4byte	0xc48
	.uleb128 0xb
	.4byte	0xc7c
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF161
	.byte	0x7
	.byte	0xe
	.4byte	0xc8b
	.4byte	.LASF162
	.uleb128 0x11
	.4byte	0xc6c
	.uleb128 0x2d
	.4byte	.LASF163
	.byte	0x7
	.byte	0x10
	.4byte	0xbef
	.byte	0x10
	.uleb128 0xb
	.4byte	0xcb2
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x1b
	.4byte	.LASF164
	.byte	0x7
	.byte	0x6d
	.4byte	0xcbd
	.uleb128 0x11
	.4byte	0xc9c
	.uleb128 0x2b
	.4byte	.LASF165
	.byte	0x5
	.byte	0x7
	.4byte	0xbef
	.sleb128 -1
	.uleb128 0x2b
	.4byte	.LASF166
	.byte	0x5
	.byte	0x8
	.4byte	0xbef
	.sleb128 -2
	.uleb128 0x2b
	.4byte	.LASF167
	.byte	0x5
	.byte	0x9
	.4byte	0xbef
	.sleb128 -3
	.uleb128 0x2b
	.4byte	.LASF168
	.byte	0x5
	.byte	0xa
	.4byte	0xbef
	.sleb128 -1
	.uleb128 0x2b
	.4byte	.LASF169
	.byte	0x5
	.byte	0xb
	.4byte	0xbef
	.sleb128 -2
	.uleb128 0x2d
	.4byte	.LASF170
	.byte	0x5
	.byte	0xc
	.4byte	0xbef
	.byte	0x2
	.uleb128 0x2b
	.4byte	.LASF171
	.byte	0x5
	.byte	0xd
	.4byte	0xbef
	.sleb128 -1
	.uleb128 0x2b
	.4byte	.LASF172
	.byte	0x5
	.byte	0xe
	.4byte	0xbef
	.sleb128 -2
	.uleb128 0x2b
	.4byte	.LASF173
	.byte	0x5
	.byte	0xf
	.4byte	0xbef
	.sleb128 -3
	.uleb128 0x2b
	.4byte	.LASF174
	.byte	0x5
	.byte	0x10
	.4byte	0xbef
	.sleb128 -4
	.uleb128 0x2e
	.4byte	.LASF175
	.byte	0x5
	.byte	0x11
	.4byte	0xd4e
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x11
	.4byte	0x279
	.uleb128 0xb
	.4byte	0xd69
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF176
	.byte	0x3
	.byte	0x27
	.4byte	0xd7a
	.byte	0x5
	.byte	0x3
	.4byte	TASK_STATE_NAMES
	.uleb128 0x11
	.4byte	0xd53
	.uleb128 0x2b
	.4byte	.LASF177
	.byte	0x8
	.byte	0x5
	.4byte	0xbef
	.sleb128 -1
	.uleb128 0x2b
	.4byte	.LASF178
	.byte	0x8
	.byte	0x6
	.4byte	0xbef
	.sleb128 -2
	.uleb128 0xb
	.4byte	0xda7
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF179
	.byte	0x9
	.byte	0x6
	.4byte	0xdb6
	.4byte	.LASF180
	.uleb128 0x11
	.4byte	0xd97
	.uleb128 0xb
	.4byte	0xdcb
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x4
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF181
	.byte	0x9
	.byte	0x7
	.4byte	0xdda
	.4byte	.LASF182
	.uleb128 0x11
	.4byte	0xdbb
	.uleb128 0xb
	.4byte	0xdef
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF183
	.byte	0xa
	.byte	0x9
	.4byte	0xdfe
	.4byte	.LASF184
	.uleb128 0x11
	.4byte	0xddf
	.uleb128 0xb
	.4byte	0xe13
	.4byte	0x261
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x7
	.byte	0x0
	.uleb128 0x2c
	.4byte	.LASF185
	.byte	0xb
	.byte	0x8
	.4byte	0xe22
	.4byte	.LASF186
	.uleb128 0x11
	.4byte	0xe03
	.uleb128 0x2b
	.4byte	.LASF187
	.byte	0xb
	.byte	0x9
	.4byte	0xe37
	.sleb128 -2139029408
	.uleb128 0x11
	.4byte	0x41a
	.uleb128 0x2b
	.4byte	.LASF188
	.byte	0xb
	.byte	0xa
	.4byte	0xe37
	.sleb128 -2139029372
	.uleb128 0x2b
	.4byte	.LASF189
	.byte	0xc
	.byte	0xd
	.4byte	0xe5c
	.sleb128 -2139029376
	.uleb128 0x11
	.4byte	0xe61
	.uleb128 0x10
	.byte	0x4
	.4byte	0xe67
	.uleb128 0x2f
	.4byte	0x25a
	.uleb128 0x2b
	.4byte	.LASF190
	.byte	0xc
	.byte	0xe
	.4byte	0xe5c
	.sleb128 -2139029372
	.uleb128 0x2b
	.4byte	.LASF191
	.byte	0xc
	.byte	0xf
	.4byte	0xe5c
	.sleb128 -2139029368
	.uleb128 0x2b
	.4byte	.LASF192
	.byte	0xc
	.byte	0x10
	.4byte	0xe5c
	.sleb128 -2139029364
	.uleb128 0x2d
	.4byte	.LASF193
	.byte	0xc
	.byte	0x11
	.4byte	0xea8
	.byte	0x33
	.uleb128 0x11
	.4byte	0xe67
	.uleb128 0x2d
	.4byte	.LASF194
	.byte	0xc
	.byte	0x12
	.4byte	0xea8
	.byte	0x17
	.uleb128 0x2d
	.4byte	.LASF195
	.byte	0xc
	.byte	0x13
	.4byte	0xea8
	.byte	0x18
	.uleb128 0x2d
	.4byte	.LASF196
	.byte	0xc
	.byte	0x14
	.4byte	0xea8
	.byte	0x19
	.uleb128 0x2d
	.4byte	.LASF197
	.byte	0xc
	.byte	0x15
	.4byte	0xea8
	.byte	0x1a
	.uleb128 0x2d
	.4byte	.LASF198
	.byte	0xc
	.byte	0x16
	.4byte	0xea8
	.byte	0x34
	.uleb128 0x2d
	.4byte	.LASF199
	.byte	0xc
	.byte	0x17
	.4byte	0xea8
	.byte	0x36
	.uleb128 0x2b
	.4byte	.LASF200
	.byte	0xc
	.byte	0x18
	.4byte	0xe5c
	.sleb128 -2138308580
	.uleb128 0x2b
	.4byte	.LASF201
	.byte	0xc
	.byte	0x19
	.4byte	0xe5c
	.sleb128 -2138243044
	.uleb128 0x2b
	.4byte	.LASF202
	.byte	0xc
	.byte	0x1a
	.4byte	0xe5c
	.sleb128 -2146762752
	.uleb128 0x2b
	.4byte	.LASF203
	.byte	0xc
	.byte	0x1b
	.4byte	0xe5c
	.sleb128 -2146762740
	.uleb128 0x2b
	.4byte	.LASF204
	.byte	0xc
	.byte	0x1c
	.4byte	0xe5c
	.sleb128 -2146762736
	.uleb128 0x2b
	.4byte	.LASF205
	.byte	0xc
	.byte	0x1d
	.4byte	0xe5c
	.sleb128 -2146762704
	.uleb128 0x2b
	.4byte	.LASF206
	.byte	0xc
	.byte	0x1e
	.4byte	0xe5c
	.sleb128 -2146762732
	.uleb128 0x2b
	.4byte	.LASF207
	.byte	0xc
	.byte	0x1f
	.4byte	0xe5c
	.sleb128 -2146762728
	.uleb128 0x2b
	.4byte	.LASF208
	.byte	0xc
	.byte	0x20
	.4byte	0xe5c
	.sleb128 -2146762724
	.uleb128 0x2b
	.4byte	.LASF209
	.byte	0xc
	.byte	0x21
	.4byte	0xe5c
	.sleb128 -2146697216
	.uleb128 0x2b
	.4byte	.LASF210
	.byte	0xc
	.byte	0x22
	.4byte	0xe5c
	.sleb128 -2146697204
	.uleb128 0x2b
	.4byte	.LASF211
	.byte	0xc
	.byte	0x23
	.4byte	0xe5c
	.sleb128 -2146697200
	.uleb128 0x2b
	.4byte	.LASF212
	.byte	0xc
	.byte	0x24
	.4byte	0xe5c
	.sleb128 -2146697168
	.uleb128 0x2b
	.4byte	.LASF213
	.byte	0xc
	.byte	0x25
	.4byte	0xe5c
	.sleb128 -2146697196
	.uleb128 0x2b
	.4byte	.LASF214
	.byte	0xc
	.byte	0x26
	.4byte	0xe5c
	.sleb128 -2146697192
	.uleb128 0x2b
	.4byte	.LASF215
	.byte	0xc
	.byte	0x27
	.4byte	0xe5c
	.sleb128 -2146697188
	.uleb128 0x18
	.4byte	.LASF216
	.byte	0x1
	.byte	0xd
	.4byte	0x691
	.byte	0x5
	.byte	0x3
	.4byte	SchedulerWatchdogEnabled
	.uleb128 0x30
	.4byte	.LASF217
	.byte	0x1
	.byte	0xc
	.4byte	0x25a
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0xa
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
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
	.uleb128 0x5
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
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
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x207
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1014
	.4byte	0x6e5
	.ascii	"Scheduler_Initialize\000"
	.4byte	0x720
	.ascii	"GetRegisteredFunctionName\000"
	.4byte	0x766
	.ascii	"DebugRegisterFunction\000"
	.4byte	0x7b0
	.ascii	"validate_stack_value\000"
	.4byte	0x7f0
	.ascii	"Scheduler_SaveCurrentTaskState\000"
	.4byte	0x827
	.ascii	"Scheduler_IsInitedTid\000"
	.4byte	0x862
	.ascii	"Scheduler_PrintTDCounts\000"
	.4byte	0x8bb
	.ascii	"Scheduler_SetNextTaskState\000"
	.4byte	0x8f2
	.ascii	"safely_add_task_to_priority_queue\000"
	.4byte	0x950
	.ascii	"Scheduler_ChangeTDState\000"
	.4byte	0x999
	.ascii	"Scheduler_UnblockTasksOnEvent\000"
	.4byte	0x9e3
	.ascii	"Scheduler_ScheduleNextTask\000"
	.4byte	0xa60
	.ascii	"Scheduler_ScheduleAndSetNextTaskState\000"
	.4byte	0xa97
	.ascii	"Scheduler_CreateAndScheduleNewTask\000"
	.4byte	0xb4a
	.ascii	"Scheduler_InitAndSetKernelTask\000"
	.4byte	0xba5
	.ascii	"SchedulerWatchdogTask_Start\000"
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
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2-.Ltext0
	.4byte	.LBE2-.Ltext0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	.LBB14-.Ltext0
	.4byte	.LBE14-.Ltext0
	.4byte	.LBB13-.Ltext0
	.4byte	.LBE13-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF132:
	.ascii	"Scheduler_SetNextTaskState\000"
.LASF141:
	.ascii	"times\000"
.LASF192:
	.ascii	"timer_clear\000"
.LASF111:
	.ascii	"num_receive_blocked\000"
.LASF185:
	.ascii	"CLOCK_SERVER_NAME\000"
.LASF69:
	.ascii	"stack_pointer\000"
.LASF92:
	.ascii	"memory_blocks_status\000"
.LASF218:
	.ascii	"GNU C 4.0.2\000"
.LASF88:
	.ascii	"user_proc_spsr\000"
.LASF187:
	.ascii	"TIMER4_VAL_LOW\000"
.LASF39:
	.ascii	"current_count\000"
.LASF59:
	.ascii	"ZOMBIE\000"
.LASF71:
	.ascii	"entry_point\000"
.LASF109:
	.ascii	"num_send_blocked\000"
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
.LASF138:
	.ascii	"Scheduler_UnblockTasksOnEvent\000"
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
.LASF160:
	.ascii	"TrSTmr\000"
.LASF175:
	.ascii	"TICK_SIZE\000"
.LASF181:
	.ascii	"IDLE_TASK_NAME\000"
.LASF20:
	.ascii	"PRIORITY_20\000"
.LASF21:
	.ascii	"PRIORITY_21\000"
.LASF22:
	.ascii	"PRIORITY_22\000"
.LASF23:
	.ascii	"PRIORITY_23\000"
.LASF26:
	.ascii	"PRIORITY_26\000"
.LASF28:
	.ascii	"PRIORITY_28\000"
.LASF29:
	.ascii	"PRIORITY_29\000"
.LASF137:
	.ascii	"new_state\000"
.LASF176:
	.ascii	"TASK_STATE_NAMES\000"
.LASF172:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF139:
	.ascii	"task_id\000"
.LASF63:
	.ascii	"EVENT_BLOCKED\000"
.LASF127:
	.ascii	"full_stack_value\000"
.LASF193:
	.ascii	"TC3OI\000"
.LASF30:
	.ascii	"PRIORITY_30\000"
.LASF31:
	.ascii	"PRIORITY_31\000"
.LASF161:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF74:
	.ascii	"entry_mode\000"
.LASF100:
	.ascii	"Scheduler\000"
.LASF99:
	.ascii	"function_name\000"
.LASF60:
	.ascii	"SEND_BLOCKED\000"
.LASF182:
	.ascii	"Idle\000"
.LASF27:
	.ascii	"PRIORITY_27\000"
.LASF140:
	.ascii	"Scheduler_ScheduleNextTask\000"
.LASF180:
	.ascii	"Admin\000"
.LASF186:
	.ascii	"ClckSvr\000"
.LASF174:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF164:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF177:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF55:
	.ascii	"NUM_EVENTS\000"
.LASF101:
	.ascii	"max_tasks\000"
.LASF167:
	.ascii	"ERR_K_DEFAULT\000"
.LASF24:
	.ascii	"PRIORITY_24\000"
.LASF80:
	.ascii	"event_id\000"
.LASF25:
	.ascii	"PRIORITY_25\000"
.LASF200:
	.ascii	"UART1IntIDIntClr\000"
.LASF136:
	.ascii	"Scheduler_ChangeTDState\000"
.LASF128:
	.ascii	"Scheduler_SaveCurrentTaskState\000"
.LASF163:
	.ascii	"LIGHTS_MASK\000"
.LASF41:
	.ascii	"items\000"
.LASF87:
	.ascii	"user_proc_return_value\000"
.LASF184:
	.ascii	"RPSSvr\000"
.LASF84:
	.ascii	"KernelState\000"
.LASF203:
	.ascii	"VIC1IntSelect\000"
.LASF68:
	.ascii	"parent_id\000"
.LASF45:
	.ascii	"queues_with_items\000"
.LASF36:
	.ascii	"TaskQueue\000"
.LASF108:
	.ascii	"num_zombie\000"
.LASF148:
	.ascii	"Scheduler_InitAndSetKernelTask\000"
.LASF145:
	.ascii	"code\000"
.LASF210:
	.ascii	"VIC2IntSelect\000"
.LASF85:
	.ascii	"user_proc_sp_value\000"
.LASF73:
	.ascii	"return_value\000"
.LASF94:
	.ascii	"scheduler\000"
.LASF112:
	.ascii	"num_event_blocked\000"
.LASF143:
	.ascii	"Scheduler_ScheduleAndSetNextTaskState\000"
.LASF46:
	.ascii	"char\000"
.LASF52:
	.ascii	"UART1_TX_EVENT\000"
.LASF191:
	.ascii	"timer_ctrl\000"
.LASF212:
	.ascii	"VIC2VectAddr\000"
.LASF56:
	.ascii	"TaskState\000"
.LASF67:
	.ascii	"messages\000"
.LASF149:
	.ascii	"task_descriptor\000"
.LASF213:
	.ascii	"VIC2IntEnClear\000"
.LASF146:
	.ascii	"new_task_id\000"
.LASF190:
	.ascii	"timer_val\000"
.LASF44:
	.ascii	"queues\000"
.LASF198:
	.ascii	"INT_UART1\000"
.LASF103:
	.ascii	"task_descriptors\000"
.LASF126:
	.ascii	"empty_stack_value\000"
.LASF119:
	.ascii	"Scheduler_Initialize\000"
.LASF76:
	.ascii	"reply_len\000"
.LASF207:
	.ascii	"VIC1SoftInt\000"
.LASF219:
	.ascii	"scheduler.c\000"
.LASF57:
	.ascii	"READY\000"
.LASF75:
	.ascii	"receive_msg\000"
.LASF129:
	.ascii	"Scheduler_IsInitedTid\000"
.LASF72:
	.ascii	"spsr_register\000"
.LASF194:
	.ascii	"UART1RXINTR1\000"
.LASF201:
	.ascii	"UART2IntIDIntClr\000"
.LASF91:
	.ascii	"memory_stack_top\000"
.LASF195:
	.ascii	"UART1TXINTR1\000"
.LASF215:
	.ascii	"VIC2SoftIntClear\000"
.LASF169:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF48:
	.ascii	"EventID\000"
.LASF1:
	.ascii	"PRIORITY_1\000"
.LASF40:
	.ascii	"size\000"
.LASF4:
	.ascii	"PRIORITY_4\000"
.LASF6:
	.ascii	"PRIORITY_6\000"
.LASF50:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF8:
	.ascii	"PRIORITY_8\000"
.LASF125:
	.ascii	"validate_stack_value\000"
.LASF37:
	.ascii	"item\000"
.LASF35:
	.ascii	"long unsigned int\000"
.LASF95:
	.ascii	"redboot_sp_value\000"
.LASF157:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF206:
	.ascii	"VIC1IntEnClear\000"
.LASF114:
	.ascii	"has_tasks_event_blocked\000"
.LASF122:
	.ascii	"DebugRegisterFunction\000"
.LASF32:
	.ascii	"QueuePriority\000"
.LASF33:
	.ascii	"QueueItem\000"
.LASF199:
	.ascii	"INT_UART2\000"
.LASF62:
	.ascii	"REPLY_BLOCKED\000"
.LASF205:
	.ascii	"VIC1VectAddr\000"
.LASF202:
	.ascii	"VIC1BaseAddress\000"
.LASF204:
	.ascii	"VIC1IntEnable\000"
.LASF54:
	.ascii	"UART2_TX_EVENT\000"
.LASF144:
	.ascii	"Scheduler_CreateAndScheduleNewTask\000"
.LASF0:
	.ascii	"PRIORITY_0\000"
.LASF113:
	.ascii	"num_tasks\000"
.LASF102:
	.ascii	"current_task_descriptor\000"
.LASF2:
	.ascii	"PRIORITY_2\000"
.LASF155:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF5:
	.ascii	"PRIORITY_5\000"
.LASF7:
	.ascii	"PRIORITY_7\000"
.LASF51:
	.ascii	"UART1_RX_EVENT\000"
.LASF152:
	.ascii	"__func__\000"
.LASF220:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF58:
	.ascii	"ACTIVE\000"
.LASF118:
	.ascii	"short int\000"
.LASF116:
	.ascii	"function_mappings\000"
.LASF97:
	.ascii	"redboot_spsr_value\000"
.LASF150:
	.ascii	"task_priority\000"
.LASF158:
	.ascii	"TCmSvr\000"
.LASF66:
	.ascii	"priority\000"
.LASF70:
	.ascii	"link_register\000"
.LASF154:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF124:
	.ascii	"k_state\000"
.LASF183:
	.ascii	"RPS_SERVER_NAME\000"
.LASF3:
	.ascii	"PRIORITY_3\000"
.LASF104:
	.ascii	"inited_td\000"
.LASF123:
	.ascii	"name\000"
.LASF38:
	.ascii	"start\000"
.LASF81:
	.ascii	"schedule_timestamp\000"
.LASF9:
	.ascii	"PRIORITY_9\000"
.LASF93:
	.ascii	"memory_blocks\000"
.LASF142:
	.ascii	"min_priority\000"
.LASF214:
	.ascii	"VIC2SoftInt\000"
.LASF61:
	.ascii	"RECEIVE_BLOCKED\000"
.LASF216:
	.ascii	"SchedulerWatchdogEnabled\000"
.LASF134:
	.ascii	"queue\000"
.LASF171:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF179:
	.ascii	"ADMINISTRATOR_TASK_NAME\000"
.LASF178:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF49:
	.ascii	"NULL_EVENT\000"
.LASF217:
	.ascii	"_EndOfProgram\000"
.LASF208:
	.ascii	"VIC1SoftIntClear\000"
.LASF77:
	.ascii	"reply_msg\000"
.LASF166:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF78:
	.ascii	"origin_tid\000"
.LASF121:
	.ascii	"entry\000"
.LASF130:
	.ascii	"Scheduler_PrintTDCounts\000"
.LASF83:
	.ascii	"unsigned char\000"
.LASF131:
	.ascii	"percentage_run\000"
.LASF82:
	.ascii	"scheduled_counter\000"
.LASF165:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF110:
	.ascii	"num_reply_blocked\000"
.LASF90:
	.ascii	"user_proc_entry_mode\000"
.LASF153:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF168:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF211:
	.ascii	"VIC2IntEnable\000"
.LASF98:
	.ascii	"FunctionMapping\000"
.LASF65:
	.ascii	"state\000"
.LASF133:
	.ascii	"safely_add_task_to_priority_queue\000"
.LASF120:
	.ascii	"GetRegisteredFunctionName\000"
.LASF156:
	.ascii	"TrnSvr\000"
.LASF89:
	.ascii	"last_kernel_sp_value\000"
.LASF53:
	.ascii	"UART2_RX_EVENT\000"
.LASF189:
	.ascii	"timer_ldr\000"
.LASF162:
	.ascii	"TrSwMr\000"
.LASF151:
	.ascii	"SchedulerWatchdogTask_Start\000"
.LASF196:
	.ascii	"UART2RXINTR2\000"
.LASF159:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF105:
	.ascii	"task_queue\000"
.LASF170:
	.ascii	"NAMESERVER_TID\000"
.LASF197:
	.ascii	"UART2TXINTR2\000"
.LASF43:
	.ascii	"PriorityQueue\000"
.LASF47:
	.ascii	"double\000"
.LASF42:
	.ascii	"MessageQueue\000"
.LASF188:
	.ascii	"TIMER4_VAL_HIGH\000"
.LASF115:
	.ascii	"functions_registered\000"
.LASF173:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF209:
	.ascii	"VIC2BaseAddress\000"
.LASF147:
	.ascii	"stack_end\000"
.LASF117:
	.ascii	"watchdog_feed_counter\000"
.LASF86:
	.ascii	"user_proc_lr_value\000"
.LASF135:
	.ascii	"queue_return_code\000"
	.ident	"GCC: (GNU) 4.0.2"
