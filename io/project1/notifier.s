	.file	"notifier.c"
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
	.type	CLOCK_SERVER_NAME, %object
	.size	CLOCK_SERVER_NAME, 8
CLOCK_SERVER_NAME:
	.ascii	"ClckSvr\000"
	.align	2
	.type	__func__.2046, %object
	.size	__func__.2046, 20
__func__.2046:
	.ascii	"ClockNotifier_Start\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ClockNotifier: did not get a clock server id\000"
	.align	2
.LC1:
	.ascii	"ClockNotifier_Start did not get a ACK or SHUTDOWN r"
	.ascii	"eply\000"
	.text
	.align	2
	.global	ClockNotifier_Start
	.type	ClockNotifier_Start, %function
ClockNotifier_Start:
.LFB2:
	.file 1 "notifier.c"
	.loc 1 7 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI0:
	ldr	sl, .L13
	.loc 1 8 0
	ldr	r3, .L13+4
	ldr	r2, .L13+8
	.loc 1 7 0
.L10:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI1:
.LVL1:
	.loc 1 8 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	ldr	r8, .L13+12
	ldr	r7, .L13+16
	ldr	r6, .L13+20
	.loc 1 15 0
	mov	r3, #15
	.loc 1 16 0
	mov	r2, #1
	.loc 1 12 0
	add	r9, sp, #20
	.loc 1 16 0
	mov	r4, #0
.LVL2:
	.loc 1 15 0
	str	r3, [sp, #4]
	.loc 1 16 0
	str	r2, [sp, #8]
	b	.L2
.LVL3:
.L12:
	.loc 1 27 0
	cmp	r4, r7
	movgt	r0, #0
	movle	r0, #1
	bl	assert(PLT)
.L2:
	.loc 1 20 0
	ldr	r0, [sl, r8]
	bl	WhoIs(PLT)
	.loc 1 22 0
	subs	r5, r0, #0
	.loc 1 26 0
	add	r4, r4, #1
	.loc 1 27 0
	add	r1, sl, r6
	.loc 1 22 0
	beq	.L12
	ldr	r7, .L13+24
	add	r6, sp, #4
	mov	r4, #16
.LVL4:
.L3:
	.loc 1 31 0
	mov	r0, #1
	bl	AwaitEvent(PLT)
	.loc 1 35 0
	mov	r3, r9
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 37 0
	ldr	r0, [sp, #20]
	add	r1, sl, r7
	cmp	r0, #12
	cmpne	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	.loc 1 41 0
	ldr	r3, [sp, #20]
	cmp	r3, #12
	bne	.L3
	.loc 1 46 0
	bl	Exit(PLT)
	.loc 1 47 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	ClockNotifier_Start(GOT)
	.word	__func__.2046(GOT)
	.word	CLOCK_SERVER_NAME(GOT)
	.word	999
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
.LFE2:
	.size	ClockNotifier_Start, .-ClockNotifier_Start
	.section	.rodata
	.align	2
	.type	__func__.2066, %object
	.size	__func__.2066, 28
__func__.2066:
	.ascii	"KeyboardInputNotifier_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"KeyboardInputNotifier failed WhoIs\000"
	.align	2
.LC3:
	.ascii	"KeyboardInputNotifier didn't get an ACK\000"
	.text
	.align	2
	.global	KeyboardInputNotifier_Start
	.type	KeyboardInputNotifier_Start, %function
KeyboardInputNotifier_Start:
.LFB3:
	.loc 1 49 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI2:
	ldr	sl, .L19
	.loc 1 50 0
	ldr	r2, .L19+4
	ldr	r3, .L19+8
	.loc 1 49 0
.L18:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI3:
.LVL6:
	.loc 1 50 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 55 0
	ldr	r3, .L19+12
	ldr	r8, .L19+16
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 56 0
	ldr	r1, .L19+20
	.loc 1 55 0
	mov	r5, r0
.LVL7:
	.loc 1 56 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 59 0
	mov	r2, #4
	.loc 1 58 0
	mov	r3, #15
	.loc 1 53 0
	add	r7, sp, #20
	.loc 1 58 0
	str	r3, [sp, #4]
	.loc 1 59 0
	str	r2, [sp, #8]
	add	r6, sp, r2
	mov	r4, #16
.L16:
	.loc 1 62 0
	mov	r0, #4
	bl	AwaitEvent(PLT)
	.loc 1 63 0
	mov	r1, r6
	mov	r0, r5
	mov	r2, r4
	mov	r3, r7
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 64 0
	ldr	r0, [sp, #20]
	add	r1, sl, r8
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	b	.L16
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	__func__.2066(GOT)
	.word	KeyboardInputNotifier_Start(GOT)
	.word	KEYBOARD_INPUT_SERVER_NAME(GOT)
	.word	.LC3(GOTOFF)
	.word	.LC2(GOTOFF)
.LFE3:
	.size	KeyboardInputNotifier_Start, .-KeyboardInputNotifier_Start
	.section	.rodata
	.align	2
	.type	__func__.2078, %object
	.size	__func__.2078, 27
__func__.2078:
	.ascii	"ScreenOutputNotifier_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"ScreenOutputNotifier failed WhoIs\000"
	.align	2
.LC5:
	.ascii	"ScreenOutputNotifier didn't get an ACK\000"
	.text
	.align	2
	.global	ScreenOutputNotifier_Start
	.type	ScreenOutputNotifier_Start, %function
ScreenOutputNotifier_Start:
.LFB4:
	.loc 1 71 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI4:
	ldr	sl, .L28
	.loc 1 72 0
	ldr	r2, .L28+4
	ldr	r3, .L28+8
	.loc 1 71 0
.L26:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI5:
.LVL9:
	.loc 1 72 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 77 0
	ldr	r3, .L28+12
	ldr	r8, .L28+16
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 78 0
	ldr	r1, .L28+20
	.loc 1 77 0
	mov	r5, r0
.LVL10:
	.loc 1 78 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 75 0
	add	r7, sp, #20
	.loc 1 80 0
	mov	r3, #15
	.loc 1 81 0
	mov	r2, #5
	add	r6, sp, #4
	mov	r4, #16
	.loc 1 80 0
	str	r3, [sp, #4]
	.loc 1 81 0
	str	r2, [sp, #8]
	b	.L22
.L27:
	.loc 1 92 0
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
.L22:
	.loc 1 85 0
	mov	r0, #5
	bl	AwaitEvent(PLT)
	.loc 1 86 0
	mov	r1, r6
	mov	r2, r4
	mov	r3, r7
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 88 0
	ldr	r0, [sp, #20]
	.loc 1 92 0
	add	r1, sl, r8
	.loc 1 88 0
	cmp	r0, #12
	bne	.L27
	.loc 1 95 0
	bl	Exit(PLT)
	.loc 1 96 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	__func__.2078(GOT)
	.word	ScreenOutputNotifier_Start(GOT)
	.word	SCREEN_OUTPUT_SERVER_NAME(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC4(GOTOFF)
.LFE4:
	.size	ScreenOutputNotifier_Start, .-ScreenOutputNotifier_Start
	.section	.rodata
	.align	2
	.type	__func__.2091, %object
	.size	__func__.2091, 25
__func__.2091:
	.ascii	"TrainInputNotifier_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"TrainInputNotifier failed WhoIs\000"
	.align	2
.LC7:
	.ascii	"TrainInputNotifier didn't get an ACK\000"
	.text
	.align	2
	.global	TrainInputNotifier_Start
	.type	TrainInputNotifier_Start, %function
TrainInputNotifier_Start:
.LFB5:
	.loc 1 98 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL11:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI6:
	ldr	sl, .L34
	.loc 1 99 0
	ldr	r2, .L34+4
	ldr	r3, .L34+8
	.loc 1 98 0
.L33:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI7:
.LVL12:
	.loc 1 99 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 104 0
	ldr	r3, .L34+12
	ldr	r8, .L34+16
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 105 0
	ldr	r1, .L34+20
	.loc 1 104 0
	mov	r5, r0
.LVL13:
	.loc 1 105 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 107 0
	mov	r3, #15
	.loc 1 108 0
	mov	r2, #2
	.loc 1 102 0
	add	r7, sp, #20
	.loc 1 107 0
	str	r3, [sp, #4]
	.loc 1 108 0
	str	r2, [sp, #8]
	add	r6, sp, #4
	mov	r4, #16
.L31:
	.loc 1 111 0
	mov	r0, #2
	bl	AwaitEvent(PLT)
	.loc 1 112 0
	mov	r1, r6
	mov	r0, r5
	mov	r2, r4
	mov	r3, r7
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 113 0
	ldr	r0, [sp, #20]
	add	r1, sl, r8
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	b	.L31
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	__func__.2091(GOT)
	.word	TrainInputNotifier_Start(GOT)
	.word	TRAIN_INPUT_SERVER_NAME(GOT)
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
.LFE5:
	.size	TrainInputNotifier_Start, .-TrainInputNotifier_Start
	.section	.rodata
	.align	2
	.type	__func__.2103, %object
	.size	__func__.2103, 26
__func__.2103:
	.ascii	"TrainOutputNotifier_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"TrainOutputNotifier failed WhoIs\000"
	.align	2
.LC9:
	.ascii	"TrainOutputNotifier didn't get an ACK\000"
	.text
	.align	2
	.global	TrainOutputNotifier_Start
	.type	TrainOutputNotifier_Start, %function
TrainOutputNotifier_Start:
.LFB6:
	.loc 1 120 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI8:
	ldr	sl, .L43
	.loc 1 121 0
	ldr	r2, .L43+4
	ldr	r3, .L43+8
	.loc 1 120 0
.L41:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI9:
.LVL15:
	.loc 1 121 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 126 0
	ldr	r3, .L43+12
	ldr	r8, .L43+16
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 127 0
	ldr	r1, .L43+20
	.loc 1 126 0
	mov	r5, r0
.LVL16:
	.loc 1 127 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 124 0
	add	r7, sp, #20
	.loc 1 129 0
	mov	r3, #15
	.loc 1 130 0
	mov	r2, #3
	add	r6, sp, #4
	mov	r4, #16
	.loc 1 129 0
	str	r3, [sp, #4]
	.loc 1 130 0
	str	r2, [sp, #8]
	b	.L37
.L42:
	.loc 1 145 0
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	.loc 1 135 0
	mov	r0, #3
	bl	AwaitEvent(PLT)
.L37:
	.loc 1 139 0
	mov	r1, r6
	mov	r2, r4
	mov	r3, r7
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 141 0
	ldr	r0, [sp, #20]
	.loc 1 145 0
	add	r1, sl, r8
	.loc 1 141 0
	cmp	r0, #12
	bne	.L42
	.loc 1 149 0
	bl	Exit(PLT)
	.loc 1 150 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	__func__.2103(GOT)
	.word	TrainOutputNotifier_Start(GOT)
	.word	TRAIN_OUTPUT_SERVER_NAME(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC8(GOTOFF)
.LFE6:
	.size	TrainOutputNotifier_Start, .-TrainOutputNotifier_Start
	.section	.rodata
	.align	2
	.type	__func__.2117, %object
	.size	__func__.2117, 22
__func__.2117:
	.ascii	"TrainIONotifier_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"TrainIONotifier_Start: did not get server id\000"
	.text
	.align	2
	.global	TrainIONotifier_Start
	.type	TrainIONotifier_Start, %function
TrainIONotifier_Start:
.LFB7:
	.loc 1 152 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL17:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI10:
	ldr	sl, .L56
	.loc 1 153 0
	ldr	r3, .L56+4
	ldr	r2, .L56+8
	.loc 1 152 0
.L54:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI11:
.LVL18:
	.loc 1 153 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	ldr	r9, .L56+12
	ldr	r8, .L56+16
	ldr	r7, .L56+20
	.loc 1 159 0
	mov	r3, #22
	.loc 1 156 0
	add	fp, sp, #20
	.loc 1 159 0
	mov	r4, #0
.LVL19:
	str	r3, [sp, #4]
	b	.L46
.LVL20:
.L55:
	.loc 1 176 0
	cmp	r4, #1000
	movge	r0, #0
	movlt	r0, #1
	bl	assert(PLT)
.L46:
	.loc 1 167 0
	ldr	r0, .L56+24
	bl	DelaySeconds(PLT)
	.loc 1 168 0
	ldr	r0, [sl, r9]
	bl	WhoIs(PLT)
	mov	r6, r0
	.loc 1 169 0
	ldr	r0, [sl, r8]
	bl	WhoIs(PLT)
	.loc 1 171 0
	cmp	r6, #0
	cmpne	r0, #0
	.loc 1 175 0
	add	r4, r4, #1
	.loc 1 171 0
	mov	r5, r0
	.loc 1 176 0
	add	r1, sl, r7
	.loc 1 171 0
	beq	.L55
	add	r7, sp, #4
	mov	r4, #16
.LVL21:
.L47:
	.loc 1 181 0
	mov	r0, #1065353216
	bl	DelaySeconds(PLT)
	.loc 1 183 0
	mov	r1, r7
	mov	r2, r4
	mov	r3, fp
	mov	r0, r6
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 185 0
	ldr	ip, [sp, #20]
	.loc 1 189 0
	mov	r0, r5
	.loc 1 185 0
	cmp	ip, #12
	.loc 1 189 0
	mov	r1, r7
	mov	r2, r4
	mov	r3, fp
	.loc 1 185 0
	beq	.L49
.LVL22:
	.loc 1 189 0
	str	r4, [sp, #0]
	bl	Send(PLT)
.LVL23:
	.loc 1 191 0
	ldr	r3, [sp, #20]
	cmp	r3, #12
	bne	.L47
.LVL24:
.L49:
	.loc 1 196 0
	bl	Exit(PLT)
	.loc 1 197 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L54+8)
	.word	TrainIONotifier_Start(GOT)
	.word	__func__.2117(GOT)
	.word	TRAIN_INPUT_SERVER_NAME(GOT)
	.word	TRAIN_OUTPUT_SERVER_NAME(GOT)
	.word	.LC10(GOTOFF)
	.word	1036831949
.LFE7:
	.size	TrainIONotifier_Start, .-TrainIONotifier_Start
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
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x44
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
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
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI4-.LFB4
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
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI6-.LFB5
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
	.4byte	.LCFI7-.LCFI6
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
	.4byte	.LCFI8-.LFB6
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
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI10-.LFB7
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
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x48
	.align	2
.LEFDE10:
	.file 2 "clock.h"
	.file 3 "message.h"
	.file 4 "notifier.h"
	.file 5 "public_kernel_interface.h"
	.file 6 "queue.h"
	.file 7 "train.h"
	.file 8 "task_descriptor.h"
	.file 9 "buffer.h"
	.file 10 "uart.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x850
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF112
	.byte	0x1
	.4byte	.LASF113
	.4byte	.LASF114
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
	.byte	0x40
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x3
	.byte	0x41
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF43
	.byte	0x3
	.byte	0x42
	.4byte	0x153
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x8
	.byte	0x4
	.uleb128 0xb
	.byte	0x4
	.4byte	0x16e
	.uleb128 0x3
	.4byte	0x1bd
	.4byte	.LASF45
	.byte	0x4
	.byte	0x5
	.byte	0x13
	.uleb128 0x4
	.4byte	.LASF46
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF47
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF48
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF49
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF50
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF51
	.sleb128 5
	.uleb128 0x4
	.4byte	.LASF52
	.sleb128 6
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF45
	.byte	0x5
	.byte	0x1b
	.4byte	0x186
	.uleb128 0x9
	.4byte	0x1f1
	.4byte	.LASF53
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x4
	.byte	0x8
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0x4
	.byte	0x9
	.4byte	0x1bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF53
	.byte	0x4
	.byte	0xa
	.4byte	0x1c8
	.uleb128 0xb
	.byte	0x4
	.4byte	0x135
	.uleb128 0x2
	.4byte	.LASF56
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x2
	.byte	0x5
	.uleb128 0x9
	.4byte	0x239
	.4byte	.LASF58
	.byte	0x8
	.byte	0x2
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x2
	.byte	0xd
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"num\000"
	.byte	0x2
	.byte	0xe
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF58
	.byte	0x2
	.byte	0xf
	.4byte	0x210
	.uleb128 0xd
	.4byte	0x2b9
	.byte	0x1
	.4byte	.LASF65
	.byte	0x1
	.byte	0x7
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST0
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x2c9
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2046
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x1
	.byte	0x9
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0xa
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0xb
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0xc
	.4byte	0x2ce
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0xd
	.4byte	0x2d4
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x135
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x7
	.4byte	0x2c9
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x12
	.4byte	0x2b9
	.uleb128 0xb
	.byte	0x4
	.4byte	0x239
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1f1
	.uleb128 0xd
	.4byte	0x342
	.byte	0x1
	.4byte	.LASF66
	.byte	0x1
	.byte	0x31
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST2
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x352
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2066
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0x33
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0x34
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x35
	.4byte	0x180
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x36
	.4byte	0x2d4
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x1
	.byte	0x37
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x7
	.4byte	0x352
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x1b
	.byte	0x0
	.uleb128 0x12
	.4byte	0x342
	.uleb128 0xd
	.4byte	0x3bf
	.byte	0x1
	.4byte	.LASF68
	.byte	0x1
	.byte	0x47
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x3cf
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2078
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0x49
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0x4a
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x4b
	.4byte	0x180
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x4c
	.4byte	0x2d4
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x1
	.byte	0x4d
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x7
	.4byte	0x3cf
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x1a
	.byte	0x0
	.uleb128 0x12
	.4byte	0x3bf
	.uleb128 0xd
	.4byte	0x43c
	.byte	0x1
	.4byte	.LASF69
	.byte	0x1
	.byte	0x62
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST4
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x44c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2091
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0x64
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0x65
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x66
	.4byte	0x180
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x67
	.4byte	0x2d4
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x1
	.byte	0x68
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x7
	.4byte	0x44c
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x18
	.byte	0x0
	.uleb128 0x12
	.4byte	0x43c
	.uleb128 0xd
	.4byte	0x4c4
	.byte	0x1
	.4byte	.LASF70
	.byte	0x1
	.byte	0x78
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST5
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x4d4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2103
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0x7a
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0x7b
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x7c
	.4byte	0x180
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x7d
	.4byte	0x2d4
	.uleb128 0xf
	.4byte	.LASF67
	.byte	0x1
	.byte	0x7e
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x1
	.byte	0x84
	.4byte	0x135
	.byte	0x0
	.uleb128 0x7
	.4byte	0x4d4
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x19
	.byte	0x0
	.uleb128 0x12
	.4byte	0x4c4
	.uleb128 0xd
	.4byte	0x55d
	.byte	0x1
	.4byte	.LASF72
	.byte	0x1
	.byte	0x98
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LLST6
	.uleb128 0xe
	.4byte	.LASF59
	.4byte	0x56d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2117
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.byte	0x9a
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0xf
	.4byte	.LASF62
	.byte	0x1
	.byte	0x9b
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x9c
	.4byte	0x180
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x9d
	.4byte	0x2d4
	.uleb128 0xf
	.4byte	.LASF73
	.byte	0x1
	.byte	0xa1
	.4byte	0x135
	.byte	0x1
	.byte	0x56
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x1
	.byte	0xa2
	.4byte	0x135
	.4byte	.LLST7
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa4
	.4byte	0x135
	.4byte	.LLST8
	.byte	0x0
	.uleb128 0x7
	.4byte	0x56d
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x15
	.byte	0x0
	.uleb128 0x12
	.4byte	0x55d
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0x6
	.byte	0x9
	.4byte	0x57e
	.sleb128 -1
	.uleb128 0x12
	.4byte	0x135
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x6
	.byte	0xa
	.4byte	0x57e
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x59f
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF77
	.byte	0x7
	.byte	0xb
	.4byte	0x5ae
	.4byte	.LASF78
	.uleb128 0x12
	.4byte	0x58f
	.uleb128 0x7
	.4byte	0x5c3
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF79
	.byte	0x7
	.byte	0xc
	.4byte	0x5d2
	.4byte	.LASF80
	.uleb128 0x12
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	0x5e7
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF81
	.byte	0x7
	.byte	0xd
	.4byte	0x5f6
	.4byte	.LASF82
	.uleb128 0x12
	.4byte	0x5d7
	.uleb128 0x7
	.4byte	0x60b
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0x7
	.byte	0xe
	.4byte	0x61a
	.4byte	.LASF84
	.uleb128 0x12
	.4byte	0x5fb
	.uleb128 0x16
	.4byte	.LASF85
	.byte	0x7
	.byte	0x10
	.4byte	0x57e
	.byte	0x10
	.uleb128 0x7
	.4byte	0x641
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x10
	.4byte	.LASF86
	.byte	0x7
	.byte	0x6d
	.4byte	0x64c
	.uleb128 0x12
	.4byte	0x62b
	.uleb128 0x14
	.4byte	.LASF87
	.byte	0x5
	.byte	0x7
	.4byte	0x57e
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF88
	.byte	0x5
	.byte	0x8
	.4byte	0x57e
	.sleb128 -2
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x5
	.byte	0x9
	.4byte	0x57e
	.sleb128 -3
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x5
	.byte	0xa
	.4byte	0x57e
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0x5
	.byte	0xb
	.4byte	0x57e
	.sleb128 -2
	.uleb128 0x16
	.4byte	.LASF92
	.byte	0x5
	.byte	0xc
	.4byte	0x57e
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF93
	.byte	0x5
	.byte	0xd
	.4byte	0x57e
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x5
	.byte	0xe
	.4byte	0x57e
	.sleb128 -2
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0x5
	.byte	0xf
	.4byte	0x57e
	.sleb128 -3
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x5
	.byte	0x10
	.4byte	0x57e
	.sleb128 -4
	.uleb128 0x17
	.4byte	.LASF97
	.byte	0x5
	.byte	0x11
	.4byte	0x6dd
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x12
	.4byte	0x179
	.uleb128 0x7
	.4byte	0x6f8
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x10
	.4byte	.LASF98
	.byte	0x8
	.byte	0x27
	.4byte	0x703
	.uleb128 0x12
	.4byte	0x6e2
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x9
	.byte	0x5
	.4byte	0x57e
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0x9
	.byte	0x6
	.4byte	0x57e
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x730
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF101
	.byte	0x2
	.byte	0x8
	.4byte	0x741
	.byte	0x5
	.byte	0x3
	.4byte	CLOCK_SERVER_NAME
	.uleb128 0x12
	.4byte	0x720
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0x2
	.byte	0x9
	.4byte	0x756
	.sleb128 -2139029408
	.uleb128 0x12
	.4byte	0x1fc
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0x2
	.byte	0xa
	.4byte	0x756
	.sleb128 -2139029372
	.uleb128 0x7
	.4byte	0x77b
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF104
	.byte	0xa
	.byte	0x8
	.4byte	0x78c
	.byte	0x5
	.byte	0x3
	.4byte	KEYBOARD_INPUT_SERVER_NAME
	.uleb128 0x12
	.4byte	0x76b
	.uleb128 0x7
	.4byte	0x7a1
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF105
	.byte	0xa
	.byte	0x9
	.4byte	0x7b2
	.byte	0x5
	.byte	0x3
	.4byte	SCREEN_OUTPUT_SERVER_NAME
	.uleb128 0x12
	.4byte	0x791
	.uleb128 0x7
	.4byte	0x7c7
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF106
	.byte	0xa
	.byte	0xa
	.4byte	0x7d8
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_INPUT_SERVER_NAME
	.uleb128 0x12
	.4byte	0x7b7
	.uleb128 0x7
	.4byte	0x7ed
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0xf
	.4byte	.LASF107
	.byte	0xa
	.byte	0xb
	.4byte	0x7fe
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_OUTPUT_SERVER_NAME
	.uleb128 0x12
	.4byte	0x7dd
	.uleb128 0x14
	.4byte	.LASF108
	.byte	0xa
	.byte	0xd
	.4byte	0x813
	.sleb128 -2138308608
	.uleb128 0x12
	.4byte	0x818
	.uleb128 0xb
	.byte	0x4
	.4byte	0x81e
	.uleb128 0x18
	.4byte	0x135
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0xa
	.byte	0xe
	.4byte	0x813
	.sleb128 -2138243072
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0xa
	.byte	0xf
	.4byte	0x813
	.sleb128 -2138308604
	.uleb128 0x14
	.4byte	.LASF111
	.byte	0xa
	.byte	0x10
	.4byte	0x813
	.sleb128 -2138243068
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
	.uleb128 0x6
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
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
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
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x1c
	.uleb128 0xe
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xba
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x854
	.4byte	0x244
	.ascii	"ClockNotifier_Start\000"
	.4byte	0x2da
	.ascii	"KeyboardInputNotifier_Start\000"
	.4byte	0x357
	.ascii	"ScreenOutputNotifier_Start\000"
	.4byte	0x3d4
	.ascii	"TrainInputNotifier_Start\000"
	.4byte	0x451
	.ascii	"TrainOutputNotifier_Start\000"
	.4byte	0x4d9
	.ascii	"TrainIONotifier_Start\000"
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
.LASF106:
	.ascii	"TRAIN_INPUT_SERVER_NAME\000"
.LASF112:
	.ascii	"GNU C 4.0.2\000"
.LASF102:
	.ascii	"TIMER4_VAL_LOW\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF63:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF82:
	.ascii	"TrSTmr\000"
.LASF97:
	.ascii	"TICK_SIZE\000"
.LASF93:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF98:
	.ascii	"TASK_STATE_NAMES\000"
.LASF6:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF109:
	.ascii	"UART2DATA\000"
.LASF66:
	.ascii	"KeyboardInputNotifier_Start\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF58:
	.ascii	"ClockMessage\000"
.LASF77:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF108:
	.ascii	"UART1DATA\000"
.LASF68:
	.ascii	"ScreenOutputNotifier_Start\000"
.LASF110:
	.ascii	"UART1RXSts\000"
.LASF70:
	.ascii	"TrainOutputNotifier_Start\000"
.LASF96:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF54:
	.ascii	"message_type\000"
.LASF62:
	.ascii	"send_buffer\000"
.LASF52:
	.ascii	"NUM_EVENTS\000"
.LASF89:
	.ascii	"ERR_K_DEFAULT\000"
.LASF55:
	.ascii	"event_id\000"
.LASF85:
	.ascii	"LIGHTS_MASK\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF74:
	.ascii	"output_server_id\000"
.LASF105:
	.ascii	"SCREEN_OUTPUT_SERVER_NAME\000"
.LASF4:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF42:
	.ascii	"MessageType\000"
.LASF104:
	.ascii	"KEYBOARD_INPUT_SERVER_NAME\000"
.LASF5:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF41:
	.ascii	"char\000"
.LASF49:
	.ascii	"UART1_TX_EVENT\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF65:
	.ascii	"ClockNotifier_Start\000"
.LASF100:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF91:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF45:
	.ascii	"EventID\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF53:
	.ascii	"NotifyMessage\000"
.LASF47:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF86:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF75:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF79:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF72:
	.ascii	"TrainIONotifier_Start\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF113:
	.ascii	"notifier.c\000"
.LASF73:
	.ascii	"input_server_id\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF99:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF51:
	.ascii	"UART2_TX_EVENT\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF48:
	.ascii	"UART1_RX_EVENT\000"
.LASF59:
	.ascii	"__func__\000"
.LASF114:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF57:
	.ascii	"short int\000"
.LASF101:
	.ascii	"CLOCK_SERVER_NAME\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF60:
	.ascii	"clock_server_id\000"
.LASF61:
	.ascii	"reply_buffer\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF80:
	.ascii	"TCmSvr\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF76:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF94:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF111:
	.ascii	"UART2RXSts\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF83:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF43:
	.ascii	"GenericMessage\000"
.LASF46:
	.ascii	"NULL_EVENT\000"
.LASF7:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF88:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF56:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF87:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF71:
	.ascii	"first\000"
.LASF90:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF64:
	.ascii	"send_message\000"
.LASF107:
	.ascii	"TRAIN_OUTPUT_SERVER_NAME\000"
.LASF67:
	.ascii	"server_tid\000"
.LASF78:
	.ascii	"TrnSvr\000"
.LASF50:
	.ascii	"UART2_RX_EVENT\000"
.LASF2:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF84:
	.ascii	"TrSwMr\000"
.LASF69:
	.ascii	"TrainInputNotifier_Start\000"
.LASF81:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF92:
	.ascii	"NAMESERVER_TID\000"
.LASF8:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF44:
	.ascii	"double\000"
.LASF103:
	.ascii	"TIMER4_VAL_HIGH\000"
.LASF95:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
	.ident	"GCC: (GNU) 4.0.2"
