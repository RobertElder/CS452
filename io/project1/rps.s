	.file	"rps.c"
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
	.type	RPS_SERVER_NAME, %object
	.size	RPS_SERVER_NAME, 7
RPS_SERVER_NAME:
	.ascii	"RPSSvr\000"
	.align	2
	.type	__func__.2046, %object
	.size	__func__.2046, 13
__func__.2046:
	.ascii	"RPSTestStart\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Shouldn't see me\012\000"
	.text
	.align	2
	.global	RPSTestStart
	.type	RPSTestStart, %function
RPSTestStart:
.LFB2:
	.file 1 "rps.c"
	.loc 1 12 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI0:
	ldr	sl, .L9
	.loc 1 13 0
	ldr	r3, .L9+4
	ldr	r2, .L9+8
	.loc 1 12 0
.L7:
	add	sl, pc, sl
	.loc 1 13 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	.loc 1 17 0
	ldr	r3, .L9+12
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r5, .L9+16
	mov	r4, #0
.LVL1:
.L2:
	.loc 1 20 0
	add	r4, r4, #1
	.loc 1 21 0
	mov	r0, #24
	ldr	r1, [sl, r5]
	bl	Create(PLT)
	.loc 1 20 0
	cmp	r4, #380
	bne	.L2
	.loc 1 24 0
	bl	Exit(PLT)
	.loc 1 26 0
	ldr	r1, .L9+20
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 27 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 26 0
	b	assert(PLT)
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	RPSTestStart(GOT)
	.word	__func__.2046(GOT)
	.word	RPSServer_Start(GOT)
	.word	RPSClient_Start(GOT)
	.word	.LC0(GOTOFF)
.LFE2:
	.size	RPSTestStart, .-RPSTestStart
	.align	2
	.global	RPSServer_Initialize
	.type	RPSServer_Initialize, %function
RPSServer_Initialize:
.LFB4:
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	stmfd	sp!, {r4, r5, lr}
.LCFI1:
	.loc 1 55 0
	mov	r4, r0
	.loc 1 56 0
	bl	MyTid(PLT)
.LVL3:
	.loc 1 57 0
	ldr	r1, .L17
	.loc 1 56 0
	str	r0, [r4, #0]
	.loc 1 57 0
	add	r0, r4, #52
	bl	Queue_Initialize(PLT)
	.loc 1 61 0
	ldr	r3, .L17+4
	.loc 1 60 0
	mvn	r1, #0
	.loc 1 58 0
	ldr	r2, .L17+8
	mov	r5, #0
	.loc 1 61 0
	str	r1, [r4, r3]
	.loc 1 59 0
	sub	r3, r3, #8
	.loc 1 58 0
	str	r5, [r4, r2]
	.loc 1 59 0
	str	r5, [r4, r3]
	.loc 1 60 0
	add	r2, r2, #8
	.loc 1 62 0
	ldr	r3, .L17+12
	.loc 1 60 0
	str	r1, [r4, r2]
	.loc 1 62 0
	mov	r2, #1	@ movhi
	strh	r2, [r4, r3]	@ movhi
	.loc 1 63 0
	ldr	r2, .L17+16
	.loc 1 64 0
	add	r3, r3, #10
	.loc 1 63 0
	str	r5, [r4, r2]
	.loc 1 65 0
	add	r2, r2, #4
	.loc 1 64 0
	str	r5, [r4, r3]
	.loc 1 65 0
	str	r5, [r4, r2]
	.loc 1 66 0
	bl	MyTid(PLT)
	mov	r1, r0
	add	r0, r4, #9472
	add	r0, r0, #48
	bl	RNG_Initialize(PLT)
	add	r4, r4, #6336
.LVL4:
	ldr	r3, .L17+20
	add	r4, r4, #28
.L12:
.LVL5:
	.loc 1 69 0
	add	r5, r5, #1
	.loc 1 70 0
	mov	r2, #0	@ movhi
	.loc 1 69 0
	cmp	r5, r3
	.loc 1 70 0
	strh	r2, [r4], #2	@ movhi
	.loc 1 69 0
	bne	.L12
	.loc 1 72 0
	ldmfd	sp!, {r4, r5, pc}
.L18:
	.align	2
.L17:
	.word	1570
	.word	6360
	.word	6348
	.word	9506
	.word	9508
	.word	1571
.LFE4:
	.size	RPSServer_Initialize, .-RPSServer_Initialize
	.global	__gtsf2
	.align	2
	.global	RPSServer_SelectPlayers
	.type	RPSServer_SelectPlayers, %function
RPSServer_SelectPlayers:
.LFB6:
	.loc 1 112 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL6:
	stmfd	sp!, {r4, r5, r6, lr}
.LCFI2:
	.loc 1 113 0
	add	r5, r0, #52
	.loc 1 112 0
	mov	r4, r0
	.loc 1 113 0
	mov	r0, r5
.LVL7:
	bl	Queue_CurrentCount(PLT)
	cmp	r0, #1
	ldrgt	r6, .L46
	ldmlefd	sp!, {r4, r5, r6, pc}
.L43:
	.loc 1 118 0
	mov	r0, r5
	bl	Queue_CurrentCount(PLT)
	cmp	r0, #0
	.loc 1 119 0
	mov	r0, r5
	.loc 1 118 0
	beq	.L41
	.loc 1 119 0
	bl	Queue_PopStart(PLT)
	mov	r2, r0
	.loc 1 121 0
	add	r3, r4, r2, asl #1
	ldrsh	r3, [r3, r6]
	.loc 1 119 0
	ldr	ip, .L46+4
	.loc 1 121 0
	cmp	r3, #0
	.loc 1 123 0
	mov	r1, r0
	.loc 1 119 0
	str	r2, [r4, ip]
	.loc 1 123 0
	mov	r0, r5
	.loc 1 131 0
	streq	r3, [r4, ip]
	.loc 1 121 0
	beq	.L43
	.loc 1 123 0
	bl	Queue_PushEnd(PLT)
	.loc 1 126 0
	add	r0, r4, #9472
	add	r0, r0, #48
	bl	RNG_GetFloat(PLT)
	mov	r1, #1061158912
	bl	__gtsf2(PLT)
	cmp	r0, #0
	ble	.L43
	.loc 1 135 0
	mov	r0, r5
	bl	Queue_CurrentCount(PLT)
	cmp	r0, #0
	.loc 1 136 0
	mov	r0, r5
	.loc 1 135 0
	beq	.L29
.L26:
	.loc 1 136 0
	bl	Queue_PopStart(PLT)
	.loc 1 138 0
	ldr	r3, .L46
	add	r2, r4, r0, asl #1
	ldrsh	r3, [r2, r3]
	.loc 1 136 0
	ldr	r2, .L46+8
	.loc 1 138 0
	cmp	r3, #0
	.loc 1 136 0
	mov	r1, r0
	str	r0, [r4, r2]
	.loc 1 138 0
	bne	.L37
	.loc 1 144 0
	str	r3, [r4, r2]
.L41:
	.loc 1 135 0
	mov	r0, r5
	bl	Queue_CurrentCount(PLT)
	cmp	r0, #0
	.loc 1 136 0
	mov	r0, r5
	.loc 1 135 0
	bne	.L26
.L29:
	.loc 1 148 0
	ldr	r0, .L46+4
	ldr	r1, .L46+8
	ldr	r3, [r4, r0]
	ldr	r2, [r4, r1]
	cmp	r3, r2
	beq	.L32
	.loc 1 155 0
	cmp	r3, #0
	bne	.L45
.L32:
	.loc 1 156 0
	mov	r3, #0
	.loc 1 157 0
	str	r3, [r4, r1]
	.loc 1 156 0
	str	r3, [r4, r0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L45:
	.loc 1 155 0
	cmp	r2, #0
	.loc 1 161 0
	ldrne	r3, .L46+12
	movne	r2, #1
	strne	r2, [r4, r3]
	.loc 1 155 0
	.loc 1 156 0
	moveq	r3, #0
	.loc 1 157 0
	streq	r3, [r4, r1]
	.loc 1 156 0
	streq	r3, [r4, r0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L37:
	.loc 1 140 0
	mov	r0, r5
	bl	Queue_PushEnd(PLT)
	b	.L29
.L47:
	.align	2
.L46:
	.word	6364
	.word	6348
	.word	6352
	.word	9516
.LFE6:
	.size	RPSServer_SelectPlayers, .-RPSServer_SelectPlayers
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"get_who_won: shouldn't get here\000"
	.align	2
.LC2:
	.ascii	"get_who_won: Unable to determine who won\000"
	.text
	.align	2
	.global	get_who_won
	.type	get_who_won, %function
get_who_won:
.LFB16:
	.loc 1 462 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	stmfd	sp!, {r4, sl, lr}
.LCFI3:
	ldr	sl, .L71
	.loc 1 463 0
	cmp	r0, #0
	.loc 1 462 0
.L68:
	add	sl, pc, sl
	mov	r4, r1
	.loc 1 463 0
	bne	.L49
.LVL9:
	.loc 1 464 0
	add	r3, r1, #1
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L51
	.p2align 2
.L56:
	b	.L64
	b	.L53
	b	.L54
	b	.L55
	b	.L55
.L49:
	.loc 1 477 0
	cmp	r0, #1
	beq	.L69
	.loc 1 491 0
	cmp	r0, #2
	beq	.L70
	.loc 1 507 0
	cmn	r1, #1
	beq	.L66
.LVL10:
	cmp	r1, #3
	beq	.L53
.L54:
	.loc 1 519 0
	mov	r0, #2
.LVL11:
	ldmfd	sp!, {r4, sl, pc}
.LVL12:
.L53:
	mov	r0, #0
.LVL13:
	ldmfd	sp!, {r4, sl, pc}
.LVL14:
.L69:
	.loc 1 478 0
	add	r3, r1, #1
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L51
	.p2align 2
.L61:
	b	.L64
	b	.L55
	b	.L53
	b	.L54
	b	.L55
.LVL15:
.L64:
	.loc 1 502 0
	ldr	r1, .L71+4
.LVL16:
	mov	r0, #0
.LVL17:
	add	r1, sl, r1
	bl	assert(PLT)
	mvn	r0, #0
	ldmfd	sp!, {r4, sl, pc}
.LVL18:
.L51:
	.loc 1 518 0
	ldr	r1, .L71+8
.LVL19:
	mov	r0, #0
.LVL20:
	add	r1, sl, r1
	bl	assert(PLT)
	mvn	r0, #0
	ldmfd	sp!, {r4, sl, pc}
.LVL21:
.L55:
	.loc 1 519 0
	mov	r0, #1
.LVL22:
	.loc 1 520 0
	ldmfd	sp!, {r4, sl, pc}
.LVL23:
.L66:
	.loc 1 509 0
	ldr	r1, .L71+4
.LVL24:
	mov	r0, #0
.LVL25:
	add	r1, sl, r1
	bl	assert(PLT)
	mov	r0, r4
	ldmfd	sp!, {r4, sl, pc}
.LVL26:
.L70:
	.loc 1 492 0
	add	r3, r1, #1
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L51
	.p2align 2
.L65:
	b	.L64
	b	.L54
	b	.L55
	b	.L53
	b	.L55
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L68+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
.LFE16:
	.size	get_who_won, .-get_who_won
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Server: Telling %d goodbye message\012\000"
	.align	2
.LC4:
	.ascii	"RPSServer couldn't send GOODBYE to client\000"
	.align	2
.LC5:
	.ascii	"Server: We are shutting down\012\000"
	.text
	.align	2
	.global	RPSServer_HandleQuit
	.type	RPSServer_HandleQuit, %function
RPSServer_HandleQuit:
.LFB9:
	.loc 1 234 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL27:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI4:
	.loc 1 240 0
	ldr	ip, .L76
	.loc 1 242 0
	ldr	r3, .L76+4
	.loc 1 240 0
	ldr	r1, [r0, ip]
.LVL28:
	.loc 1 234 0
	mov	r4, r0
	.loc 1 239 0
	mov	r0, #0
.LVL29:
	.loc 1 242 0
	str	r0, [r4, r3]
	.loc 1 240 0
	sub	r1, r1, #1
	.loc 1 243 0
	ldr	r3, .L76+8
	.loc 1 239 0
	add	lr, r4, r2, asl #1
	.loc 1 240 0
	str	r1, [r4, ip]
	.loc 1 234 0
	mov	r5, r2
	.loc 1 243 0
	mov	r1, #4
	.loc 1 239 0
	ldr	r2, .L76+12
.LVL30:
	.loc 1 243 0
	str	r1, [r4, r3]
	.loc 1 234 0
	ldr	sl, .L76+16
	.loc 1 241 0
	sub	r3, r3, #3168
	.loc 1 239 0
	strh	r0, [lr, r2]	@ movhi
	.loc 1 241 0
	str	r0, [r4, r3]
	.loc 1 247 0
	ldr	r0, .L76+20
	.loc 1 234 0
.L75:
	add	sl, pc, sl
	.loc 1 246 0
	mov	r2, #9
	str	r2, [r4, #36]!
	.loc 1 247 0
	add	r0, sl, r0
	mov	r1, r5
	bl	robprintfbusy(PLT)
	.loc 1 248 0
	mov	r1, r4
	mov	r2, #16
	mov	r0, r5
	bl	Reply(PLT)
	.loc 1 249 0
	ldr	r1, .L76+24
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 251 0
	ldr	r0, .L76+28
	add	r0, sl, r0
	.loc 1 252 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 251 0
	b	robprintfbusy(PLT)
.L77:
	.align	2
.L76:
	.word	9512
	.word	6352
	.word	9516
	.word	6364
	.word	_GLOBAL_OFFSET_TABLE_-(.L75+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
.LFE9:
	.size	RPSServer_HandleQuit, .-RPSServer_HandleQuit
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Failed to reply RESULT message to player 1\000"
	.align	2
.LC7:
	.ascii	"Failed to send RESULT message to player 2\000"
	.align	2
.LC8:
	.ascii	"RPSServer couldn't send WAIT to client\000"
	.text
	.align	2
	.global	RPSServer_ReplyResult
	.type	RPSServer_ReplyResult, %function
RPSServer_ReplyResult:
.LFB7:
	.loc 1 164 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL31:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI5:
	.loc 1 169 0
	ldr	r3, .L97
	ldr	r2, .L97+4
	.loc 1 164 0
	ldr	sl, .L97+8
	mov	r4, r0
.L93:
	add	sl, pc, sl
	mov	r5, r1
	.loc 1 169 0
	ldr	r0, [r0, r3]
.LVL32:
	ldr	r1, [r4, r2]
.LVL33:
	bl	get_who_won(PLT)
	.loc 1 171 0
	cmp	r0, #0
.LVL34:
	moveq	ip, #2
.LVL35:
	moveq	lr, ip
.LVL36:
	beq	.L81
	.loc 1 174 0
	cmp	r0, #1
	moveq	ip, r0
	moveq	lr, #0
	movne	lr, #1
	movne	ip, #0
.L81:
	.loc 1 182 0
	ldr	r6, .L97+12
	ldr	r3, [r4, r6]
	cmp	r3, r5
	beq	.L94
	.loc 1 192 0
	ldr	r6, .L97+16
	ldr	r3, [r4, r6]
	cmp	r5, r3
	beq	.L95
	.loc 1 205 0
	mov	r3, #13
	.loc 1 206 0
	add	r0, r4, #9472
.LVL37:
	.loc 1 205 0
	str	r3, [r4, #36]
	.loc 1 206 0
	mov	r1, #1
	mov	r2, #3
	add	r0, r0, #48
	bl	RNG_GetRange(PLT)
.LVL38:
	.loc 1 204 0
	add	r1, r4, #36
.LVL39:
	.loc 1 206 0
	str	r0, [r1, #12]
	.loc 1 207 0
	mov	r2, #16
	mov	r0, r5
	bl	Reply(PLT)
.LVL40:
	.loc 1 208 0
	ldr	r1, .L97+20
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 211 0
	ldr	r3, .L97+12
	ldr	r2, [r4, r3]
	cmp	r2, #0
	ldmnefd	sp!, {r4, r5, r6, sl, pc}
.L96:
	add	r3, r3, #4
	ldr	r2, [r4, r3]
	cmp	r2, #0
	ldmnefd	sp!, {r4, r5, r6, sl, pc}
	.loc 1 214 0
	ldr	r3, .L97+24
	.loc 1 212 0
	mvn	r1, #0
	.loc 1 214 0
	str	r2, [r4, r3]
	.loc 1 213 0
	ldr	r2, .L97+4
	.loc 1 212 0
	ldr	r3, .L97
	.loc 1 213 0
	str	r1, [r4, r2]
	.loc 1 212 0
	str	r1, [r4, r3]
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL41:
.L95:
	.loc 1 197 0
	ldr	r3, .L97
	.loc 1 194 0
	add	r1, r4, #36
.LVL42:
	.loc 1 197 0
	ldr	r0, [r4, r3]
.LVL43:
	.loc 1 195 0
	mov	r2, #7
	.loc 1 196 0
	stmib	r1, {r0, ip}	@ phole stm
	.loc 1 195 0
	str	r2, [r4, #36]
	.loc 1 199 0
	mov	r0, r5
	add	r2, r2, #9
	bl	Reply(PLT)
.LVL44:
	.loc 1 200 0
	ldr	r1, .L97+28
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 201 0
	mov	r3, #0
	str	r3, [r4, r6]
	.loc 1 211 0
	ldr	r3, .L97+12
	ldr	r2, [r4, r3]
	cmp	r2, #0
	beq	.L96
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL45:
.L94:
	.loc 1 186 0
	ldr	r3, .L97+4
	.loc 1 183 0
	add	r1, r4, #36
.LVL46:
	.loc 1 186 0
	ldr	r0, [r4, r3]
.LVL47:
	.loc 1 184 0
	mov	r2, #7
	.loc 1 185 0
	stmib	r1, {r0, lr}	@ phole stm
	.loc 1 184 0
	str	r2, [r4, #36]
	.loc 1 188 0
	mov	r0, r5
	add	r2, r2, #9
	bl	Reply(PLT)
.LVL48:
	.loc 1 189 0
	ldr	r1, .L97+32
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 191 0
	mov	r3, #0
	str	r3, [r4, r6]
	.loc 1 211 0
	ldr	r3, .L97+12
	ldr	r2, [r4, r3]
	cmp	r2, #0
	beq	.L96
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L98:
	.align	2
.L97:
	.word	6356
	.word	6360
	.word	_GLOBAL_OFFSET_TABLE_-(.L93+8)
	.word	6348
	.word	6352
	.word	.LC8(GOTOFF)
	.word	9516
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
.LFE7:
	.size	RPSServer_ReplyResult, .-RPSServer_ReplyResult
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"Server: Telling %d that have shutdown\012\000"
	.align	2
.LC10:
	.ascii	"RPSServer couldn't send SHUTDOWN to client\000"
	.align	2
.LC11:
	.ascii	"Server: We got players! P1=%d, P2=%d\012\000"
	.text
	.align	2
	.global	RPSServer_HandlePlay
	.type	RPSServer_HandlePlay, %function
RPSServer_HandlePlay:
.LFB10:
	.loc 1 254 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL49:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI6:
	.loc 1 258 0
	ldr	r3, .L123
	.loc 1 254 0
	ldr	sl, .L123+4
	.loc 1 258 0
	ldr	r3, [r0, r3]
	.loc 1 254 0
.L117:
	add	sl, pc, sl
	.loc 1 258 0
	cmp	r3, #4
	.loc 1 254 0
	mov	r5, r0
	mov	r7, r2
	.loc 1 256 0
	add	r6, r0, #36
	.loc 1 258 0
	beq	.L120
.LVL50:
	.loc 1 265 0
	cmp	r3, #1
	beq	.L121
	.loc 1 290 0
	cmp	r3, #3
	beq	.L122
.L111:
	.loc 1 296 0
	mov	r3, #13
	.loc 1 297 0
	add	r0, r5, #9472
.LVL51:
	mov	r1, #1
.LVL52:
	mov	r2, #3
	.loc 1 296 0
	str	r3, [r6, #0]
	.loc 1 297 0
	add	r0, r0, #48
	bl	RNG_GetRange(PLT)
	.loc 1 298 0
	mov	r1, r6
	.loc 1 297 0
	str	r0, [r6, #12]
	.loc 1 298 0
	mov	r2, #16
	mov	r0, r7
.LVL53:
.L119:
	bl	Reply(PLT)
.LVL54:
	.loc 1 299 0
	ldr	r1, .L123+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	.loc 1 301 0
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
	.loc 1 299 0
	b	assert(PLT)
.LVL55:
.L122:
	.loc 1 290 0
	ldr	r3, .L123+12
	ldr	r2, [r0, r3]
	cmp	r7, r2
	beq	.L113
	add	r3, r3, #4
	ldr	r2, [r0, r3]
	cmp	r7, r2
	bne	.L111
.L113:
	.loc 1 292 0
	mov	r1, r7
.LVL56:
	.loc 1 301 0
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
	.loc 1 292 0
	b	RPSServer_ReplyResult(PLT)
.LVL57:
.LVL58:
.L121:
	.loc 1 268 0
	ldr	r3, .L123+12
	ldr	r2, [r0, r3]
	cmp	r7, r2
	beq	.L118
	.loc 1 270 0
	ldr	r3, .L123+16
	ldr	r2, [r0, r3]
	cmp	r7, r2
	beq	.L118
.L106:
	.loc 1 274 0
	ldr	r3, .L123+20
	ldr	r2, [r5, r3]
	cmn	r2, #1
	beq	.L108
.LVL59:
	add	r3, r3, #4
	ldr	r2, [r5, r3]
	cmn	r2, #1
	beq	.L108
	.loc 1 275 0
	ldr	r4, .L123
	mov	r3, #2
	str	r3, [r5, r4]
	.loc 1 277 0
	ldr	ip, .L123+16
	ldr	r3, .L123+12
	ldr	r0, .L123+24
	ldr	r1, [r5, r3]
.LVL60:
	ldr	r2, [r5, ip]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 278 0
	ldr	r1, .L123+28
	.loc 1 279 0
	mov	r2, #3
	.loc 1 278 0
	ldr	r3, [r5, r1]
	.loc 1 279 0
	str	r2, [r5, r4]
	.loc 1 278 0
	add	r3, r3, #1
	str	r3, [r5, r1]
.LVL61:
.L108:
	.loc 1 285 0
	mov	r2, #0
	.loc 1 284 0
	mov	r3, #13
	.loc 1 285 0
	str	r2, [r6, #12]
	.loc 1 286 0
	mov	r1, r6
.LVL62:
	mov	r0, r7
	add	r2, r2, #16
	.loc 1 284 0
	str	r3, [r6, #0]
	b	.L119
.LVL63:
.L118:
	.loc 1 271 0
	ldr	r2, [r1, #4]
	add	r3, r3, #8
	str	r2, [r5, r3]
	b	.L106
.LVL64:
.L120:
	.loc 1 260 0
	ldr	r0, .L123+32
.LVL65:
	.loc 1 259 0
	ldr	r3, .L123+36
	.loc 1 260 0
	ldr	r2, [r5, r0]
	.loc 1 259 0
	mov	ip, #0	@ movhi
	.loc 1 260 0
	sub	r2, r2, #1
	str	r2, [r5, r0]
	.loc 1 259 0
	add	r1, r5, r7, asl #1
.LVL66:
	.loc 1 262 0
	ldr	r0, .L123+40
	.loc 1 259 0
	strh	ip, [r1, r3]	@ movhi
	.loc 1 261 0
	mov	r3, #12
	str	r3, [r5, #36]
	.loc 1 262 0
	add	r0, sl, r0
	mov	r1, r7
	bl	robprintfbusy(PLT)
	.loc 1 263 0
	mov	r1, r6
	mov	r0, r7
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 264 0
	ldr	r1, .L123+44
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	.loc 1 301 0
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
	.loc 1 264 0
	b	assert(PLT)
.L124:
	.align	2
.L123:
	.word	9516
	.word	_GLOBAL_OFFSET_TABLE_-(.L117+8)
	.word	.LC8(GOTOFF)
	.word	6348
	.word	6352
	.word	6356
	.word	.LC11(GOTOFF)
	.word	9508
	.word	9512
	.word	6364
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
.LFE10:
	.size	RPSServer_HandlePlay, .-RPSServer_HandlePlay
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"RPSServer couldn't send SIGN_UP_OK to client. Got e"
	.ascii	"rr=%d. Source TID=%d\000"
	.text
	.align	2
	.global	RPSServer_HandleSignup
	.type	RPSServer_HandleSignup, %function
RPSServer_HandleSignup:
.LFB8:
	.loc 1 221 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL67:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI7:
	ldr	sl, .L128
	mov	r4, r0
.L127:
	add	sl, pc, sl
	.loc 1 224 0
	mov	r1, r2
.LVL68:
	add	r0, r0, #52
.LVL69:
	.loc 1 221 0
	mov	r5, r2
	.loc 1 224 0
	bl	Queue_PushEnd(PLT)
.LVL70:
	.loc 1 226 0
	ldr	r2, .L128+4
	.loc 1 225 0
	add	r1, r4, r5, asl #1
	.loc 1 226 0
	ldr	r3, [r4, r2]
	.loc 1 230 0
	mov	r0, r5
	.loc 1 226 0
	add	r3, r3, #1
	str	r3, [r4, r2]
	.loc 1 229 0
	mov	r3, #5
	.loc 1 225 0
	ldr	r2, .L128+8
	.loc 1 229 0
	str	r3, [r4, #36]!
	.loc 1 225 0
	mov	r3, #1	@ movhi
	strh	r3, [r1, r2]	@ movhi
	.loc 1 230 0
	mov	r1, r4
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 231 0
	ldr	r1, .L128+12
	mov	r2, r0
.LVL71:
	add	r1, sl, r1
	rsbs	r0, r0, #1
	movcc	r0, #0
	mov	r3, r5
	.loc 1 232 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 231 0
	b	assertf(PLT)
.LVL72:
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L127+8)
	.word	9512
	.word	6364
	.word	.LC12(GOTOFF)
.LFE8:
	.size	RPSServer_HandleSignup, .-RPSServer_HandleSignup
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"num signed in underflow\000"
	.align	2
.LC14:
	.ascii	"not running\000"
	.align	2
.LC15:
	.ascii	"RPSServer: Unknown message type from client\000"
	.text
	.align	2
	.global	RPSServer_ProcessMessage
	.type	RPSServer_ProcessMessage, %function
RPSServer_ProcessMessage:
.LFB5:
	.loc 1 74 0
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL73:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI8:
	.loc 1 78 0
	ldr	r3, .L145
	.loc 1 74 0
	ldr	sl, .L145+4
	.loc 1 78 0
	ldr	r2, [r0, r3]
	.loc 1 74 0
	mov	r4, r0
	.loc 1 78 0
	ldr	r6, .L145+8
	ldr	r0, .L145+12
.LVL74:
	.loc 1 74 0
.L142:
	add	sl, pc, sl
	.loc 1 78 0
	cmp	r2, r0
	movhi	r0, #0
	movls	r0, #1
	.loc 1 74 0
	sub	sp, sp, #4
.LCFI9:
.LVL75:
	.loc 1 78 0
	add	r1, sl, r6
	bl	assert(PLT)
	.loc 1 79 0
	ldr	r3, .L145+16
	ldr	r1, .L145+20
	ldrsh	r0, [r4, r3]
	add	r1, sl, r1
	cmp	r0, #1
	movne	r0, #0
	moveq	r0, #1
	.loc 1 81 0
	add	r5, r4, #4
	.loc 1 79 0
	bl	assert(PLT)
	.loc 1 81 0
	mov	r0, sp
	mov	r1, r5
	mov	r2, #16
	bl	Receive(PLT)
	.loc 1 84 0
	ldr	r3, [r4, #4]
	cmp	r3, #6
	beq	.L133
	cmp	r3, #8
	beq	.L134
	cmp	r3, #4
	beq	.L143
	.loc 1 95 0
	ldr	r1, .L145+24
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.LVL76:
.L135:
	.loc 1 99 0
	ldr	r5, .L145+28
	ldr	r3, [r4, r5]
	cmp	r3, #0
	beq	.L144
.L136:
	.loc 1 103 0
	ldr	r3, .L145
	ldr	r2, [r4, r3]
	cmp	r2, #0
	bne	.L138
	ldr	r3, [r4, r5]
	cmp	r3, #4
	.loc 1 104 0
	ldreq	r3, .L145+16
	streqh	r2, [r4, r3]	@ movhi
.L138:
	.loc 1 106 0
	ldr	r3, .L145
	ldr	r0, .L145+12
	ldr	r2, [r4, r3]
	add	r1, sl, r6
	cmp	r2, r0
	movhi	r0, #0
	movls	r0, #1
	bl	assert(PLT)
	.loc 1 110 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L144:
	.loc 1 100 0
	mov	r0, r4
	bl	RPSServer_SelectPlayers(PLT)
	b	.L136
.LVL77:
.L133:
	.loc 1 92 0
	mov	r1, r5
.LVL78:
	mov	r0, r4
.LVL79:
	ldr	r2, [sp, #0]
	bl	RPSServer_HandlePlay(PLT)
.LVL80:
	b	.L135
.LVL81:
.L134:
	.loc 1 89 0
	mov	r1, r5
.LVL82:
	mov	r0, r4
.LVL83:
	ldr	r2, [sp, #0]
	bl	RPSServer_HandleQuit(PLT)
.LVL84:
	b	.L135
.LVL85:
.L143:
	.loc 1 86 0
	mov	r1, r5
.LVL86:
	mov	r0, r4
.LVL87:
	ldr	r2, [sp, #0]
	bl	RPSServer_HandleSignup(PLT)
.LVL88:
	b	.L135
.L146:
	.align	2
.L145:
	.word	9512
	.word	_GLOBAL_OFFSET_TABLE_-(.L142+8)
	.word	.LC13(GOTOFF)
	.word	999999
	.word	9506
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	9516
.LFE5:
	.size	RPSServer_ProcessMessage, .-RPSServer_ProcessMessage
	.section	.rodata
	.align	2
	.type	__func__.2057, %object
	.size	__func__.2057, 16
__func__.2057:
	.ascii	"RPSServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC16:
	.ascii	"RPSClient_Start\000"
	.align	2
.LC17:
	.ascii	"RPSServer created tid=%d\012\000"
	.align	2
.LC18:
	.ascii	"RPSServer_Start failed to register name\000"
	.align	2
.LC19:
	.ascii	"About to call exit from rpsserver.\012\000"
	.text
	.align	2
	.global	RPSServer_Start
	.type	RPSServer_Start, %function
RPSServer_Start:
.LFB3:
	.loc 1 29 0
	@ args = 0, pretend = 0, frame = 9536
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL89:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI10:
	ldr	sl, .L154
	.loc 1 30 0
	ldr	r2, .L154+4
	ldr	r3, .L154+8
	.loc 1 29 0
.L153:
	add	sl, pc, sl
	sub	sp, sp, #9536
.LCFI11:
.LVL90:
	.loc 1 30 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 31 0
	ldr	r3, .L154+12
	ldr	r1, .L154+16
	ldr	r0, [sl, r3]
	add	r1, sl, r1
	bl	DebugRegisterFunction(PLT)
	.loc 1 32 0
	bl	MyTid(PLT)
	mov	r1, r0
	ldr	r0, .L154+20
	.loc 1 39 0
	mov	r5, sp
	.loc 1 32 0
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 34 0
	ldr	r3, .L154+24
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 36 0
	ldr	r1, .L154+28
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 39 0
	mov	r0, sp
	bl	RPSServer_Initialize(PLT)
.L148:
	.loc 1 42 0
	mov	r0, sp
	bl	RPSServer_ProcessMessage(PLT)
	.loc 1 44 0
	add	r3, sp, #9472
	ldrsh	r4, [r3, #34]
	cmp	r4, #0
	bne	.L148
	.loc 1 49 0
	ldr	r0, .L154+32
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 50 0
	bl	Exit(PLT)
	.loc 1 52 0
	ldr	r1, .L154+36
	mov	r0, r4
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 53 0
	add	sp, sp, #9536
	ldmfd	sp!, {r4, r5, sl, pc}
.L155:
	.align	2
.L154:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	__func__.2057(GOT)
	.word	RPSServer_Start(GOT)
	.word	RPSClient_Start(GOT)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	RPS_SERVER_NAME(GOT)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC0(GOTOFF)
.LFE3:
	.size	RPSServer_Start, .-RPSServer_Start
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"Client didn't get a goodbye from server\000"
	.align	2
.LC21:
	.ascii	"Client: %d - I decided to quit.\012\000"
	.text
	.align	2
	.global	RPSClient_Quit
	.type	RPSClient_Quit, %function
RPSClient_Quit:
.LFB15:
	.loc 1 450 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL91:
	stmfd	sp!, {r4, sl, lr}
.LCFI12:
	ldr	sl, .L159
	mov	r4, r0
	.loc 1 455 0
	mov	ip, #16
	.loc 1 454 0
	mov	r3, #8
	.loc 1 450 0
.L158:
	add	sl, pc, sl
	sub	sp, sp, #4
.LCFI13:
.LVL92:
	.loc 1 454 0
	str	r3, [r4, #20]
	.loc 1 455 0
	mov	r2, ip
	add	r1, r4, #20
	add	r3, r4, #4
	ldr	r0, [r0, #68]
.LVL93:
	str	ip, [sp, #0]
	bl	Send(PLT)
	.loc 1 457 0
	ldr	r0, [r4, #4]
	ldr	r1, .L159+4
	cmp	r0, #9
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 458 0
	ldr	r0, .L159+8
	ldr	r1, [r4, #0]
	add	r0, sl, r0
	.loc 1 459 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 458 0
	b	robprintfbusy(PLT)
.L160:
	.align	2
.L159:
	.word	_GLOBAL_OFFSET_TABLE_-(.L158+8)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
.LFE15:
	.size	RPSClient_Quit, .-RPSClient_Quit
	.align	2
	.global	RPSClient_Initialize
	.type	RPSClient_Initialize, %function
RPSClient_Initialize:
.LFB12:
	.loc 1 337 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL94:
	stmfd	sp!, {r4, sl, lr}
.LCFI14:
	ldr	sl, .L164
	mov	r4, r0
.L163:
	add	sl, pc, sl
	.loc 1 338 0
	bl	MyTid(PLT)
.LVL95:
	.loc 1 339 0
	mov	r1, r0
	.loc 1 338 0
	str	r0, [r4, #0]
	.loc 1 339 0
	add	r0, r4, #52
	bl	RNG_Initialize(PLT)
	.loc 1 340 0
	ldr	r3, .L164+4
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 341 0
	mov	r3, #7
	str	r3, [r4, #72]
	.loc 1 342 0
	mov	r3, #1	@ movhi
	.loc 1 340 0
	str	r0, [r4, #68]
	.loc 1 342 0
	strh	r3, [r4, #76]	@ movhi
	.loc 1 343 0
	ldmfd	sp!, {r4, sl, pc}
.L165:
	.align	2
.L164:
	.word	_GLOBAL_OFFSET_TABLE_-(.L163+8)
	.word	RPS_SERVER_NAME(GOT)
.LFE12:
	.size	RPSClient_Initialize, .-RPSClient_Initialize
	.section	.rodata.str1.4
	.align	2
.LC22:
	.ascii	"Unknown int to rps choice\000"
	.text
	.align	2
	.global	int_to_rps_choice
	.type	int_to_rps_choice, %function
int_to_rps_choice:
.LFB14:
	.loc 1 434 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL96:
	stmfd	sp!, {sl, lr}
.LCFI15:
	ldr	sl, .L176
.L175:
	add	sl, pc, sl
	.loc 1 435 0
	cmp	r0, #3
	addls	pc, pc, r0, asl #2
	b	.L167
	.p2align 2
.L172:
	b	.L168
	b	.L169
	b	.L170
	b	.L171
.L167:
	.loc 1 445 0
	ldr	r1, .L176+4
	mov	r0, #0
.LVL97:
	add	r1, sl, r1
	bl	assert(PLT)
	mvn	r0, #0
	.loc 1 448 0
	ldmfd	sp!, {sl, pc}
.LVL98:
.L168:
	.loc 1 435 0
	mov	r0, #0
.LVL99:
	ldmfd	sp!, {sl, pc}
.LVL100:
.L169:
	.loc 1 437 0
	mov	r0, #1
.LVL101:
	ldmfd	sp!, {sl, pc}
.LVL102:
.L170:
	.loc 1 435 0
	mov	r0, #2
.LVL103:
	ldmfd	sp!, {sl, pc}
.LVL104:
.L171:
	mov	r0, #3
.LVL105:
	ldmfd	sp!, {sl, pc}
.L177:
	.align	2
.L176:
	.word	_GLOBAL_OFFSET_TABLE_-(.L175+8)
	.word	.LC22(GOTOFF)
.LFE14:
	.size	int_to_rps_choice, .-int_to_rps_choice
	.section	.rodata.str1.4
	.align	2
.LC23:
	.ascii	"Client wasn't told to wait. Got=%d, TID=%d\000"
	.align	2
.LC24:
	.ascii	"Forever Alone: TID=%d hasn't played in a while\000"
	.align	2
.LC25:
	.ascii	"RNG gave client something wrong\000"
	.align	2
.LC26:
	.ascii	"Client: %d - I won \000"
	.align	2
.LC27:
	.ascii	"Client: %d - I lost \000"
	.align	2
.LC28:
	.ascii	"Client: %d - It was a tie \000"
	.align	2
.LC29:
	.ascii	"Client not sure whether its win or lose\000"
	.align	2
.LC30:
	.ascii	" because opponent chose rock\012\000"
	.align	2
.LC31:
	.ascii	" because opponent chose paper\012\000"
	.align	2
.LC32:
	.ascii	" because opponent chose scissors\012\000"
	.align	2
.LC33:
	.ascii	" because opponent gave up\012\000"
	.align	2
.LC34:
	.ascii	"Client unable to explain why it won/lost\000"
	.text
	.align	2
	.global	RPSClient_PlayARound
	.type	RPSClient_PlayARound, %function
RPSClient_PlayARound:
.LFB13:
	.loc 1 346 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL106:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI16:
	ldr	sl, .L207
	mov	r4, r0
.L203:
	add	sl, pc, sl
	sub	sp, sp, #4
.LCFI17:
.LVL107:
	.loc 1 350 0
	mov	r1, #0
	mov	r2, #2
	add	r0, r0, #52
.LVL108:
	bl	RNG_GetRange(PLT)
	.loc 1 350 0
	bl	int_to_rps_choice(PLT)
	ldr	r9, .L207+4
	.loc 1 352 0
	add	r8, r4, #20
	.loc 1 353 0
	mov	r3, #6
	.loc 1 350 0
	mov	fp, r0
.LVL109:
	.loc 1 354 0
	mov	r6, #0
.LVL110:
	add	r5, r4, #4
	mov	r7, #16
	.loc 1 353 0
	str	r3, [r4, #20]
	.loc 1 354 0
	str	r0, [r8, #4]
	b	.L179
.LVL111:
.L185:
	.loc 1 378 0
	ldr	r0, .L207+8
	ldr	r1, .L207+12
	cmp	r6, r0
	movgt	r0, #0
	movle	r0, #1
	add	r1, sl, r1
	ldr	r2, [r4, #0]
	bl	assertf(PLT)
.LVL112:
.L179:
	.loc 1 358 0
	ldr	r0, [r4, #68]
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	str	r7, [sp, #0]
	bl	Send(PLT)
	.loc 1 363 0
	ldr	r0, [r4, #4]
	.loc 1 377 0
	add	r6, r6, #1
	.loc 1 363 0
	cmp	r0, #7
	.loc 1 370 0
	add	r1, sl, r9
	mov	r2, r0
	.loc 1 363 0
	beq	.L180
	.loc 1 365 0
	cmp	r0, #12
	beq	.L201
	.loc 1 370 0
	cmp	r0, #13
	movne	r0, #0
	moveq	r0, #1
	ldr	r3, [r4, #0]
	bl	assertf(PLT)
	.loc 1 373 0
	ldr	r0, [r5, #12]
	cmp	r0, #0
	beq	.L185
	.loc 1 374 0
	bl	Delay(PLT)
	b	.L185
.L180:
	.loc 1 381 0
	cmp	fp, #2
	bhi	.L204
	.loc 1 399 0
	ldr	r3, [r5, #8]
	.loc 1 397 0
	ldr	r5, [r5, #4]
.LVL113:
	.loc 1 399 0
	cmp	r3, #1
	beq	.L191
.L206:
	bcc	.L190
	cmp	r3, #2
	beq	.L205
	.loc 1 410 0
	ldr	r1, .L207+16
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.L193:
	.loc 1 414 0
	cmp	r5, #3
	addls	pc, pc, r5, asl #2
	b	.L194
	.p2align 2
.L199:
	b	.L195
	b	.L196
	b	.L197
	b	.L198
.LVL114:
.L204:
	.loc 1 392 0
	ldr	r1, .L207+20
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 399 0
	ldr	r3, [r5, #8]
	.loc 1 397 0
	ldr	r5, [r5, #4]
.LVL115:
	.loc 1 399 0
	cmp	r3, #1
	bne	.L206
	b	.L191
.LVL116:
.L201:
	.loc 1 366 0
	mov	r3, #0	@ movhi
	strh	r3, [r4, #76]	@ movhi
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL117:
.L190:
	.loc 1 401 0
	ldr	r0, .L207+24
	ldr	r1, [r4, #0]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	b	.L193
.L191:
	.loc 1 404 0
	ldr	r0, .L207+28
	ldr	r1, [r4, #0]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	b	.L193
.L194:
	.loc 1 428 0
	ldr	r1, .L207+32
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 428 0
	b	assert(PLT)
.L195:
	.loc 1 416 0
	ldr	r0, .L207+36
	add	r0, sl, r0
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 416 0
	b	robprintfbusy(PLT)
.L196:
	.loc 1 419 0
	ldr	r0, .L207+40
	add	r0, sl, r0
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 419 0
	b	robprintfbusy(PLT)
.L197:
	.loc 1 422 0
	ldr	r0, .L207+44
	add	r0, sl, r0
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 422 0
	b	robprintfbusy(PLT)
.L198:
	.loc 1 425 0
	ldr	r0, .L207+48
	add	r0, sl, r0
	.loc 1 431 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 425 0
	b	robprintfbusy(PLT)
.L205:
	.loc 1 407 0
	ldr	r0, .L207+52
	ldr	r1, [r4, #0]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	b	.L193
.L208:
	.align	2
.L207:
	.word	_GLOBAL_OFFSET_TABLE_-(.L203+8)
	.word	.LC23(GOTOFF)
	.word	1569999
	.word	.LC24(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC28(GOTOFF)
.LFE13:
	.size	RPSClient_PlayARound, .-RPSClient_PlayARound
	.section	.rodata.str1.4
	.align	2
.LC35:
	.ascii	"RPSClient created, tid=%d\012\000"
	.align	2
.LC36:
	.ascii	"Client didn't sign up successfully\000"
	.align	2
.LC37:
	.ascii	"Client: %d - Quiting due to server shutdown\012\000"
	.text
	.align	2
	.global	RPSClient_Start
	.type	RPSClient_Start, %function
RPSClient_Start:
.LFB11:
	.loc 1 304 0
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL118:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI18:
	ldr	sl, .L219
	sub	sp, sp, #84
.LCFI19:
.LVL119:
.L217:
	add	sl, pc, sl
	.loc 1 305 0
	bl	MyTid(PLT)
	.loc 1 305 0
	mov	r1, r0
	ldr	r0, .L219+4
	.loc 1 307 0
	add	r5, sp, #4
	.loc 1 305 0
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 317 0
	mov	r4, #16
	.loc 1 307 0
	mov	r0, r5
	bl	RPSClient_Initialize(PLT)
	.loc 1 317 0
	add	r3, sp, #8
	.loc 1 316 0
	mov	ip, #4
	.loc 1 317 0
	mov	r2, r4
	add	r1, sp, #24
.LVL120:
	ldr	r0, [sp, #72]
	.loc 1 316 0
	str	ip, [sp, #24]
	.loc 1 317 0
	str	r4, [sp, #0]
	bl	Send(PLT)
.LVL121:
	.loc 1 320 0
	ldr	r0, [sp, #8]
	ldr	r1, .L219+8
	cmp	r0, #5
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 323 0
	ldr	r3, [sp, #76]
	cmp	r3, #0
	bne	.L218
.LVL122:
.L210:
	.loc 1 332 0
	mov	r0, r5
	bl	RPSClient_Quit(PLT)
	.loc 1 334 0
	bl	Exit(PLT)
	.loc 1 335 0
	add	sp, sp, #84
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL123:
.L218:
	ldr	r6, .L219+12
.LVL124:
	.loc 1 323 0
	sub	r4, r4, #16
	b	.L212
.L213:
	ldr	r3, [sp, #76]
	cmp	r4, r3
	bcs	.L210
.L212:
	.loc 1 324 0
	mov	r0, r5
	bl	RPSClient_PlayARound(PLT)
	.loc 1 325 0
	bl	Pass(PLT)
	.loc 1 326 0
	ldrsh	r3, [sp, #80]
	.loc 1 323 0
	add	r4, r4, #1
	.loc 1 326 0
	cmp	r3, #0
	.loc 1 327 0
	add	r0, sl, r6
	.loc 1 326 0
	bne	.L213
	.loc 1 327 0
	ldr	r1, [sp, #4]
	bl	robprintfbusy(PLT)
	.loc 1 328 0
	bl	Exit(PLT)
	b	.L213
.L220:
	.align	2
.L219:
	.word	_GLOBAL_OFFSET_TABLE_-(.L217+8)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
.LFE11:
	.size	RPSClient_Start, .-RPSClient_Start
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
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI2-.LFB6
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x86
	.uleb128 0x2
	.byte	0x85
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x4
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI3-.LFB16
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI4-.LFB9
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI5-.LFB7
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI6-.LFB10
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
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI7-.LFB8
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
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI8-.LFB5
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
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x18
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI10-.LFB3
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
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x2550
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
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI14-.LFB12
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI15-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI16-.LFB13
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
	.uleb128 0x28
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI18-.LFB11
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
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x68
	.align	2
.LEFDE28:
	.file 2 "rps.h"
	.file 3 "queue.h"
	.file 4 "random.h"
	.file 5 "message.h"
	.file 6 "train.h"
	.file 7 "public_kernel_interface.h"
	.file 8 "task_descriptor.h"
	.file 9 "buffer.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL24-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL30-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL33-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL65-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL54-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL69-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL75-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL74-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL84-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL87-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x4
	.byte	0x7d
	.sleb128 -9536
	.4byte	.LVL90-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL92-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL92-.Ltext0
	.4byte	.LFE15-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL93-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL93-.Ltext0
	.4byte	.LFE15-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL94-.Ltext0
	.4byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL95-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL98-.Ltext0
	.4byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL100-.Ltext0
	.4byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL102-.Ltext0
	.4byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL107-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL107-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST30:
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL108-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST31:
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL114-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL115-.Ltext0
	.4byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL117-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST32:
	.4byte	.LVL118-.Ltext0
	.4byte	.LVL119-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -84
	.4byte	.LVL119-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST33:
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST34:
	.4byte	.LVL122-.Ltext0
	.4byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL124-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0xb24
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF147
	.byte	0x1
	.4byte	.LASF148
	.4byte	.LASF149
	.uleb128 0x2
	.4byte	0x40
	.4byte	.LASF2
	.byte	0x4
	.byte	0x3
	.byte	0x31
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x3
	.byte	0x32
	.4byte	0x40
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x3
	.byte	0x33
	.4byte	0x25
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF1
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.4byte	0xaf
	.4byte	.LASF3
	.2byte	0x1898
	.byte	0x3
	.byte	0x3e
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0x3f
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii	"end\000"
	.byte	0x3
	.byte	0x40
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x3
	.byte	0x41
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x42
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x43
	.4byte	0xaf
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x9
	.4byte	0xc0
	.4byte	0x42
	.uleb128 0xa
	.4byte	0x54
	.2byte	0x621
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x3
	.byte	0x44
	.4byte	0x5b
	.uleb128 0xb
	.4byte	0x1c2
	.4byte	.LASF48
	.byte	0x4
	.byte	0x5
	.byte	0x9
	.uleb128 0xc
	.4byte	.LASF9
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF10
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF11
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF12
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF13
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF14
	.sleb128 5
	.uleb128 0xc
	.4byte	.LASF15
	.sleb128 6
	.uleb128 0xc
	.4byte	.LASF16
	.sleb128 7
	.uleb128 0xc
	.4byte	.LASF17
	.sleb128 8
	.uleb128 0xc
	.4byte	.LASF18
	.sleb128 9
	.uleb128 0xc
	.4byte	.LASF19
	.sleb128 10
	.uleb128 0xc
	.4byte	.LASF20
	.sleb128 11
	.uleb128 0xc
	.4byte	.LASF21
	.sleb128 12
	.uleb128 0xc
	.4byte	.LASF22
	.sleb128 13
	.uleb128 0xc
	.4byte	.LASF23
	.sleb128 14
	.uleb128 0xc
	.4byte	.LASF24
	.sleb128 15
	.uleb128 0xc
	.4byte	.LASF25
	.sleb128 16
	.uleb128 0xc
	.4byte	.LASF26
	.sleb128 17
	.uleb128 0xc
	.4byte	.LASF27
	.sleb128 18
	.uleb128 0xc
	.4byte	.LASF28
	.sleb128 19
	.uleb128 0xc
	.4byte	.LASF29
	.sleb128 20
	.uleb128 0xc
	.4byte	.LASF30
	.sleb128 21
	.uleb128 0xc
	.4byte	.LASF31
	.sleb128 22
	.uleb128 0xc
	.4byte	.LASF32
	.sleb128 23
	.uleb128 0xc
	.4byte	.LASF33
	.sleb128 24
	.uleb128 0xc
	.4byte	.LASF34
	.sleb128 25
	.uleb128 0xc
	.4byte	.LASF35
	.sleb128 26
	.uleb128 0xc
	.4byte	.LASF36
	.sleb128 27
	.uleb128 0xc
	.4byte	.LASF37
	.sleb128 28
	.uleb128 0xc
	.4byte	.LASF38
	.sleb128 29
	.uleb128 0xc
	.4byte	.LASF39
	.sleb128 30
	.uleb128 0xc
	.4byte	.LASF40
	.sleb128 31
	.uleb128 0xc
	.4byte	.LASF41
	.sleb128 32
	.uleb128 0xc
	.4byte	.LASF42
	.sleb128 33
	.uleb128 0xc
	.4byte	.LASF43
	.sleb128 34
	.uleb128 0xc
	.4byte	.LASF44
	.sleb128 35
	.uleb128 0xc
	.4byte	.LASF45
	.sleb128 36
	.uleb128 0xc
	.4byte	.LASF46
	.sleb128 37
	.uleb128 0xc
	.4byte	.LASF47
	.sleb128 38
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x5
	.byte	0x31
	.4byte	0xcb
	.uleb128 0xd
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x9
	.4byte	0x1e4
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0xf
	.byte	0x0
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x1
	.byte	0x8
	.uleb128 0xf
	.4byte	0x228
	.ascii	"RNG\000"
	.byte	0x10
	.byte	0x4
	.byte	0x4
	.uleb128 0x8
	.ascii	"a\000"
	.byte	0x4
	.byte	0x5
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii	"c\000"
	.byte	0x4
	.byte	0x6
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.ascii	"x\000"
	.byte	0x4
	.byte	0x7
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.ascii	"m\000"
	.byte	0x4
	.byte	0x8
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x10
	.ascii	"RNG\000"
	.byte	0x4
	.byte	0x9
	.4byte	0x1eb
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x8
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.4byte	0x252
	.4byte	0x252
	.uleb128 0xa
	.4byte	0x54
	.2byte	0x622
	.byte	0x0
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x2
	.byte	0x5
	.uleb128 0xb
	.4byte	0x284
	.4byte	.LASF53
	.byte	0x4
	.byte	0x2
	.byte	0xb
	.uleb128 0xc
	.4byte	.LASF54
	.sleb128 -1
	.uleb128 0xc
	.4byte	.LASF55
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF56
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF57
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF58
	.sleb128 3
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF53
	.byte	0x2
	.byte	0x11
	.4byte	0x259
	.uleb128 0xb
	.4byte	0x2ae
	.4byte	.LASF59
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.uleb128 0x11
	.ascii	"WIN\000"
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF60
	.sleb128 1
	.uleb128 0x11
	.ascii	"TIE\000"
	.sleb128 2
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF59
	.byte	0x2
	.byte	0x17
	.4byte	0x28f
	.uleb128 0x2
	.4byte	0x2fe
	.4byte	.LASF61
	.byte	0x10
	.byte	0x2
	.byte	0x19
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0x2
	.byte	0x1a
	.4byte	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0x2
	.byte	0x1b
	.4byte	0x284
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x2
	.byte	0x1c
	.4byte	0x2ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x2
	.byte	0x1d
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF61
	.byte	0x2
	.byte	0x1e
	.4byte	0x2b9
	.uleb128 0xb
	.4byte	0x334
	.4byte	.LASF66
	.byte	0x4
	.byte	0x2
	.byte	0x20
	.uleb128 0xc
	.4byte	.LASF67
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF68
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF69
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF70
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF71
	.sleb128 4
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF66
	.byte	0x2
	.byte	0x26
	.4byte	0x309
	.uleb128 0x7
	.4byte	0x429
	.4byte	.LASF72
	.2byte	0x2540
	.byte	0x2
	.byte	0x28
	.uleb128 0x8
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x29
	.4byte	0x1cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF73
	.byte	0x2
	.byte	0x2a
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF74
	.byte	0x2
	.byte	0x2b
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x2
	.byte	0x2c
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x3
	.4byte	.LASF76
	.byte	0x2
	.byte	0x2d
	.4byte	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x3
	.4byte	.LASF77
	.byte	0x2
	.byte	0x2e
	.4byte	0x1cd
	.byte	0x3
	.byte	0x23
	.uleb128 0x18cc
	.uleb128 0x3
	.4byte	.LASF78
	.byte	0x2
	.byte	0x2f
	.4byte	0x1cd
	.byte	0x3
	.byte	0x23
	.uleb128 0x18d0
	.uleb128 0x3
	.4byte	.LASF79
	.byte	0x2
	.byte	0x30
	.4byte	0x284
	.byte	0x3
	.byte	0x23
	.uleb128 0x18d4
	.uleb128 0x3
	.4byte	.LASF80
	.byte	0x2
	.byte	0x31
	.4byte	0x284
	.byte	0x3
	.byte	0x23
	.uleb128 0x18d8
	.uleb128 0x3
	.4byte	.LASF81
	.byte	0x2
	.byte	0x32
	.4byte	0x241
	.byte	0x3
	.byte	0x23
	.uleb128 0x18dc
	.uleb128 0x3
	.4byte	.LASF82
	.byte	0x2
	.byte	0x33
	.4byte	0x252
	.byte	0x3
	.byte	0x23
	.uleb128 0x2522
	.uleb128 0x3
	.4byte	.LASF83
	.byte	0x2
	.byte	0x34
	.4byte	0x4d
	.byte	0x3
	.byte	0x23
	.uleb128 0x2524
	.uleb128 0x3
	.4byte	.LASF84
	.byte	0x2
	.byte	0x35
	.4byte	0x4d
	.byte	0x3
	.byte	0x23
	.uleb128 0x2528
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0x2
	.byte	0x36
	.4byte	0x334
	.byte	0x3
	.byte	0x23
	.uleb128 0x252c
	.uleb128 0x8
	.ascii	"rng\000"
	.byte	0x2
	.byte	0x37
	.4byte	0x228
	.byte	0x3
	.byte	0x23
	.uleb128 0x2530
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF72
	.byte	0x2
	.byte	0x38
	.4byte	0x33f
	.uleb128 0x2
	.4byte	0x4b1
	.4byte	.LASF86
	.byte	0x50
	.byte	0x2
	.byte	0x3a
	.uleb128 0x8
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x3b
	.4byte	0x1cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF75
	.byte	0x2
	.byte	0x3c
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF74
	.byte	0x2
	.byte	0x3d
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x3
	.4byte	.LASF73
	.byte	0x2
	.byte	0x3e
	.4byte	0x1d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.ascii	"rng\000"
	.byte	0x2
	.byte	0x3f
	.4byte	0x228
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x3
	.4byte	.LASF87
	.byte	0x2
	.byte	0x40
	.4byte	0x1cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x3
	.4byte	.LASF88
	.byte	0x2
	.byte	0x41
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x3
	.4byte	.LASF82
	.byte	0x2
	.byte	0x42
	.4byte	0x252
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF86
	.byte	0x2
	.byte	0x43
	.4byte	0x434
	.uleb128 0x12
	.4byte	0x505
	.byte	0x1
	.4byte	.LASF91
	.byte	0x1
	.byte	0xc
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF89
	.4byte	0x515
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2046
	.uleb128 0x14
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x1cd
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.byte	0xf
	.4byte	0x51a
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x1cd
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x9
	.4byte	0x515
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0xc
	.byte	0x0
	.uleb128 0x17
	.4byte	0x505
	.uleb128 0x17
	.4byte	0x1cd
	.uleb128 0x18
	.4byte	0x552
	.byte	0x1
	.4byte	.LASF92
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0x37
	.4byte	0x552
	.4byte	.LLST0
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x1cd
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0x429
	.uleb128 0x18
	.4byte	0x580
	.byte	0x1
	.4byte	.LASF93
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0x70
	.4byte	0x552
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x5be
	.byte	0x1
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x1ce
	.byte	0x1
	.4byte	0x1cd
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x284
	.4byte	.LLST2
	.uleb128 0x1c
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x284
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x18
	.4byte	0x61a
	.byte	0x1
	.4byte	.LASF96
	.byte	0x1
	.byte	0xea
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0xea
	.4byte	0x552
	.4byte	.LLST4
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0xea
	.4byte	0x61a
	.4byte	.LLST5
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0xea
	.4byte	0x1cd
	.4byte	.LLST6
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x1
	.byte	0xec
	.4byte	0x1cd
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.byte	0xee
	.4byte	0x61a
	.byte	0x0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0x2fe
	.uleb128 0x18
	.4byte	0x69e
	.byte	0x1
	.4byte	.LASF101
	.byte	0x1
	.byte	0xa4
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0xa4
	.4byte	0x552
	.4byte	.LLST7
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0xa4
	.4byte	0x1cd
	.4byte	.LLST8
	.uleb128 0x1d
	.4byte	.LASF100
	.byte	0x1
	.byte	0xa5
	.4byte	0x61a
	.4byte	.LLST9
	.uleb128 0x1d
	.4byte	.LASF102
	.byte	0x1
	.byte	0xa6
	.4byte	0x2ae
	.4byte	.LLST10
	.uleb128 0x1d
	.4byte	.LASF103
	.byte	0x1
	.byte	0xa7
	.4byte	0x2ae
	.4byte	.LLST11
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x1
	.byte	0xa8
	.4byte	0x1cd
	.uleb128 0x1d
	.4byte	.LASF104
	.byte	0x1
	.byte	0xa9
	.4byte	0x1cd
	.4byte	.LLST12
	.byte	0x0
	.uleb128 0x18
	.4byte	0x6fb
	.byte	0x1
	.4byte	.LASF105
	.byte	0x1
	.byte	0xfe
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0xfe
	.4byte	0x552
	.4byte	.LLST13
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0xfe
	.4byte	0x61a
	.4byte	.LLST14
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0xfe
	.4byte	0x1cd
	.4byte	.LLST15
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x1
	.byte	0xff
	.4byte	0x1cd
	.uleb128 0x1e
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x100
	.4byte	0x61a
	.byte	0x0
	.uleb128 0x18
	.4byte	0x75b
	.byte	0x1
	.4byte	.LASF106
	.byte	0x1
	.byte	0xdd
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0xdd
	.4byte	0x552
	.4byte	.LLST16
	.uleb128 0x19
	.4byte	.LASF97
	.byte	0x1
	.byte	0xdd
	.4byte	0x61a
	.4byte	.LLST17
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.byte	0xdd
	.4byte	0x1cd
	.4byte	.LLST18
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.byte	0xe4
	.4byte	0x61a
	.uleb128 0x1d
	.4byte	.LASF99
	.byte	0x1
	.byte	0xe6
	.4byte	0x1cd
	.4byte	.LLST19
	.byte	0x0
	.uleb128 0x1f
	.4byte	0x7a2
	.byte	0x1
	.4byte	.LASF107
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST20
	.uleb128 0x19
	.4byte	.LASF94
	.byte	0x1
	.byte	0x4a
	.4byte	0x552
	.4byte	.LLST21
	.uleb128 0x1d
	.4byte	.LASF108
	.byte	0x1
	.byte	0x4b
	.4byte	0x61a
	.4byte	.LLST22
	.uleb128 0x1d
	.4byte	.LASF98
	.byte	0x1
	.byte	0x4c
	.4byte	0x1cd
	.4byte	.LLST23
	.byte	0x0
	.uleb128 0x20
	.4byte	0x7e4
	.byte	0x1
	.4byte	.LASF109
	.byte	0x1
	.byte	0x1d
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST24
	.uleb128 0x13
	.4byte	.LASF89
	.4byte	0x7e4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2057
	.uleb128 0x15
	.4byte	.LASF110
	.byte	0x1
	.byte	0x22
	.4byte	0x1cd
	.uleb128 0x21
	.4byte	.LASF94
	.byte	0x1
	.byte	0x26
	.4byte	0x429
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1d4
	.uleb128 0x22
	.4byte	0x82c
	.byte	0x1
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x1c2
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LLST25
	.uleb128 0x1c
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x1c2
	.4byte	0x82c
	.4byte	.LLST26
	.uleb128 0x1e
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x1c4
	.4byte	0x61a
	.uleb128 0x1e
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x61a
	.byte	0x0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0x4b1
	.uleb128 0x23
	.4byte	0x85c
	.byte	0x1
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x151
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x151
	.4byte	0x82c
	.4byte	.LLST27
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x88a
	.byte	0x1
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x1b2
	.byte	0x1
	.4byte	0x284
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x24
	.ascii	"num\000"
	.byte	0x1
	.2byte	0x1b2
	.4byte	0x1cd
	.4byte	.LLST28
	.byte	0x0
	.uleb128 0x22
	.4byte	0x905
	.byte	0x1
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x15a
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LLST29
	.uleb128 0x1c
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x15a
	.4byte	0x82c
	.4byte	.LLST30
	.uleb128 0x1e
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x15b
	.4byte	0x61a
	.uleb128 0x1e
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x15c
	.4byte	0x61a
	.uleb128 0x25
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x15e
	.4byte	0x284
	.byte	0x1
	.byte	0x5b
	.uleb128 0x25
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x164
	.4byte	0x1cd
	.byte	0x1
	.byte	0x56
	.uleb128 0x1e
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x18c
	.4byte	0x2ae
	.uleb128 0x26
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x18d
	.4byte	0x284
	.4byte	.LLST31
	.byte	0x0
	.uleb128 0x27
	.4byte	0x958
	.byte	0x1
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x130
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LLST32
	.uleb128 0x25
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x132
	.4byte	0x4b1
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x26
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x138
	.4byte	0x61a
	.4byte	.LLST33
	.uleb128 0x1e
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x139
	.4byte	0x61a
	.uleb128 0x28
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x142
	.4byte	0x1cd
	.4byte	.LLST34
	.byte	0x0
	.uleb128 0x29
	.4byte	.LASF120
	.byte	0x3
	.byte	0xb
	.4byte	0x51a
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF121
	.byte	0x3
	.byte	0xc
	.4byte	0x51a
	.sleb128 -2
	.uleb128 0x9
	.4byte	0x980
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF122
	.byte	0x6
	.byte	0xb
	.4byte	0x98f
	.4byte	.LASF123
	.uleb128 0x17
	.4byte	0x970
	.uleb128 0x9
	.4byte	0x9a4
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF124
	.byte	0x6
	.byte	0xc
	.4byte	0x9b3
	.4byte	.LASF125
	.uleb128 0x17
	.4byte	0x994
	.uleb128 0x9
	.4byte	0x9c8
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF126
	.byte	0x6
	.byte	0xd
	.4byte	0x9d7
	.4byte	.LASF127
	.uleb128 0x17
	.4byte	0x9b8
	.uleb128 0x9
	.4byte	0x9ec
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF128
	.byte	0x6
	.byte	0xe
	.4byte	0x9fb
	.4byte	.LASF129
	.uleb128 0x17
	.4byte	0x9dc
	.uleb128 0x2b
	.4byte	.LASF130
	.byte	0x6
	.byte	0x10
	.4byte	0x51a
	.byte	0x10
	.uleb128 0x9
	.4byte	0xa22
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x5
	.uleb128 0xe
	.4byte	0x54
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x6
	.byte	0x6d
	.4byte	0xa2d
	.uleb128 0x17
	.4byte	0xa0c
	.uleb128 0x29
	.4byte	.LASF132
	.byte	0x7
	.byte	0x7
	.4byte	0x51a
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF133
	.byte	0x7
	.byte	0x8
	.4byte	0x51a
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF134
	.byte	0x7
	.byte	0x9
	.4byte	0x51a
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF135
	.byte	0x7
	.byte	0xa
	.4byte	0x51a
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF136
	.byte	0x7
	.byte	0xb
	.4byte	0x51a
	.sleb128 -2
	.uleb128 0x2b
	.4byte	.LASF137
	.byte	0x7
	.byte	0xc
	.4byte	0x51a
	.byte	0x2
	.uleb128 0x29
	.4byte	.LASF138
	.byte	0x7
	.byte	0xd
	.4byte	0x51a
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF139
	.byte	0x7
	.byte	0xe
	.4byte	0x51a
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF140
	.byte	0x7
	.byte	0xf
	.4byte	0x51a
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF141
	.byte	0x7
	.byte	0x10
	.4byte	0x51a
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF142
	.byte	0x7
	.byte	0x11
	.4byte	0xabe
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x17
	.4byte	0x233
	.uleb128 0x9
	.4byte	0xad9
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.uleb128 0xe
	.4byte	0x54
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF143
	.byte	0x8
	.byte	0x27
	.4byte	0xae4
	.uleb128 0x17
	.4byte	0xac3
	.uleb128 0x29
	.4byte	.LASF144
	.byte	0x9
	.byte	0x5
	.4byte	0x51a
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF145
	.byte	0x9
	.byte	0x6
	.4byte	0x51a
	.sleb128 -2
	.uleb128 0x9
	.4byte	0xb11
	.4byte	0x1e4
	.uleb128 0xe
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x21
	.4byte	.LASF146
	.byte	0x2
	.byte	0x9
	.4byte	0xb22
	.byte	0x5
	.byte	0x3
	.4byte	RPS_SERVER_NAME
	.uleb128 0x17
	.4byte	0xb01
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x17
	.uleb128 0x26
	.byte	0x0
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x2
	.uleb128 0x6
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0xb
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x16b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb28
	.4byte	0x4bc
	.ascii	"RPSTestStart\000"
	.4byte	0x51f
	.ascii	"RPSServer_Initialize\000"
	.4byte	0x558
	.ascii	"RPSServer_SelectPlayers\000"
	.4byte	0x580
	.ascii	"get_who_won\000"
	.4byte	0x5be
	.ascii	"RPSServer_HandleQuit\000"
	.4byte	0x620
	.ascii	"RPSServer_ReplyResult\000"
	.4byte	0x69e
	.ascii	"RPSServer_HandlePlay\000"
	.4byte	0x6fb
	.ascii	"RPSServer_HandleSignup\000"
	.4byte	0x75b
	.ascii	"RPSServer_ProcessMessage\000"
	.4byte	0x7a2
	.ascii	"RPSServer_Start\000"
	.4byte	0x7e9
	.ascii	"RPSClient_Quit\000"
	.4byte	0x832
	.ascii	"RPSClient_Initialize\000"
	.4byte	0x85c
	.ascii	"int_to_rps_choice\000"
	.4byte	0x88a
	.ascii	"RPSClient_PlayARound\000"
	.4byte	0x905
	.ascii	"RPSClient_Start\000"
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
.LASF99:
	.ascii	"return_code\000"
.LASF109:
	.ascii	"RPSServer_Start\000"
.LASF147:
	.ascii	"GNU C 4.0.2\000"
.LASF6:
	.ascii	"current_count\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF77:
	.ascii	"player_1_tid\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF97:
	.ascii	"message\000"
.LASF103:
	.ascii	"player_2_outcome\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF100:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF114:
	.ascii	"RPSClient_Initialize\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF106:
	.ascii	"RPSServer_HandleSignup\000"
.LASF98:
	.ascii	"source_tid\000"
.LASF127:
	.ascii	"TrSTmr\000"
.LASF142:
	.ascii	"TICK_SIZE\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF111:
	.ascii	"RPSClient_Quit\000"
.LASF143:
	.ascii	"TASK_STATE_NAMES\000"
.LASF95:
	.ascii	"get_who_won\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF139:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF68:
	.ascii	"WAITING_FOR_CHOICES\000"
.LASF128:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF41:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF66:
	.ascii	"RPSServerState\000"
.LASF105:
	.ascii	"RPSServer_HandlePlay\000"
.LASF93:
	.ascii	"RPSServer_SelectPlayers\000"
.LASF94:
	.ascii	"server\000"
.LASF110:
	.ascii	"result\000"
.LASF59:
	.ascii	"RPS_OUTCOME\000"
.LASF141:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF131:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF118:
	.ascii	"reason\000"
.LASF53:
	.ascii	"RPS_CHOICE\000"
.LASF76:
	.ascii	"player_tid_queue\000"
.LASF62:
	.ascii	"message_type\000"
.LASF60:
	.ascii	"LOSE\000"
.LASF74:
	.ascii	"send_buffer\000"
.LASF134:
	.ascii	"ERR_K_DEFAULT\000"
.LASF72:
	.ascii	"RPSServer\000"
.LASF126:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF46:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF64:
	.ascii	"outcome\000"
.LASF117:
	.ascii	"counter\000"
.LASF130:
	.ascii	"LIGHTS_MASK\000"
.LASF8:
	.ascii	"items\000"
.LASF115:
	.ascii	"int_to_rps_choice\000"
.LASF3:
	.ascii	"TaskQueue\000"
.LASF71:
	.ascii	"SHUTDOWN\000"
.LASF70:
	.ascii	"SENDING_RESULTS\000"
.LASF116:
	.ascii	"RPSClient_PlayARound\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF48:
	.ascii	"MessageType\000"
.LASF58:
	.ascii	"FORFEIT\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF49:
	.ascii	"char\000"
.LASF79:
	.ascii	"player_1_choice\000"
.LASF101:
	.ascii	"RPSServer_ReplyResult\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF61:
	.ascii	"RPSMessage\000"
.LASF73:
	.ascii	"receive_buffer\000"
.LASF148:
	.ascii	"rps.c\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF138:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF63:
	.ascii	"choice\000"
.LASF42:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF65:
	.ascii	"delay_time\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF92:
	.ascii	"RPSServer_Initialize\000"
.LASF55:
	.ascii	"ROCK\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF54:
	.ascii	"NO_CHOICE\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF136:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF81:
	.ascii	"signed_in_players\000"
.LASF7:
	.ascii	"size\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF4:
	.ascii	"item\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF124:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF119:
	.ascii	"RPSClient_Start\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF2:
	.ascii	"QueueItem\000"
.LASF67:
	.ascii	"WAITING_FOR_PLAYERS\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF144:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF44:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF89:
	.ascii	"__func__\000"
.LASF149:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF52:
	.ascii	"short int\000"
.LASF69:
	.ascii	"GOT_CHOICES\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF91:
	.ascii	"RPSTestStart\000"
.LASF107:
	.ascii	"RPSServer_ProcessMessage\000"
.LASF43:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF78:
	.ascii	"player_2_tid\000"
.LASF75:
	.ascii	"reply_buffer\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF47:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF125:
	.ascii	"TCmSvr\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF121:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF82:
	.ascii	"running\000"
.LASF88:
	.ascii	"num_rounds_to_play\000"
.LASF113:
	.ascii	"send_message\000"
.LASF146:
	.ascii	"RPS_SERVER_NAME\000"
.LASF5:
	.ascii	"start\000"
.LASF84:
	.ascii	"num_signed_in\000"
.LASF112:
	.ascii	"client\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF45:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF80:
	.ascii	"player_2_choice\000"
.LASF145:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF104:
	.ascii	"winner\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF133:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF86:
	.ascii	"RPSClient\000"
.LASF51:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF132:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF90:
	.ascii	"num_clients\000"
.LASF120:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF135:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF85:
	.ascii	"state\000"
.LASF83:
	.ascii	"games_played\000"
.LASF123:
	.ascii	"TrnSvr\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF96:
	.ascii	"RPSServer_HandleQuit\000"
.LASF129:
	.ascii	"TrSwMr\000"
.LASF102:
	.ascii	"player_1_outcome\000"
.LASF87:
	.ascii	"server_id\000"
.LASF56:
	.ascii	"PAPER\000"
.LASF137:
	.ascii	"NAMESERVER_TID\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF122:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF50:
	.ascii	"double\000"
.LASF140:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF108:
	.ascii	"receive_message\000"
.LASF57:
	.ascii	"SCISSORS\000"
	.ident	"GCC: (GNU) 4.0.2"
