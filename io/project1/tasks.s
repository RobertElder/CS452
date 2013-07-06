	.file	"tasks.c"
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
	.type	CLOCK_SERVER_NAME, %object
	.size	CLOCK_SERVER_NAME, 8
CLOCK_SERVER_NAME:
	.ascii	"ClckSvr\000"
	.align	2
	.type	TRAIN_OUTPUT_SERVER_NAME, %object
	.size	TRAIN_OUTPUT_SERVER_NAME, 7
TRAIN_OUTPUT_SERVER_NAME:
	.ascii	"TrOSvr\000"
	.align	2
	.type	TRAIN_INPUT_SERVER_NAME, %object
	.size	TRAIN_INPUT_SERVER_NAME, 7
TRAIN_INPUT_SERVER_NAME:
	.ascii	"TrISvr\000"
	.align	2
	.type	SCREEN_OUTPUT_SERVER_NAME, %object
	.size	SCREEN_OUTPUT_SERVER_NAME, 7
SCREEN_OUTPUT_SERVER_NAME:
	.ascii	"KbOSvr\000"
	.align	2
	.type	KEYBOARD_INPUT_SERVER_NAME, %object
	.size	KEYBOARD_INPUT_SERVER_NAME, 7
KEYBOARD_INPUT_SERVER_NAME:
	.ascii	"KbISvr\000"
	.align	2
	.type	TRAIN_SERVER_NAME, %object
	.size	TRAIN_SERVER_NAME, 7
TRAIN_SERVER_NAME:
	.ascii	"TrnSvr\000"
	.align	2
	.type	UI_SERVER_NAME, %object
	.size	UI_SERVER_NAME, 6
UI_SERVER_NAME:
	.ascii	"UISvr\000"
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
	.type	__func__.2396, %object
	.size	__func__.2396, 17
__func__.2396:
	.ascii	"KernelTask_Start\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"FirstTask tid not 1, got %d\000"
	.align	2
.LC1:
	.ascii	"Shouldn't see me\012\000"
	.text
	.align	2
	.global	KernelTask_Start
	.type	KernelTask_Start, %function
KernelTask_Start:
.LFB2:
	.file 1 "tasks.c"
	.loc 1 21 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {sl, lr}
.LCFI0:
	ldr	sl, .L4
	.loc 1 22 0
	ldr	r2, .L4+4
	ldr	r3, .L4+8
	.loc 1 21 0
.L3:
	add	sl, pc, sl
	.loc 1 22 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 23 0
	ldr	r3, .L4+12
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 25 0
	ldr	r1, .L4+16
	.loc 1 23 0
	mov	r2, r0
.LVL1:
	.loc 1 25 0
	add	r1, sl, r1
	cmp	r0, #1
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
.LVL2:
	.loc 1 27 0
	bl	Exit(PLT)
	.loc 1 28 0
	ldr	r1, .L4+20
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 29 0
	ldmfd	sp!, {sl, lr}
	.loc 1 28 0
	b	assert(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	__func__.2396(GOT)
	.word	KernelTask_Start(GOT)
	.word	FirstTask_Start(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
.LFE2:
	.size	KernelTask_Start, .-KernelTask_Start
	.section	.rodata
	.align	2
	.type	__func__.2402, %object
	.size	__func__.2402, 16
__func__.2402:
	.ascii	"FirstTask_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"NameServer tid not 2\000"
	.align	2
.LC3:
	.ascii	"ClockServer tid not positive\000"
	.align	2
.LC4:
	.ascii	"AdministratorTask tid not positive\000"
	.align	2
.LC5:
	.ascii	"SchedulerWatchdogTask tid not positive\000"
	.align	2
.LC6:
	.ascii	"UARTBootstrapTask tid not positive\000"
	.align	2
.LC7:
	.ascii	"TrainServer tid not positive\000"
	.align	2
.LC8:
	.ascii	"UIServer_Start tid not positive\000"
	.align	2
.LC9:
	.ascii	"IdleTask tid not postive\000"
	.text
	.align	2
	.global	FirstTask_Start
	.type	FirstTask_Start, %function
FirstTask_Start:
.LFB3:
	.loc 1 31 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL3:
	stmfd	sp!, {sl, lr}
.LCFI1:
	ldr	sl, .L9
	.loc 1 32 0
	ldr	r2, .L9+4
	ldr	r3, .L9+8
	.loc 1 31 0
.L8:
	add	sl, pc, sl
	.loc 1 32 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 36 0
	ldr	r3, .L9+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 37 0
	ldr	r1, .L9+16
	cmp	r0, #2
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 38 0
	bl	Pass(PLT)
	.loc 1 40 0
	ldr	r3, .L9+20
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 41 0
	ldr	r1, .L9+24
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 42 0
	bl	Pass(PLT)
	.loc 1 44 0
	ldr	r3, .L9+28
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 45 0
	ldr	r1, .L9+32
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 46 0
	bl	Pass(PLT)
	.loc 1 48 0
	ldr	r3, .L9+36
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 49 0
	ldr	r1, .L9+40
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 50 0
	bl	Pass(PLT)
	.loc 1 53 0
	ldr	r3, .L9+44
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 54 0
	ldr	r1, .L9+48
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 55 0
	bl	Pass(PLT)
	.loc 1 57 0
	ldr	r3, .L9+52
	mov	r0, #8
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 58 0
	ldr	r1, .L9+56
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 59 0
	bl	Pass(PLT)
	.loc 1 61 0
	ldr	r3, .L9+60
	mov	r0, #7
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 62 0
	ldr	r1, .L9+64
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 63 0
	bl	Pass(PLT)
	.loc 1 155 0
	ldr	r3, .L9+68
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 156 0
	ldr	r1, .L9+72
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 159 0
	bl	Exit(PLT)
	.loc 1 161 0
	ldr	r1, .L9+76
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 162 0
	ldmfd	sp!, {sl, lr}
	.loc 1 161 0
	b	assert(PLT)
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	__func__.2402(GOT)
	.word	FirstTask_Start(GOT)
	.word	NameServer_Start(GOT)
	.word	.LC2(GOTOFF)
	.word	ClockServer_Start(GOT)
	.word	.LC3(GOTOFF)
	.word	AdministratorTask_Start(GOT)
	.word	.LC4(GOTOFF)
	.word	SchedulerWatchdogTask_Start(GOT)
	.word	.LC5(GOTOFF)
	.word	UARTBootstrapTask_Start(GOT)
	.word	.LC6(GOTOFF)
	.word	TrainServer_Start(GOT)
	.word	.LC7(GOTOFF)
	.word	UIServer_Start(GOT)
	.word	.LC8(GOTOFF)
	.word	IdleTask_Start(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC1(GOTOFF)
.LFE3:
	.size	FirstTask_Start, .-FirstTask_Start
	.section	.rodata
	.align	2
	.type	__func__.2416, %object
	.size	__func__.2416, 21
__func__.2416:
	.ascii	"ClockPrintTask_Start\000"
	.global	__ltsf2
	.text
	.align	2
	.global	ClockPrintTask_Start
	.type	ClockPrintTask_Start, %function
ClockPrintTask_Start:
.LFB4:
	.loc 1 164 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL4:
	stmfd	sp!, {sl, lr}
.LCFI2:
	ldr	sl, .L18
	.loc 1 165 0
	ldr	r3, .L18+4
	ldr	r2, .L18+8
	.loc 1 164 0
.L16:
	add	sl, pc, sl
	.loc 1 165 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	.loc 1 165 0
	bl	DebugRegisterFunction(PLT)
	b	.L12
.L13:
	.loc 1 167 0
	bl	print_current_time(PLT)
	.loc 1 168 0
	mov	r0, #1065353216
	bl	DelaySeconds(PLT)
.L12:
	.loc 1 166 0
	bl	TimeSeconds(PLT)
	ldr	r1, .L18+12
	bl	__ltsf2(PLT)
	cmp	r0, #0
	blt	.L13
	.loc 1 172 0
	ldmfd	sp!, {sl, lr}
	.loc 1 171 0
	b	Exit(PLT)
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	ClockPrintTask_Start(GOT)
	.word	__func__.2416(GOT)
	.word	1082130432
.LFE4:
	.size	ClockPrintTask_Start, .-ClockPrintTask_Start
	.section	.rodata
	.align	2
	.type	__func__.2423, %object
	.size	__func__.2423, 15
__func__.2423:
	.ascii	"IdleTask_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"fail\012\000"
	.align	2
.LC11:
	.ascii	"Nope.\000"
	.text
	.align	2
	.global	IdleTask_Start
	.type	IdleTask_Start, %function
IdleTask_Start:
.LFB5:
	.loc 1 174 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI3:
	ldr	sl, .L31
	.loc 1 175 0
	ldr	r3, .L31+4
	ldr	r2, .L31+8
	.loc 1 174 0
.L29:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI4:
.LVL6:
	.loc 1 175 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	.loc 1 176 0
	ldr	r3, .L31+12
	ldr	r5, .L31+16
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 182 0
	add	r8, sp, #4
	.loc 1 183 0
	mov	r3, #22
	str	r3, [sp, #20]
	b	.L21
.LVL7:
.L30:
	.loc 1 193 0
	bl	DelaySeconds(PLT)
.L21:
	.loc 1 187 0
	ldr	r0, [sl, r5]
	bl	WhoIs(PLT)
	.loc 1 189 0
	subs	r4, r0, #0
	.loc 1 193 0
	ldr	r0, .L31+20
	.loc 1 189 0
	beq	.L30
	ldr	r7, .L31+24
	add	r6, sp, #20
	mov	r5, #16
.L22:
	.loc 1 197 0
	mov	r3, r8
	mov	r1, r6
	mov	r2, r5
	mov	r0, r4
	str	r5, [sp, #0]
	bl	Send(PLT)
	.loc 1 198 0
	ldr	r0, [sp, #4]
	add	r1, sl, r7
	cmp	r0, #12
	cmpne	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
	.loc 1 200 0
	ldr	r3, [sp, #4]
	cmp	r3, #12
	bne	.L22
	.loc 1 205 0
	bl	Exit(PLT)
	.loc 1 206 0
	ldr	r1, .L31+28
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 207 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	IdleTask_Start(GOT)
	.word	__func__.2423(GOT)
	.word	IDLE_TASK_NAME(GOT)
	.word	ADMINISTRATOR_TASK_NAME(GOT)
	.word	1045220557
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
.LFE5:
	.size	IdleTask_Start, .-IdleTask_Start
	.section	.rodata
	.align	2
	.type	__func__.2441, %object
	.size	__func__.2441, 24
__func__.2441:
	.ascii	"AdministratorTask_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"AdministratorTask_Start failed to register name\000"
	.align	2
.LC13:
	.ascii	"AdministratorTask_Start: unknown message type %d\000"
	.align	2
.LC14:
	.ascii	"AdministratorTask_Start: did not get a ack from ui "
	.ascii	"server\000"
	.align	2
.LC15:
	.ascii	"AdministratorTask_Start: did not get a ack from tra"
	.ascii	"in server\000"
	.align	2
.LC16:
	.ascii	"AdministratorTask_Start: did not get a ack from key"
	.ascii	"board input server\000"
	.align	2
.LC17:
	.ascii	"AdministratorTask_Start: did not get a ack from scr"
	.ascii	"een output server\000"
	.align	2
.LC18:
	.ascii	"AdministratorTask_Start: did not get a ack from tra"
	.ascii	"in input server\000"
	.align	2
.LC19:
	.ascii	"AdministratorTask_Start: did not get a ack from tra"
	.ascii	"in output server\000"
	.align	2
.LC20:
	.ascii	"AdministratorTask_Start: did not get a ack from clo"
	.ascii	"ck server\000"
	.align	2
.LC21:
	.ascii	"AdministratorTask_Start didn't get ACK from name se"
	.ascii	"rver\000"
	.text
	.align	2
	.global	AdministratorTask_Start
	.type	AdministratorTask_Start, %function
AdministratorTask_Start:
.LFB6:
	.loc 1 209 0
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI5:
	ldr	sl, .L51
	.loc 1 210 0
	ldr	r2, .L51+4
	ldr	r3, .L51+8
	.loc 1 209 0
.L47:
	add	sl, pc, sl
	sub	sp, sp, #56
.LCFI6:
.LVL9:
	.loc 1 210 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 212 0
	ldr	r3, .L51+12
	.loc 1 229 0
	mov	r4, #0
.LVL10:
	.loc 1 212 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 214 0
	ldr	r1, .L51+16
.LVL11:
	cmp	r0, r4
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 228 0
	add	r8, sp, #20
	.loc 1 229 0
	add	r6, sp, #4
.LVL12:
	mov	r5, r4
.LVL13:
	add	r7, sp, #52
	mov	r9, #10
	b	.L34
.LVL14:
.L50:
	.loc 1 252 0
	ldr	r1, .L51+20
	.loc 1 236 0
	cmp	r3, #22
	.loc 1 252 0
	add	r1, sl, r1
	mov	r2, r3
	mov	r0, #0
	.loc 1 236 0
	beq	.L48
	.loc 1 252 0
	bl	assertf(PLT)
.L38:
	.loc 1 257 0
	bl	Pass(PLT)
	.loc 1 234 0
	cmp	r4, #0
	cmpne	r5, #0
	bne	.L49
.L34:
	.loc 1 235 0
	mov	r1, r8
	mov	r2, #16
	mov	r0, r7
	bl	Receive(PLT)
	.loc 1 236 0
	ldr	r3, [sp, #20]
	.loc 1 240 0
	mov	r1, r6
	.loc 1 236 0
	cmp	r3, #12
	.loc 1 240 0
	mov	r2, #16
	.loc 1 236 0
	bne	.L50
	.loc 1 240 0
	ldr	r0, [sp, #52]
	.loc 1 238 0
	add	r4, r4, #1
	.loc 1 239 0
	str	r9, [r6, #0]
	.loc 1 240 0
	bl	Reply(PLT)
	.loc 1 257 0
	bl	Pass(PLT)
	.loc 1 234 0
	cmp	r4, #0
	cmpne	r5, #0
	beq	.L34
.L49:
	.loc 1 268 0
	ldr	r3, .L51+24
	mov	r4, #16
.LVL15:
	.loc 1 261 0
	add	r5, sp, #36
.LVL16:
	.loc 1 268 0
	ldr	r0, [sl, r3]
	.loc 1 263 0
	mov	r3, #12
	str	r3, [sp, #36]
	.loc 1 268 0
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 269 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+28
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 274 0
	ldr	r3, .L51+32
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 275 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+36
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 280 0
	ldr	r3, .L51+40
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 281 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+44
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 282 0
	ldr	r3, .L51+48
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 283 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+52
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 284 0
	ldr	r3, .L51+56
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 285 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+60
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 286 0
	ldr	r3, .L51+64
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 287 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+68
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 293 0
	ldr	r3, .L51+72
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	mov	r2, r4
	mov	r3, r6
	mov	r1, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 294 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+76
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 298 0
	mov	ip, #14
	.loc 1 300 0
	mov	r1, r5
	mov	r2, r4
	mov	r3, r6
	mov	r0, #2
	.loc 1 298 0
	str	ip, [sp, #36]
	.loc 1 300 0
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 301 0
	ldr	r0, [sp, #4]
	ldr	r1, .L51+80
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 303 0
	bl	Exit(PLT)
	.loc 1 304 0
	add	sp, sp, #56
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.LVL17:
.L48:
	.loc 1 243 0
	cmp	r4, #1
	.loc 1 244 0
	moveq	r3, #12
	.loc 1 249 0
	ldr	r0, [sp, #52]
	mov	r1, r6
	mov	r2, #16
	.loc 1 244 0
	moveq	r5, r4
	streq	r3, [r6, #0]
	.loc 1 247 0
	strne	r9, [r6, #0]
	.loc 1 249 0
	bl	Reply(PLT)
	b	.L38
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L47+8)
	.word	__func__.2441(GOT)
	.word	AdministratorTask_Start(GOT)
	.word	ADMINISTRATOR_TASK_NAME(GOT)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	UI_SERVER_NAME(GOT)
	.word	.LC14(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC15(GOTOFF)
	.word	KEYBOARD_INPUT_SERVER_NAME(GOT)
	.word	.LC16(GOTOFF)
	.word	SCREEN_OUTPUT_SERVER_NAME(GOT)
	.word	.LC17(GOTOFF)
	.word	TRAIN_INPUT_SERVER_NAME(GOT)
	.word	.LC18(GOTOFF)
	.word	TRAIN_OUTPUT_SERVER_NAME(GOT)
	.word	.LC19(GOTOFF)
	.word	CLOCK_SERVER_NAME(GOT)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
.LFE6:
	.size	AdministratorTask_Start, .-AdministratorTask_Start
	.align	2
	.global	overflow
	.type	overflow, %function
overflow:
.LFB7:
	.loc 1 306 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL18:
	stmfd	sp!, {r4, r5, lr}
.LCFI7:
	.loc 1 306 0
	mov	r5, r0
	mov	r4, #0
	b	.L55
.LVL19:
.L59:
	.loc 1 309 0
	add	r4, r4, #1
.LVL20:
.L55:
	.loc 1 308 0
	bl	Pass(PLT)
	.loc 1 309 0
	cmp	r4, r5
	bne	.L59
	.loc 1 314 0
	sub	r0, r4, #1
	ldmfd	sp!, {r4, r5, pc}
.LFE7:
	.size	overflow, .-overflow
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
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI1-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI2-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI3-.LFB5
	.byte	0xe
	.uleb128 0x1c
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x88
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x6
	.byte	0x84
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI5-.LFB6
	.byte	0xe
	.uleb128 0x20
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x89
	.uleb128 0x3
	.byte	0x88
	.uleb128 0x4
	.byte	0x87
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x6
	.byte	0x85
	.uleb128 0x7
	.byte	0x84
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x58
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI7-.LFB7
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
	.file 2 "message.h"
	.file 3 "nameserver.h"
	.file 4 "queue.h"
	.file 5 "tasks.h"
	.file 6 "train.h"
	.file 7 "public_kernel_interface.h"
	.file 8 "task_descriptor.h"
	.file 9 "buffer.h"
	.file 10 "rps.h"
	.file 11 "clock.h"
	.file 12 "uart.h"
	.file 13 "ui.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -56
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL19-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x8c2
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF131
	.byte	0x1
	.4byte	.LASF132
	.4byte	.LASF133
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	0x12a
	.4byte	.LASF42
	.byte	0x4
	.byte	0x2
	.byte	0x9
	.uleb128 0x4
	.4byte	.LASF2
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF3
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF4
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF5
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF6
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF7
	.sleb128 5
	.uleb128 0x4
	.4byte	.LASF8
	.sleb128 6
	.uleb128 0x4
	.4byte	.LASF9
	.sleb128 7
	.uleb128 0x4
	.4byte	.LASF10
	.sleb128 8
	.uleb128 0x4
	.4byte	.LASF11
	.sleb128 9
	.uleb128 0x4
	.4byte	.LASF12
	.sleb128 10
	.uleb128 0x4
	.4byte	.LASF13
	.sleb128 11
	.uleb128 0x4
	.4byte	.LASF14
	.sleb128 12
	.uleb128 0x4
	.4byte	.LASF15
	.sleb128 13
	.uleb128 0x4
	.4byte	.LASF16
	.sleb128 14
	.uleb128 0x4
	.4byte	.LASF17
	.sleb128 15
	.uleb128 0x4
	.4byte	.LASF18
	.sleb128 16
	.uleb128 0x4
	.4byte	.LASF19
	.sleb128 17
	.uleb128 0x4
	.4byte	.LASF20
	.sleb128 18
	.uleb128 0x4
	.4byte	.LASF21
	.sleb128 19
	.uleb128 0x4
	.4byte	.LASF22
	.sleb128 20
	.uleb128 0x4
	.4byte	.LASF23
	.sleb128 21
	.uleb128 0x4
	.4byte	.LASF24
	.sleb128 22
	.uleb128 0x4
	.4byte	.LASF25
	.sleb128 23
	.uleb128 0x4
	.4byte	.LASF26
	.sleb128 24
	.uleb128 0x4
	.4byte	.LASF27
	.sleb128 25
	.uleb128 0x4
	.4byte	.LASF28
	.sleb128 26
	.uleb128 0x4
	.4byte	.LASF29
	.sleb128 27
	.uleb128 0x4
	.4byte	.LASF30
	.sleb128 28
	.uleb128 0x4
	.4byte	.LASF31
	.sleb128 29
	.uleb128 0x4
	.4byte	.LASF32
	.sleb128 30
	.uleb128 0x4
	.4byte	.LASF33
	.sleb128 31
	.uleb128 0x4
	.4byte	.LASF34
	.sleb128 32
	.uleb128 0x4
	.4byte	.LASF35
	.sleb128 33
	.uleb128 0x4
	.4byte	.LASF36
	.sleb128 34
	.uleb128 0x4
	.4byte	.LASF37
	.sleb128 35
	.uleb128 0x4
	.4byte	.LASF38
	.sleb128 36
	.uleb128 0x4
	.4byte	.LASF39
	.sleb128 37
	.uleb128 0x4
	.4byte	.LASF40
	.sleb128 38
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x2
	.byte	0x31
	.4byte	0x33
	.uleb128 0x6
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x7
	.4byte	0x14c
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0xf
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.4byte	0x16e
	.4byte	.LASF43
	.byte	0x4
	.byte	0x2
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x2
	.byte	0x41
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF43
	.byte	0x2
	.byte	0x42
	.4byte	0x153
	.uleb128 0x7
	.4byte	0x189
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x8
	.byte	0x4
	.uleb128 0xb
	.byte	0x4
	.4byte	0x16e
	.uleb128 0xb
	.byte	0x4
	.4byte	0x135
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x2
	.byte	0x5
	.uleb128 0x9
	.4byte	0x1e1
	.4byte	.LASF47
	.byte	0x10
	.byte	0x3
	.byte	0xb
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x3
	.byte	0xc
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"str\000"
	.byte	0x3
	.byte	0xd
	.4byte	0x179
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x3
	.byte	0xe
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF47
	.byte	0x3
	.byte	0xf
	.4byte	0x1aa
	.uleb128 0xd
	.4byte	0x223
	.byte	0x1
	.4byte	.LASF50
	.byte	0x1
	.byte	0x15
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF49
	.4byte	0x233
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2396
	.uleb128 0xf
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x135
	.4byte	.LLST0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x233
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x10
	.byte	0x0
	.uleb128 0x10
	.4byte	0x223
	.uleb128 0xd
	.4byte	0x26b
	.byte	0x1
	.4byte	.LASF51
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF49
	.4byte	0x26b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2402
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x135
	.byte	0x0
	.uleb128 0x10
	.4byte	0x13c
	.uleb128 0xd
	.4byte	0x298
	.byte	0x1
	.4byte	.LASF52
	.byte	0x1
	.byte	0xa4
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF49
	.4byte	0x2a8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2416
	.byte	0x0
	.uleb128 0x7
	.4byte	0x2a8
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x14
	.byte	0x0
	.uleb128 0x10
	.4byte	0x298
	.uleb128 0x12
	.4byte	0x315
	.byte	0x1
	.4byte	.LASF53
	.byte	0x1
	.byte	0xae
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST1
	.uleb128 0xe
	.4byte	.LASF49
	.4byte	0x325
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2423
	.uleb128 0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0xb3
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0xb4
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x1
	.byte	0xb5
	.4byte	0x190
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x1
	.byte	0xb6
	.4byte	0x190
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.byte	0xb9
	.4byte	0x135
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x7
	.4byte	0x325
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0xe
	.byte	0x0
	.uleb128 0x10
	.4byte	0x315
	.uleb128 0x12
	.4byte	0x409
	.byte	0x1
	.4byte	.LASF59
	.byte	0x1
	.byte	0xd1
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST2
	.uleb128 0xe
	.4byte	.LASF49
	.4byte	0x419
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2441
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x1
	.byte	0xd4
	.4byte	0x135
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x1
	.byte	0xd8
	.4byte	0x25
	.4byte	.LLST3
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0x1
	.byte	0xd9
	.4byte	0x25
	.4byte	.LLST4
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x1
	.byte	0xdd
	.4byte	0x25
	.uleb128 0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0xe0
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 36
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x1
	.byte	0xe1
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0xe2
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x1
	.byte	0xe4
	.4byte	0x190
	.uleb128 0x14
	.4byte	.LASF66
	.byte	0x1
	.byte	0xe5
	.4byte	0x190
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x1
	.byte	0xe7
	.4byte	0x135
	.byte	0x2
	.byte	0x7d
	.sleb128 52
	.uleb128 0x16
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x105
	.4byte	0x190
	.4byte	.LLST5
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x106
	.4byte	0x190
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x128
	.4byte	0x41e
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x129
	.4byte	0x41e
	.byte	0x0
	.uleb128 0x7
	.4byte	0x419
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x17
	.byte	0x0
	.uleb128 0x10
	.4byte	0x409
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1e1
	.uleb128 0x18
	.4byte	0x45c
	.byte	0x1
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x132
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x132
	.4byte	0x135
	.4byte	.LLST6
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x133
	.4byte	0x135
	.byte	0x0
	.uleb128 0x1b
	.4byte	.LASF73
	.byte	0x4
	.byte	0xb
	.4byte	0x468
	.sleb128 -1
	.uleb128 0x10
	.4byte	0x135
	.uleb128 0x1b
	.4byte	.LASF74
	.byte	0x4
	.byte	0xc
	.4byte	0x468
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x489
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x5
	.byte	0x6
	.4byte	0x49a
	.byte	0x5
	.byte	0x3
	.4byte	ADMINISTRATOR_TASK_NAME
	.uleb128 0x10
	.4byte	0x479
	.uleb128 0x7
	.4byte	0x4af
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x4
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF76
	.byte	0x5
	.byte	0x7
	.4byte	0x4c0
	.byte	0x5
	.byte	0x3
	.4byte	IDLE_TASK_NAME
	.uleb128 0x10
	.4byte	0x49f
	.uleb128 0x7
	.4byte	0x4d5
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x6
	.byte	0xb
	.4byte	0x4e6
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_NAME
	.uleb128 0x10
	.4byte	0x4c5
	.uleb128 0x7
	.4byte	0x4fb
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF78
	.byte	0x6
	.byte	0xc
	.4byte	0x50a
	.4byte	.LASF79
	.uleb128 0x10
	.4byte	0x4eb
	.uleb128 0x7
	.4byte	0x51f
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF80
	.byte	0x6
	.byte	0xd
	.4byte	0x52e
	.4byte	.LASF81
	.uleb128 0x10
	.4byte	0x50f
	.uleb128 0x7
	.4byte	0x543
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF82
	.byte	0x6
	.byte	0xe
	.4byte	0x552
	.4byte	.LASF83
	.uleb128 0x10
	.4byte	0x533
	.uleb128 0x1d
	.4byte	.LASF84
	.byte	0x6
	.byte	0x10
	.4byte	0x468
	.byte	0x10
	.uleb128 0x7
	.4byte	0x579
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0x6
	.byte	0x6d
	.4byte	0x584
	.uleb128 0x10
	.4byte	0x563
	.uleb128 0x1b
	.4byte	.LASF86
	.byte	0x7
	.byte	0x7
	.4byte	0x468
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF87
	.byte	0x7
	.byte	0x8
	.4byte	0x468
	.sleb128 -2
	.uleb128 0x1b
	.4byte	.LASF88
	.byte	0x7
	.byte	0x9
	.4byte	0x468
	.sleb128 -3
	.uleb128 0x1b
	.4byte	.LASF89
	.byte	0x7
	.byte	0xa
	.4byte	0x468
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF90
	.byte	0x7
	.byte	0xb
	.4byte	0x468
	.sleb128 -2
	.uleb128 0x1d
	.4byte	.LASF91
	.byte	0x7
	.byte	0xc
	.4byte	0x468
	.byte	0x2
	.uleb128 0x1b
	.4byte	.LASF92
	.byte	0x7
	.byte	0xd
	.4byte	0x468
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF93
	.byte	0x7
	.byte	0xe
	.4byte	0x468
	.sleb128 -2
	.uleb128 0x1b
	.4byte	.LASF94
	.byte	0x7
	.byte	0xf
	.4byte	0x468
	.sleb128 -3
	.uleb128 0x1b
	.4byte	.LASF95
	.byte	0x7
	.byte	0x10
	.4byte	0x468
	.sleb128 -4
	.uleb128 0x1e
	.4byte	.LASF96
	.byte	0x7
	.byte	0x11
	.4byte	0x615
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x10
	.4byte	0x189
	.uleb128 0x7
	.4byte	0x630
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x8
	.byte	0x27
	.4byte	0x63b
	.uleb128 0x10
	.4byte	0x61a
	.uleb128 0x1b
	.4byte	.LASF98
	.byte	0x9
	.byte	0x5
	.4byte	0x468
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF99
	.byte	0x9
	.byte	0x6
	.4byte	0x468
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x668
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF100
	.byte	0xa
	.byte	0x9
	.4byte	0x677
	.4byte	.LASF101
	.uleb128 0x10
	.4byte	0x658
	.uleb128 0x7
	.4byte	0x68c
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF102
	.byte	0xb
	.byte	0x8
	.4byte	0x69d
	.byte	0x5
	.byte	0x3
	.4byte	CLOCK_SERVER_NAME
	.uleb128 0x10
	.4byte	0x67c
	.uleb128 0x1b
	.4byte	.LASF103
	.byte	0xb
	.byte	0x9
	.4byte	0x6b2
	.sleb128 -2139029408
	.uleb128 0x10
	.4byte	0x196
	.uleb128 0x1b
	.4byte	.LASF104
	.byte	0xb
	.byte	0xa
	.4byte	0x6b2
	.sleb128 -2139029372
	.uleb128 0x7
	.4byte	0x6d7
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF105
	.byte	0xc
	.byte	0x8
	.4byte	0x6e8
	.byte	0x5
	.byte	0x3
	.4byte	KEYBOARD_INPUT_SERVER_NAME
	.uleb128 0x10
	.4byte	0x6c7
	.uleb128 0x7
	.4byte	0x6fd
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0xc
	.byte	0x9
	.4byte	0x70e
	.byte	0x5
	.byte	0x3
	.4byte	SCREEN_OUTPUT_SERVER_NAME
	.uleb128 0x10
	.4byte	0x6ed
	.uleb128 0x7
	.4byte	0x723
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF107
	.byte	0xc
	.byte	0xa
	.4byte	0x734
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_INPUT_SERVER_NAME
	.uleb128 0x10
	.4byte	0x713
	.uleb128 0x7
	.4byte	0x749
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF108
	.byte	0xc
	.byte	0xb
	.4byte	0x75a
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_OUTPUT_SERVER_NAME
	.uleb128 0x10
	.4byte	0x739
	.uleb128 0x1b
	.4byte	.LASF109
	.byte	0xc
	.byte	0xd
	.4byte	0x76f
	.sleb128 -2138308608
	.uleb128 0x10
	.4byte	0x774
	.uleb128 0xb
	.byte	0x4
	.4byte	0x77a
	.uleb128 0x1f
	.4byte	0x135
	.uleb128 0x1b
	.4byte	.LASF110
	.byte	0xc
	.byte	0xe
	.4byte	0x76f
	.sleb128 -2138243072
	.uleb128 0x1b
	.4byte	.LASF111
	.byte	0xc
	.byte	0xf
	.4byte	0x76f
	.sleb128 -2138308604
	.uleb128 0x1b
	.4byte	.LASF112
	.byte	0xc
	.byte	0x10
	.4byte	0x76f
	.sleb128 -2138243068
	.uleb128 0x7
	.4byte	0x7bf
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF113
	.byte	0xd
	.byte	0xe
	.4byte	0x7d0
	.byte	0x5
	.byte	0x3
	.4byte	UI_SERVER_NAME
	.uleb128 0x10
	.4byte	0x7af
	.uleb128 0x7
	.4byte	0x7e5
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF114
	.byte	0xd
	.byte	0xf
	.4byte	0x7f4
	.4byte	.LASF115
	.uleb128 0x10
	.4byte	0x7d5
	.uleb128 0x7
	.4byte	0x809
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF116
	.byte	0xd
	.byte	0x10
	.4byte	0x818
	.4byte	.LASF117
	.uleb128 0x10
	.4byte	0x7f9
	.uleb128 0x7
	.4byte	0x82d
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x43
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF118
	.byte	0xd
	.byte	0x11
	.4byte	0x83c
	.4byte	.LASF119
	.uleb128 0x10
	.4byte	0x81d
	.uleb128 0x1d
	.4byte	.LASF120
	.byte	0xd
	.byte	0x12
	.4byte	0x468
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF121
	.byte	0xd
	.byte	0x13
	.4byte	0x468
	.byte	0x1
	.uleb128 0x1d
	.4byte	.LASF122
	.byte	0xd
	.byte	0x14
	.4byte	0x468
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF123
	.byte	0xd
	.byte	0x15
	.4byte	0x468
	.byte	0x14
	.uleb128 0x1d
	.4byte	.LASF124
	.byte	0xd
	.byte	0x16
	.4byte	0x468
	.byte	0x17
	.uleb128 0x1d
	.4byte	.LASF125
	.byte	0xd
	.byte	0x17
	.4byte	0x468
	.byte	0x1
	.uleb128 0x1d
	.4byte	.LASF126
	.byte	0xd
	.byte	0x18
	.4byte	0x468
	.byte	0x28
	.uleb128 0x1d
	.4byte	.LASF127
	.byte	0xd
	.byte	0x19
	.4byte	0x468
	.byte	0x13
	.uleb128 0x1d
	.4byte	.LASF128
	.byte	0xd
	.byte	0x1a
	.4byte	0x468
	.byte	0x46
	.uleb128 0x1d
	.4byte	.LASF129
	.byte	0xd
	.byte	0x1b
	.4byte	0x468
	.byte	0x1e
	.uleb128 0x1d
	.4byte	.LASF130
	.byte	0xd
	.byte	0x1c
	.4byte	0x468
	.byte	0x19
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xb
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x8c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x8c6
	.4byte	0x1ec
	.ascii	"KernelTask_Start\000"
	.4byte	0x238
	.ascii	"FirstTask_Start\000"
	.4byte	0x270
	.ascii	"ClockPrintTask_Start\000"
	.4byte	0x2ad
	.ascii	"IdleTask_Start\000"
	.4byte	0x32a
	.ascii	"AdministratorTask_Start\000"
	.4byte	0x424
	.ascii	"overflow\000"
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
.LASF134:
	.ascii	"times\000"
.LASF102:
	.ascii	"CLOCK_SERVER_NAME\000"
.LASF63:
	.ascii	"required_requests\000"
.LASF107:
	.ascii	"TRAIN_INPUT_SERVER_NAME\000"
.LASF131:
	.ascii	"GNU C 4.0.2\000"
.LASF103:
	.ascii	"TIMER4_VAL_LOW\000"
.LASF72:
	.ascii	"overflow\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF125:
	.ascii	"ENGINE_STATUS_COL_OFFSET\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF78:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF57:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF89:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF67:
	.ascii	"source_tid\000"
.LASF47:
	.ascii	"NameServerMessage\000"
.LASF81:
	.ascii	"TrSTmr\000"
.LASF96:
	.ascii	"TICK_SIZE\000"
.LASF76:
	.ascii	"IDLE_TASK_NAME\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF120:
	.ascii	"SENSOR_TABLE_ROW_OFFSET\000"
.LASF70:
	.ascii	"ns_send_message\000"
.LASF6:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF93:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF52:
	.ascii	"ClockPrintTask_Start\000"
.LASF110:
	.ascii	"UART2DATA\000"
.LASF126:
	.ascii	"ENGINE_STATUS_COL_2_OFFSET\000"
.LASF97:
	.ascii	"TASK_STATE_NAMES\000"
.LASF69:
	.ascii	"shutdown_reply_message\000"
.LASF82:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF51:
	.ascii	"FirstTask_Start\000"
.LASF58:
	.ascii	"admin_tid\000"
.LASF111:
	.ascii	"UART1RXSts\000"
.LASF99:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF95:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF85:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF48:
	.ascii	"message_type\000"
.LASF98:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF54:
	.ascii	"send_buffer\000"
.LASF88:
	.ascii	"ERR_K_DEFAULT\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF114:
	.ascii	"UI_TIMER_NAME\000"
.LASF84:
	.ascii	"LIGHTS_MASK\000"
.LASF60:
	.ascii	"return_code\000"
.LASF127:
	.ascii	"ENGINE_DATA_COL_OFFSET\000"
.LASF106:
	.ascii	"SCREEN_OUTPUT_SERVER_NAME\000"
.LASF77:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF4:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF42:
	.ascii	"MessageType\000"
.LASF105:
	.ascii	"KEYBOARD_INPUT_SERVER_NAME\000"
.LASF5:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF41:
	.ascii	"char\000"
.LASF115:
	.ascii	"UITmr\000"
.LASF62:
	.ascii	"shutdown_requests\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF128:
	.ascii	"ENGINE_DATA_COL_2_OFFSET\000"
.LASF64:
	.ascii	"receive_buffer\000"
.LASF116:
	.ascii	"UI_PRINT_TASK_NAME\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF92:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF119:
	.ascii	"> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYST"
	.ascii	"EM CS-452-2013 <\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF61:
	.ascii	"idletask_shutdown_sent\000"
.LASF65:
	.ascii	"receive_msg\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF123:
	.ascii	"MAP_COL_OFFSET\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF90:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF56:
	.ascii	"send_message\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF59:
	.ascii	"AdministratorTask_Start\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF121:
	.ascii	"SENSOR_TABLE_COL_OFFSET\000"
.LASF49:
	.ascii	"__func__\000"
.LASF71:
	.ascii	"ns_reply_message\000"
.LASF46:
	.ascii	"short int\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF55:
	.ascii	"reply_buffer\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF75:
	.ascii	"ADMINISTRATOR_TASK_NAME\000"
.LASF113:
	.ascii	"UI_SERVER_NAME\000"
.LASF79:
	.ascii	"TCmSvr\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF74:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF130:
	.ascii	"MAX_PRINT_MESSAGE\000"
.LASF100:
	.ascii	"RPS_SERVER_NAME\000"
.LASF124:
	.ascii	"ENGINE_STATUS_ROW_OFFSET\000"
.LASF112:
	.ascii	"UART2RXSts\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF117:
	.ascii	"UIPrt\000"
.LASF101:
	.ascii	"RPSSvr\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF118:
	.ascii	"UI_SERVER_HEADER\000"
.LASF66:
	.ascii	"reply_msg\000"
.LASF7:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF87:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF43:
	.ascii	"GenericMessage\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF45:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF86:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF73:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF68:
	.ascii	"shutdown_send_message\000"
.LASF122:
	.ascii	"MAP_ROW_OFFSET\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF53:
	.ascii	"IdleTask_Start\000"
.LASF108:
	.ascii	"TRAIN_OUTPUT_SERVER_NAME\000"
.LASF2:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF129:
	.ascii	"PRINT_MESSAGE_OFFSET\000"
.LASF83:
	.ascii	"TrSwMr\000"
.LASF50:
	.ascii	"KernelTask_Start\000"
.LASF80:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF91:
	.ascii	"NAMESERVER_TID\000"
.LASF8:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF132:
	.ascii	"tasks.c\000"
.LASF44:
	.ascii	"double\000"
.LASF104:
	.ascii	"TIMER4_VAL_HIGH\000"
.LASF94:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF109:
	.ascii	"UART1DATA\000"
.LASF133:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
	.ident	"GCC: (GNU) 4.0.2"
