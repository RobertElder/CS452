	.file	"clock.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.bss
	.align	2
profile_last_time_value:
	.space	4
	.section	.rodata
	.align	2
	.type	CLOCK_SERVER_NAME, %object
	.size	CLOCK_SERVER_NAME, 8
CLOCK_SERVER_NAME:
	.ascii	"ClckSvr\000"
	.align	2
	.type	ADMINISTRATOR_TASK_NAME, %object
	.size	ADMINISTRATOR_TASK_NAME, 6
ADMINISTRATOR_TASK_NAME:
	.ascii	"Admin\000"
	.text
	.align	2
	.global	ClockServer_Initialize
	.type	ClockServer_Initialize, %function
ClockServer_Initialize:
.LFB3:
	.file 1 "clock.c"
	.loc 1 66 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, lr}
.LCFI0:
	.loc 1 66 0
	mov	r4, r0
	.loc 1 67 0
	bl	MyTid(PLT)
.LVL1:
	.loc 1 69 0
	ldr	r3, .L8
	.loc 1 68 0
	mov	r1, #0
	.loc 1 70 0
	ldr	r2, .L8+4
	.loc 1 69 0
	strh	r1, [r4, r3]	@ movhi
	ldr	lr, .L8+8
	.loc 1 70 0
	mov	r3, #1	@ movhi
	strh	r3, [r4, r2]	@ movhi
	mov	ip, r1
.LVL2:
	.loc 1 67 0
	str	r0, [r4, #0]
	.loc 1 68 0
	str	r1, [r4, #36]
	mov	r3, r1
.LVL3:
.L2:
	.loc 1 73 0
	add	ip, ip, #1
	cmp	ip, lr
.LVL4:
	.loc 1 74 0
	str	r3, [r4, #40]
	.loc 1 73 0
	add	r4, r4, #4
	bne	.L2
	.loc 1 76 0
	ldmfd	sp!, {r4, pc}
.L9:
	.align	2
.L8:
	.word	6324
	.word	6326
	.word	1571
.LFE3:
	.size	ClockServer_Initialize, .-ClockServer_Initialize
	.align	2
	.global	ClockServer_HandleShutdownRequest
	.type	ClockServer_HandleShutdownRequest, %function
ClockServer_HandleShutdownRequest:
.LFB9:
	.loc 1 191 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 192 0
	ldr	r2, .L12
.LVL6:
	.loc 1 191 0
	mov	r3, r0
	.loc 1 192 0
	mov	r0, #1	@ movhi
.LVL7:
	strh	r0, [r3, r2]	@ movhi
	.loc 1 195 0
	mov	r0, #10
	str	r0, [r3, #20]!
	.loc 1 197 0
	mov	r2, #16
	mov	r0, r1
	mov	r1, r3
.LVL8:
	.loc 1 191 0
	@ lr needed for prologue
	.loc 1 198 0
	.loc 1 197 0
	b	Reply(PLT)
.LVL9:
.L13:
	.align	2
.L12:
	.word	6324
.LFE9:
	.size	ClockServer_HandleShutdownRequest, .-ClockServer_HandleShutdownRequest
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\033[1;33mClockServer: WARNING delay value in the p"
	.ascii	"ast from tid=%d! Got=%d, now=%d\033[0m\012\000"
	.text
	.align	2
	.global	ClockServer_HandleDelayRequest
	.type	ClockServer_HandleDelayRequest, %function
ClockServer_HandleDelayRequest:
.LFB6:
	.loc 1 122 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI1:
	mov	r3, r3, asl #16
.LVL11:
	.loc 1 125 0
	movs	r7, r3, lsr #16
.LVL12:
	.loc 1 126 0
	ldreq	ip, [r2, #4]
	ldreq	r3, [r0, #36]
	ldrne	ip, [r2, #4]
	addeq	ip, ip, r3
	streq	ip, [r2, #4]
	.loc 1 129 0
	ldr	lr, [r0, #36]
	.loc 1 122 0
	ldr	sl, .L27
	.loc 1 144 0
	add	r6, r0, r1, asl #2
	.loc 1 122 0
	mov	r5, r1
.LBB2:
	.loc 1 130 0
	mov	r2, r1
.LVL13:
	ldr	r1, .L27+4
.LVL14:
.LBE2:
	.loc 1 122 0
.L25:
	add	sl, pc, sl
	.loc 1 129 0
	cmp	ip, lr
	.loc 1 122 0
	mov	r4, r0
	sub	sp, sp, #4
.LCFI2:
.LVL15:
.LBB3:
	.loc 1 130 0
	mov	r3, ip
	mov	r0, #0
.LVL16:
	add	r1, sl, r1
.LBE3:
	.loc 1 129 0
	bls	.L26
	.loc 1 144 0
	str	ip, [r6, #40]
	.loc 1 146 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L26:
.LBB4:
	.loc 1 130 0
	str	lr, [sp, #0]
	bl	assertf(PLT)
.LVL17:
	.loc 1 136 0
	cmp	r7, #0
	.loc 1 137 0
	movne	r3, #21
	.loc 1 139 0
	moveq	r3, #19
	.loc 1 142 0
	mov	r0, r5
	add	r1, r4, #20
	mov	r2, #16
	.loc 1 137 0
	strne	r3, [r4, #20]
	.loc 1 139 0
	streq	r3, [r4, #20]
.LBE4:
	.loc 1 146 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LBB5:
	.loc 1 142 0
	b	Reply(PLT)
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	.LC0(GOTOFF)
.LBE5:
.LFE6:
	.size	ClockServer_HandleDelayRequest, .-ClockServer_HandleDelayRequest
	.align	2
	.global	ClockServer_HandleTimeRequest
	.type	ClockServer_HandleTimeRequest, %function
ClockServer_HandleTimeRequest:
.LFB5:
	.loc 1 112 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	.loc 1 117 0
	ldr	ip, [r0, #36]
	.loc 1 115 0
	add	r2, r0, #20
.LVL19:
	.loc 1 116 0
	mov	r3, #17
	str	r3, [r0, #20]
	.loc 1 117 0
	str	ip, [r2, #4]
	.loc 1 119 0
	mov	r0, r1
.LVL20:
	mov	r1, r2
.LVL21:
	mov	r2, #16
.LVL22:
	.loc 1 112 0
	@ lr needed for prologue
	.loc 1 120 0
	.loc 1 119 0
	b	Reply(PLT)
.LVL23:
.LFE5:
	.size	ClockServer_HandleTimeRequest, .-ClockServer_HandleTimeRequest
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"ClockServer didn't get a clock tick event id\000"
	.global	__floatsidf
	.global	__adddf3
	.global	__divdf3
	.global	__muldf3
	.global	__fixdfsi
	.global	__gtdf2
	.align	2
.LC2:
	.ascii	"\033[1;31mSLOW! %dus\033[0m\012\000"
	.text
	.align	2
	.global	ClockServer_HandleNotifier
	.type	ClockServer_HandleNotifier, %function
ClockServer_HandleNotifier:
.LFB4:
	.loc 1 79 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL24:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI3:
	ldr	sl, .L44+24
	.loc 1 80 0
	ldr	r3, [r2, #4]
	.loc 1 79 0
	mov	fp, r1
	.loc 1 80 0
	ldr	r1, .L44+28
.LVL25:
	.loc 1 79 0
.L41:
	add	sl, pc, sl
	mov	r7, r0
	.loc 1 80 0
	add	r1, sl, r1
	cmp	r3, #1
	movne	r0, #0
	moveq	r0, #1
.LVL26:
	bl	assert(PLT)
.LVL27:
	.loc 1 84 0
	ldr	r3, .L44+32
	.loc 1 94 0
	ldr	r9, .L44+36
	.loc 1 84 0
	ldrsh	r2, [r7, r3]
	.loc 1 94 0
	ldr	r4, [r7, r9]
	.loc 1 84 0
	cmp	r2, #0
	.loc 1 85 0
	movne	r3, #12
	.loc 1 86 0
	ldrne	r2, .L44+40
	.loc 1 85 0
	strne	r3, [r7, #20]
	.loc 1 88 0
	moveq	r3, #10
	.loc 1 86 0
	movne	r3, #0	@ movhi
	strneh	r3, [r7, r2]	@ movhi
	.loc 1 88 0
	streq	r3, [r7, #20]
	.loc 1 93 0
	ldr	r3, .L44+44
	ldr	r8, [r3, #0]
	.loc 1 94 0
	rsb	r4, r4, r8
	mov	r0, r4
	bl	__floatsidf(PLT)
	cmp	r4, #0
	mov	r5, r0
	mov	r6, r1
	ldr	r2, .L44+48
	mov	r3, #0
	blt	.L42
.L35:
	adr	r2, .L44
	ldmia	r2, {r2-r3}
	mov	r0, r5
	mov	r1, r6
	bl	__divdf3(PLT)
	adr	r2, .L44+8
	ldmia	r2, {r2-r3}
	bl	__muldf3(PLT)
	bl	__fixdfsi(PLT)
	.loc 1 98 0
	mov	r2, #16
	.loc 1 94 0
	mov	r4, r0
	.loc 1 98 0
	add	r1, r7, #20
	.loc 1 95 0
	str	r8, [r7, r9]
	.loc 1 98 0
	mov	r0, fp
	bl	Reply(PLT)
	.loc 1 102 0
	mov	r0, r4
.LVL28:
	bl	__floatsidf(PLT)
.LVL29:
	adr	r2, .L44+16
	ldmia	r2, {r2-r3}
	bl	__gtdf2(PLT)
	cmp	r0, #0
	.loc 1 103 0
	ldr	r2, .L44+52
	.loc 1 102 0
	ble	.L36
	.loc 1 103 0
	ldr	r3, [r7, r2]
	.loc 1 105 0
	ldr	r0, .L44+56
	.loc 1 103 0
	add	r3, r3, #1
	.loc 1 104 0
	tst	r3, #1
	.loc 1 105 0
	add	r0, sl, r0
	mov	r1, r4
.LVL30:
	.loc 1 103 0
	str	r3, [r7, r2]
	.loc 1 104 0
	beq	.L43
.L36:
	.loc 1 109 0
	ldr	r3, [r7, #36]
	add	r3, r3, #1
	str	r3, [r7, #36]
	.loc 1 110 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L43:
	.loc 1 105 0
	bl	robprintfbusy(PLT)
.LVL31:
	.loc 1 109 0
	ldr	r3, [r7, #36]
	add	r3, r3, #1
	str	r3, [r7, #36]
	.loc 1 110 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L42:
	.loc 1 94 0
	bl	__adddf3(PLT)
	mov	r5, r0
	mov	r6, r1
	b	.L35
.L45:
	.align	2
.L44:
	.word	1083095040
	.word	0
	.word	1083129856
	.word	0
	.word	1083564032
	.word	0
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	.LC1(GOTOFF)
	.word	6324
	.word	6328
	.word	6326
	.word	-2139029408
	.word	1106247680
	.word	6332
	.word	.LC2(GOTOFF)
.LFE4:
	.size	ClockServer_HandleNotifier, .-ClockServer_HandleNotifier
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"ClockServer_GetNextTask tid not in range\000"
	.text
	.align	2
	.global	ClockServer_GetNextTask
	.type	ClockServer_GetNextTask, %function
ClockServer_GetNextTask:
.LFB7:
	.loc 1 149 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL32:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI4:
	ldr	sl, .L57
	mov	r5, r0
.L56:
	add	sl, pc, sl
	.loc 1 152 0
	mov	r0, r1
.LVL33:
	.loc 1 149 0
	mov	r4, r1
	.loc 1 152 0
	bl	is_tid_in_range(PLT)
.LVL34:
	.loc 1 152 0
	ldr	r1, .L57+4
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 155 0
	ldr	r3, .L57+8
	cmp	r4, r3
	bgt	.L47
	mov	r3, r4, asl #2
	add	r3, r3, #40
	ldr	lr, .L57+12
	ldr	ip, .L57+16
	add	r1, r5, r3
	mov	r0, r4
.LVL35:
.L49:
	.loc 1 156 0
	ldr	r2, [r1], #4
	cmp	r2, #0
	beq	.L50
	ldr	r3, [r5, #36]
	cmp	r2, r3
	ldmlsfd	sp!, {r4, r5, sl, pc}
	ldrsh	r3, [r5, lr]
	cmp	r3, #0
	ldmnefd	sp!, {r4, r5, sl, pc}
.L50:
	.loc 1 155 0
	add	r0, r0, #1
	cmp	r0, ip
	bne	.L49
.L47:
	mov	r0, #0
.LVL36:
	.loc 1 162 0
	ldmfd	sp!, {r4, r5, sl, pc}
.L58:
	.align	2
.L57:
	.word	_GLOBAL_OFFSET_TABLE_-(.L56+8)
	.word	.LC3(GOTOFF)
	.word	1570
	.word	6324
	.word	1571
.LFE7:
	.size	ClockServer_GetNextTask, .-ClockServer_GetNextTask
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"ClockServer_UnblockDelayedTasks running for too lon"
	.ascii	"g\000"
	.text
	.align	2
	.global	ClockServer_UnblockDelayedTasks
	.type	ClockServer_UnblockDelayedTasks, %function
ClockServer_UnblockDelayedTasks:
.LFB8:
	.loc 1 164 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL37:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI5:
	ldr	sl, .L65
	mov	r6, #0
.LVL38:
	ldr	r7, .L65+4
	mov	r4, r0
	mov	r5, r6
.LVL39:
.L64:
	add	sl, pc, sl
.LVL40:
.L60:
.LBB6:
	.loc 1 169 0
	mov	r1, r5
	mov	r0, r4
	bl	ClockServer_GetNextTask(PLT)
	.loc 1 171 0
	subs	r5, r0, #0
	.loc 1 184 0
	add	r6, r6, #1
	.loc 1 182 0
	add	r1, r4, #20
	mov	r2, #16
	.loc 1 175 0
	add	ip, r4, r5, asl #2
	.loc 1 171 0
	ldmeqfd	sp!, {r4, r5, r6, r7, sl, pc}
	.loc 1 175 0
	mov	r3, #0
	str	r3, [ip, #40]
	.loc 1 178 0
	mov	ip, #19
	str	ip, [r4, #20]
	.loc 1 182 0
	bl	Reply(PLT)
	.loc 1 186 0
	ldr	r0, .L65+8
	add	r1, sl, r7
	cmp	r6, r0
	movgt	r0, #0
	movle	r0, #1
	bl	assert(PLT)
	b	.L60
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L64+8)
	.word	.LC4(GOTOFF)
	.word	1571
.LBE6:
.LFE8:
	.size	ClockServer_UnblockDelayedTasks, .-ClockServer_UnblockDelayedTasks
	.section	.rodata
	.align	2
	.type	__func__.1988, %object
	.size	__func__.1988, 18
__func__.1988:
	.ascii	"ClockServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"ClockClient_Start\000"
	.align	2
.LC6:
	.ascii	"NotifyMessage size too big\000"
	.align	2
.LC7:
	.ascii	"ClockMessage size too big\000"
	.align	2
.LC8:
	.ascii	"ClockServer: Failed to register name\000"
	.align	2
.LC9:
	.ascii	"ClockNotifier tid not positive\000"
	.align	2
.LC10:
	.ascii	"ClockServer: unknown message type %d\000"
	.text
	.align	2
	.global	ClockServer_Start
	.type	ClockServer_Start, %function
ClockServer_Start:
.LFB2:
	.loc 1 11 0
	@ args = 0, pretend = 0, frame = 6340
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL41:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI6:
	ldr	sl, .L82
	.loc 1 12 0
	ldr	r2, .L82+4
	ldr	r3, .L82+8
	.loc 1 11 0
.L80:
	add	sl, pc, sl
	sub	sp, sp, #6336
.LCFI7:
.LVL42:
	sub	sp, sp, #4
.LCFI8:
.LVL43:
	.loc 1 12 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 13 0
	ldr	r3, .L82+12
	ldr	r1, .L82+16
	ldr	r0, [sl, r3]
	add	r1, sl, r1
	bl	DebugRegisterFunction(PLT)
	.loc 1 15 0
	mov	r0, sp
	bl	ClockServer_Initialize(PLT)
	.loc 1 20 0
	ldr	r1, .L82+20
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 21 0
	ldr	r1, .L82+24
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 23 0
	ldr	r3, .L82+28
	.loc 1 15 0
	add	r5, sp, #4
	.loc 1 23 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 24 0
	ldr	r1, .L82+32
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 26 0
	ldr	r3, .L82+36
	mov	r0, #0
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 27 0
	ldr	r1, .L82+40
	cmp	r0, #0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 30 0
	ldr	ip, .L82+44
	.loc 1 33 0
	add	r3, sp, #6144
	.loc 1 30 0
	ldr	r2, [ip, #0]
	.loc 1 33 0
	ldrsh	r1, [r3, #182]
	.loc 1 31 0
	ldr	r3, .L82+48
	.loc 1 30 0
	orr	r2, r2, #256
	.loc 1 31 0
	ldr	r0, [r3, #0]
	.loc 1 33 0
	cmp	r1, #0
	.loc 1 30 0
	str	r2, [ip, #0]
	.loc 1 31 0
	add	r2, sp, #4096
	.loc 1 15 0
	sub	r5, r5, #4
	.loc 1 17 0
	add	r4, sp, #4
	.loc 1 31 0
	str	r0, [r2, #2232]
	.loc 1 33 0
	bne	.L81
.LVL44:
.L68:
	.loc 1 62 0
	bl	Exit(PLT)
	.loc 1 63 0
	add	sp, sp, #196
	add	sp, sp, #6144
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL45:
.L81:
	add	r6, sp, #6336
.LVL46:
.L69:
	.loc 1 34 0
	mov	r2, #16
	mov	r1, r4
	mov	r0, r6
	bl	Receive(PLT)
	.loc 1 37 0
	ldr	r2, [r4, #0]
	sub	r3, r2, #12
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L70
	.p2align 2
.L76:
	b	.L71
	b	.L70
	b	.L70
	b	.L72
	b	.L73
	b	.L70
	b	.L74
	b	.L70
	b	.L75
.L71:
	.loc 1 51 0
	add	r3, sp, #4096
	mov	r0, r5
	ldr	r1, [r3, #2240]
	mov	r2, r4
.LVL47:
	bl	ClockServer_HandleShutdownRequest(PLT)
.LVL48:
.L77:
	.loc 1 58 0
	mov	r0, r5
	bl	ClockServer_UnblockDelayedTasks(PLT)
	.loc 1 59 0
	bl	Pass(PLT)
	.loc 1 33 0
	add	r2, sp, #6144
	ldrsh	r3, [r2, #182]
	cmp	r3, #0
	bne	.L69
	b	.L68
.L72:
	.loc 1 39 0
	add	r3, sp, #4096
	mov	r0, r5
	ldr	r1, [r3, #2240]
	mov	r2, r4
.LVL49:
	bl	ClockServer_HandleNotifier(PLT)
.LVL50:
	b	.L77
.L73:
	.loc 1 42 0
	add	r2, sp, #4096
	ldr	r1, [r2, #2240]
	mov	r0, r5
	mov	r2, r4
.LVL51:
	bl	ClockServer_HandleTimeRequest(PLT)
.LVL52:
	b	.L77
.L74:
	.loc 1 45 0
	add	r3, sp, #4096
	ldr	r1, [r3, #2240]
	mov	r0, r5
	mov	r2, r4
.LVL53:
	mov	r3, #0
	bl	ClockServer_HandleDelayRequest(PLT)
.LVL54:
	b	.L77
.L70:
	.loc 1 54 0
	ldr	r1, .L82+52
	mov	r0, #0
	add	r1, sl, r1
	bl	assertf(PLT)
	b	.L77
.L75:
	.loc 1 48 0
	add	r2, sp, #4096
	ldr	r1, [r2, #2240]
	mov	r0, r5
	mov	r2, r4
.LVL55:
	mov	r3, #1
	bl	ClockServer_HandleDelayRequest(PLT)
.LVL56:
	b	.L77
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L80+8)
	.word	__func__.1988(GOT)
	.word	ClockServer_Start(GOT)
	.word	ClockClient_Start(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	CLOCK_SERVER_NAME(GOT)
	.word	.LC8(GOTOFF)
	.word	ClockNotifier_Start(GOT)
	.word	.LC9(GOTOFF)
	.word	-2139029372
	.word	-2139029408
	.word	.LC10(GOTOFF)
.LFE2:
	.size	ClockServer_Start, .-ClockServer_Start
	.align	2
	.global	ClockClient_Initialize
	.type	ClockClient_Initialize, %function
ClockClient_Initialize:
.LFB11:
	.loc 1 250 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL57:
	stmfd	sp!, {r4, sl, lr}
.LCFI9:
	ldr	sl, .L87
	mov	r4, r0
.L86:
	add	sl, pc, sl
	.loc 1 251 0
	bl	MyTid(PLT)
.LVL58:
	.loc 1 252 0
	ldr	r3, .L87+4
	.loc 1 251 0
	str	r0, [r4, #4]
	.loc 1 252 0
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	str	r0, [r4, #0]
	.loc 1 253 0
	bl	MyParentTid(PLT)
	str	r0, [r4, #8]
	.loc 1 254 0
	ldmfd	sp!, {r4, sl, pc}
.L88:
	.align	2
.L87:
	.word	_GLOBAL_OFFSET_TABLE_-(.L86+8)
	.word	CLOCK_SERVER_NAME(GOT)
.LFE11:
	.size	ClockClient_Initialize, .-ClockClient_Initialize
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"ClockClient: server not found. got=%d\000"
	.align	2
.LC12:
	.ascii	"ClockClient: parent not found. got=%d\000"
	.align	2
.LC13:
	.ascii	"ClockClient TID=%d: failed to get ACK message\012\000"
	.align	2
.LC14:
	.ascii	"ClockClient TID=%d: Didn't get an admin tid\000"
	.text
	.align	2
	.global	ClockClient_Start
	.type	ClockClient_Start, %function
ClockClient_Start:
.LFB10:
	.loc 1 201 0
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL59:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI10:
	ldr	sl, .L101
	sub	sp, sp, #56
.LCFI11:
.LVL60:
.L98:
	add	sl, pc, sl
	.loc 1 203 0
	add	r0, sp, #4
	bl	ClockClient_Initialize(PLT)
	.loc 1 204 0
	ldr	r0, [sp, #4]
	ldr	r1, .L101+4
	mov	r2, r0
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 205 0
	ldr	r1, .L101+8
	ldr	r0, [sp, #4]
	add	r1, sl, r1
	ldr	r2, [sp, #12]
	.loc 1 212 0
	mov	r4, #16
	.loc 1 207 0
	add	r8, sp, #24
	.loc 1 208 0
	add	fp, sp, #40
	.loc 1 205 0
	bl	assertf(PLT)
	.loc 1 212 0
	mov	r2, r4
	mov	r3, fp
	.loc 1 210 0
	mov	ip, #22
	.loc 1 212 0
	mov	r1, r8
	ldr	r0, [sp, #12]
	.loc 1 210 0
	str	ip, [sp, #24]
	.loc 1 212 0
	str	r4, [sp, #0]
	.loc 1 214 0
	ldr	r9, .L101+12
	.loc 1 212 0
	bl	Send(PLT)
	.loc 1 214 0
	ldr	r0, [sp, #40]
	add	r1, sl, r9
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
	.loc 1 217 0
	ldr	r2, [sp, #48]
	.loc 1 216 0
	ldr	r3, [sp, #44]
	.loc 1 220 0
	cmp	r2, #0
	.loc 1 216 0
	str	r3, [sp, #16]
	.loc 1 217 0
	str	r2, [sp, #20]
	.loc 1 220 0
	bgt	.L99
.LVL61:
.L90:
	ldr	r6, .L101+16
	ldr	r7, .L101+20
	ldr	r5, .L101+24
	.loc 1 228 0
	mov	r3, #12
	mov	r4, #0
.LVL62:
	str	r3, [r8, #0]
	b	.L93
.LVL63:
.L100:
	.loc 1 241 0
	cmp	r4, r7
	movgt	r0, #0
	movle	r0, #1
.LVL64:
	bl	assertf(PLT)
.L93:
	.loc 1 234 0
	ldr	r0, [sl, r6]
	bl	WhoIs(PLT)
	.loc 1 236 0
	cmp	r0, #0
.LVL65:
	.loc 1 239 0
	add	r4, r4, #1
	.loc 1 241 0
	add	r1, sl, r5
	.loc 1 236 0
	beq	.L100
	.loc 1 244 0
	mov	ip, #16
	mov	r1, r8
	mov	r2, ip
	mov	r3, fp
	str	ip, [sp, #0]
	bl	Send(PLT)
.LVL66:
	.loc 1 245 0
	ldr	r0, [sp, #40]
	add	r1, sl, r9
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assertf(PLT)
	.loc 1 247 0
	bl	Exit(PLT)
	.loc 1 248 0
	add	sp, sp, #56
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL67:
.L99:
.LVL68:
	.loc 1 220 0
	sub	r4, r4, #16
.L92:
	.loc 1 222 0
	ldr	r0, [sp, #16]
	bl	Delay(PLT)
	.loc 1 220 0
	ldr	r3, [sp, #20]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L92
	b	.L90
.L102:
	.align	2
.L101:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	ADMINISTRATOR_TASK_NAME(GOT)
	.word	999
	.word	.LC14(GOTOFF)
.LFE10:
	.size	ClockClient_Start, .-ClockClient_Start
	.align	2
	.global	print_current_time
	.type	print_current_time, %function
print_current_time:
.LFB12:
	.loc 1 256 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL69:
	@ lr needed for prologue
	.loc 1 257 0
	bx	lr
.LFE12:
	.size	print_current_time, .-print_current_time
	.align	2
	.global	ProfileStart
	.type	ProfileStart, %function
ProfileStart:
.LFB13:
	.loc 1 259 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL70:
	str	sl, [sp, #-4]!
.LCFI12:
	ldr	sl, .L108
	.loc 1 260 0
	ldr	r3, .L108+4
	ldr	r2, .L108+8
	.loc 1 259 0
.L107:
	add	sl, pc, sl
	.loc 1 260 0
	ldr	r1, [r3, #0]
	ldr	r3, [sl, r2]
	.loc 1 259 0
	@ lr needed for prologue
	.loc 1 260 0
	str	r1, [r3, #0]
	.loc 1 261 0
	ldmfd	sp!, {sl}
	bx	lr
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	-2139029408
	.word	profile_last_time_value(GOT)
.LFE13:
	.size	ProfileStart, .-ProfileStart
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"\033[1;32m%s %dus\033[0m\012\000"
	.text
	.align	2
	.global	ProfileEnd
	.type	ProfileEnd, %function
ProfileEnd:
.LFB14:
	.loc 1 263 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL71:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI13:
	ldr	sl, .L113+16
	.loc 1 265 0
	ldr	r3, .L113+20
	.loc 1 263 0
.L112:
	add	sl, pc, sl
	.loc 1 265 0
	ldr	r6, [sl, r3]
	.loc 1 264 0
	ldr	r2, .L113+24
	.loc 1 265 0
	ldr	r3, [r6, #0]
	.loc 1 264 0
	ldr	r5, [r2, #0]
.LVL72:
	.loc 1 263 0
	mov	r4, r0
	.loc 1 265 0
	rsb	r0, r3, r5
.LVL73:
	bl	__floatsidf(PLT)
	adr	r2, .L113
	ldmia	r2, {r2-r3}
	.loc 1 265 0
	bl	__divdf3(PLT)
	adr	r2, .L113+8
	ldmia	r2, {r2-r3}
	bl	__muldf3(PLT)
	bl	__fixdfsi(PLT)
	mov	r2, r0
	.loc 1 267 0
	ldr	r0, .L113+28
	mov	r1, r4
	add	r0, sl, r0
	.loc 1 266 0
	str	r5, [r6, #0]
	.loc 1 268 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 267 0
	b	robprintfbusy(PLT)
.L114:
	.align	2
.L113:
	.word	1083095040
	.word	0
	.word	1083129856
	.word	0
	.word	_GLOBAL_OFFSET_TABLE_-(.L112+8)
	.word	profile_last_time_value(GOT)
	.word	-2139029408
	.word	.LC15(GOTOFF)
.LFE14:
	.size	ProfileEnd, .-ProfileEnd
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI0-.LFB3
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI1-.LFB6
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
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x1c
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI3-.LFB4
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
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI4-.LFB7
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI5-.LFB8
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
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
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
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x18d4
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x18d8
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI9-.LFB11
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI10-.LFB10
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
	.uleb128 0x5c
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI12-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI13-.LFB14
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
.LEFDE24:
	.file 2 "clock.h"
	.file 3 "message.h"
	.file 4 "notifier.h"
	.file 5 "public_kernel_interface.h"
	.file 6 "tasks.h"
	.file 7 "queue.h"
	.file 8 "train.h"
	.file 9 "task_descriptor.h"
	.file 10 "buffer.h"
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
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL16-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL25-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -6340
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL43-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x3
	.byte	0x72
	.sleb128 2240
	.4byte	.LVL46-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x3
	.byte	0x72
	.sleb128 2240
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -56
	.4byte	.LVL60-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL68-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x9e3
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF134
	.byte	0x1
	.4byte	.LASF135
	.4byte	.LASF136
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
	.uleb128 0xb
	.byte	0x4
	.4byte	0x17f
	.uleb128 0xc
	.4byte	0x14c
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x8
	.byte	0x4
	.uleb128 0xb
	.byte	0x4
	.4byte	0x16e
	.uleb128 0x3
	.4byte	0x1c8
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
	.4byte	0x191
	.uleb128 0x9
	.4byte	0x1fc
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
	.4byte	0x1c8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF53
	.byte	0x4
	.byte	0xa
	.4byte	0x1d3
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
	.4byte	0x244
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
	.uleb128 0xd
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
	.4byte	0x21b
	.uleb128 0xe
	.4byte	0x2df
	.4byte	.LASF59
	.2byte	0x18c0
	.byte	0x2
	.byte	0x11
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x12
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.4byte	.LASF60
	.byte	0x2
	.byte	0x13
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.4byte	.LASF61
	.byte	0x2
	.byte	0x14
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.4byte	.LASF62
	.byte	0x2
	.byte	0x15
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xa
	.4byte	.LASF63
	.byte	0x2
	.byte	0x16
	.4byte	0x2df
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.4byte	.LASF64
	.byte	0x2
	.byte	0x17
	.4byte	0x214
	.byte	0x3
	.byte	0x23
	.uleb128 0x18b4
	.uleb128 0xa
	.4byte	.LASF65
	.byte	0x2
	.byte	0x18
	.4byte	0x214
	.byte	0x3
	.byte	0x23
	.uleb128 0x18b6
	.uleb128 0xa
	.4byte	.LASF66
	.byte	0x2
	.byte	0x19
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x18b8
	.uleb128 0xa
	.4byte	.LASF67
	.byte	0x2
	.byte	0x1a
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x18bc
	.byte	0x0
	.uleb128 0x7
	.4byte	0x2f0
	.4byte	0x135
	.uleb128 0xf
	.4byte	0x2c
	.2byte	0x622
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF59
	.byte	0x2
	.byte	0x1b
	.4byte	0x24f
	.uleb128 0x9
	.4byte	0x36a
	.4byte	.LASF68
	.byte	0x34
	.byte	0x2
	.byte	0x2e
	.uleb128 0xa
	.4byte	.LASF69
	.byte	0x2
	.byte	0x2f
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x30
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.4byte	.LASF70
	.byte	0x2
	.byte	0x31
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.4byte	.LASF71
	.byte	0x2
	.byte	0x32
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.4byte	.LASF72
	.byte	0x2
	.byte	0x33
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.4byte	.LASF73
	.byte	0x2
	.byte	0x34
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xa
	.4byte	.LASF61
	.byte	0x2
	.byte	0x35
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF68
	.byte	0x2
	.byte	0x36
	.4byte	0x2fb
	.uleb128 0x9
	.4byte	0x3ac
	.4byte	.LASF74
	.byte	0xc
	.byte	0x6
	.byte	0x9
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x6
	.byte	0xa
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.4byte	.LASF71
	.byte	0x6
	.byte	0xb
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.4byte	.LASF72
	.byte	0x6
	.byte	0xc
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF74
	.byte	0x6
	.byte	0xd
	.4byte	0x375
	.uleb128 0x10
	.4byte	0x3ee
	.byte	0x1
	.4byte	.LASF75
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0x42
	.4byte	0x3ee
	.4byte	.LLST0
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x135
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2f0
	.uleb128 0x10
	.4byte	0x445
	.byte	0x1
	.4byte	.LASF76
	.byte	0x1
	.byte	0xbf
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0xbf
	.4byte	0x3ee
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0xbf
	.4byte	0x135
	.4byte	.LLST3
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0xbf
	.4byte	0x445
	.4byte	.LLST4
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.byte	0xc2
	.4byte	0x445
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x244
	.uleb128 0x14
	.4byte	0x4b2
	.byte	0x1
	.4byte	.LASF81
	.byte	0x1
	.byte	0x7a
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0x7a
	.4byte	0x3ee
	.4byte	.LLST6
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0x7a
	.4byte	0x135
	.4byte	.LLST7
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x7a
	.4byte	0x445
	.4byte	.LLST8
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0x1
	.byte	0x7a
	.4byte	0x214
	.4byte	.LLST9
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.byte	0x86
	.4byte	0x445
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.4byte	0x507
	.byte	0x1
	.4byte	.LASF83
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0x70
	.4byte	0x3ee
	.4byte	.LLST10
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0x70
	.4byte	0x135
	.4byte	.LLST11
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x70
	.4byte	0x445
	.4byte	.LLST12
	.uleb128 0x16
	.4byte	.LASF80
	.byte	0x1
	.byte	0x73
	.4byte	0x445
	.4byte	.LLST13
	.byte	0x0
	.uleb128 0x10
	.4byte	0x572
	.byte	0x1
	.4byte	.LASF84
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0x4f
	.4byte	0x3ee
	.4byte	.LLST14
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0x4f
	.4byte	0x135
	.4byte	.LLST15
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x4f
	.4byte	0x572
	.4byte	.LLST16
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.byte	0x52
	.4byte	0x445
	.uleb128 0x17
	.ascii	"now\000"
	.byte	0x1
	.byte	0x5d
	.4byte	0x135
	.uleb128 0x16
	.4byte	.LASF85
	.byte	0x1
	.byte	0x5e
	.4byte	0x135
	.4byte	.LLST17
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1fc
	.uleb128 0x18
	.4byte	0x5c2
	.byte	0x1
	.4byte	.LASF86
	.byte	0x1
	.byte	0x95
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0x95
	.4byte	0x3ee
	.4byte	.LLST18
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x1
	.byte	0x95
	.4byte	0x135
	.4byte	.LLST19
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x9a
	.4byte	0x135
	.4byte	.LLST20
	.byte	0x0
	.uleb128 0x10
	.4byte	0x619
	.byte	0x1
	.4byte	.LASF88
	.byte	0x1
	.byte	0xa4
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF77
	.byte	0x1
	.byte	0xa4
	.4byte	0x3ee
	.4byte	.LLST21
	.uleb128 0x19
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xa5
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.uleb128 0x1a
	.4byte	.LASF89
	.byte	0x1
	.byte	0xa6
	.4byte	0x135
	.byte	0x1
	.byte	0x56
	.uleb128 0x1b
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.byte	0xb1
	.4byte	0x445
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.4byte	0x684
	.byte	0x1
	.4byte	.LASF90
	.byte	0x1
	.byte	0xb
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST22
	.uleb128 0x1d
	.4byte	.LASF91
	.4byte	0x694
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.1988
	.uleb128 0x1a
	.4byte	.LASF77
	.byte	0x1
	.byte	0xe
	.4byte	0x2f0
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x16
	.4byte	.LASF79
	.byte	0x1
	.byte	0x11
	.4byte	0x18b
	.4byte	.LLST23
	.uleb128 0x16
	.4byte	.LASF78
	.byte	0x1
	.byte	0x12
	.4byte	0x135
	.4byte	.LLST24
	.uleb128 0x13
	.4byte	.LASF92
	.byte	0x1
	.byte	0x17
	.4byte	0x135
	.uleb128 0x17
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x135
	.byte	0x0
	.uleb128 0x7
	.4byte	0x694
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x11
	.byte	0x0
	.uleb128 0xc
	.4byte	0x684
	.uleb128 0x10
	.4byte	0x6c1
	.byte	0x1
	.4byte	.LASF93
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF94
	.byte	0x1
	.byte	0xfa
	.4byte	0x6c1
	.4byte	.LLST25
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x36a
	.uleb128 0x1c
	.4byte	0x720
	.byte	0x1
	.4byte	.LASF95
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LLST26
	.uleb128 0x1a
	.4byte	.LASF94
	.byte	0x1
	.byte	0xca
	.4byte	0x36a
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x1
	.byte	0xcf
	.4byte	0x720
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.byte	0xd0
	.4byte	0x720
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0xdb
	.4byte	0x135
	.4byte	.LLST27
	.uleb128 0x16
	.4byte	.LASF97
	.byte	0x1
	.byte	0xe7
	.4byte	0x135
	.4byte	.LLST28
	.byte	0x0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x3ac
	.uleb128 0x1e
	.byte	0x1
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x100
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1e
	.byte	0x1
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x103
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1f
	.4byte	0x792
	.byte	0x1
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x107
	.byte	0x1
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x20
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x107
	.4byte	0x179
	.4byte	.LLST29
	.uleb128 0x21
	.ascii	"now\000"
	.byte	0x1
	.2byte	0x108
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.uleb128 0x22
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x109
	.4byte	0x135
	.byte	0x0
	.uleb128 0x23
	.4byte	.LASF101
	.byte	0x7
	.byte	0xb
	.4byte	0x79e
	.sleb128 -1
	.uleb128 0xc
	.4byte	0x135
	.uleb128 0x23
	.4byte	.LASF102
	.byte	0x7
	.byte	0xc
	.4byte	0x79e
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x7bf
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF103
	.byte	0x8
	.byte	0xb
	.4byte	0x7ce
	.4byte	.LASF104
	.uleb128 0xc
	.4byte	0x7af
	.uleb128 0x7
	.4byte	0x7e3
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF105
	.byte	0x8
	.byte	0xc
	.4byte	0x7f2
	.4byte	.LASF106
	.uleb128 0xc
	.4byte	0x7d3
	.uleb128 0x7
	.4byte	0x807
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF107
	.byte	0x8
	.byte	0xd
	.4byte	0x816
	.4byte	.LASF108
	.uleb128 0xc
	.4byte	0x7f7
	.uleb128 0x7
	.4byte	0x82b
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF109
	.byte	0x8
	.byte	0xe
	.4byte	0x83a
	.4byte	.LASF110
	.uleb128 0xc
	.4byte	0x81b
	.uleb128 0x25
	.4byte	.LASF111
	.byte	0x8
	.byte	0x10
	.4byte	0x79e
	.byte	0x10
	.uleb128 0x7
	.4byte	0x861
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x8
	.byte	0x6d
	.4byte	0x86c
	.uleb128 0xc
	.4byte	0x84b
	.uleb128 0x23
	.4byte	.LASF113
	.byte	0x5
	.byte	0x7
	.4byte	0x79e
	.sleb128 -1
	.uleb128 0x23
	.4byte	.LASF114
	.byte	0x5
	.byte	0x8
	.4byte	0x79e
	.sleb128 -2
	.uleb128 0x23
	.4byte	.LASF115
	.byte	0x5
	.byte	0x9
	.4byte	0x79e
	.sleb128 -3
	.uleb128 0x23
	.4byte	.LASF116
	.byte	0x5
	.byte	0xa
	.4byte	0x79e
	.sleb128 -1
	.uleb128 0x23
	.4byte	.LASF117
	.byte	0x5
	.byte	0xb
	.4byte	0x79e
	.sleb128 -2
	.uleb128 0x25
	.4byte	.LASF118
	.byte	0x5
	.byte	0xc
	.4byte	0x79e
	.byte	0x2
	.uleb128 0x23
	.4byte	.LASF119
	.byte	0x5
	.byte	0xd
	.4byte	0x79e
	.sleb128 -1
	.uleb128 0x23
	.4byte	.LASF120
	.byte	0x5
	.byte	0xe
	.4byte	0x79e
	.sleb128 -2
	.uleb128 0x23
	.4byte	.LASF121
	.byte	0x5
	.byte	0xf
	.4byte	0x79e
	.sleb128 -3
	.uleb128 0x23
	.4byte	.LASF122
	.byte	0x5
	.byte	0x10
	.4byte	0x79e
	.sleb128 -4
	.uleb128 0x26
	.4byte	.LASF123
	.byte	0x5
	.byte	0x11
	.4byte	0x8fd
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0xc
	.4byte	0x184
	.uleb128 0x7
	.4byte	0x918
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF124
	.byte	0x9
	.byte	0x27
	.4byte	0x923
	.uleb128 0xc
	.4byte	0x902
	.uleb128 0x23
	.4byte	.LASF125
	.byte	0xa
	.byte	0x5
	.4byte	0x79e
	.sleb128 -1
	.uleb128 0x23
	.4byte	.LASF126
	.byte	0xa
	.byte	0x6
	.4byte	0x79e
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x950
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LASF127
	.byte	0x2
	.byte	0x8
	.4byte	0x961
	.byte	0x5
	.byte	0x3
	.4byte	CLOCK_SERVER_NAME
	.uleb128 0xc
	.4byte	0x940
	.uleb128 0x23
	.4byte	.LASF128
	.byte	0x2
	.byte	0x9
	.4byte	0x976
	.sleb128 -2139029408
	.uleb128 0xc
	.4byte	0x207
	.uleb128 0x23
	.4byte	.LASF129
	.byte	0x2
	.byte	0xa
	.4byte	0x976
	.sleb128 -2139029372
	.uleb128 0x7
	.4byte	0x99b
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LASF130
	.byte	0x6
	.byte	0x6
	.4byte	0x9ac
	.byte	0x5
	.byte	0x3
	.4byte	ADMINISTRATOR_TASK_NAME
	.uleb128 0xc
	.4byte	0x98b
	.uleb128 0x7
	.4byte	0x9c1
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x4
	.byte	0x0
	.uleb128 0x24
	.4byte	.LASF131
	.byte	0x6
	.byte	0x7
	.4byte	0x9d0
	.4byte	.LASF132
	.uleb128 0xc
	.4byte	0x9b1
	.uleb128 0x1a
	.4byte	.LASF133
	.byte	0x1
	.byte	0x9
	.4byte	0x135
	.byte	0x5
	.byte	0x3
	.4byte	profile_last_time_value
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
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
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
	.uleb128 0xb
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
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
	.4byte	0x171
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x9e7
	.4byte	0x3b7
	.ascii	"ClockServer_Initialize\000"
	.4byte	0x3f4
	.ascii	"ClockServer_HandleShutdownRequest\000"
	.4byte	0x44b
	.ascii	"ClockServer_HandleDelayRequest\000"
	.4byte	0x4b2
	.ascii	"ClockServer_HandleTimeRequest\000"
	.4byte	0x507
	.ascii	"ClockServer_HandleNotifier\000"
	.4byte	0x578
	.ascii	"ClockServer_GetNextTask\000"
	.4byte	0x5c2
	.ascii	"ClockServer_UnblockDelayedTasks\000"
	.4byte	0x619
	.ascii	"ClockServer_Start\000"
	.4byte	0x699
	.ascii	"ClockClient_Initialize\000"
	.4byte	0x6c7
	.ascii	"ClockClient_Start\000"
	.4byte	0x726
	.ascii	"print_current_time\000"
	.4byte	0x73a
	.ascii	"ProfileStart\000"
	.4byte	0x74e
	.ascii	"ProfileEnd\000"
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
	.section	.debug_str,"MS",%progbits,1
.LASF97:
	.ascii	"admin_tid\000"
.LASF134:
	.ascii	"GNU C 4.0.2\000"
.LASF128:
	.ascii	"TIMER4_VAL_LOW\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF93:
	.ascii	"ClockClient_Initialize\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF135:
	.ascii	"clock.c\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF80:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF98:
	.ascii	"print_current_time\000"
.LASF78:
	.ascii	"source_tid\000"
.LASF108:
	.ascii	"TrSTmr\000"
.LASF123:
	.ascii	"TICK_SIZE\000"
.LASF131:
	.ascii	"IDLE_TASK_NAME\000"
.LASF119:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF90:
	.ascii	"ClockServer_Start\000"
.LASF124:
	.ascii	"TASK_STATE_NAMES\000"
.LASF6:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF58:
	.ascii	"ClockMessage\000"
.LASF132:
	.ascii	"Idle\000"
.LASF68:
	.ascii	"ClockClient\000"
.LASF89:
	.ascii	"count\000"
.LASF84:
	.ascii	"ClockServer_HandleNotifier\000"
.LASF77:
	.ascii	"server\000"
.LASF122:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF54:
	.ascii	"message_type\000"
.LASF125:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF71:
	.ascii	"delay_time\000"
.LASF73:
	.ascii	"send_buffer\000"
.LASF63:
	.ascii	"tid_to_delay_until\000"
.LASF52:
	.ascii	"NUM_EVENTS\000"
.LASF115:
	.ascii	"ERR_K_DEFAULT\000"
.LASF64:
	.ascii	"shutdown\000"
.LASF55:
	.ascii	"event_id\000"
.LASF111:
	.ascii	"LIGHTS_MASK\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF70:
	.ascii	"parent_tid\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF92:
	.ascii	"return_code\000"
.LASF87:
	.ascii	"min_tid\000"
.LASF4:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF62:
	.ascii	"ticks\000"
.LASF42:
	.ascii	"MessageType\000"
.LASF5:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF41:
	.ascii	"char\000"
.LASF49:
	.ascii	"UART1_TX_EVENT\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF59:
	.ascii	"ClockServer\000"
.LASF60:
	.ascii	"receive_buffer\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF75:
	.ascii	"ClockServer_Initialize\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF88:
	.ascii	"ClockServer_UnblockDelayedTasks\000"
.LASF79:
	.ascii	"receive_msg\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF117:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF45:
	.ascii	"EventID\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF53:
	.ascii	"NotifyMessage\000"
.LASF47:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF112:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF105:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF99:
	.ascii	"ProfileStart\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF67:
	.ascii	"slow_counter\000"
.LASF72:
	.ascii	"num_delays\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF51:
	.ascii	"UART2_TX_EVENT\000"
.LASF81:
	.ascii	"ClockServer_HandleDelayRequest\000"
.LASF48:
	.ascii	"UART1_RX_EVENT\000"
.LASF91:
	.ascii	"__func__\000"
.LASF136:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF57:
	.ascii	"short int\000"
.LASF127:
	.ascii	"CLOCK_SERVER_NAME\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF61:
	.ascii	"reply_buffer\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF106:
	.ascii	"TCmSvr\000"
.LASF85:
	.ascii	"diff\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF102:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF82:
	.ascii	"absolute\000"
.LASF95:
	.ascii	"ClockClient_Start\000"
.LASF65:
	.ascii	"running\000"
.LASF120:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF76:
	.ascii	"ClockServer_HandleShutdownRequest\000"
.LASF94:
	.ascii	"client\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF86:
	.ascii	"ClockServer_GetNextTask\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF74:
	.ascii	"K3Message\000"
.LASF109:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF43:
	.ascii	"GenericMessage\000"
.LASF130:
	.ascii	"ADMINISTRATOR_TASK_NAME\000"
.LASF126:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF46:
	.ascii	"NULL_EVENT\000"
.LASF7:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF114:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF56:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF113:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF101:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF116:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF96:
	.ascii	"send_message\000"
.LASF69:
	.ascii	"server_tid\000"
.LASF104:
	.ascii	"TrnSvr\000"
.LASF50:
	.ascii	"UART2_RX_EVENT\000"
.LASF2:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF110:
	.ascii	"TrSwMr\000"
.LASF107:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF66:
	.ascii	"last_timer_value\000"
.LASF118:
	.ascii	"NAMESERVER_TID\000"
.LASF8:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF103:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF44:
	.ascii	"double\000"
.LASF129:
	.ascii	"TIMER4_VAL_HIGH\000"
.LASF121:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF83:
	.ascii	"ClockServer_HandleTimeRequest\000"
.LASF133:
	.ascii	"profile_last_time_value\000"
.LASF100:
	.ascii	"ProfileEnd\000"
	.ident	"GCC: (GNU) 4.0.2"
