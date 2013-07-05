	.file	"train.c"
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
	.type	TRAIN_SERVER_NAME, %object
	.size	TRAIN_SERVER_NAME, 7
TRAIN_SERVER_NAME:
	.ascii	"TrnSvr\000"
	.align	2
	.type	TRAIN_SWITCH_MASTER_NAME, %object
	.size	TRAIN_SWITCH_MASTER_NAME, 7
TRAIN_SWITCH_MASTER_NAME:
	.ascii	"TrSwMr\000"
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
	.text
	.align	2
	.global	TrainServer_HandleSwitchData
	.type	TrainServer_HandleSwitchData, %function
TrainServer_HandleSwitchData:
.LFB6:
	.file 1 "train.c"
	.loc 1 212 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 216 0
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	.loc 1 214 0
	add	ip, r0, #16
	.loc 1 216 0
	cmp	r3, #34
	.loc 1 217 0
	ldreqb	r1, [r0, #9]	@ zero_extendqisi2
	.loc 1 219 0
	ldrneb	r3, [r0, #9]	@ zero_extendqisi2
	.loc 1 217 0
	ldreq	r3, .L6
	.loc 1 219 0
	ldrne	r2, .L6
	.loc 1 217 0
	addeq	r1, r0, r1, asl #2
	.loc 1 219 0
	addne	r3, r0, r3, asl #2
	.loc 1 217 0
	moveq	r2, #67
	.loc 1 219 0
	movne	r1, #83
	.loc 1 223 0
	ldr	r0, [r0, #420]
.LVL1:
	.loc 1 217 0
	streq	r2, [r1, r3]
	.loc 1 219 0
	strne	r1, [r3, r2]
	.loc 1 222 0
	mov	r3, #10
	.loc 1 223 0
	mov	r1, ip
	mov	r2, #16
	.loc 1 212 0
	@ lr needed for prologue
	.loc 1 222 0
	str	r3, [ip, #0]
	.loc 1 224 0
	.loc 1 223 0
	b	Reply(PLT)
.L7:
	.align	2
.L6:
	.word	14276
.LFE6:
	.size	TrainServer_HandleSwitchData, .-TrainServer_HandleSwitchData
	.align	2
	.global	TrainServer_HandleSensorQuery
	.type	TrainServer_HandleSensorQuery, %function
TrainServer_HandleSensorQuery:
.LFB5:
	.loc 1 198 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 202 0
	ldr	ip, [r0, #4]
.LVL3:
	.loc 1 200 0
	add	r1, r0, #16
.LVL4:
	.loc 1 204 0
	add	ip, r0, ip, asl #2
.LVL5:
	ldr	r3, [ip, #80]
	.loc 1 205 0
	mov	r2, #0
	.loc 1 204 0
	str	r3, [r1, #8]
	.loc 1 207 0
	mov	r3, #10
	str	r3, [r0, #16]
	.loc 1 209 0
	ldr	r0, [r0, #420]
.LVL6:
	.loc 1 205 0
	str	r2, [ip, #80]
	.loc 1 209 0
	add	r2, r2, #16
	.loc 1 198 0
	@ lr needed for prologue
	.loc 1 210 0
	.loc 1 209 0
	b	Reply(PLT)
.LVL7:
.LFE5:
	.size	TrainServer_HandleSensorQuery, .-TrainServer_HandleSensorQuery
	.align	2
	.global	TrainServer_HandleSwitchQuery
	.type	TrainServer_HandleSwitchQuery, %function
TrainServer_HandleSwitchQuery:
.LFB7:
	.loc 1 226 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 230 0
	ldr	r3, [r0, #4]
	ldr	r2, .L12
	add	r3, r0, r3, asl #2
	ldr	ip, [r3, r2]
	.loc 1 228 0
	add	r1, r0, #16
.LVL9:
	.loc 1 230 0
	str	ip, [r1, #4]
	.loc 1 232 0
	mov	r3, #10
	str	r3, [r0, #16]
	.loc 1 233 0
	ldr	r0, [r0, #420]
.LVL10:
	mov	r2, #16
	.loc 1 226 0
	@ lr needed for prologue
	.loc 1 234 0
	.loc 1 233 0
	b	Reply(PLT)
.LVL11:
.L13:
	.align	2
.L12:
	.word	14276
.LFE7:
	.size	TrainServer_HandleSwitchQuery, .-TrainServer_HandleSwitchQuery
	.align	2
	.global	TrainServer_HandleSelectTrack
	.type	TrainServer_HandleSelectTrack, %function
TrainServer_HandleSelectTrack:
.LFB8:
	.loc 1 236 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	.loc 1 240 0
	ldr	r3, [r0, #4]
	.loc 1 241 0
	add	ip, r0, #448
	.loc 1 240 0
	cmp	r3, #65
	.loc 1 243 0
	add	r2, r0, #7360
	.loc 1 241 0
	moveq	r3, #14272
	.loc 1 243 0
	movne	r3, #14272
	strne	r2, [r0, r3]
	.loc 1 238 0
	add	r1, r0, #16
	.loc 1 241 0
	streq	ip, [r0, r3]
	.loc 1 247 0
	ldr	r0, [r0, #420]
.LVL13:
	.loc 1 246 0
	mov	r3, #10
	.loc 1 247 0
	mov	r2, #16
	.loc 1 236 0
	@ lr needed for prologue
	.loc 1 246 0
	str	r3, [r1, #0]
	.loc 1 248 0
	.loc 1 247 0
	b	Reply(PLT)
.LFE8:
	.size	TrainServer_HandleSelectTrack, .-TrainServer_HandleSelectTrack
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"TrainEngineStatusMessage too big\000"
	.text
	.align	2
	.global	TrainServer_HandleQueryTrainEngine
	.type	TrainServer_HandleQueryTrainEngine, %function
TrainServer_HandleQueryTrainEngine:
.LFB11:
	.loc 1 274 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, sl, lr}
.LCFI0:
	ldr	sl, .L22
	.loc 1 277 0
	ldr	r1, .L22+4
	.loc 1 274 0
.L21:
	add	sl, pc, sl
	mov	r4, r0
	.loc 1 277 0
	add	r1, sl, r1
	mov	r0, #1
.LVL15:
	bl	assert(PLT)
	.loc 1 290 0
	add	r2, r4, #16320
	add	r2, r2, #4
	.loc 1 275 0
	add	r1, r4, #16
.LVL16:
	.loc 1 292 0
	ldr	r0, [r4, #420]
	.loc 1 279 0
	mov	r3, #10
	.loc 1 290 0
	str	r2, [r1, #4]
	.loc 1 292 0
	mov	r2, #16
	.loc 1 279 0
	str	r3, [r4, #16]
	.loc 1 293 0
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 292 0
	b	Reply(PLT)
.LVL17:
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	.LC0(GOTOFF)
.LFE11:
	.size	TrainServer_HandleQueryTrainEngine, .-TrainServer_HandleQueryTrainEngine
	.align	2
	.global	TrainServer_HandleTrainEngineClientCommandRequest
	.type	TrainServer_HandleTrainEngineClientCommandRequest, %function
TrainServer_HandleTrainEngineClientCommandRequest:
.LFB12:
	.loc 1 295 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	.loc 1 299 0
	mov	r3, #10
	.loc 1 296 0
	add	r1, r0, #16
.LVL19:
	.loc 1 299 0
	str	r3, [r0, #16]
	.loc 1 300 0
	mov	r2, #0
	.loc 1 302 0
	ldr	r0, [r0, #420]
.LVL20:
	.loc 1 300 0
	str	r2, [r1, #4]
	.loc 1 302 0
	add	r2, r2, #16
	.loc 1 295 0
	@ lr needed for prologue
	.loc 1 303 0
	.loc 1 302 0
	b	Reply(PLT)
.LVL21:
.LFE12:
	.size	TrainServer_HandleTrainEngineClientCommandRequest, .-TrainServer_HandleTrainEngineClientCommandRequest
	.align	2
	.global	TrainServer_HandleGetSwitchRequest
	.type	TrainServer_HandleGetSwitchRequest, %function
TrainServer_HandleGetSwitchRequest:
.LFB13:
	.loc 1 305 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL22:
	stmfd	sp!, {r4, lr}
.LCFI1:
	.loc 1 308 0
	add	r1, r0, #14272
	mov	r3, #11
	ldr	r4, .L37
	.loc 1 305 0
	mov	lr, r0
	.loc 1 308 0
	str	r3, [r0, #16]
	.loc 1 306 0
	add	ip, r0, #16
	.loc 1 308 0
	add	r1, r1, #4
	mov	r0, #0
.LVL23:
	b	.L27
.L28:
	.loc 1 311 0
	add	r0, r0, #1
	cmp	r0, #256
	beq	.L33
.L27:
	.loc 1 312 0
	ldr	r2, [r1, #0]
	ldr	r3, [r1, #1024]
	.loc 1 311 0
	add	r1, r1, #4
	.loc 1 312 0
	cmp	r2, r3
	beq	.L28
.LBB2:
	.loc 1 316 0
	add	r1, lr, r0, asl #2
	ldr	r3, [r1, r4]
	.loc 1 323 0
	strb	r0, [ip, #9]
	.loc 1 316 0
	cmp	r3, #67
	movne	r3, #33
	moveq	r3, #34
	.loc 1 322 0
	strb	r3, [ip, #8]
	.loc 1 324 0
	ldr	r0, [r1, r4]
.LVL24:
	ldr	r2, .L37+4
	.loc 1 313 0
	mov	r3, #10
	str	r3, [ip, #0]
	.loc 1 324 0
	str	r0, [r1, r2]
.LVL25:
.L33:
.LBE2:
	.loc 1 329 0
	ldr	r0, [lr, #420]
.LVL26:
	mov	r1, ip
	mov	r2, #16
.LVL27:
	.loc 1 330 0
	ldmfd	sp!, {r4, lr}
	.loc 1 329 0
	b	Reply(PLT)
.L38:
	.align	2
.L37:
	.word	15300
	.word	14276
.LFE13:
	.size	TrainServer_HandleGetSwitchRequest, .-TrainServer_HandleGetSwitchRequest
	.align	2
	.global	TrainServer_HandleSetSwitch
	.type	TrainServer_HandleSetSwitch, %function
TrainServer_HandleSetSwitch:
.LFB14:
	.loc 1 332 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL28:
	.loc 1 341 0
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	.loc 1 336 0
	mov	r2, #10
	.loc 1 341 0
	cmp	r3, #34
	.loc 1 339 0
	ldrb	r3, [r0, #9]	@ zero_extendqisi2
.LVL29:
	.loc 1 336 0
	str	r2, [r0, #16]
	.loc 1 342 0
	addeq	r1, r0, r3, asl #2
	.loc 1 344 0
	addne	r1, r0, r3, asl #2
	.loc 1 342 0
	ldreq	r3, .L44
.LVL30:
	.loc 1 344 0
	ldrne	r3, .L44
	.loc 1 342 0
	addeq	r2, r2, #57
	.loc 1 344 0
	movne	r2, #83
	.loc 1 342 0
	streq	r2, [r1, r3]
	.loc 1 344 0
	strne	r2, [r1, r3]
	.loc 1 347 0
	add	r1, r0, #16
	ldr	r0, [r0, #420]
.LVL31:
	mov	r2, #16
	.loc 1 332 0
	@ lr needed for prologue
	.loc 1 348 0
	.loc 1 347 0
	b	Reply(PLT)
.L45:
	.align	2
.L44:
	.word	15300
.LFE14:
	.size	TrainServer_HandleSetSwitch, .-TrainServer_HandleSetSwitch
	.align	2
	.global	TrainEngine_Initialize
	.type	TrainEngine_Initialize, %function
TrainEngine_Initialize:
.LFB28:
	.loc 1 719 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL32:
	str	r4, [sp, #-4]!
.LCFI2:
	.loc 1 721 0
	mov	r2, #0
	.loc 1 725 0
	mov	r3, #0
	mov	r4, #0
	.loc 1 719 0
	@ lr needed for prologue
	.loc 1 728 0
	str	r3, [r0, #48]
	str	r4, [r0, #52]
	.loc 1 725 0
	str	r3, [r0, #24]
	str	r4, [r0, #28]
	.loc 1 726 0
	str	r3, [r0, #32]
	str	r4, [r0, #36]
	.loc 1 727 0
	str	r3, [r0, #40]
	str	r4, [r0, #44]
	.loc 1 730 0
	str	r2, [r0, #1264]
	.loc 1 720 0
	stmib	r0, {r1, r2}	@ phole stm
	.loc 1 722 0
	str	r2, [r0, #12]
	.loc 1 723 0
	str	r2, [r0, #16]
	.loc 1 724 0
	str	r2, [r0, #20]
	.loc 1 729 0
	str	r2, [r0, #60]
	.loc 1 731 0
	ldmfd	sp!, {r4}
	bx	lr
.LFE28:
	.size	TrainEngine_Initialize, .-TrainEngine_Initialize
	.align	2
	.global	TrainServer_HandleSetTrain
	.type	TrainServer_HandleSetTrain, %function
TrainServer_HandleSetTrain:
.LFB9:
	.loc 1 250 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r4, lr}
.LCFI3:
	.loc 1 250 0
	mov	r4, r0
	.loc 1 254 0
	add	r0, r0, #16320
.LVL34:
	add	r0, r0, #4
	ldr	r1, [r4, #4]
	bl	TrainEngine_Initialize(PLT)
	.loc 1 256 0
	mov	r3, #10
	str	r3, [r4, #16]
	.loc 1 257 0
	mov	r2, #16
	ldr	r0, [r4, #420]
	add	r1, r4, #16
	bl	Reply(PLT)
	.loc 1 259 0
	ldr	r3, .L50
	mov	r2, #0
	str	r2, [r4, r3]
	.loc 1 260 0
	ldmfd	sp!, {r4, pc}
.L51:
	.align	2
.L50:
	.word	16332
.LFE9:
	.size	TrainServer_HandleSetTrain, .-TrainServer_HandleSetTrain
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"TrainServer_Start failed to register name\000"
	.align	2
.LC2:
	.ascii	"TrainServer failed to create TrainSensorReader\000"
	.align	2
.LC3:
	.ascii	"TrainServer failed to create TrainCommandServer\000"
	.align	2
.LC4:
	.ascii	"TrainServer failed to create TrainServerTimer\000"
	.align	2
.LC5:
	.ascii	"TrainServer failed to create TrainEngineClient_Star"
	.ascii	"t\000"
	.align	2
.LC6:
	.ascii	"TrainServer failed to create TrainSwitchMaster\000"
	.text
	.align	2
	.global	TrainServer_Initialize
	.type	TrainServer_Initialize, %function
TrainServer_Initialize:
.LFB3:
	.loc 1 110 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL35:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI4:
	ldr	sl, .L67
	.loc 1 111 0
	ldr	r3, .L67+4
	.loc 1 110 0
.L66:
	add	sl, pc, sl
	mov	r6, r0
	.loc 1 111 0
	ldr	r0, [sl, r3]
.LVL36:
	bl	RegisterAs(PLT)
	.loc 1 112 0
	ldr	r1, .L67+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 118 0
	ldr	r2, .L67+12
	.loc 1 116 0
	add	r3, r6, #16
	.loc 1 114 0
	mov	r4, #0
	.loc 1 118 0
	ldr	r1, [sl, r2]
	.loc 1 116 0
	str	r3, [r6, #36]
	.loc 1 114 0
	str	r4, [r6, #40]
	.loc 1 115 0
	str	r6, [r6, #32]
	.loc 1 118 0
	mov	r0, #6
	bl	Create(PLT)
	.loc 1 119 0
	ldr	r1, .L67+16
	.loc 1 118 0
	str	r0, [r6, #432]
	.loc 1 119 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 121 0
	ldr	r3, .L67+20
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 122 0
	ldr	r1, .L67+24
	.loc 1 121 0
	str	r0, [r6, #428]
	.loc 1 122 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 124 0
	ldr	r3, .L67+28
	mov	r0, #8
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 125 0
	ldr	r1, .L67+32
	.loc 1 124 0
	str	r0, [r6, #440]
	.loc 1 125 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 127 0
	ldr	r3, .L67+36
	mov	r0, #8
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L67+40
	.loc 1 128 0
	ldr	r1, .L67+44
	.loc 1 127 0
	str	r0, [r6, r3]
	.loc 1 128 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 130 0
	ldr	r3, .L67+48
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 131 0
	ldr	r1, .L67+52
	.loc 1 130 0
	str	r0, [r6, #444]
	.loc 1 131 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 133 0
	mov	r3, #4
	.loc 1 135 0
	add	r0, r6, #44
	mov	r1, #101
	.loc 1 133 0
	str	r3, [r6, #424]
	.loc 1 135 0
	bl	RNG_Initialize(PLT)
.LVL37:
	mov	r5, r4
	mov	r1, r6
	mov	ip, r4
	mov	r0, #100
.LVL38:
.L53:
.LBB3:
	.loc 1 140 0
	str	ip, [r1, #60]
	.loc 1 141 0
	str	ip, [r1, #80]
	add	r2, r6, r0
	mov	r3, ip
.LVL39:
.L54:
	.loc 1 144 0
	add	r3, r3, #1
	cmp	r3, #16
	.loc 1 145 0
	str	r5, [r2], #4
	.loc 1 144 0
	bne	.L54
.LVL40:
.LBE3:
	.loc 1 139 0
	add	r4, r4, #1
	cmp	r4, #5
	add	r0, r0, #64
	add	r1, r1, #4
	bne	.L53
.LVL41:
	.loc 1 149 0
	add	r4, r6, #448
.LVL42:
	mov	r0, r4
	bl	init_tracka(PLT)
.LVL43:
	.loc 1 150 0
	add	r0, r6, #7360
	bl	init_trackb(PLT)
	.loc 1 151 0
	add	r2, r6, #14272
	mov	r3, #14272
	mov	r0, r5
.LVL44:
	str	r4, [r6, r3]
	add	r2, r2, #4
.LVL45:
	mov	r1, r5
.LVL46:
.L57:
	.loc 1 154 0
	add	r0, r0, #1
	cmp	r0, #256
	.loc 1 155 0
	str	r1, [r2, #0]
	.loc 1 156 0
	str	r1, [r2, #1024]
	.loc 1 154 0
	add	r2, r2, #4
	bne	.L57
	.loc 1 160 0
	add	r0, r6, #16320
	add	r0, r0, #4
	.loc 1 161 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 160 0
	b	TrainEngine_Initialize(PLT)
.LVL47:
.L68:
	.align	2
.L67:
	.word	_GLOBAL_OFFSET_TABLE_-(.L66+8)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC1(GOTOFF)
	.word	TrainSensorReader_Start(GOT)
	.word	.LC2(GOTOFF)
	.word	TrainCommandServer_Start(GOT)
	.word	.LC3(GOTOFF)
	.word	TrainServerTimer_Start(GOT)
	.word	.LC4(GOTOFF)
	.word	TrainEngineClient_Start(GOT)
	.word	16324
	.word	.LC5(GOTOFF)
	.word	TrainSwitchMaster_Start(GOT)
	.word	.LC6(GOTOFF)
.LFE3:
	.size	TrainServer_Initialize, .-TrainServer_Initialize
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"%c%d.\000"
	.text
	.align	2
	.global	TrainServer_HandleSensorReaderData
	.type	TrainServer_HandleSensorReaderData, %function
TrainServer_HandleSensorReaderData:
.LFB4:
	.loc 1 163 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL48:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI5:
	.loc 1 166 0
	ldr	r3, [r0, #40]
	.loc 1 163 0
	ldr	sl, .L86
	.loc 1 166 0
	cmp	r3, #1
	.loc 1 167 0
	ldreq	r2, [r0, #36]
	addeq	r3, r3, #11
	.loc 1 170 0
	add	r9, r0, #16
	.loc 1 163 0
	mov	r5, r0
	.loc 1 167 0
	streq	r3, [r2, #0]
	.loc 1 163 0
.L84:
	add	sl, pc, sl
	.loc 1 170 0
	mov	r1, r9
	mov	r2, #16
	ldr	r0, [r0, #420]
.LVL49:
	bl	Reply(PLT)
	.loc 1 172 0
	ldr	r3, [r5, #40]
	.loc 1 176 0
	ldr	r7, [r5, #4]
.LVL50:
	.loc 1 172 0
	cmp	r3, #1
	.loc 1 173 0
	ldreq	r3, [r5, #424]
	.loc 1 179 0
	add	r2, r5, r7, asl #2
	.loc 1 173 0
	subeq	r3, r3, #1
	.loc 1 177 0
	ldr	r6, [r5, #8]
.LVL51:
	.loc 1 173 0
	streq	r3, [r5, #424]
	.loc 1 181 0
	ldr	r3, [r2, #80]
	.loc 1 179 0
	str	r6, [r2, #60]
	.loc 1 181 0
	orr	r3, r6, r3
	str	r3, [r2, #80]
	.loc 1 184 0
	bl	Time(PLT)
	mov	r4, #0
.LVL52:
	mov	r8, r0
.LVL53:
	b	.L74
.L77:
	.loc 1 185 0
	cmp	r4, #15
	bgt	.L85
.L74:
	.loc 1 186 0
	mov	r3, r6, asr r4
	.loc 1 187 0
	add	r2, r4, r7, asl #4
	.loc 1 186 0
	tst	r3, #1
	.loc 1 187 0
	add	ip, r5, r2, asl #2
	.loc 1 186 0
	addeq	r4, r4, #1
	beq	.L77
	.loc 1 189 0
	ldr	r3, [r5, #40]
	.loc 1 187 0
	str	r8, [ip, #100]
	.loc 1 189 0
	cmp	r3, #2
	movne	ip, #0
	moveq	ip, #1
	cmp	r6, #0
	.loc 1 191 0
	ldr	r1, .L86+4
	.loc 1 189 0
	moveq	ip, #0
	.loc 1 191 0
	mov	r0, #1
	.loc 1 189 0
	cmp	ip, #0
	.loc 1 191 0
	add	r1, sl, r1
	add	r2, r7, #65
	.loc 1 189 0
	addeq	r4, r4, r0
	beq	.L77
	.loc 1 191 0
	add	r4, r4, #1
	.loc 1 190 0
	mov	r3, #0
	str	r3, [r5, #40]
	.loc 1 191 0
	mov	r3, r4
	bl	PutString(PLT)
	.loc 1 192 0
	ldr	r0, [r5, #436]
	mov	r1, r9
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 185 0
	cmp	r4, #15
	ble	.L74
.L85:
	.loc 1 196 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L84+8)
	.word	.LC7(GOTOFF)
.LFE4:
	.size	TrainServer_HandleSensorReaderData, .-TrainServer_HandleSensorReaderData
	.align	2
	.global	TrainServer_HandleSetDestination
	.type	TrainServer_HandleSetDestination, %function
TrainServer_HandleSetDestination:
.LFB10:
	.loc 1 262 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL54:
	stmfd	sp!, {r4, lr}
.LCFI6:
	.loc 1 266 0
	mov	r3, #14272
	.loc 1 262 0
	mov	r4, r0
	.loc 1 266 0
	ldr	r1, [r4, #12]
	ldr	r0, [r0, r3]
.LVL55:
	bl	NodeNameToTrackNode(PLT)
	mov	r3, #16384
	.loc 1 268 0
	mov	r2, #10
	.loc 1 266 0
	str	r0, [r4, r3]
	.loc 1 268 0
	str	r2, [r4, #16]
	.loc 1 269 0
	ldr	r0, [r4, #420]
	add	r2, r2, #6
	add	r1, r4, #16
	bl	Reply(PLT)
	.loc 1 271 0
	ldr	r3, .L90
	mov	r2, #1
	str	r2, [r4, r3]
	.loc 1 272 0
	ldmfd	sp!, {r4, pc}
.L91:
	.align	2
.L90:
	.word	16332
.LFE10:
	.size	TrainServer_HandleSetDestination, .-TrainServer_HandleSetDestination
	.global	__floatsidf
	.global	__muldf3
	.global	__divdf3
	.global	__ltdf2
	.align	2
	.global	TrainServer_ProcessEngineCalibratingSpeed
	.type	TrainServer_ProcessEngineCalibratingSpeed, %function
TrainServer_ProcessEngineCalibratingSpeed:
.LFB24:
	.loc 1 496 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL56:
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
.LCFI7:
	.loc 1 502 0
	ldr	r2, [r0, #332]
.LVL57:
	.loc 1 501 0
	ldr	ip, [r0, #288]
.LVL58:
	.loc 1 496 0
	mov	r3, r0
	.loc 1 506 0
	cmp	ip, #0
	cmpne	r2, #0
	.loc 1 507 0
	rsb	r0, r2, ip
.LVL59:
	.loc 1 496 0
	sub	sp, sp, #4
.LCFI8:
.LVL60:
	.loc 1 504 0
	ldr	r2, [r3, #336]
.LVL61:
	.loc 1 496 0
	mov	r8, r1
	.loc 1 503 0
	ldr	r3, [r3, #284]
.LVL62:
	.loc 1 506 0
	bne	.L102
.LVL63:
	.loc 1 508 0
	cmp	r3, #0
	cmpne	r2, #0
	.loc 1 509 0
	rsb	r0, r2, r3
	.loc 1 508 0
	beq	.L101
.L102:
	.loc 1 509 0
	bl	__floatsidf(PLT)
.LVL64:
	adr	r2, .L103
	ldmia	r2, {r2-r3}
	bl	__muldf3(PLT)
	adr	r2, .L103+8
	ldmia	r2, {r2-r3}
	bl	__divdf3(PLT)
	.loc 1 514 0
	mov	r3, #0
	mov	r2, #0
	.loc 1 509 0
	mov	r6, r1
.LVL65:
	mov	r5, r0
.LVL66:
	.loc 1 514 0
	bl	__ltdf2(PLT)
	.loc 1 519 0
	mov	r7, #0
	.loc 1 514 0
	cmp	r0, r7
	.loc 1 515 0
	addlt	r3, r5, #-2147483648
	movlt	r4, r6
	movlt	r5, r3
	movlt	r6, r4
	.loc 1 518 0
	mov	r2, r5
	mov	r3, r6
	adr	r0, .L103+16
	ldmia	r0, {r0-r1}
	bl	__divdf3(PLT)
	.loc 1 519 0
	ldrb	r2, [r8, #4]	@ zero_extendqisi2
	.loc 1 518 0
	str	r0, [r8, #24]
	str	r1, [r8, #28]
	.loc 1 519 0
	mov	r3, r7
	mov	r1, r7
	mov	r0, #2
	str	r7, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 520 0
	ldrb	r2, [r8, #4]	@ zero_extendqisi2
	mov	r3, r7
	mov	r0, #2
	mov	r1, #5
	str	r7, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 521 0
	mov	r3, #1
	str	r3, [r8, #8]
.LVL67:
.L101:
	.loc 1 522 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L104:
	.align	2
.L103:
	.word	1072064102
	.word	1717986918
	.word	1083129856
	.word	0
	.word	1078362112
	.word	0
.LFE24:
	.size	TrainServer_ProcessEngineCalibratingSpeed, .-TrainServer_ProcessEngineCalibratingSpeed
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"Engine %d is starting.\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngineIdle
	.type	TrainServer_ProcessEngineIdle, %function
TrainServer_ProcessEngineIdle:
.LFB16:
	.loc 1 380 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL68:
	stmfd	sp!, {r4, sl, lr}
.LCFI9:
	ldr	sl, .L108
	.loc 1 381 0
	ldr	r0, .L108+4
.LVL69:
	.loc 1 380 0
.L107:
	add	sl, pc, sl
	sub	sp, sp, #4
.LCFI10:
.LVL70:
	mov	r4, r1
	.loc 1 381 0
	add	r0, sl, r0
	ldr	r1, [r1, #4]
.LVL71:
	bl	PrintMessage(PLT)
	.loc 1 382 0
	mov	ip, #0
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	mov	r3, ip
	mov	r0, #2
	mov	r1, #4
	str	ip, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 383 0
	mov	r3, #1
	str	r3, [r4, #8]
	.loc 1 384 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, sl, pc}
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	.LC8(GOTOFF)
.LFE16:
	.size	TrainServer_ProcessEngineIdle, .-TrainServer_ProcessEngineIdle
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"Found starting position.\000"
	.align	2
.LC10:
	.ascii	"Travelling from %s to %s.\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngineFoundStartingPosition
	.type	TrainServer_ProcessEngineFoundStartingPosition, %function
TrainServer_ProcessEngineFoundStartingPosition:
.LFB18:
	.loc 1 397 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL72:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI11:
	ldr	sl, .L117
	mov	r6, r0
	.loc 1 398 0
	ldr	r0, .L117+4
.LVL73:
	.loc 1 397 0
.L116:
	add	sl, pc, sl
	sub	sp, sp, #8
.LCFI12:
.LVL74:
	.loc 1 398 0
	add	r0, sl, r0
	.loc 1 397 0
	mov	r5, r1
	.loc 1 398 0
	bl	PrintMessage(PLT)
.LVL75:
	.loc 1 399 0
	mov	r3, #14272
	ldr	r1, [r6, r3]
	ldr	r2, [r5, #12]
	add	r0, r6, #44
	bl	GetRandomSensorReachableViaDirectedGraph(PLT)
	.loc 1 401 0
	ldr	r2, [r5, #12]
	.loc 1 399 0
	mov	r3, r0
	str	r0, [r5, #60]
	.loc 1 401 0
	ldr	r0, .L117+8
	ldr	r1, [r2, #0]
	add	r0, sl, r0
	ldr	r2, [r3, #0]
	bl	PrintMessage(PLT)
	mov	r4, #0
	add	r3, r6, #14272
	add	r3, r3, #4
	mov	r2, r4
.LVL76:
.L111:
	.loc 1 404 0
	add	r2, r2, #1
	cmp	r2, #256
	.loc 1 405 0
	str	r4, [r3, #0]
	.loc 1 406 0
	str	r4, [r3, #1024]
	.loc 1 404 0
	add	r3, r3, #4
	bne	.L111
	.loc 1 409 0
	mov	r3, #14272
	ldr	r1, [r6, r3]
	ldr	r2, [r5, #12]
.LVL77:
	ldr	r3, [r5, #60]
	add	r0, r5, #64
	str	r4, [sp, #0]
	str	r4, [sp, #4]
	bl	PopulateRouteNodeInfo(PLT)
	.loc 1 411 0
	mov	r3, #3
	str	r3, [r5, #8]
	.loc 1 412 0
	ldrb	r2, [r5, #4]	@ zero_extendqisi2
	mov	r3, r4
	mov	r1, #24
	mov	r0, #2
	str	r4, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 413 0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L118:
	.align	2
.L117:
	.word	_GLOBAL_OFFSET_TABLE_-(.L116+8)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
.LFE18:
	.size	TrainServer_ProcessEngineFoundStartingPosition, .-TrainServer_ProcessEngineFoundStartingPosition
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Queuing switch %d to be %c\000"
	.text
	.align	2
	.global	TrainServer_QueueSwitchStates
	.type	TrainServer_QueueSwitchStates, %function
TrainServer_QueueSwitchStates:
.LFB20:
	.loc 1 424 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL78:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI13:
	.loc 1 426 0
	ldr	r3, [r1, #1264]
.LVL79:
	.loc 1 427 0
	ldr	ip, [r1, #60]
	add	r3, r3, r3, asl #1
.LVL80:
	mov	r3, r3, asl #2
	add	r2, r3, r1
	.loc 1 424 0
	mov	r5, r1
	.loc 1 427 0
	ldr	r1, [r2, #64]
.LVL81:
	.loc 1 424 0
	ldr	sl, .L132
	.loc 1 427 0
	cmp	ip, r1
	.loc 1 424 0
.L130:
	add	sl, pc, sl
	mov	r7, r0
	.loc 1 427 0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.LVL82:
	add	r2, r3, #76
	ldr	r8, .L132+4
	add	r3, r3, #64
	rsb	r6, r3, r2
	add	r4, r5, r3
	b	.L122
.LVL83:
.L123:
	ldr	r1, [r4, r6]
	add	r4, r4, #12
	cmp	r1, ip
	beq	.L131
.LVL84:
.L122:
	.loc 1 428 0
	ldr	r3, [r1, #4]
.LBB4:
	.loc 1 436 0
	ldr	r0, .L132+8
.LBE4:
	.loc 1 428 0
	cmp	r3, #2
.LBB5:
	.loc 1 436 0
	add	r0, sl, r0
.LBE5:
	.loc 1 428 0
	bne	.L123
.LBB6:
	.loc 1 429 0
	ldr	r1, [r1, #8]
.LVL85:
	.loc 1 430 0
	ldr	r3, [r4, #8]
.LVL86:
	.loc 1 431 0
	add	lr, r7, r1, asl #2
	ldr	ip, [lr, r8]
	.loc 1 436 0
	mov	r2, r3
	.loc 1 431 0
	cmp	ip, #0
	beq	.L127
.LVL87:
	cmp	ip, r3
	ldmnefd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L127:
	.loc 1 435 0
	str	r3, [lr, r8]
	.loc 1 436 0
	bl	PrintMessage(PLT)
.LVL88:
.LBE6:
	.loc 1 427 0
	ldr	r1, [r4, r6]
	ldr	ip, [r5, #60]
	add	r4, r4, #12
	cmp	r1, ip
	bne	.L122
.L131:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L133:
	.align	2
.L132:
	.word	_GLOBAL_OFFSET_TABLE_-(.L130+8)
	.word	15300
	.word	.LC11(GOTOFF)
.LFE20:
	.size	TrainServer_QueueSwitchStates, .-TrainServer_QueueSwitchStates
	.global	__extendsfdf2
	.global	__subdf3
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"At destination %s.\000"
	.global	__adddf3
	.text
	.align	2
	.global	TrainServer_ProcessSensorData
	.type	TrainServer_ProcessSensorData, %function
TrainServer_ProcessSensorData:
.LFB21:
	.loc 1 443 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL89:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI14:
	ldr	sl, .L149
	sub	sp, sp, #4
.LCFI15:
.LVL90:
.L147:
	add	sl, pc, sl
	mov	r6, r1
	mov	r9, r0
	.loc 1 444 0
	bl	TimeSeconds(PLT)
.LVL91:
	.loc 1 444 0
	bl	__extendsfdf2(PLT)
	mov	r7, r0
.LVL92:
	.loc 1 446 0
	ldr	r0, [r6, #56]
	.loc 1 444 0
	mov	r8, r1
.LVL93:
	.loc 1 446 0
	bl	__floatsidf(PLT)
	add	r2, r6, #48
	ldmia	r2, {r2-r3}
	mov	r4, r0
	mov	r5, r1
	mov	r0, r7
	mov	r1, r8
	bl	__subdf3(PLT)
	mov	r3, r1
	mov	r2, r0
	mov	r1, r5
	mov	r0, r4
	bl	__divdf3(PLT)
	.loc 1 451 0
	ldr	r3, [r6, #60]
	ldr	ip, [r6, #12]
	.loc 1 449 0
	mov	lr, #0
	.loc 1 451 0
	cmp	ip, r3
	.loc 1 446 0
	str	r0, [r6, #24]
	str	r1, [r6, #28]
	.loc 1 448 0
	add	r3, r6, #32
	ldmia	r3, {r3-r4}
	.loc 1 447 0
	str	r7, [r6, #48]
	str	r8, [r6, #52]
	.loc 1 448 0
	str	r3, [r6, #40]
	str	r4, [r6, #44]
	.loc 1 449 0
	str	lr, [r6, #16]
	.loc 1 451 0
	beq	.L148
	.loc 1 459 0
	ldr	r1, [r6, #1264]
	cmp	r1, #99
	bgt	.L138
	.loc 1 460 0
	mov	lr, r1, asl #1
	add	r3, lr, r1
	mov	r0, r3, asl #2
	add	r2, r0, r6
	ldr	r3, [r2, #64]
	cmp	ip, r3
	addne	r3, r0, #64
	moveq	r0, r1
.LVL94:
	addne	r2, r6, r3
	movne	r0, r1
	beq	.L141
.L140:
	.loc 1 459 0
	add	r0, r0, #1
	cmp	r0, #100
	beq	.L138
	.loc 1 460 0
	ldr	r3, [r2, #12]
	add	r2, r2, #12
	cmp	ip, r3
	bne	.L140
.L141:
	mov	r1, r0
	.loc 1 461 0
	str	r0, [r6, #1264]
.L138:
	.loc 1 466 0
	add	r0, r6, #64
.LVL95:
	bl	DistanceToNextSensor(PLT)
	str	r0, [r6, #56]
	.loc 1 467 0
	bl	__floatsidf(PLT)
	add	r2, r6, #24
	ldmia	r2, {r2-r3}
	bl	__divdf3(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	bl	__adddf3(PLT)
	str	r0, [r6, #32]
	str	r1, [r6, #36]
	.loc 1 469 0
	mov	r0, r9
	mov	r1, r6
	.loc 1 470 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	.loc 1 469 0
	b	TrainServer_QueueSwitchStates(PLT)
.L148:
	.loc 1 452 0
	mov	r3, #4
	str	r3, [r6, #8]
	.loc 1 453 0
	ldrb	r2, [r6, #4]	@ zero_extendqisi2
	mov	r1, lr
	mov	r3, lr
	mov	r0, #2
	str	lr, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 454 0
	ldr	r3, [r6, #12]
	ldr	r0, .L149+4
	ldr	r1, [r3, #0]
	add	r0, sl, r0
	.loc 1 470 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	.loc 1 454 0
	b	PrintMessage(PLT)
.L150:
	.align	2
.L149:
	.word	_GLOBAL_OFFSET_TABLE_-(.L147+8)
	.word	.LC12(GOTOFF)
.LFE21:
	.size	TrainServer_ProcessSensorData, .-TrainServer_ProcessSensorData
	.align	2
	.global	TrainServer_ProcessEngineAtDestination
	.type	TrainServer_ProcessEngineAtDestination, %function
TrainServer_ProcessEngineAtDestination:
.LFB22:
	.loc 1 472 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL96:
	stmfd	sp!, {r4, r5, lr}
.LCFI16:
	sub	sp, sp, #4
.LCFI17:
.LVL97:
	.loc 1 472 0
	mov	r5, r1
	.loc 1 474 0
	bl	Time(PLT)
.LVL98:
	ldr	r2, .L155
	mov	r4, r0
	smull	lr, ip, r2, r4
	mov	r3, r4, asr #31
	rsb	r3, r3, ip, asr #4
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r4, r4, r3, asl #1
	subs	r3, r4, #0
	.loc 1 475 0
	mov	r1, #16
	mov	r0, #2
	.loc 1 474 0
	bne	.L154
	.loc 1 475 0
	ldrb	r2, [r5, #4]	@ zero_extendqisi2
	str	r4, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 476 0
	mov	r0, #1
	bl	Delay(PLT)
	.loc 1 477 0
	ldrb	r2, [r5, #4]	@ zero_extendqisi2
	mov	r1, r4
	mov	r0, #2
	mov	r3, r4
	str	r4, [sp, #0]
	bl	SendTrainCommand(PLT)
.L154:
	.loc 1 479 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.L156:
	.align	2
.L155:
	.word	1374389535
.LFE22:
	.size	TrainServer_ProcessEngineAtDestination, .-TrainServer_ProcessEngineAtDestination
	.align	2
	.global	TrainServer_GetEnginePosition
	.type	TrainServer_GetEnginePosition, %function
TrainServer_GetEnginePosition:
.LFB23:
	.loc 1 481 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL99:
	stmfd	sp!, {r4, lr}
.LCFI18:
	.loc 1 481 0
	mov	r1, #0
.LVL100:
	mov	lr, r0
.LVL101:
	mov	r4, r0
.LVL102:
.LVL103:
.L158:
	.loc 1 487 0
	ldr	ip, [lr, #60]
	mov	r2, #0
.L159:
	mov	r3, ip, asr r2
	ands	r0, r3, #1
	bne	.L170
	.loc 1 486 0
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L159
	.loc 1 485 0
	add	r1, r1, #1
	cmp	r1, #5
	add	lr, lr, #4
	bne	.L158
	.loc 1 494 0
	ldmfd	sp!, {r4, pc}
.L170:
	.loc 1 488 0
	mov	r3, #14272
	ldr	r0, [r4, r3]
	.loc 1 494 0
	ldmfd	sp!, {r4, lr}
	.loc 1 488 0
	b	SensorToTrackNode(PLT)
.LVL104:
.LFE23:
	.size	TrainServer_GetEnginePosition, .-TrainServer_GetEnginePosition
	.align	2
	.global	TrainServer_ProcessEngineRunning
	.type	TrainServer_ProcessEngineRunning, %function
TrainServer_ProcessEngineRunning:
.LFB19:
	.loc 1 415 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL105:
	stmfd	sp!, {r4, r5, lr}
.LCFI19:
	.loc 1 415 0
	mov	r4, r1
	mov	r5, r0
	.loc 1 416 0
	bl	TrainServer_GetEnginePosition(PLT)
.LVL106:
	.loc 1 418 0
	subs	r2, r0, #0
.LVL107:
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r3, [r4, #12]
	.loc 1 420 0
	mov	r0, r5
	.loc 1 418 0
	cmp	r2, r3
	.loc 1 420 0
	mov	r1, r4
	.loc 1 418 0
	ldmeqfd	sp!, {r4, r5, pc}
.LVL108:
	.loc 1 419 0
	str	r2, [r4, #12]
	.loc 1 422 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 420 0
	b	TrainServer_ProcessSensorData(PLT)
.LVL109:
.LFE19:
	.size	TrainServer_ProcessEngineRunning, .-TrainServer_ProcessEngineRunning
	.align	2
	.global	TrainServer_ProcessEngineFindingPosition
	.type	TrainServer_ProcessEngineFindingPosition, %function
TrainServer_ProcessEngineFindingPosition:
.LFB17:
	.loc 1 386 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL110:
	stmfd	sp!, {r4, r5, lr}
.LCFI20:
	sub	sp, sp, #4
.LCFI21:
.LVL111:
	.loc 1 386 0
	mov	r4, r1
	.loc 1 387 0
	bl	TrainServer_GetEnginePosition(PLT)
.LVL112:
	.loc 1 392 0
	mov	r5, #0
	.loc 1 390 0
	mov	lr, #2
	.loc 1 389 0
	subs	ip, r0, #0
.LVL113:
	.loc 1 392 0
	mov	r1, r5
	mov	r3, r5
	mov	r0, lr
	.loc 1 389 0
	beq	.L179
	.loc 1 392 0
	ldrb	r2, [r4, #4]	@ zero_extendqisi2
	.loc 1 391 0
	str	ip, [r4, #12]
	.loc 1 390 0
	str	lr, [r4, #8]
	.loc 1 392 0
	str	r5, [sp, #0]
	bl	SendTrainCommand(PLT)
.LVL114:
.LVL115:
.L179:
	.loc 1 394 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.LFE17:
	.size	TrainServer_ProcessEngineFindingPosition, .-TrainServer_ProcessEngineFindingPosition
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"Unknown Train Engine State\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngine
	.type	TrainServer_ProcessEngine, %function
TrainServer_ProcessEngine:
.LFB15:
	.loc 1 350 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL116:
	str	sl, [sp, #-4]!
.LCFI22:
	.loc 1 351 0
	ldr	r3, [r1, #4]
	.loc 1 350 0
	ldr	sl, .L193
	.loc 1 351 0
	cmp	r3, #0
	.loc 1 350 0
.L192:
	add	sl, pc, sl
	@ lr needed for prologue
	.loc 1 351 0
	beq	.L191
	.loc 1 355 0
	ldr	r3, [r1, #8]
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L183
	.p2align 2
.L190:
	b	.L184
	b	.L185
	b	.L186
	b	.L187
	b	.L188
	b	.L189
.L191:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	bx	lr
.L183:
	.loc 1 375 0
	ldr	r1, .L193+4
.LVL117:
	mov	r0, #0
.LVL118:
	add	r1, sl, r1
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 375 0
	b	assert(PLT)
.LVL119:
.L189:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 372 0
	b	TrainServer_ProcessEngineCalibratingSpeed(PLT)
.LVL120:
.L188:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 369 0
	b	TrainServer_ProcessEngineAtDestination(PLT)
.LVL121:
.L187:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 366 0
	b	TrainServer_ProcessEngineRunning(PLT)
.LVL122:
.L186:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 363 0
	b	TrainServer_ProcessEngineFoundStartingPosition(PLT)
.LVL123:
.L185:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 360 0
	b	TrainServer_ProcessEngineFindingPosition(PLT)
.LVL124:
.L184:
	.loc 1 378 0
	ldmfd	sp!, {sl}
	.loc 1 357 0
	b	TrainServer_ProcessEngineIdle(PLT)
.LVL125:
.L194:
	.align	2
.L193:
	.word	_GLOBAL_OFFSET_TABLE_-(.L192+8)
	.word	.LC13(GOTOFF)
.LFE15:
	.size	TrainServer_ProcessEngine, .-TrainServer_ProcessEngine
	.section	.rodata
	.align	2
	.type	__func__.1874, %object
	.size	__func__.1874, 18
__func__.1874:
	.ascii	"TrainServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"TrainServer did not get ACK reply from train comman"
	.ascii	"d server shutdown\000"
	.align	2
.LC15:
	.ascii	"TrainServer: unknown message type\000"
	.align	2
.LC16:
	.ascii	"TrainServer: did not get admin tid\000"
	.align	2
.LC17:
	.ascii	"TrainServer: failed to set ack message\000"
	.text
	.align	2
	.global	TrainServer_Start
	.type	TrainServer_Start, %function
TrainServer_Start:
.LFB2:
	.loc 1 10 0
	@ args = 0, pretend = 0, frame = 17592
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL126:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI23:
	ldr	sl, .L222
	sub	sp, sp, #17408
.LCFI24:
.LVL127:
	.loc 1 11 0
	ldr	r3, .L222+4
	.loc 1 10 0
	sub	sp, sp, #188
.LCFI25:
.LVL128:
	.loc 1 11 0
	ldr	r2, .L222+8
	.loc 1 10 0
.L220:
	add	sl, pc, sl
	.loc 1 13 0
	add	r4, sp, #188
	.loc 1 11 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	.loc 1 13 0
	sub	r4, r4, #184
	.loc 1 11 0
	bl	DebugRegisterFunction(PLT)
	.loc 1 13 0
	mov	r0, r4
	bl	TrainServer_Initialize(PLT)
	.loc 1 16 0
	ldr	r3, [r4, #424]
	.loc 1 13 0
	mov	r5, #0
.LVL129:
	.loc 1 16 0
	cmp	r3, #0
	beq	.L221
.L197:
.LBB7:
	.loc 1 17 0
	mov	r1, r4
	mov	r2, #16
	add	r0, r4, #420
	bl	Receive(PLT)
	.loc 1 18 0
	ldr	r1, [r4, #36]
	.loc 1 20 0
	ldr	r0, [r4, #32]
	.loc 1 18 0
	mov	r2, #10
	str	r2, [r1, #0]
	.loc 1 20 0
	ldr	r3, [r0, #0]
	sub	r3, r3, #12
	cmp	r3, #26
	addls	pc, pc, r3, asl #2
	b	.L198
	.p2align 2
.L213:
	b	.L199
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L198
	b	.L200
	b	.L198
	b	.L198
	b	.L201
	b	.L202
	b	.L198
	b	.L203
	b	.L204
	b	.L205
	b	.L206
	b	.L207
	b	.L208
	b	.L209
	b	.L198
	b	.L210
	b	.L211
	b	.L212
.L199:
	.loc 1 26 0
	mov	lr, #16
	.loc 1 24 0
	mov	ip, #1
	.loc 1 26 0
	add	r3, r4, lr
	.loc 1 24 0
	str	ip, [r4, #40]
	.loc 1 26 0
	ldr	r0, [r4, #428]
	mov	r2, lr
	str	lr, [sp, #0]
	mov	r1, r4
	.loc 1 23 0
	ldr	r5, [r4, #420]
	.loc 1 26 0
	bl	Send(PLT)
	.loc 1 28 0
	ldr	r3, [r4, #36]
	ldr	r1, .L222+12
	ldr	r0, [r3, #0]
	add	r1, sl, r1
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	.loc 1 30 0
	ldr	r3, [r4, #424]
	sub	r3, r3, #1
	str	r3, [r4, #424]
.L214:
	.loc 1 98 0
	add	r1, r4, #16320
	add	r1, r1, #4
	mov	r0, r4
	bl	TrainServer_ProcessEngine(PLT)
.LBE7:
	.loc 1 16 0
	ldr	r3, [r4, #424]
	cmp	r3, #0
	bne	.L197
.L221:
	.loc 1 101 0
	ldr	r1, .L222+16
	mov	r0, r5
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 102 0
	ldr	r2, [r4, #36]
	.loc 1 103 0
	ldr	r1, .L222+20
	.loc 1 102 0
	mov	r3, #10
	str	r3, [r2, #0]
	.loc 1 103 0
	add	r1, sl, r1
	mov	r0, #1
	bl	assert(PLT)
	.loc 1 104 0
	add	r1, r4, #16
	mov	r2, #16
	mov	r0, r5
	bl	Reply(PLT)
	.loc 1 107 0
	bl	Exit(PLT)
	.loc 1 108 0
	add	sp, sp, #188
	add	sp, sp, #17408
	ldmfd	sp!, {r4, r5, sl, pc}
.L200:
.LBB8:
	.loc 1 34 0
	ldr	r3, [r4, #40]
	.loc 1 38 0
	ldr	r0, [r4, #420]
	.loc 1 34 0
	cmp	r3, #1
	.loc 1 35 0
	ldreq	r2, [r4, #36]
	addeq	r3, r3, #11
	streq	r3, [r2, #0]
	.loc 1 38 0
	add	r1, r4, #16
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 40 0
	ldr	r3, [r4, #40]
	cmp	r3, #1
	.loc 1 41 0
	ldreq	r3, [r4, #424]
	subeq	r3, r3, #1
	streq	r3, [r4, #424]
	b	.L214
.L201:
	.loc 1 46 0
	mov	r0, r4
	bl	TrainServer_HandleSensorReaderData(PLT)
	b	.L214
.L202:
	.loc 1 50 0
	mov	r0, r4
	bl	TrainServer_HandleSwitchData(PLT)
	b	.L214
.L203:
	.loc 1 54 0
	mov	r0, r4
	bl	TrainServer_HandleSensorQuery(PLT)
	b	.L214
.L204:
	.loc 1 58 0
	mov	r0, r4
	bl	TrainServer_HandleSwitchQuery(PLT)
	b	.L214
.L205:
	.loc 1 62 0
	ldr	r2, [r4, #420]
	.loc 1 61 0
	mov	r3, #2
	str	r3, [r4, #40]
	.loc 1 62 0
	str	r2, [r4, #436]
	b	.L214
.L206:
	.loc 1 67 0
	mov	r0, r4
	bl	TrainServer_HandleSelectTrack(PLT)
	b	.L214
.L207:
	.loc 1 71 0
	mov	r0, r4
	bl	TrainServer_HandleSetTrain(PLT)
	b	.L214
.L208:
	.loc 1 75 0
	mov	r0, r4
	bl	TrainServer_HandleSetDestination(PLT)
	b	.L214
.L209:
	.loc 1 79 0
	mov	r0, r4
	bl	TrainServer_HandleQueryTrainEngine(PLT)
	b	.L214
.L198:
	.loc 1 93 0
	ldr	r1, .L222+24
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	b	.L214
.L210:
	.loc 1 83 0
	mov	r0, r4
	bl	TrainServer_HandleTrainEngineClientCommandRequest(PLT)
	b	.L214
.L211:
	.loc 1 87 0
	mov	r0, r4
	bl	TrainServer_HandleGetSwitchRequest(PLT)
	b	.L214
.L212:
	.loc 1 90 0
	mov	r0, r4
	bl	TrainServer_HandleSetSwitch(PLT)
	b	.L214
.L223:
	.align	2
.L222:
	.word	_GLOBAL_OFFSET_TABLE_-(.L220+8)
	.word	TrainServer_Start(GOT)
	.word	__func__.1874(GOT)
	.word	.LC14(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC15(GOTOFF)
.LBE8:
.LFE2:
	.size	TrainServer_Start, .-TrainServer_Start
	.section	.rodata
	.align	2
	.type	__func__.2275, %object
	.size	__func__.2275, 23
__func__.2275:
	.ascii	"TrainServerTimer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"TrainServerTimer failed to register name\000"
	.align	2
.LC19:
	.ascii	"TrainServerTimer: server tid not found\000"
	.align	2
.LC20:
	.ascii	"TrainServerTimer: didn't get ACK message\000"
	.text
	.align	2
	.global	TrainServerTimer_Start
	.type	TrainServerTimer_Start, %function
TrainServerTimer_Start:
.LFB25:
	.loc 1 524 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL130:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI26:
	ldr	sl, .L231
	.loc 1 525 0
	ldr	r2, .L231+4
	ldr	r3, .L231+8
	.loc 1 524 0
.L230:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI27:
.LVL131:
	.loc 1 525 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 526 0
	ldr	r3, .L231+12
	ldr	r8, .L231+16
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 527 0
	ldr	r1, .L231+20
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 532 0
	ldr	r3, .L231+24
	.loc 1 531 0
	add	r7, sp, #4
	.loc 1 532 0
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 533 0
	ldr	r1, .L231+28
	.loc 1 532 0
	mov	r5, r0
.LVL132:
	.loc 1 533 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 535 0
	mov	r3, #22
	add	r6, sp, #20
	str	r3, [sp, #20]
	mov	r4, #16
.L225:
	.loc 1 538 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 539 0
	mov	r3, r7
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 540 0
	ldr	r0, [sp, #4]
	add	r1, sl, r8
	cmp	r0, #12
	cmpne	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	.loc 1 543 0
	ldr	r3, [sp, #4]
	cmp	r3, #12
	bne	.L225
	.loc 1 548 0
	bl	Exit(PLT)
	.loc 1 549 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L232:
	.align	2
.L231:
	.word	_GLOBAL_OFFSET_TABLE_-(.L230+8)
	.word	__func__.2275(GOT)
	.word	TrainServerTimer_Start(GOT)
	.word	TRAIN_SERVER_TIMER_NAME(GOT)
	.word	.LC20(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC19(GOTOFF)
.LFE25:
	.size	TrainServerTimer_Start, .-TrainServerTimer_Start
	.section	.rodata
	.align	2
	.type	__func__.2294, %object
	.size	__func__.2294, 25
__func__.2294:
	.ascii	"TrainCommandServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC21:
	.ascii	"TrainCommandServer failed to register\000"
	.align	2
.LC22:
	.ascii	"TrainCommandServer_Start: failed to get train serve"
	.ascii	"r tid\000"
	.align	2
.LC23:
	.ascii	"TrainCommandServer did not get train command\000"
	.align	2
.LC24:
	.ascii	"module_num out of range (not using 0-indexed?)\000"
	.align	2
.LC25:
	.ascii	"Unknown train command\000"
	.text
	.align	2
	.global	TrainCommandServer_Start
	.type	TrainCommandServer_Start, %function
TrainCommandServer_Start:
.LFB26:
	.loc 1 551 0
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL133:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI28:
	ldr	sl, .L249
	.loc 1 552 0
	ldr	r2, .L249+4
	ldr	r3, .L249+8
	.loc 1 551 0
.L247:
	add	sl, pc, sl
	sub	sp, sp, #76
.LCFI29:
.LVL134:
	.loc 1 552 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 554 0
	ldr	r3, .L249+12
	.loc 1 559 0
	add	r6, sp, #56
	.loc 1 554 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 555 0
	ldr	r1, .L249+16
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 563 0
	ldr	r3, .L249+20
	add	r7, sp, #72
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 565 0
	ldr	r1, .L249+24
	.loc 1 560 0
	add	r5, sp, #40
	.loc 1 565 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 571 0
	mov	r0, r7
	mov	r1, r6
	mov	r2, #16
	bl	Receive(PLT)
	.loc 1 573 0
	ldr	r0, [sp, #56]
	cmp	r0, #12
	beq	.L248
.LVL135:
.L235:
	.loc 1 578 0
	ldr	r1, .L249+28
	cmp	r0, #27
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 581 0
	ldr	r3, [sp, #60]
	sub	r3, r3, #2
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L237
	.p2align 2
.L244:
	b	.L238
	b	.L239
	b	.L240
	b	.L241
	b	.L242
	b	.L243
.L237:
	.loc 1 642 0
	ldr	r1, .L249+32
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.L245:
	.loc 1 646 0
	mov	r3, #10
	.loc 1 647 0
	mov	r1, r5
	mov	r2, #16
	ldr	r0, [sp, #72]
	.loc 1 646 0
	str	r3, [r5, #0]
	.loc 1 647 0
	bl	Reply(PLT)
	.loc 1 571 0
	mov	r0, r7
	mov	r1, r6
	mov	r2, #16
	bl	Receive(PLT)
	.loc 1 573 0
	ldr	r0, [sp, #56]
	cmp	r0, #12
	bne	.L235
.L248:
	.loc 1 574 0
	mov	r3, #10
	.loc 1 575 0
	mov	r1, r5
	mov	r2, #16
	ldr	r0, [sp, #72]
	.loc 1 574 0
	str	r3, [r5, #0]
	.loc 1 575 0
	bl	Reply(PLT)
	.loc 1 650 0
	bl	Exit(PLT)
	.loc 1 651 0
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L238:
	.loc 1 585 0
	mov	r1, #2
	ldrb	r2, [r6, #8]	@ zero_extendqisi2
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	mov	r0, #0
	bl	PutcAtomic(PLT)
	b	.L245
.L239:
	.loc 1 589 0
	ldrb	r4, [r6, #8]	@ zero_extendqisi2
	mov	r0, #0
	mov	r3, r4
	mov	r1, #2
	mov	r2, r0
	bl	PutcAtomic(PLT)
	.loc 1 590 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 591 0
	mov	r3, r4
	mov	r1, #2
	mov	r2, #15
	mov	r0, #0
	bl	PutcAtomic(PLT)
	.loc 1 592 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 593 0
	mov	r3, r4
	mov	r1, #2
	mov	r2, #5
	mov	r0, #0
	bl	PutcAtomic(PLT)
	b	.L245
.L240:
	.loc 1 598 0
	ldrb	r2, [r6, #8]	@ zero_extendqisi2
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	mov	r1, #2
	mov	r0, #0
	bl	PutcAtomic(PLT)
	.loc 1 599 0
	ldr	r0, .L249+36
	bl	DelaySeconds(PLT)
	.loc 1 600 0
	mov	r1, #32
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 603 0
	ldr	r0, .L249+40
	bl	DelaySeconds(PLT)
	.loc 1 604 0
	mov	r1, #32
	mov	r0, #0
	bl	Putc(PLT)
	b	.L245
.L241:
	.loc 1 608 0
	ldrb	r4, [r6, #8]	@ zero_extendqisi2
.LVL136:
	.loc 1 609 0
	ldr	r1, .L249+44
	cmp	r4, #4
	movhi	r0, #0
	movls	r0, #1
	.loc 1 610 0
	add	r4, r4, #1
.LVL137:
	mvn	r4, r4, asl #26
	mvn	r4, r4, lsr #26
	.loc 1 609 0
	add	r1, sl, r1
	.loc 1 610 0
	and	r4, r4, #255
	.loc 1 609 0
	bl	assert(PLT)
	.loc 1 610 0
	mov	r1, r4
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 613 0
	mov	r0, #0
	bl	Getc(PLT)
	mov	r4, r0
	.loc 1 614 0
	mov	r0, #0
	bl	Getc(PLT)
	.loc 1 616 0
	strb	r4, [r5, #8]
	.loc 1 617 0
	strb	r0, [r5, #9]
	b	.L245
.L242:
	.loc 1 621 0
	ldrb	r0, [r6, #8]	@ zero_extendqisi2
	ldr	r1, .L249+44
	cmp	r0, #4
	movhi	r0, #0
	movls	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 622 0
	mov	r1, #133
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 625 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #20]
	.loc 1 626 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #0]
	.loc 1 627 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #24]
	.loc 1 628 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #4]
	.loc 1 629 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #28]
	.loc 1 630 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #8]
	.loc 1 631 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #32]
	.loc 1 632 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #12]
	.loc 1 633 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #36]
	.loc 1 634 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #16]
	b	.L245
.L243:
	.loc 1 638 0
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	add	r2, sp, #76
	add	r1, r2, r3, asl #2
	ldr	r2, [r1, #-56]
	strb	r2, [r5, #8]
	.loc 1 639 0
	ldr	r3, [r1, #-76]
	strb	r3, [r5, #9]
	b	.L245
.L250:
	.align	2
.L249:
	.word	_GLOBAL_OFFSET_TABLE_-(.L247+8)
	.word	__func__.2294(GOT)
	.word	TrainCommandServer_Start(GOT)
	.word	TRAIN_COMMAND_SERVER_NAME(GOT)
	.word	.LC21(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	1041865114
	.word	1045220557
	.word	.LC24(GOTOFF)
.LFE26:
	.size	TrainCommandServer_Start, .-TrainCommandServer_Start
	.section	.rodata
	.align	2
	.type	__func__.2358, %object
	.size	__func__.2358, 24
__func__.2358:
	.ascii	"TrainSensorReader_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC26:
	.ascii	"TrainSensorMessage size too big\000"
	.align	2
.LC27:
	.ascii	"TrainSensorReader failed to get server tid\000"
	.align	2
.LC28:
	.ascii	"TrainSensorReader failed to get ACK message\000"
	.text
	.align	2
	.global	TrainSensorReader_Start
	.type	TrainSensorReader_Start, %function
TrainSensorReader_Start:
.LFB27:
	.loc 1 653 0
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL138:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI30:
	ldr	sl, .L264
	.loc 1 654 0
	ldr	r3, .L264+4
	ldr	r2, .L264+8
	.loc 1 653 0
.L262:
	add	sl, pc, sl
	sub	sp, sp, #48
.LCFI31:
.LVL139:
	.loc 1 654 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	.loc 1 666 0
	ldr	r1, .L264+12
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	ldr	r6, .L264+16
	ldr	r5, .L264+20
	.loc 1 659 0
	add	r3, sp, #12
	.loc 1 658 0
	add	r8, sp, #28
	.loc 1 666 0
	mov	r4, #0
.LVL140:
	.loc 1 659 0
	str	r3, [sp, #8]
	b	.L252
.LVL141:
.L263:
	.loc 1 677 0
	cmp	r4, #99
	movgt	r0, #0
	movle	r0, #1
	bl	assert(PLT)
.L252:
	.loc 1 670 0
	ldr	r0, [sl, r6]
	bl	WhoIs(PLT)
	.loc 1 672 0
	subs	r9, r0, #0
	.loc 1 676 0
	add	r4, r4, #1
	.loc 1 677 0
	add	r1, sl, r5
	.loc 1 672 0
	beq	.L263
	.loc 1 680 0
	mov	r0, #1065353216
	bl	DelaySeconds(PLT)
	add	r3, sp, #47
	str	r3, [sp, #4]
	add	fp, sp, #46
.LVL142:
.L255:
	.loc 1 683 0
	mov	r1, #0
	mov	r0, #6
	mov	r2, r1
	str	fp, [sp, #0]
	bl	SendTrainCommand(PLT)
	mov	r7, #0
.L256:
.LBB9:
	.loc 1 685 0
	mov	r1, r7
	mov	r2, #0
	ldr	r3, [sp, #4]
	mov	r0, #7
	str	fp, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 689 0
	ldrb	r3, [sp, #46]	@ zero_extendqisi2
.LVL143:
	.loc 1 690 0
	ldrb	r2, [sp, #47]	@ zero_extendqisi2
.LVL144:
	.loc 1 692 0
	ldr	r4, .L264+24
.LVL145:
	ldr	r0, .L264+28
	add	r3, r3, r3, asl #10
.LVL146:
	.loc 1 694 0
	add	r2, r2, r2, asl #10
.LVL147:
	.loc 1 692 0
	mov	ip, r3, asl #5
	.loc 1 694 0
	mov	r5, r2, asl #5
	mov	lr, r4
	mov	r1, r0
	.loc 1 692 0
	mov	r3, r3, asl #1
	.loc 1 694 0
	mov	r2, r2, asl #1
	.loc 1 692 0
	and	r0, ip, r0
	.loc 1 694 0
	and	r1, r5, r1
	.loc 1 692 0
	and	r4, r3, r4
	.loc 1 694 0
	and	lr, r2, lr
	.loc 1 692 0
	orr	r4, r4, r0
	.loc 1 694 0
	orr	lr, lr, r1
	.loc 1 692 0
	add	r3, r4, r4, asl #8
	.loc 1 694 0
	add	r2, lr, lr, asl #8
	.loc 1 692 0
	add	r4, r4, r3, asl #8
	.loc 1 694 0
	add	lr, lr, r2, asl #8
	.loc 1 692 0
	mov	r4, r4, lsr #16
	.loc 1 694 0
	mov	lr, lr, lsr #16
	and	lr, lr, #255
	.loc 1 692 0
	and	r4, r4, #255
	.loc 1 700 0
	mov	r6, #16
	.loc 1 697 0
	orr	r5, lr, r4, asl #8
	.loc 1 700 0
	mov	r1, r8
	.loc 1 696 0
	mov	ip, #25
	.loc 1 700 0
	mov	r2, r6
	ldr	r3, [sp, #8]
	mov	r0, r9
	.loc 1 698 0
	str	r7, [r8, #4]
	.loc 1 696 0
	str	ip, [r8, #0]
	.loc 1 697 0
	str	r5, [r8, #8]
	.loc 1 692 0
	strb	r4, [sp, #46]
	.loc 1 694 0
	strb	lr, [sp, #47]
	.loc 1 700 0
	str	r6, [sp, #0]
	bl	Send(PLT)
	.loc 1 702 0
	ldr	r0, [sp, #12]
	.loc 1 707 0
	ldr	r1, .L264+32
	.loc 1 702 0
	cmp	r0, #12
	.loc 1 707 0
	add	r7, r7, #1
	add	r1, sl, r1
	.loc 1 702 0
	beq	.L257
	.loc 1 707 0
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
.LBE9:
	.loc 1 684 0
	cmp	r7, #5
	bne	.L256
	ldr	r3, [sp, #4]
	b	.L255
.L257:
	.loc 1 716 0
	bl	Exit(PLT)
	.loc 1 717 0
	add	sp, sp, #48
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L265:
	.align	2
.L264:
	.word	_GLOBAL_OFFSET_TABLE_-(.L262+8)
	.word	TrainSensorReader_Start(GOT)
	.word	__func__.2358(GOT)
	.word	.LC26(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC27(GOTOFF)
	.word	139536
	.word	558144
	.word	.LC28(GOTOFF)
.LFE27:
	.size	TrainSensorReader_Start, .-TrainSensorReader_Start
	.align	2
	.global	TrainEngine_SetInitialSwitches
	.type	TrainEngine_SetInitialSwitches, %function
TrainEngine_SetInitialSwitches:
.LFB30:
	.loc 1 766 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL148:
	str	lr, [sp, #-4]!
.LCFI32:
	.loc 1 767 0
	mov	r1, #11
	mov	r0, #34
	bl	SetTrainSwitch(PLT)
	.loc 1 768 0
	mov	r1, #14
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 769 0
	mov	r1, #15
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 770 0
	mov	r1, #6
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 771 0
	mov	r1, #7
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 772 0
	mov	r1, #8
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 773 0
	mov	r0, #33
	mov	r1, #9
	.loc 1 774 0
	ldr	lr, [sp], #4
	.loc 1 773 0
	b	SetTrainSwitch(PLT)
.LFE30:
	.size	TrainEngine_SetInitialSwitches, .-TrainEngine_SetInitialSwitches
	.section	.rodata
	.align	2
	.type	__func__.2409, %object
	.size	__func__.2409, 24
__func__.2409:
	.ascii	"TrainEngineClient_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC29:
	.ascii	"TrainEngineClient failed to get server tid\000"
	.align	2
.LC30:
	.ascii	"TrainEngineClient: unknown message type %d\000"
	.text
	.align	2
	.global	TrainEngineClient_Start
	.type	TrainEngineClient_Start, %function
TrainEngineClient_Start:
.LFB29:
	.loc 1 733 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL149:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI33:
	ldr	sl, .L283
	.loc 1 734 0
	ldr	r3, .L283+4
	ldr	r2, .L283+8
	.loc 1 733 0
.L280:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI34:
.LVL150:
	.loc 1 734 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 739 0
	bl	MyParentTid(PLT)
	.loc 1 740 0
	ldr	r1, .L283+12
	.loc 1 739 0
	mov	r5, r0
.LVL151:
	.loc 1 740 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 742 0
	mov	r3, #36
	str	r3, [sp, #20]
	.loc 1 744 0
	bl	TrainEngine_SetInitialSwitches(PLT)
	ldr	r7, .L283+16
	.loc 1 738 0
	add	r4, sp, #4
	add	r6, sp, #20
.L281:
	.loc 1 747 0
	mov	ip, #16
	mov	r3, r4
	mov	r2, ip
	mov	r1, r6
	mov	r0, r5
	str	ip, [sp, #0]
	bl	Send(PLT)
	.loc 1 749 0
	ldr	r3, [sp, #8]
	.loc 1 752 0
	ldr	r0, .L283+20
	.loc 1 749 0
	cmp	r3, #0
	beq	.L271
	cmp	r3, #1
	.loc 1 758 0
	mov	r2, r3
	mov	r0, #0
	add	r1, sl, r7
	.loc 1 749 0
	beq	.L282
	.loc 1 758 0
	bl	assertf(PLT)
	b	.L281
.L271:
	.loc 1 752 0
	bl	DelaySeconds(PLT)
	b	.L281
.L282:
	.loc 1 755 0
	mov	ip, #0
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	ldrb	r2, [r4, #9]	@ zero_extendqisi2
	mov	r3, ip
	mov	r0, #2
	str	ip, [sp, #0]
	bl	SendTrainCommand(PLT)
	b	.L281
.L284:
	.align	2
.L283:
	.word	_GLOBAL_OFFSET_TABLE_-(.L280+8)
	.word	TrainEngineClient_Start(GOT)
	.word	__func__.2409(GOT)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	1008981770
.LFE29:
	.size	TrainEngineClient_Start, .-TrainEngineClient_Start
	.section	.rodata
	.align	2
	.type	__func__.2431, %object
	.size	__func__.2431, 24
__func__.2431:
	.ascii	"TrainSwitchMaster_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC31:
	.ascii	"TrainSwitchMaster failed to register\000"
	.align	2
.LC32:
	.ascii	"TrainSwitchMaster_Start: failed to get train server"
	.ascii	" tid\000"
	.text
	.align	2
	.global	TrainSwitchMaster_Start
	.type	TrainSwitchMaster_Start, %function
TrainSwitchMaster_Start:
.LFB31:
	.loc 1 776 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL152:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI35:
	ldr	sl, .L297
	.loc 1 777 0
	ldr	r2, .L297+4
	ldr	r3, .L297+8
	.loc 1 776 0
.L295:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI36:
.LVL153:
	.loc 1 777 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 779 0
	ldr	r3, .L297+12
	.loc 1 785 0
	add	r6, sp, #4
	.loc 1 779 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 780 0
	ldr	r1, .L297+16
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 787 0
	ldr	r3, .L297+20
	add	r5, sp, #20
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 789 0
	ldr	r1, .L297+24
	.loc 1 787 0
	mov	r4, r0
.LVL154:
	.loc 1 789 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 791 0
	mov	r3, #37
	str	r3, [sp, #20]
	b	.L296
.L287:
	.loc 1 801 0
	ldr	r0, .L297+28
	bl	DelaySeconds(PLT)
.L296:
	.loc 1 794 0
	mov	ip, #16
	mov	r2, ip
	mov	r3, r6
	mov	r1, r5
	mov	r0, r4
	str	ip, [sp, #0]
	bl	Send(PLT)
	.loc 1 796 0
	ldr	r2, [sp, #4]
	.loc 1 799 0
	mov	ip, #0
	.loc 1 796 0
	cmp	r2, #10
	.loc 1 799 0
	mov	r3, ip
	mov	r0, #4
	.loc 1 796 0
	bne	.L287
	.loc 1 799 0
	ldrb	r1, [sp, #12]	@ zero_extendqisi2
	ldrb	r2, [sp, #13]	@ zero_extendqisi2
	str	ip, [sp, #0]
	bl	SendTrainCommand(PLT)
	b	.L296
.L298:
	.align	2
.L297:
	.word	_GLOBAL_OFFSET_TABLE_-(.L295+8)
	.word	__func__.2431(GOT)
	.word	TrainSwitchMaster_Start(GOT)
	.word	TRAIN_SWITCH_MASTER_NAME(GOT)
	.word	.LC31(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC32(GOTOFF)
	.word	1028443341
.LFE31:
	.size	TrainSwitchMaster_Start, .-TrainSwitchMaster_Start
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
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI0-.LFB11
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI1-.LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI2-.LFB28
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI3-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
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
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI5-.LFB4
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
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI6-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI7-.LFB24
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x1c
	.byte	0x8e
	.uleb128 0x1
	.byte	0x88
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
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI9-.LFB16
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI11-.LFB18
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
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x1c
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x4
	.4byte	.LCFI13-.LFB20
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
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI14-.LFB21
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
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x24
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI16-.LFB22
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI18-.LFB23
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI19-.LFB19
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI20-.LFB17
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI22-.LFB15
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI23-.LFB2
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
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x4410
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x44cc
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI26-.LFB25
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
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI28-.LFB26
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
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x64
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI30-.LFB27
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
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x54
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI32-.LFB30
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI33-.LFB29
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
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x3c
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI35-.LFB31
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
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x38
	.align	2
.LEFDE58:
	.file 2 "train.h"
	.file 3 "message.h"
	.file 4 "random.h"
	.file 5 "tracks/track_node.h"
	.file 6 "route.h"
	.file 7 "queue.h"
	.file 8 "public_kernel_interface.h"
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
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL47-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL55-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL60-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL63-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL67-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL67-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL67-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST30:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST31:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL71-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST32:
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -8
	.4byte	.LVL74-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST33:
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST34:
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL75-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST35:
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST36:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL82-.Ltext0
	.4byte	.LFE20-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST37:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL81-.Ltext0
	.4byte	.LFE20-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST38:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST39:
	.4byte	.LVL85-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST40:
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL87-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST41:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL90-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST42:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL91-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST43:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL91-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST44:
	.4byte	.LVL94-.Ltext0
	.4byte	.LVL95-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST45:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL97-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST46:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST47:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL98-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST48:
	.4byte	.LVL99-.Ltext0
	.4byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL102-.Ltext0
	.4byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST49:
	.4byte	.LVL100-.Ltext0
	.4byte	.LVL104-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST50:
	.4byte	.LVL103-.Ltext0
	.4byte	.LVL104-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST51:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL109-.Ltext0
	.4byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST52:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL109-.Ltext0
	.4byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST53:
	.4byte	.LVL107-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST54:
	.4byte	.LVL110-.Ltext0
	.4byte	.LVL111-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL111-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST55:
	.4byte	.LVL110-.Ltext0
	.4byte	.LVL112-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST56:
	.4byte	.LVL110-.Ltext0
	.4byte	.LVL112-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL112-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST57:
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL114-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL115-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST58:
	.4byte	.LVL116-.Ltext0
	.4byte	.LVL118-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL122-.Ltext0
	.4byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL123-.Ltext0
	.4byte	.LVL124-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL124-.Ltext0
	.4byte	.LVL125-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST59:
	.4byte	.LVL116-.Ltext0
	.4byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL122-.Ltext0
	.4byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL123-.Ltext0
	.4byte	.LVL124-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL124-.Ltext0
	.4byte	.LVL125-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST60:
	.4byte	.LVL126-.Ltext0
	.4byte	.LVL127-.Ltext0
	.2byte	0x4
	.byte	0x7d
	.sleb128 -17596
	.4byte	.LVL127-.Ltext0
	.4byte	.LVL128-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -188
	.4byte	.LVL128-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST61:
	.4byte	.LVL130-.Ltext0
	.4byte	.LVL131-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL131-.Ltext0
	.4byte	.LFE25-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST62:
	.4byte	.LVL133-.Ltext0
	.4byte	.LVL134-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -76
	.4byte	.LVL134-.Ltext0
	.4byte	.LFE26-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST63:
	.4byte	.LVL136-.Ltext0
	.4byte	.LVL137-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST64:
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL139-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -48
	.4byte	.LVL139-.Ltext0
	.4byte	.LFE27-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST65:
	.4byte	.LVL140-.Ltext0
	.4byte	.LVL145-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST66:
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST67:
	.4byte	.LVL144-.Ltext0
	.4byte	.LVL147-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST68:
	.4byte	.LVL149-.Ltext0
	.4byte	.LVL150-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL150-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST69:
	.4byte	.LVL152-.Ltext0
	.4byte	.LVL153-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL153-.Ltext0
	.4byte	.LFE31-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x1536
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF227
	.byte	0x1
	.4byte	.LASF228
	.4byte	.LASF229
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
	.byte	0x4
	.4byte	0x14c
	.uleb128 0xa
	.4byte	0x174
	.4byte	.LASF43
	.byte	0x4
	.byte	0x3
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF44
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
	.4byte	0x159
	.uleb128 0xc
	.4byte	0x1bc
	.ascii	"RNG\000"
	.byte	0x10
	.byte	0x4
	.byte	0x4
	.uleb128 0xd
	.ascii	"a\000"
	.byte	0x4
	.byte	0x5
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.ascii	"c\000"
	.byte	0x4
	.byte	0x6
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.ascii	"x\000"
	.byte	0x4
	.byte	0x7
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.ascii	"m\000"
	.byte	0x4
	.byte	0x8
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xe
	.ascii	"RNG\000"
	.byte	0x4
	.byte	0x9
	.4byte	0x17f
	.uleb128 0xf
	.4byte	0x1f4
	.byte	0x4
	.byte	0x5
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF45
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF46
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF47
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF48
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF49
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF50
	.sleb128 5
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF51
	.byte	0x5
	.byte	0xb
	.4byte	0x1c7
	.uleb128 0x5
	.4byte	.LASF52
	.byte	0x5
	.byte	0x12
	.4byte	0x20a
	.uleb128 0xa
	.4byte	0x25d
	.4byte	.LASF52
	.byte	0x30
	.byte	0x5
	.byte	0x11
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x5
	.byte	0x1c
	.4byte	0x2b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x5
	.byte	0x1d
	.4byte	0x1f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.ascii	"num\000"
	.byte	0x5
	.byte	0x1e
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x5
	.byte	0x1f
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x5
	.byte	0x20
	.4byte	0x2c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF57
	.byte	0x5
	.byte	0x13
	.4byte	0x268
	.uleb128 0xa
	.4byte	0x2ad
	.4byte	.LASF57
	.byte	0x10
	.byte	0x5
	.byte	0x13
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x5
	.byte	0x16
	.4byte	0x2ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.ascii	"src\000"
	.byte	0x5
	.byte	0x17
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF58
	.byte	0x5
	.byte	0x17
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x5
	.byte	0x18
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x25d
	.uleb128 0x9
	.byte	0x4
	.4byte	0x1ff
	.uleb128 0x9
	.byte	0x4
	.4byte	0x2bf
	.uleb128 0x10
	.4byte	0x14c
	.uleb128 0x7
	.4byte	0x2d4
	.4byte	0x25d
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x1
	.byte	0x0
	.uleb128 0x3
	.4byte	0x311
	.4byte	.LASF60
	.byte	0x4
	.byte	0x2
	.byte	0x12
	.uleb128 0x4
	.4byte	.LASF61
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF62
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF63
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF64
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF65
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF66
	.sleb128 5
	.uleb128 0x4
	.4byte	.LASF67
	.sleb128 6
	.uleb128 0x4
	.4byte	.LASF68
	.sleb128 7
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF60
	.byte	0x2
	.byte	0x1b
	.4byte	0x2d4
	.uleb128 0x3
	.4byte	0x33b
	.4byte	.LASF69
	.byte	0x4
	.byte	0x2
	.byte	0x26
	.uleb128 0x4
	.4byte	.LASF70
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF71
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF72
	.sleb128 2
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF69
	.byte	0x2
	.byte	0x2a
	.4byte	0x31c
	.uleb128 0x3
	.4byte	0x367
	.4byte	.LASF73
	.byte	0x4
	.byte	0x2
	.byte	0x2c
	.uleb128 0x4
	.4byte	.LASF74
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF75
	.sleb128 83
	.uleb128 0x4
	.4byte	.LASF76
	.sleb128 67
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF73
	.byte	0x2
	.byte	0x30
	.4byte	0x346
	.uleb128 0x3
	.4byte	0x3a3
	.4byte	.LASF77
	.byte	0x4
	.byte	0x2
	.byte	0x37
	.uleb128 0x4
	.4byte	.LASF78
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF79
	.sleb128 1
	.uleb128 0x4
	.4byte	.LASF80
	.sleb128 2
	.uleb128 0x4
	.4byte	.LASF81
	.sleb128 3
	.uleb128 0x4
	.4byte	.LASF82
	.sleb128 4
	.uleb128 0x4
	.4byte	.LASF83
	.sleb128 5
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF77
	.byte	0x2
	.byte	0x3e
	.4byte	0x372
	.uleb128 0x3
	.4byte	0x3c7
	.4byte	.LASF84
	.byte	0x4
	.byte	0x2
	.byte	0x40
	.uleb128 0x4
	.4byte	.LASF85
	.sleb128 0
	.uleb128 0x4
	.4byte	.LASF86
	.sleb128 1
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF84
	.byte	0x2
	.byte	0x43
	.4byte	0x3ae
	.uleb128 0xa
	.4byte	0x415
	.4byte	.LASF87
	.byte	0xc
	.byte	0x2
	.byte	0x45
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x46
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x2
	.byte	0x47
	.4byte	0x311
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.ascii	"c1\000"
	.byte	0x2
	.byte	0x48
	.4byte	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.ascii	"c2\000"
	.byte	0x2
	.byte	0x49
	.4byte	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF87
	.byte	0x2
	.byte	0x4a
	.4byte	0x3d2
	.uleb128 0xa
	.4byte	0x463
	.4byte	.LASF89
	.byte	0xc
	.byte	0x2
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x4d
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x2
	.byte	0x4e
	.4byte	0x3c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.ascii	"c1\000"
	.byte	0x2
	.byte	0x4f
	.4byte	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.ascii	"c2\000"
	.byte	0x2
	.byte	0x50
	.4byte	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF89
	.byte	0x2
	.byte	0x51
	.4byte	0x420
	.uleb128 0xa
	.4byte	0x4a5
	.4byte	.LASF90
	.byte	0xc
	.byte	0x2
	.byte	0x53
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x54
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF91
	.byte	0x2
	.byte	0x55
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF92
	.byte	0x2
	.byte	0x56
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF90
	.byte	0x2
	.byte	0x57
	.4byte	0x46e
	.uleb128 0xa
	.4byte	0x4f5
	.4byte	.LASF93
	.byte	0x10
	.byte	0x2
	.byte	0x59
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x5a
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF94
	.byte	0x2
	.byte	0x5b
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF95
	.byte	0x2
	.byte	0x5c
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.4byte	.LASF96
	.byte	0x2
	.byte	0x5d
	.4byte	0x153
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF93
	.byte	0x2
	.byte	0x5e
	.4byte	0x4b0
	.uleb128 0x5
	.4byte	.LASF97
	.byte	0x2
	.byte	0x60
	.4byte	0x50b
	.uleb128 0x11
	.4byte	0x5de
	.4byte	.LASF97
	.2byte	0x4f4
	.byte	0x2
	.byte	0x60
	.uleb128 0xd
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x79
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF98
	.byte	0x2
	.byte	0x7a
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF99
	.byte	0x2
	.byte	0x7b
	.4byte	0x3a3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.4byte	.LASF100
	.byte	0x2
	.byte	0x7c
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.4byte	.LASF101
	.byte	0x2
	.byte	0x7d
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.4byte	.LASF102
	.byte	0x2
	.byte	0x7e
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.4byte	.LASF103
	.byte	0x2
	.byte	0x7f
	.4byte	0x65a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.4byte	.LASF104
	.byte	0x2
	.byte	0x80
	.4byte	0x65a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xb
	.4byte	.LASF105
	.byte	0x2
	.byte	0x81
	.4byte	0x65a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xb
	.4byte	.LASF106
	.byte	0x2
	.byte	0x82
	.4byte	0x65a
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xb
	.4byte	.LASF107
	.byte	0x2
	.byte	0x83
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xb
	.4byte	.LASF108
	.byte	0x2
	.byte	0x84
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xb
	.4byte	.LASF109
	.byte	0x2
	.byte	0x85
	.4byte	0x661
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xb
	.4byte	.LASF110
	.byte	0x2
	.byte	0x86
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x4f0
	.byte	0x0
	.uleb128 0xa
	.4byte	0x607
	.4byte	.LASF111
	.byte	0x8
	.byte	0x2
	.byte	0x62
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x2
	.byte	0x63
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF112
	.byte	0x2
	.byte	0x6a
	.4byte	0x607
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x500
	.uleb128 0x5
	.4byte	.LASF111
	.byte	0x2
	.byte	0x6b
	.4byte	0x5de
	.uleb128 0x5
	.4byte	.LASF113
	.byte	0x6
	.byte	0x3
	.4byte	0x623
	.uleb128 0xa
	.4byte	0x65a
	.4byte	.LASF113
	.byte	0xc
	.byte	0x6
	.byte	0x3
	.uleb128 0xb
	.4byte	.LASF114
	.byte	0x6
	.byte	0xf
	.4byte	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x6
	.byte	0x10
	.4byte	0x2ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.4byte	.LASF115
	.byte	0x6
	.byte	0x11
	.4byte	0x367
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF116
	.byte	0x8
	.byte	0x4
	.uleb128 0x7
	.4byte	0x671
	.4byte	0x618
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x63
	.byte	0x0
	.uleb128 0x11
	.4byte	0x7c0
	.4byte	.LASF117
	.2byte	0x44b8
	.byte	0x2
	.byte	0x89
	.uleb128 0xb
	.4byte	.LASF118
	.byte	0x2
	.byte	0x8a
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xb
	.4byte	.LASF119
	.byte	0x2
	.byte	0x8b
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.4byte	.LASF120
	.byte	0x2
	.byte	0x8c
	.4byte	0x7c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xb
	.4byte	.LASF121
	.byte	0x2
	.byte	0x8d
	.4byte	0x7c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.4byte	.LASF99
	.byte	0x2
	.byte	0x8e
	.4byte	0x33b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xd
	.ascii	"rng\000"
	.byte	0x2
	.byte	0x8f
	.4byte	0x1bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xb
	.4byte	.LASF122
	.byte	0x2
	.byte	0x96
	.4byte	0x7c6
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xb
	.4byte	.LASF123
	.byte	0x2
	.byte	0x97
	.4byte	0x7c6
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0xb
	.4byte	.LASF124
	.byte	0x2
	.byte	0x98
	.4byte	0x7d6
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0xb
	.4byte	.LASF125
	.byte	0x2
	.byte	0x99
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1a4
	.uleb128 0xb
	.4byte	.LASF126
	.byte	0x2
	.byte	0x9a
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1a8
	.uleb128 0xb
	.4byte	.LASF127
	.byte	0x2
	.byte	0x9b
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1ac
	.uleb128 0xb
	.4byte	.LASF128
	.byte	0x2
	.byte	0x9c
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b0
	.uleb128 0xb
	.4byte	.LASF129
	.byte	0x2
	.byte	0x9d
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b4
	.uleb128 0xb
	.4byte	.LASF130
	.byte	0x2
	.byte	0x9e
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b8
	.uleb128 0xb
	.4byte	.LASF131
	.byte	0x2
	.byte	0x9f
	.4byte	0x135
	.byte	0x3
	.byte	0x23
	.uleb128 0x1bc
	.uleb128 0xb
	.4byte	.LASF132
	.byte	0x2
	.byte	0xa1
	.4byte	0x7ec
	.byte	0x3
	.byte	0x23
	.uleb128 0x1c0
	.uleb128 0xb
	.4byte	.LASF133
	.byte	0x2
	.byte	0xa2
	.4byte	0x7ec
	.byte	0x3
	.byte	0x23
	.uleb128 0x1cc0
	.uleb128 0xb
	.4byte	.LASF134
	.byte	0x2
	.byte	0xa3
	.4byte	0x2b3
	.byte	0x3
	.byte	0x23
	.uleb128 0x37c0
	.uleb128 0xb
	.4byte	.LASF135
	.byte	0x2
	.byte	0xa5
	.4byte	0x7fc
	.byte	0x3
	.byte	0x23
	.uleb128 0x37c4
	.uleb128 0xb
	.4byte	.LASF136
	.byte	0x2
	.byte	0xa6
	.4byte	0x7fc
	.byte	0x3
	.byte	0x23
	.uleb128 0x3bc4
	.uleb128 0xb
	.4byte	.LASF137
	.byte	0x2
	.byte	0xa8
	.4byte	0x80c
	.byte	0x3
	.byte	0x23
	.uleb128 0x3fc4
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x174
	.uleb128 0x7
	.4byte	0x7d6
	.4byte	0x135
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x4
	.byte	0x0
	.uleb128 0x7
	.4byte	0x7ec
	.4byte	0x135
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x4
	.uleb128 0x8
	.4byte	0x2c
	.byte	0xf
	.byte	0x0
	.uleb128 0x7
	.4byte	0x7fc
	.4byte	0x1ff
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x8f
	.byte	0x0
	.uleb128 0x7
	.4byte	0x80c
	.4byte	0x367
	.uleb128 0x8
	.4byte	0x2c
	.byte	0xff
	.byte	0x0
	.uleb128 0x7
	.4byte	0x81c
	.4byte	0x500
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF117
	.byte	0x2
	.byte	0xa9
	.4byte	0x671
	.uleb128 0x2
	.4byte	.LASF138
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF139
	.byte	0x2
	.byte	0x5
	.uleb128 0x12
	.4byte	0x873
	.byte	0x1
	.4byte	.LASF140
	.byte	0x1
	.byte	0xd4
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xd4
	.4byte	0x873
	.4byte	.LLST0
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0x1
	.byte	0xd5
	.4byte	0x879
	.uleb128 0x14
	.4byte	.LASF121
	.byte	0x1
	.byte	0xd6
	.4byte	0x879
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x81c
	.uleb128 0x9
	.byte	0x4
	.4byte	0x415
	.uleb128 0x12
	.4byte	0x8d0
	.byte	0x1
	.4byte	.LASF141
	.byte	0x1
	.byte	0xc6
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xc6
	.4byte	0x873
	.4byte	.LLST1
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0x1
	.byte	0xc7
	.4byte	0x8d0
	.uleb128 0x15
	.4byte	.LASF144
	.byte	0x1
	.byte	0xc8
	.4byte	0x8d0
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LASF91
	.byte	0x1
	.byte	0xca
	.4byte	0x135
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4a5
	.uleb128 0x12
	.4byte	0x918
	.byte	0x1
	.4byte	.LASF145
	.byte	0x1
	.byte	0xe2
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xe2
	.4byte	0x873
	.4byte	.LLST4
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0x1
	.byte	0xe3
	.4byte	0x918
	.uleb128 0x15
	.4byte	.LASF121
	.byte	0x1
	.byte	0xe4
	.4byte	0x918
	.4byte	.LLST5
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x4f5
	.uleb128 0x12
	.4byte	0x95c
	.byte	0x1
	.4byte	.LASF146
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xec
	.4byte	0x873
	.4byte	.LLST6
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0x1
	.byte	0xed
	.4byte	0x918
	.uleb128 0x14
	.4byte	.LASF121
	.byte	0x1
	.byte	0xee
	.4byte	0x7c0
	.byte	0x0
	.uleb128 0x16
	.4byte	0x996
	.byte	0x1
	.4byte	.LASF147
	.byte	0x1
	.2byte	0x112
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x112
	.4byte	0x873
	.4byte	.LLST7
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x113
	.4byte	0x996
	.4byte	.LLST8
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x60d
	.uleb128 0x16
	.4byte	0x9d6
	.byte	0x1
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x127
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x127
	.4byte	0x873
	.4byte	.LLST9
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x128
	.4byte	0x9d6
	.4byte	.LLST10
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x463
	.uleb128 0x16
	.4byte	0xa38
	.byte	0x1
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x131
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x131
	.4byte	0x873
	.4byte	.LLST11
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x132
	.4byte	0x879
	.uleb128 0x18
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x136
	.4byte	0x135
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x19
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x13a
	.4byte	0x135
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.4byte	0xa96
	.byte	0x1
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x14c
	.byte	0x1
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x14c
	.4byte	0x873
	.4byte	.LLST13
	.uleb128 0x19
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x14d
	.4byte	0x879
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x14e
	.4byte	0x879
	.uleb128 0x19
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x152
	.4byte	0x135
	.uleb128 0x18
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x153
	.4byte	0x135
	.4byte	.LLST14
	.byte	0x0
	.uleb128 0x16
	.4byte	0xacc
	.byte	0x1
	.4byte	.LASF153
	.byte	0x1
	.2byte	0x2cf
	.byte	0x1
	.4byte	.LFB28
	.4byte	.LFE28
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x2cf
	.4byte	0x607
	.byte	0x1
	.byte	0x50
	.uleb128 0x1b
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x2cf
	.4byte	0x135
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x12
	.4byte	0xb0a
	.byte	0x1
	.4byte	.LASF155
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xfa
	.4byte	0x873
	.4byte	.LLST15
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0x1
	.byte	0xfb
	.4byte	0x918
	.uleb128 0x14
	.4byte	.LASF121
	.byte	0x1
	.byte	0xfc
	.4byte	0x7c0
	.byte	0x0
	.uleb128 0x12
	.4byte	0xb7d
	.byte	0x1
	.4byte	.LASF156
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0x6e
	.4byte	0x873
	.4byte	.LLST16
	.uleb128 0x14
	.4byte	.LASF157
	.byte	0x1
	.byte	0x6f
	.4byte	0x135
	.uleb128 0x15
	.4byte	.LASF91
	.byte	0x1
	.byte	0x89
	.4byte	0x135
	.4byte	.LLST17
	.uleb128 0x15
	.4byte	.LASF150
	.byte	0x1
	.byte	0x99
	.4byte	0x135
	.4byte	.LLST18
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0x135
	.uleb128 0x1a
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x15
	.4byte	.LASF158
	.byte	0x1
	.byte	0x8f
	.4byte	0x135
	.4byte	.LLST19
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.4byte	0xbe4
	.byte	0x1
	.4byte	.LASF159
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x13
	.4byte	.LASF142
	.byte	0x1
	.byte	0xa3
	.4byte	0x873
	.4byte	.LLST20
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0x1
	.byte	0xa4
	.4byte	0x8d0
	.uleb128 0x1d
	.4byte	.LASF91
	.byte	0x1
	.byte	0xb0
	.4byte	0x135
	.byte	0x1
	.byte	0x57
	.uleb128 0x1d
	.4byte	.LASF92
	.byte	0x1
	.byte	0xb1
	.4byte	0x135
	.byte	0x1
	.byte	0x56
	.uleb128 0x1d
	.4byte	.LASF158
	.byte	0x1
	.byte	0xb7
	.4byte	0x135
	.byte	0x1
	.byte	0x54
	.uleb128 0x1d
	.4byte	.LASF160
	.byte	0x1
	.byte	0xb8
	.4byte	0x135
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x16
	.4byte	0xc26
	.byte	0x1
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x106
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x106
	.4byte	0x873
	.4byte	.LLST21
	.uleb128 0x19
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x107
	.4byte	0x918
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x108
	.4byte	0x7c0
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xcb4
	.byte	0x1
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x1f0
	.byte	0x1
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LLST22
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x1f0
	.4byte	0x873
	.4byte	.LLST23
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1f0
	.4byte	0x607
	.4byte	.LLST24
	.uleb128 0x1f
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x1f2
	.4byte	0x65a
	.byte	0x6
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x18
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x1f5
	.4byte	0x135
	.4byte	.LLST25
	.uleb128 0x18
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1f6
	.4byte	0x135
	.4byte	.LLST26
	.uleb128 0x18
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x1f7
	.4byte	0x135
	.4byte	.LLST27
	.uleb128 0x18
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x1f8
	.4byte	0x135
	.4byte	.LLST28
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xcef
	.byte	0x1
	.4byte	.LASF168
	.byte	0x1
	.2byte	0x17c
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LLST29
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x17c
	.4byte	0x873
	.4byte	.LLST30
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x17c
	.4byte	0x607
	.4byte	.LLST31
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xd3a
	.byte	0x1
	.4byte	.LASF169
	.byte	0x1
	.2byte	0x18d
	.byte	0x1
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LLST32
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x18d
	.4byte	0x873
	.4byte	.LLST33
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x18d
	.4byte	0x607
	.4byte	.LLST34
	.uleb128 0x18
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x193
	.4byte	0x135
	.4byte	.LLST35
	.byte	0x0
	.uleb128 0x16
	.4byte	0xdaa
	.byte	0x1
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x1a8
	.byte	0x1
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x873
	.4byte	.LLST36
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x607
	.4byte	.LLST37
	.uleb128 0x18
	.4byte	.LASF171
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x135
	.4byte	.LLST38
	.uleb128 0x20
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x18
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x1ad
	.4byte	0x135
	.4byte	.LLST39
	.uleb128 0x18
	.4byte	.LASF172
	.byte	0x1
	.2byte	0x1ae
	.4byte	0x135
	.4byte	.LLST40
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xe12
	.byte	0x1
	.4byte	.LASF173
	.byte	0x1
	.2byte	0x1bb
	.byte	0x1
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LLST41
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x873
	.4byte	.LLST42
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x607
	.4byte	.LLST43
	.uleb128 0x1f
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x65a
	.byte	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x19
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x1bd
	.4byte	0x65a
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x1ca
	.4byte	0x135
	.4byte	.LLST44
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xe4d
	.byte	0x1
	.4byte	.LASF176
	.byte	0x1
	.2byte	0x1d8
	.byte	0x1
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LLST45
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x873
	.4byte	.LLST46
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x607
	.4byte	.LLST47
	.byte	0x0
	.uleb128 0x22
	.4byte	0xe9b
	.byte	0x1
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x1e1
	.byte	0x1
	.4byte	0x2b3
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x873
	.4byte	.LLST48
	.uleb128 0x18
	.4byte	.LASF178
	.byte	0x1
	.2byte	0x1e2
	.4byte	0x135
	.4byte	.LLST49
	.uleb128 0x18
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x135
	.4byte	.LLST50
	.byte	0x0
	.uleb128 0x16
	.4byte	0xee5
	.byte	0x1
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x19f
	.byte	0x1
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x19f
	.4byte	0x873
	.4byte	.LLST51
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x19f
	.4byte	0x607
	.4byte	.LLST52
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x1a0
	.4byte	0x2b3
	.4byte	.LLST53
	.byte	0x0
	.uleb128 0x1e
	.4byte	0xf30
	.byte	0x1
	.4byte	.LASF180
	.byte	0x1
	.2byte	0x182
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LLST54
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x182
	.4byte	0x873
	.4byte	.LLST55
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x182
	.4byte	0x607
	.4byte	.LLST56
	.uleb128 0x18
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x183
	.4byte	0x2b3
	.4byte	.LLST57
	.byte	0x0
	.uleb128 0x16
	.4byte	0xf6a
	.byte	0x1
	.4byte	.LASF181
	.byte	0x1
	.2byte	0x15e
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x15e
	.4byte	0x873
	.4byte	.LLST58
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x15e
	.4byte	0x607
	.4byte	.LLST59
	.byte	0x0
	.uleb128 0x23
	.4byte	0xfbd
	.byte	0x1
	.4byte	.LASF182
	.byte	0x1
	.byte	0xa
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST60
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0xfcd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.1874
	.uleb128 0x1d
	.4byte	.LASF142
	.byte	0x1
	.byte	0xc
	.4byte	0x81c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1d
	.4byte	.LASF184
	.byte	0x1
	.byte	0xe
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.uleb128 0x20
	.4byte	.Ldebug_ranges0+0x20
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x135
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0xfcd
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x11
	.byte	0x0
	.uleb128 0x10
	.4byte	0xfbd
	.uleb128 0x25
	.4byte	0x104c
	.byte	0x1
	.4byte	.LASF185
	.byte	0x1
	.2byte	0x20c
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LLST61
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0x105c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2275
	.uleb128 0x19
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x20e
	.4byte	0x135
	.uleb128 0x1f
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x210
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x211
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x212
	.4byte	0x7c0
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x213
	.4byte	0x7c0
	.uleb128 0x1f
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x214
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x7
	.4byte	0x105c
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x16
	.byte	0x0
	.uleb128 0x10
	.4byte	0x104c
	.uleb128 0x25
	.4byte	0x115f
	.byte	0x1
	.4byte	.LASF189
	.byte	0x1
	.2byte	0x227
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LLST62
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0x116f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2294
	.uleb128 0x19
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x22a
	.4byte	0x135
	.uleb128 0x1f
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x22d
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 56
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x22e
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 40
	.uleb128 0x19
	.4byte	.LASF190
	.byte	0x1
	.2byte	0x22f
	.4byte	0x879
	.uleb128 0x19
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x230
	.4byte	0x879
	.uleb128 0x1f
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x231
	.4byte	0x135
	.byte	0x3
	.byte	0x7d
	.sleb128 72
	.uleb128 0x19
	.4byte	.LASF192
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x18
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.4byte	.LLST63
	.uleb128 0x19
	.4byte	.LASF193
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF194
	.byte	0x1
	.2byte	0x232
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF195
	.byte	0x1
	.2byte	0x233
	.4byte	0x135
	.uleb128 0x1f
	.4byte	.LASF196
	.byte	0x1
	.2byte	0x237
	.4byte	0x7c6
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x1f
	.4byte	.LASF197
	.byte	0x1
	.2byte	0x238
	.4byte	0x7c6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x116f
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x18
	.byte	0x0
	.uleb128 0x10
	.4byte	0x115f
	.uleb128 0x25
	.4byte	0x1250
	.byte	0x1
	.4byte	.LASF198
	.byte	0x1
	.2byte	0x28d
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LLST64
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0x1260
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2358
	.uleb128 0x1f
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x290
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 28
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x291
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.uleb128 0x19
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x292
	.4byte	0x8d0
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x293
	.4byte	0x7c0
	.uleb128 0x19
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x294
	.4byte	0x14c
	.uleb128 0x1f
	.4byte	.LASF193
	.byte	0x1
	.2byte	0x295
	.4byte	0x14c
	.byte	0x2
	.byte	0x7d
	.sleb128 47
	.uleb128 0x1f
	.4byte	.LASF194
	.byte	0x1
	.2byte	0x296
	.4byte	0x14c
	.byte	0x2
	.byte	0x7d
	.sleb128 46
	.uleb128 0x1f
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x297
	.4byte	0x135
	.byte	0x1
	.byte	0x59
	.uleb128 0x19
	.4byte	.LASF199
	.byte	0x1
	.2byte	0x298
	.4byte	0x82e
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x29c
	.4byte	0x135
	.4byte	.LLST65
	.uleb128 0x1a
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x18
	.4byte	.LASF200
	.byte	0x1
	.2byte	0x2b1
	.4byte	0x25
	.4byte	.LLST66
	.uleb128 0x18
	.4byte	.LASF201
	.byte	0x1
	.2byte	0x2b2
	.4byte	0x25
	.4byte	.LLST67
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x1260
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x17
	.byte	0x0
	.uleb128 0x10
	.4byte	0x1250
	.uleb128 0x26
	.byte	0x1
	.4byte	.LASF230
	.byte	0x1
	.2byte	0x2fe
	.4byte	.LFB30
	.4byte	.LFE30
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x25
	.4byte	0x12e7
	.byte	0x1
	.4byte	.LASF202
	.byte	0x1
	.2byte	0x2dd
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LLST68
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0x12e7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2409
	.uleb128 0x1f
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x2df
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x2e0
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x2e1
	.4byte	0x7c0
	.uleb128 0x19
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x2e2
	.4byte	0x9d6
	.uleb128 0x1f
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x2e3
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x10
	.4byte	0x1250
	.uleb128 0x25
	.4byte	0x137e
	.byte	0x1
	.4byte	.LASF203
	.byte	0x1
	.2byte	0x308
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LLST69
	.uleb128 0x24
	.4byte	.LASF183
	.4byte	0x137e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2431
	.uleb128 0x19
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x30b
	.4byte	0x135
	.uleb128 0x1f
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x30e
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x1f
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x30f
	.4byte	0x13c
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x19
	.4byte	.LASF204
	.byte	0x1
	.2byte	0x310
	.4byte	0x879
	.uleb128 0x19
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x311
	.4byte	0x879
	.uleb128 0x19
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x312
	.4byte	0x14c
	.uleb128 0x19
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x312
	.4byte	0x14c
	.uleb128 0x1f
	.4byte	.LASF195
	.byte	0x1
	.2byte	0x313
	.4byte	0x135
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x10
	.4byte	0x1250
	.uleb128 0x27
	.4byte	.LASF205
	.byte	0x7
	.byte	0x9
	.4byte	0x138f
	.sleb128 -1
	.uleb128 0x10
	.4byte	0x135
	.uleb128 0x27
	.4byte	.LASF206
	.byte	0x7
	.byte	0xa
	.4byte	0x138f
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x13b0
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF207
	.byte	0x2
	.byte	0xb
	.4byte	0x13c1
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_NAME
	.uleb128 0x10
	.4byte	0x13a0
	.uleb128 0x7
	.4byte	0x13d6
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF208
	.byte	0x2
	.byte	0xc
	.4byte	0x13e7
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_COMMAND_SERVER_NAME
	.uleb128 0x10
	.4byte	0x13c6
	.uleb128 0x7
	.4byte	0x13fc
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF209
	.byte	0x2
	.byte	0xd
	.4byte	0x140d
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_TIMER_NAME
	.uleb128 0x10
	.4byte	0x13ec
	.uleb128 0x7
	.4byte	0x1422
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1d
	.4byte	.LASF210
	.byte	0x2
	.byte	0xe
	.4byte	0x1433
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SWITCH_MASTER_NAME
	.uleb128 0x10
	.4byte	0x1412
	.uleb128 0x28
	.4byte	.LASF211
	.byte	0x2
	.byte	0x10
	.4byte	0x138f
	.byte	0x10
	.uleb128 0x7
	.4byte	0x145a
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF212
	.byte	0x2
	.byte	0x6d
	.4byte	0x1465
	.uleb128 0x10
	.4byte	0x1444
	.uleb128 0x27
	.4byte	.LASF213
	.byte	0x8
	.byte	0x7
	.4byte	0x138f
	.sleb128 -1
	.uleb128 0x27
	.4byte	.LASF214
	.byte	0x8
	.byte	0x8
	.4byte	0x138f
	.sleb128 -2
	.uleb128 0x27
	.4byte	.LASF215
	.byte	0x8
	.byte	0x9
	.4byte	0x138f
	.sleb128 -3
	.uleb128 0x27
	.4byte	.LASF216
	.byte	0x8
	.byte	0xa
	.4byte	0x138f
	.sleb128 -1
	.uleb128 0x27
	.4byte	.LASF217
	.byte	0x8
	.byte	0xb
	.4byte	0x138f
	.sleb128 -2
	.uleb128 0x28
	.4byte	.LASF218
	.byte	0x8
	.byte	0xc
	.4byte	0x138f
	.byte	0x3
	.uleb128 0x27
	.4byte	.LASF219
	.byte	0x8
	.byte	0xd
	.4byte	0x138f
	.sleb128 -1
	.uleb128 0x27
	.4byte	.LASF220
	.byte	0x8
	.byte	0xe
	.4byte	0x138f
	.sleb128 -2
	.uleb128 0x27
	.4byte	.LASF221
	.byte	0x8
	.byte	0xf
	.4byte	0x138f
	.sleb128 -3
	.uleb128 0x27
	.4byte	.LASF222
	.byte	0x8
	.byte	0x10
	.4byte	0x138f
	.sleb128 -4
	.uleb128 0x29
	.4byte	.LASF223
	.byte	0x8
	.byte	0x11
	.4byte	0x14f6
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x10
	.4byte	0x65a
	.uleb128 0x7
	.4byte	0x1511
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF224
	.byte	0x9
	.byte	0x27
	.4byte	0x151c
	.uleb128 0x10
	.4byte	0x14fb
	.uleb128 0x27
	.4byte	.LASF225
	.byte	0xa
	.byte	0x5
	.4byte	0x138f
	.sleb128 -1
	.uleb128 0x27
	.4byte	.LASF226
	.byte	0xa
	.byte	0x6
	.4byte	0x138f
	.sleb128 -2
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xf
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
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
	.uleb128 0x6
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
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x423
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x153a
	.4byte	0x835
	.ascii	"TrainServer_HandleSwitchData\000"
	.4byte	0x87f
	.ascii	"TrainServer_HandleSensorQuery\000"
	.4byte	0x8d6
	.ascii	"TrainServer_HandleSwitchQuery\000"
	.4byte	0x91e
	.ascii	"TrainServer_HandleSelectTrack\000"
	.4byte	0x95c
	.ascii	"TrainServer_HandleQueryTrainEngine\000"
	.4byte	0x99c
	.ascii	"TrainServer_HandleTrainEngineClientCommandRequest\000"
	.4byte	0x9dc
	.ascii	"TrainServer_HandleGetSwitchRequest\000"
	.4byte	0xa38
	.ascii	"TrainServer_HandleSetSwitch\000"
	.4byte	0xa96
	.ascii	"TrainEngine_Initialize\000"
	.4byte	0xacc
	.ascii	"TrainServer_HandleSetTrain\000"
	.4byte	0xb0a
	.ascii	"TrainServer_Initialize\000"
	.4byte	0xb7d
	.ascii	"TrainServer_HandleSensorReaderData\000"
	.4byte	0xbe4
	.ascii	"TrainServer_HandleSetDestination\000"
	.4byte	0xc26
	.ascii	"TrainServer_ProcessEngineCalibratingSpeed\000"
	.4byte	0xcb4
	.ascii	"TrainServer_ProcessEngineIdle\000"
	.4byte	0xcef
	.ascii	"TrainServer_ProcessEngineFoundStartingPosition\000"
	.4byte	0xd3a
	.ascii	"TrainServer_QueueSwitchStates\000"
	.4byte	0xdaa
	.ascii	"TrainServer_ProcessSensorData\000"
	.4byte	0xe12
	.ascii	"TrainServer_ProcessEngineAtDestination\000"
	.4byte	0xe4d
	.ascii	"TrainServer_GetEnginePosition\000"
	.4byte	0xe9b
	.ascii	"TrainServer_ProcessEngineRunning\000"
	.4byte	0xee5
	.ascii	"TrainServer_ProcessEngineFindingPosition\000"
	.4byte	0xf30
	.ascii	"TrainServer_ProcessEngine\000"
	.4byte	0xf6a
	.ascii	"TrainServer_Start\000"
	.4byte	0xfd2
	.ascii	"TrainServerTimer_Start\000"
	.4byte	0x1061
	.ascii	"TrainCommandServer_Start\000"
	.4byte	0x1174
	.ascii	"TrainSensorReader_Start\000"
	.4byte	0x1265
	.ascii	"TrainEngine_SetInitialSwitches\000"
	.4byte	0x1279
	.ascii	"TrainEngineClient_Start\000"
	.4byte	0x12ec
	.ascii	"TrainSwitchMaster_Start\000"
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
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF184:
	.ascii	"admin_tid\000"
.LASF65:
	.ascii	"TRAIN_SWITCH\000"
.LASF227:
	.ascii	"GNU C 4.0.2\000"
.LASF141:
	.ascii	"TrainServer_HandleSensorQuery\000"
.LASF51:
	.ascii	"node_type\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF148:
	.ascii	"TrainServer_HandleTrainEngineClientCommandRequest\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF64:
	.ascii	"TRAIN_REVERSE\000"
.LASF194:
	.ascii	"upper\000"
.LASF74:
	.ascii	"SWITCH_UNKNOWN\000"
.LASF182:
	.ascii	"TrainServer_Start\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF159:
	.ascii	"TrainServer_HandleSensorReaderData\000"
.LASF129:
	.ascii	"blocked_tid\000"
.LASF121:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF80:
	.ascii	"TRAIN_ENGINE_FOUND_STARTING_POSITION\000"
.LASF151:
	.ascii	"direction_code\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF130:
	.ascii	"train_server_timer_tid\000"
.LASF200:
	.ascii	"upper_word\000"
.LASF89:
	.ascii	"TrainEngineClientMessage\000"
.LASF125:
	.ascii	"source_tid\000"
.LASF223:
	.ascii	"TICK_SIZE\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF202:
	.ascii	"TrainEngineClient_Start\000"
.LASF87:
	.ascii	"TrainCommandMessage\000"
.LASF6:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF220:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF230:
	.ascii	"TrainEngine_SetInitialSwitches\000"
.LASF192:
	.ascii	"speed\000"
.LASF193:
	.ascii	"lower\000"
.LASF224:
	.ascii	"TASK_STATE_NAMES\000"
.LASF55:
	.ascii	"reverse\000"
.LASF63:
	.ascii	"TRAIN_SPEED\000"
.LASF106:
	.ascii	"actual_time_at_last_sensor\000"
.LASF107:
	.ascii	"distance_to_next_sensor\000"
.LASF217:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF136:
	.ascii	"queued_switch_states\000"
.LASF45:
	.ascii	"NODE_NONE\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF207:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF132:
	.ascii	"track_a_nodes\000"
.LASF195:
	.ascii	"train_server_tid\000"
.LASF165:
	.ascii	"t_12\000"
.LASF135:
	.ascii	"switch_states\000"
.LASF69:
	.ascii	"TrainServerState\000"
.LASF142:
	.ascii	"server\000"
.LASF176:
	.ascii	"TrainServer_ProcessEngineAtDestination\000"
.LASF203:
	.ascii	"TrainSwitchMaster_Start\000"
.LASF60:
	.ascii	"TrainCommand\000"
.LASF222:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF98:
	.ascii	"train_num\000"
.LASF44:
	.ascii	"message_type\000"
.LASF50:
	.ascii	"NODE_EXIT\000"
.LASF186:
	.ascii	"send_buffer\000"
.LASF81:
	.ascii	"TRAIN_ENGINE_RUNNING\000"
.LASF215:
	.ascii	"ERR_K_DEFAULT\000"
.LASF197:
	.ascii	"upper_buffer\000"
.LASF199:
	.ascii	"shutdown\000"
.LASF174:
	.ascii	"time\000"
.LASF211:
	.ascii	"LIGHTS_MASK\000"
.LASF73:
	.ascii	"SwitchState\000"
.LASF57:
	.ascii	"track_edge\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF59:
	.ascii	"dist\000"
.LASF160:
	.ascii	"current_time\000"
.LASF178:
	.ascii	"sensor_module\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF126:
	.ascii	"num_child_task_running\000"
.LASF196:
	.ascii	"lower_buffer\000"
.LASF83:
	.ascii	"TRAIN_ENGINE_CALIBRATING_SPEED\000"
.LASF164:
	.ascii	"t_11\000"
.LASF156:
	.ascii	"TrainServer_Initialize\000"
.LASF111:
	.ascii	"TrainEngineStatusMessage\000"
.LASF180:
	.ascii	"TrainServer_ProcessEngineFindingPosition\000"
.LASF157:
	.ascii	"return_code\000"
.LASF161:
	.ascii	"TrainServer_HandleSetDestination\000"
.LASF56:
	.ascii	"edge\000"
.LASF79:
	.ascii	"TRAIN_ENGINE_FINDING_POSITION\000"
.LASF158:
	.ascii	"sensor_num\000"
.LASF150:
	.ascii	"switch_num\000"
.LASF4:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF166:
	.ascii	"t_21\000"
.LASF167:
	.ascii	"t_22\000"
.LASF112:
	.ascii	"train_engine\000"
.LASF42:
	.ascii	"MessageType\000"
.LASF201:
	.ascii	"lower_word\000"
.LASF5:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF41:
	.ascii	"char\000"
.LASF68:
	.ascii	"TRAIN_GET_CACHED_SENSOR_DATA\000"
.LASF145:
	.ascii	"TrainServer_HandleSwitchQuery\000"
.LASF48:
	.ascii	"NODE_MERGE\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF94:
	.ascii	"int1\000"
.LASF95:
	.ascii	"int2\000"
.LASF173:
	.ascii	"TrainServer_ProcessSensorData\000"
.LASF134:
	.ascii	"current_track_nodes\000"
.LASF146:
	.ascii	"TrainServer_HandleSelectTrack\000"
.LASF118:
	.ascii	"receive_buffer\000"
.LASF96:
	.ascii	"char1\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF219:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF149:
	.ascii	"TrainServer_HandleGetSwitchRequest\000"
.LASF97:
	.ascii	"TrainEngine\000"
.LASF155:
	.ascii	"TrainServer_HandleSetTrain\000"
.LASF101:
	.ascii	"next_node\000"
.LASF90:
	.ascii	"TrainSensorMessage\000"
.LASF190:
	.ascii	"command_receive_message\000"
.LASF113:
	.ascii	"RouteNodeInfo\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF77:
	.ascii	"TrainEngineState\000"
.LASF76:
	.ascii	"SWITCH_CURVED\000"
.LASF115:
	.ascii	"switch_state\000"
.LASF127:
	.ascii	"train_command_server_tid\000"
.LASF109:
	.ascii	"route_node_info\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF198:
	.ascii	"TrainSensorReader_Start\000"
.LASF78:
	.ascii	"TRAIN_ENGINE_IDLE\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF212:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF88:
	.ascii	"command\000"
.LASF72:
	.ascii	"TRAIN_SERVER_BLOCK_UNTIL_SENSOR\000"
.LASF108:
	.ascii	"destination_node\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF128:
	.ascii	"train_sensor_reader_tid\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF140:
	.ascii	"TrainServer_HandleSwitchData\000"
.LASF208:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF61:
	.ascii	"TRAIN_STOP\000"
.LASF204:
	.ascii	"command_send_message\000"
.LASF93:
	.ascii	"GenericTrainMessage\000"
.LASF122:
	.ascii	"sensor_bit_flags\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF92:
	.ascii	"sensor_bit_flag\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF105:
	.ascii	"expected_time_at_last_sensor\000"
.LASF225:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF153:
	.ascii	"TrainEngine_Initialize\000"
.LASF85:
	.ascii	"TRAIN_ENGINE_CLIENT_DO_NOTHING\000"
.LASF100:
	.ascii	"current_node\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF172:
	.ascii	"next_switch_state\000"
.LASF52:
	.ascii	"track_node\000"
.LASF154:
	.ascii	"engine\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF183:
	.ascii	"__func__\000"
.LASF229:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF139:
	.ascii	"short int\000"
.LASF218:
	.ascii	"NAMESERVER_TID\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF104:
	.ascii	"expected_time_at_next_sensor\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF119:
	.ascii	"reply_buffer\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF228:
	.ascii	"train.c\000"
.LASF169:
	.ascii	"TrainServer_ProcessEngineFoundStartingPosition\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF206:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF114:
	.ascii	"node\000"
.LASF185:
	.ascii	"TrainServerTimer_Start\000"
.LASF123:
	.ascii	"new_sensor_bit_flags_for_ui\000"
.LASF152:
	.ascii	"TrainServer_HandleSetSwitch\000"
.LASF103:
	.ascii	"calculated_speed\000"
.LASF70:
	.ascii	"TRAIN_SERVER_IDLE\000"
.LASF84:
	.ascii	"TrainEngineClientCommand\000"
.LASF171:
	.ascii	"current_route_node_index\000"
.LASF53:
	.ascii	"name\000"
.LASF66:
	.ascii	"TRAIN_READ_SENSOR\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF133:
	.ascii	"track_b_nodes\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF189:
	.ascii	"TrainCommandServer_Start\000"
.LASF210:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF179:
	.ascii	"TrainServer_ProcessEngineRunning\000"
.LASF43:
	.ascii	"GenericMessage\000"
.LASF137:
	.ascii	"train_engines\000"
.LASF226:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF99:
	.ascii	"state\000"
.LASF7:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF214:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF54:
	.ascii	"type\000"
.LASF102:
	.ascii	"speed_setting\000"
.LASF138:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF175:
	.ascii	"time_difference\000"
.LASF62:
	.ascii	"TRAIN_GO\000"
.LASF170:
	.ascii	"TrainServer_QueueSwitchStates\000"
.LASF213:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF205:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF216:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF82:
	.ascii	"TRAIN_ENGINE_AT_DESTINATION\000"
.LASF143:
	.ascii	"recv_sensor_message\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF187:
	.ascii	"send_message\000"
.LASF110:
	.ascii	"route_node_index\000"
.LASF188:
	.ascii	"server_tid\000"
.LASF144:
	.ascii	"reply_sensor_message\000"
.LASF91:
	.ascii	"module_num\000"
.LASF163:
	.ascii	"difference\000"
.LASF181:
	.ascii	"TrainServer_ProcessEngine\000"
.LASF147:
	.ascii	"TrainServer_HandleQueryTrainEngine\000"
.LASF177:
	.ascii	"TrainServer_GetEnginePosition\000"
.LASF2:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF46:
	.ascii	"NODE_SENSOR\000"
.LASF209:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF124:
	.ascii	"sensor_time_log\000"
.LASF191:
	.ascii	"command_reply_message\000"
.LASF75:
	.ascii	"SWITCH_STRAIGHT\000"
.LASF8:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF116:
	.ascii	"double\000"
.LASF168:
	.ascii	"TrainServer_ProcessEngineIdle\000"
.LASF117:
	.ascii	"TrainServer\000"
.LASF221:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF71:
	.ascii	"TRAIN_SERVER_SHUTDOWN\000"
.LASF67:
	.ascii	"TRAIN_CACHE_ALL_SENSORS\000"
.LASF120:
	.ascii	"receive_message\000"
.LASF162:
	.ascii	"TrainServer_ProcessEngineCalibratingSpeed\000"
.LASF47:
	.ascii	"NODE_BRANCH\000"
.LASF58:
	.ascii	"dest\000"
.LASF49:
	.ascii	"NODE_ENTER\000"
.LASF86:
	.ascii	"TRAIN_ENGINE_CLIENT_SET_SPEED\000"
.LASF131:
	.ascii	"switch_master_tid\000"
	.ident	"GCC: (GNU) 4.0.2"
