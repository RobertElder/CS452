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
	.loc 1 220 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 224 0
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	.loc 1 222 0
	add	ip, r0, #16
	.loc 1 224 0
	cmp	r3, #34
	.loc 1 225 0
	ldreqb	r1, [r0, #9]	@ zero_extendqisi2
	.loc 1 227 0
	ldrneb	r3, [r0, #9]	@ zero_extendqisi2
	.loc 1 225 0
	ldreq	r3, .L6
	.loc 1 227 0
	ldrne	r2, .L6
	.loc 1 225 0
	addeq	r1, r0, r1, asl #2
	.loc 1 227 0
	addne	r3, r0, r3, asl #2
	.loc 1 225 0
	moveq	r2, #67
	.loc 1 227 0
	movne	r1, #83
	.loc 1 231 0
	ldr	r0, [r0, #420]
.LVL1:
	.loc 1 225 0
	streq	r2, [r1, r3]
	.loc 1 227 0
	strne	r1, [r3, r2]
	.loc 1 230 0
	mov	r3, #10
	.loc 1 231 0
	mov	r1, ip
	mov	r2, #16
	.loc 1 220 0
	@ lr needed for prologue
	.loc 1 230 0
	str	r3, [ip, #0]
	.loc 1 232 0
	.loc 1 231 0
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
	.loc 1 206 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 210 0
	ldr	ip, [r0, #4]
.LVL3:
	.loc 1 208 0
	add	r1, r0, #16
.LVL4:
	.loc 1 212 0
	add	ip, r0, ip, asl #2
.LVL5:
	ldr	r3, [ip, #80]
	.loc 1 213 0
	mov	r2, #0
	.loc 1 212 0
	str	r3, [r1, #8]
	.loc 1 215 0
	mov	r3, #10
	str	r3, [r0, #16]
	.loc 1 217 0
	ldr	r0, [r0, #420]
.LVL6:
	.loc 1 213 0
	str	r2, [ip, #80]
	.loc 1 217 0
	add	r2, r2, #16
	.loc 1 206 0
	@ lr needed for prologue
	.loc 1 218 0
	.loc 1 217 0
	b	Reply(PLT)
.LVL7:
.LFE5:
	.size	TrainServer_HandleSensorQuery, .-TrainServer_HandleSensorQuery
	.align	2
	.global	TrainServer_HandleSwitchQuery
	.type	TrainServer_HandleSwitchQuery, %function
TrainServer_HandleSwitchQuery:
.LFB7:
	.loc 1 234 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 238 0
	ldr	r3, [r0, #4]
	ldr	r2, .L12
	add	r3, r0, r3, asl #2
	ldr	ip, [r3, r2]
	.loc 1 236 0
	add	r1, r0, #16
.LVL9:
	.loc 1 238 0
	str	ip, [r1, #4]
	.loc 1 240 0
	mov	r3, #10
	str	r3, [r0, #16]
	.loc 1 241 0
	ldr	r0, [r0, #420]
.LVL10:
	mov	r2, #16
	.loc 1 234 0
	@ lr needed for prologue
	.loc 1 242 0
	.loc 1 241 0
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
	.loc 1 244 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL12:
	.loc 1 248 0
	ldr	r3, [r0, #4]
	.loc 1 249 0
	add	ip, r0, #448
	.loc 1 248 0
	cmp	r3, #65
	.loc 1 251 0
	add	r2, r0, #7360
	.loc 1 249 0
	moveq	r3, #14272
	.loc 1 251 0
	movne	r3, #14272
	strne	r2, [r0, r3]
	.loc 1 246 0
	add	r1, r0, #16
	.loc 1 249 0
	streq	ip, [r0, r3]
	.loc 1 255 0
	ldr	r0, [r0, #420]
.LVL13:
	.loc 1 254 0
	mov	r3, #10
	.loc 1 255 0
	mov	r2, #16
	.loc 1 244 0
	@ lr needed for prologue
	.loc 1 254 0
	str	r3, [r1, #0]
	.loc 1 256 0
	.loc 1 255 0
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
	.loc 1 282 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, sl, lr}
.LCFI0:
	ldr	sl, .L22
	.loc 1 285 0
	ldr	r1, .L22+4
	.loc 1 282 0
.L21:
	add	sl, pc, sl
	mov	r4, r0
	.loc 1 285 0
	add	r1, sl, r1
	mov	r0, #1
.LVL15:
	bl	assert(PLT)
	.loc 1 298 0
	add	r2, r4, #17152
	add	r2, r2, #212
	.loc 1 283 0
	add	r1, r4, #16
.LVL16:
	.loc 1 300 0
	ldr	r0, [r4, #420]
	.loc 1 287 0
	mov	r3, #10
	.loc 1 298 0
	str	r2, [r1, #4]
	.loc 1 300 0
	mov	r2, #16
	.loc 1 287 0
	str	r3, [r4, #16]
	.loc 1 301 0
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 300 0
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
	.global	TrainEngine_Initialize
	.type	TrainEngine_Initialize, %function
TrainEngine_Initialize:
.LFB31:
	.loc 1 808 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL18:
	str	r4, [sp, #-4]!
.LCFI1:
	.loc 1 810 0
	mov	r2, #0
	.loc 1 814 0
	mov	r3, #0
	mov	r4, #0
	.loc 1 808 0
	@ lr needed for prologue
	.loc 1 817 0
	str	r3, [r0, #44]
	str	r4, [r0, #48]
	.loc 1 814 0
	str	r3, [r0, #20]
	str	r4, [r0, #24]
	.loc 1 815 0
	str	r3, [r0, #28]
	str	r4, [r0, #32]
	.loc 1 816 0
	str	r3, [r0, #36]
	str	r4, [r0, #40]
	.loc 1 820 0
	str	r2, [r0, #1272]
	.loc 1 809 0
	stmib	r0, {r1, r2}	@ phole stm
	.loc 1 811 0
	str	r2, [r0, #56]
	.loc 1 812 0
	str	r2, [r0, #12]
	.loc 1 813 0
	str	r2, [r0, #16]
	.loc 1 818 0
	str	r2, [r0, #64]
	.loc 1 819 0
	str	r2, [r0, #1268]
	.loc 1 821 0
	ldmfd	sp!, {r4}
	bx	lr
.LFE31:
	.size	TrainEngine_Initialize, .-TrainEngine_Initialize
	.align	2
	.global	TrainServer_HandleSetTrain
	.type	TrainServer_HandleSetTrain, %function
TrainServer_HandleSetTrain:
.LFB9:
	.loc 1 258 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL19:
	stmfd	sp!, {r4, lr}
.LCFI2:
	.loc 1 258 0
	mov	r4, r0
	.loc 1 262 0
	add	r0, r0, #17152
.LVL20:
	add	r0, r0, #212
	ldr	r1, [r4, #4]
	bl	TrainEngine_Initialize(PLT)
	.loc 1 264 0
	mov	r3, #10
	str	r3, [r4, #16]
	.loc 1 265 0
	mov	r2, #16
	ldr	r0, [r4, #420]
	add	r1, r4, #16
	bl	Reply(PLT)
	.loc 1 267 0
	ldr	r3, .L28
	mov	r2, #0
	str	r2, [r4, r3]
	.loc 1 268 0
	ldmfd	sp!, {r4, pc}
.L29:
	.align	2
.L28:
	.word	17372
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
	.ascii	"TrainServer failed to create TrainSwitchMaster\000"
	.align	2
.LC6:
	.ascii	"TrainServer failed to create TrainEngineClient_Star"
	.ascii	"t\000"
	.text
	.align	2
	.global	TrainServer_Initialize
	.type	TrainServer_Initialize, %function
TrainServer_Initialize:
.LFB3:
	.loc 1 110 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL21:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI3:
	ldr	sl, .L46
	.loc 1 111 0
	ldr	r3, .L46+4
	.loc 1 110 0
.L44:
	add	sl, pc, sl
	mov	r6, r0
	.loc 1 111 0
	ldr	r0, [sl, r3]
.LVL22:
	bl	RegisterAs(PLT)
	.loc 1 112 0
	ldr	r1, .L46+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 118 0
	ldr	r2, .L46+12
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
	ldr	r1, .L46+16
	.loc 1 118 0
	str	r0, [r6, #432]
	.loc 1 119 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 121 0
	ldr	r3, .L46+20
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 122 0
	ldr	r1, .L46+24
	.loc 1 121 0
	str	r0, [r6, #428]
	.loc 1 122 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 124 0
	ldr	r3, .L46+28
	mov	r0, #8
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 125 0
	ldr	r1, .L46+32
	.loc 1 124 0
	str	r0, [r6, #440]
	.loc 1 125 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 128 0
	ldr	r3, .L46+36
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 129 0
	ldr	r1, .L46+40
	.loc 1 128 0
	str	r0, [r6, #444]
	.loc 1 129 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 131 0
	mov	r3, #4
	.loc 1 133 0
	add	r0, r6, #44
	mov	r1, #101
	.loc 1 131 0
	str	r3, [r6, #424]
	.loc 1 133 0
	bl	RNG_Initialize(PLT)
.LVL23:
	mov	r5, r4
	mov	r1, r6
	mov	ip, r4
	mov	r0, #100
.LVL24:
.L31:
.LBB2:
	.loc 1 138 0
	str	ip, [r1, #60]
	.loc 1 139 0
	str	ip, [r1, #80]
	add	r2, r6, r0
	mov	r3, ip
.LVL25:
.L32:
	.loc 1 142 0
	add	r3, r3, #1
	cmp	r3, #16
	.loc 1 143 0
	str	r5, [r2], #4
	.loc 1 142 0
	bne	.L32
.LVL26:
.LBE2:
	.loc 1 137 0
	add	r4, r4, #1
	cmp	r4, #5
	add	r0, r0, #64
	add	r1, r1, #4
	bne	.L31
.LVL27:
	.loc 1 147 0
	add	r4, r6, #448
.LVL28:
	mov	r0, r4
	bl	init_tracka(PLT)
.LVL29:
	.loc 1 148 0
	add	r0, r6, #7360
	bl	init_trackb(PLT)
	.loc 1 149 0
	mov	r3, #14272
	add	r2, r6, #14272
	str	r4, [r6, r3]
	add	r2, r2, #4
	mov	r1, r5
.LVL30:
	mov	r3, #85
.L35:
	.loc 1 152 0
	add	r1, r1, #1
	cmp	r1, #256
	.loc 1 153 0
	str	r3, [r2, #0]
	.loc 1 154 0
	str	r3, [r2, #1024]
	.loc 1 152 0
	add	r2, r2, #4
	bne	.L35
	.loc 1 158 0
	add	r0, r6, #16320
	add	r0, r0, #4
	bl	Queue_Initialize(PLT)
.LVL31:
	.loc 1 162 0
	add	r0, r6, #17152
	add	r0, r0, #212
	mov	r1, #0
	bl	TrainEngine_Initialize(PLT)
	.loc 1 164 0
	add	r0, r6, #18432
	add	r0, r0, #208
	mov	r1, #10
	bl	Queue_Initialize(PLT)
	.loc 1 167 0
	ldr	r3, .L46+44
	mov	r0, #8
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	.loc 1 168 0
	ldr	r1, .L46+48
	.loc 1 167 0
	ldr	r3, .L46+52
	.loc 1 168 0
	add	r1, sl, r1
	.loc 1 167 0
	str	r0, [r6, r3]
	.loc 1 169 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 168 0
	b	assert(PLT)
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC1(GOTOFF)
	.word	TrainSensorReader_Start(GOT)
	.word	.LC2(GOTOFF)
	.word	TrainCommandServer_Start(GOT)
	.word	.LC3(GOTOFF)
	.word	TrainServerTimer_Start(GOT)
	.word	.LC4(GOTOFF)
	.word	TrainSwitchMaster_Start(GOT)
	.word	.LC5(GOTOFF)
	.word	TrainEngineClient_Start(GOT)
	.word	.LC6(GOTOFF)
	.word	17364
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
	.loc 1 171 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL32:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI4:
	.loc 1 174 0
	ldr	r3, [r0, #40]
	.loc 1 171 0
	ldr	sl, .L65
	.loc 1 174 0
	cmp	r3, #1
	.loc 1 175 0
	ldreq	r2, [r0, #36]
	addeq	r3, r3, #11
	.loc 1 178 0
	add	r9, r0, #16
	.loc 1 171 0
	mov	r5, r0
	.loc 1 175 0
	streq	r3, [r2, #0]
	.loc 1 171 0
.L63:
	add	sl, pc, sl
	.loc 1 178 0
	mov	r1, r9
	mov	r2, #16
	ldr	r0, [r0, #420]
.LVL33:
	bl	Reply(PLT)
	.loc 1 180 0
	ldr	r3, [r5, #40]
	.loc 1 184 0
	ldr	r7, [r5, #4]
.LVL34:
	.loc 1 180 0
	cmp	r3, #1
	.loc 1 181 0
	ldreq	r3, [r5, #424]
	.loc 1 187 0
	add	r2, r5, r7, asl #2
	.loc 1 181 0
	subeq	r3, r3, #1
	.loc 1 185 0
	ldr	r6, [r5, #8]
.LVL35:
	.loc 1 181 0
	streq	r3, [r5, #424]
	.loc 1 189 0
	ldr	r3, [r2, #80]
	.loc 1 187 0
	str	r6, [r2, #60]
	.loc 1 189 0
	orr	r3, r6, r3
	str	r3, [r2, #80]
	.loc 1 192 0
	bl	Time(PLT)
	mov	r4, #0
.LVL36:
	mov	r8, r0
.LVL37:
	b	.L53
.L56:
	.loc 1 193 0
	cmp	r4, #15
	bgt	.L64
.L53:
	.loc 1 194 0
	mov	r3, r6, asr r4
	.loc 1 195 0
	add	r2, r4, r7, asl #4
	.loc 1 194 0
	tst	r3, #1
	.loc 1 195 0
	add	ip, r5, r2, asl #2
	.loc 1 194 0
	addeq	r4, r4, #1
	beq	.L56
	.loc 1 197 0
	ldr	r3, [r5, #40]
	.loc 1 195 0
	str	r8, [ip, #100]
	.loc 1 197 0
	cmp	r3, #2
	movne	ip, #0
	moveq	ip, #1
	cmp	r6, #0
	.loc 1 199 0
	ldr	r1, .L65+4
	.loc 1 197 0
	moveq	ip, #0
	.loc 1 199 0
	mov	r0, #1
	.loc 1 197 0
	cmp	ip, #0
	.loc 1 199 0
	add	r1, sl, r1
	add	r2, r7, #65
	.loc 1 197 0
	addeq	r4, r4, r0
	beq	.L56
	.loc 1 199 0
	add	r4, r4, #1
	.loc 1 198 0
	mov	r3, #0
	str	r3, [r5, #40]
	.loc 1 199 0
	mov	r3, r4
	bl	PutString(PLT)
	.loc 1 200 0
	ldr	r0, [r5, #436]
	mov	r1, r9
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 193 0
	cmp	r4, #15
	ble	.L53
.L64:
	.loc 1 204 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L63+8)
	.word	.LC7(GOTOFF)
.LFE4:
	.size	TrainServer_HandleSensorReaderData, .-TrainServer_HandleSensorReaderData
	.align	2
	.global	TrainServer_HandleSetDestination
	.type	TrainServer_HandleSetDestination, %function
TrainServer_HandleSetDestination:
.LFB10:
	.loc 1 270 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL38:
	stmfd	sp!, {r4, lr}
.LCFI5:
	.loc 1 274 0
	mov	r3, #14272
	.loc 1 270 0
	mov	r4, r0
	.loc 1 274 0
	ldr	r1, [r4, #12]
	ldr	r0, [r0, r3]
.LVL39:
	bl	NodeNameToTrackNode(PLT)
	ldr	r3, .L69
	.loc 1 276 0
	mov	r2, #10
	.loc 1 274 0
	str	r0, [r4, r3]
	.loc 1 276 0
	str	r2, [r4, #16]
	.loc 1 277 0
	ldr	r0, [r4, #420]
	add	r2, r2, #6
	add	r1, r4, #16
	bl	Reply(PLT)
	.loc 1 279 0
	ldr	r3, .L69+4
	mov	r2, #1
	str	r2, [r4, r3]
	.loc 1 280 0
	ldmfd	sp!, {r4, pc}
.L70:
	.align	2
.L69:
	.word	17428
	.word	17372
.LFE10:
	.size	TrainServer_HandleSetDestination, .-TrainServer_HandleSetDestination
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"Setting train %d to speed %d\000"
	.text
	.align	2
	.global	TrainServer_HandleTrainEngineClientCommandRequest
	.type	TrainServer_HandleTrainEngineClientCommandRequest, %function
TrainServer_HandleTrainEngineClientCommandRequest:
.LFB12:
	.loc 1 303 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL40:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI6:
	ldr	sl, .L77
	mov	r5, r0
	.loc 1 306 0
	mov	r3, #10
	.loc 1 308 0
	add	r0, r0, #18432
.LVL41:
	.loc 1 303 0
.L76:
	add	sl, pc, sl
	.loc 1 306 0
	str	r3, [r5, #16]
	.loc 1 308 0
	add	r0, r0, #208
	bl	Queue_PopStart(PLT)
	.loc 1 310 0
	subs	ip, r0, #0
.LBB3:
	.loc 1 312 0
	mov	r3, ip, asr #8
	.loc 1 316 0
	ldr	r0, .L77+4
	.loc 1 312 0
	and	r6, r3, #255
.LVL42:
	.loc 1 313 0
	and	lr, ip, #255
.LVL43:
.LBE3:
	.loc 1 304 0
	add	r4, r5, #16
.LBB4:
	.loc 1 316 0
	add	r0, sl, r0
	mov	r1, lr
	mov	r2, r6
.LBE4:
	.loc 1 318 0
	streq	ip, [r4, #4]
	.loc 1 310 0
	beq	.L74
.LVL44:
.LBB5:
	.loc 1 311 0
	mov	r3, #1
	str	r3, [r4, #4]
	.loc 1 314 0
	strb	r6, [r4, #8]
	.loc 1 315 0
	strb	lr, [r4, #9]
	.loc 1 316 0
	bl	PrintMessage(PLT)
.LVL45:
.L74:
.LBE5:
	.loc 1 321 0
	ldr	r0, [r5, #420]
	mov	r1, r4
.LVL46:
	mov	r2, #16
.LVL47:
	.loc 1 322 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 321 0
	b	Reply(PLT)
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	.LC8(GOTOFF)
.LFE12:
	.size	TrainServer_HandleTrainEngineClientCommandRequest, .-TrainServer_HandleTrainEngineClientCommandRequest
	.align	2
	.global	GetQueuedSwitchState
	.type	GetQueuedSwitchState, %function
GetQueuedSwitchState:
.LFB20:
	.loc 1 470 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL48:
	.loc 1 472 0
	ldr	r3, .L81
	.loc 1 470 0
	add	r1, r0, r1, asl #2
.LVL49:
	.loc 1 472 0
	ldr	r0, [r1, r3]
.LVL50:
	.loc 1 470 0
	@ lr needed for prologue
	.loc 1 472 0
	bx	lr
.L82:
	.align	2
.L81:
	.word	15300
.LFE20:
	.size	GetQueuedSwitchState, .-GetQueuedSwitchState
	.align	2
	.global	TrainServer_SetTrainSpeed
	.type	TrainServer_SetTrainSpeed, %function
TrainServer_SetTrainSpeed:
.LFB27:
	.loc 1 600 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL51:
	stmfd	sp!, {r4, r5, r6, lr}
.LCFI7:
	.loc 1 600 0
	mov	r5, r0
	.loc 1 602 0
	add	r0, r0, #18432
.LVL52:
	.loc 1 600 0
	mov	r6, r1
	.loc 1 602 0
	add	r0, r0, #208
	orr	r1, r2, r1, asl #8
.LVL53:
	.loc 1 600 0
	mov	r4, r2
	.loc 1 602 0
	bl	Queue_PushEnd(PLT)
.LVL54:
	.loc 1 606 0
	ldr	r3, .L87
	ldr	r2, [r5, r3]
	cmp	r4, r2
	.loc 1 607 0
	addeq	r3, r3, #12
	streq	r6, [r5, r3]
	ldmfd	sp!, {r4, r5, r6, pc}
.L88:
	.align	2
.L87:
	.word	17368
.LFE27:
	.size	TrainServer_SetTrainSpeed, .-TrainServer_SetTrainSpeed
	.global	__floatsidf
	.global	__muldf3
	.global	__divdf3
	.global	__ltdf2
	.align	2
	.global	TrainServer_ProcessEngineCalibratingSpeed
	.type	TrainServer_ProcessEngineCalibratingSpeed, %function
TrainServer_ProcessEngineCalibratingSpeed:
.LFB26:
	.loc 1 572 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL55:
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
.LCFI8:
	.loc 1 577 0
	ldr	r2, [r0, #288]
.LVL56:
	.loc 1 578 0
	ldr	r3, [r0, #332]
.LVL57:
	.loc 1 572 0
	mov	r7, r0
	.loc 1 582 0
	cmp	r2, #0
	cmpne	r3, #0
	.loc 1 583 0
	rsb	r0, r3, r2
.LVL58:
	.loc 1 572 0
	mov	r8, r1
	.loc 1 579 0
	ldr	r2, [r7, #284]
.LVL59:
	.loc 1 580 0
	ldr	r3, [r7, #336]
.LVL60:
	.loc 1 582 0
	bne	.L99
.LVL61:
	.loc 1 584 0
	cmp	r2, #0
	cmpne	r3, #0
	.loc 1 585 0
	rsb	r0, r3, r2
	.loc 1 584 0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
.L99:
	.loc 1 585 0
	bl	__floatsidf(PLT)
.LVL62:
	adr	r2, .L100
	ldmia	r2, {r2-r3}
	bl	__muldf3(PLT)
	adr	r2, .L100+8
	ldmia	r2, {r2-r3}
	bl	__divdf3(PLT)
	.loc 1 590 0
	mov	r3, #0
	mov	r2, #0
	.loc 1 585 0
	mov	r6, r1
.LVL63:
	mov	r5, r0
.LVL64:
	.loc 1 590 0
	bl	__ltdf2(PLT)
	cmp	r0, #0
	.loc 1 591 0
	addlt	r3, r5, #-2147483648
	movlt	r4, r6
	movlt	r5, r3
	movlt	r6, r4
	.loc 1 594 0
	mov	r3, r6
	mov	r2, r5
	adr	r0, .L100+16
	ldmia	r0, {r0-r1}
	bl	__divdf3(PLT)
	.loc 1 595 0
	ldr	r2, [r8, #4]
	.loc 1 594 0
	str	r0, [r8, #20]
	str	r1, [r8, #24]
	.loc 1 595 0
	mov	r1, #0
	mov	r0, r7
	bl	TrainServer_SetTrainSpeed(PLT)
	.loc 1 596 0
	mov	r0, r7
	mov	r1, #5
	ldr	r2, [r8, #4]
	bl	TrainServer_SetTrainSpeed(PLT)
	.loc 1 597 0
	mov	r3, #1
	str	r3, [r8, #8]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L101:
	.align	2
.L100:
	.word	1072064102
	.word	1717986918
	.word	1083129856
	.word	0
	.word	1078362112
	.word	0
.LFE26:
	.size	TrainServer_ProcessEngineCalibratingSpeed, .-TrainServer_ProcessEngineCalibratingSpeed
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"Engine %d is starting.\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngineIdle
	.type	TrainServer_ProcessEngineIdle, %function
TrainServer_ProcessEngineIdle:
.LFB16:
	.loc 1 417 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL65:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI9:
	ldr	sl, .L105
	mov	r5, r0
	.loc 1 418 0
	ldr	r0, .L105+4
.LVL66:
	.loc 1 417 0
.L104:
	add	sl, pc, sl
	mov	r4, r1
	.loc 1 418 0
	add	r0, sl, r0
	ldr	r1, [r1, #4]
.LVL67:
	bl	PrintMessage(PLT)
	.loc 1 419 0
	mov	r0, r5
	mov	r1, #4
	ldr	r2, [r4, #4]
	bl	TrainServer_SetTrainSpeed(PLT)
	.loc 1 420 0
	mov	r3, #1
	str	r3, [r4, #8]
	.loc 1 421 0
	ldmfd	sp!, {r4, r5, sl, pc}
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	.LC9(GOTOFF)
.LFE16:
	.size	TrainServer_ProcessEngineIdle, .-TrainServer_ProcessEngineIdle
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"Attempting to queue switch state that overwrites pr"
	.ascii	"evious queued switch state. Setting switch number %"
	.ascii	"d to %c, but queued state is %c.\000"
	.text
	.align	2
	.global	QueueSwitchState
	.type	QueueSwitchState, %function
QueueSwitchState:
.LFB21:
	.loc 1 474 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL68:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI10:
	ldr	sl, .L115
	.loc 1 476 0
	mov	lr, r1, asl #2
	cmp	r2, #85
	.loc 1 474 0
.L114:
	add	sl, pc, sl
	sub	sp, sp, #4
.LCFI11:
.LVL69:
	.loc 1 476 0
	ldr	r8, .L115+4
	.loc 1 474 0
	mov	r6, r2
	mov	r4, r1
	mov	r5, r0
	.loc 1 476 0
	add	r7, lr, r0
	beq	.L113
.LVL70:
	ldr	ip, [r7, r8]
	.loc 1 481 0
	mov	r2, r1
	ldr	r1, .L115+8
	.loc 1 476 0
	cmp	r6, ip
	.loc 1 481 0
	add	r1, sl, r1
	mov	r3, r6
	.loc 1 476 0
	beq	.L108
.LVL71:
	.loc 1 481 0
	cmp	ip, #85
	movne	r0, #0
	moveq	r0, #1
.LVL72:
	str	ip, [sp, #0]
	bl	assertf(PLT)
.LVL73:
	.loc 1 483 0
	add	r0, r5, #16320
	add	r0, r0, #4
	mov	r1, r4
	bl	Queue_PushEnd(PLT)
	.loc 1 484 0
	str	r6, [r7, r8]
	b	.L112
.LVL74:
.L113:
	mov	lr, r1, asl #2
.LVL75:
.L108:
	.loc 1 477 0
	ldr	r3, .L115+4
	add	r2, lr, r5
	str	r6, [r2, r3]
.LVL76:
.L112:
	.loc 1 486 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L116:
	.align	2
.L115:
	.word	_GLOBAL_OFFSET_TABLE_-(.L114+8)
	.word	15300
	.word	.LC10(GOTOFF)
.LFE21:
	.size	QueueSwitchState, .-QueueSwitchState
	.align	2
	.global	TrainServer_QueueSwitchStates
	.type	TrainServer_QueueSwitchStates, %function
TrainServer_QueueSwitchStates:
.LFB22:
	.loc 1 488 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL77:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
.LCFI12:
	.loc 1 489 0
	ldr	r3, [r1, #1268]
.LVL78:
	.loc 1 490 0
	ldr	ip, [r1, #64]
	add	r3, r3, r3, asl #1
.LVL79:
	mov	r3, r3, asl #2
	add	r2, r3, r1
	.loc 1 488 0
	mov	r8, r1
	.loc 1 490 0
	ldr	r1, [r2, #68]
.LVL80:
	.loc 1 488 0
	mov	r9, r0
	.loc 1 490 0
	cmp	r1, ip
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.LVL81:
	add	r2, r3, #80
	add	r3, r3, #68
	rsb	r7, r3, r2
	add	r6, r8, r3
	b	.L120
.LVL82:
.L121:
	ldr	r1, [r6, r7]
	add	r6, r6, #12
	cmp	ip, r1
	beq	.L126
.LVL83:
.L120:
	.loc 1 491 0
	ldr	r3, [r1, #4]
.LBB6:
	.loc 1 494 0
	mov	r0, r9
.LBE6:
	.loc 1 491 0
	cmp	r3, #2
	bne	.L121
.LVL84:
.LBB7:
	.loc 1 492 0
	ldr	r4, [r1, #8]
	.loc 1 493 0
	ldr	r5, [r6, #8]
	.loc 1 494 0
	mov	r1, r4
	bl	GetQueuedSwitchState(PLT)
.LVL85:
	.loc 1 495 0
	cmp	r0, #85
	cmpne	r5, r0
	.loc 1 499 0
	mov	r1, r4
	mov	r2, r5
	mov	r0, r9
	.loc 1 495 0
	ldmnefd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.LVL86:
	.loc 1 499 0
	bl	QueueSwitchState(PLT)
.LVL87:
.LBE7:
	.loc 1 490 0
	ldr	r1, [r6, r7]
	ldr	ip, [r8, #64]
	add	r6, r6, #12
	cmp	ip, r1
	bne	.L120
.LVL88:
.L126:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.LFE22:
	.size	TrainServer_QueueSwitchStates, .-TrainServer_QueueSwitchStates
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Found starting position.\000"
	.align	2
.LC12:
	.ascii	"Travelling from %s to %s.\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngineFoundStartingPosition
	.type	TrainServer_ProcessEngineFoundStartingPosition, %function
TrainServer_ProcessEngineFoundStartingPosition:
.LFB18:
	.loc 1 434 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL89:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI13:
	ldr	sl, .L138
	mov	r7, r0
	.loc 1 435 0
	ldr	r0, .L138+4
.LVL90:
	.loc 1 434 0
.L137:
	add	sl, pc, sl
	sub	sp, sp, #12
.LCFI14:
.LVL91:
	.loc 1 435 0
	add	r0, sl, r0
	.loc 1 434 0
	mov	r8, r1
	.loc 1 435 0
	bl	PrintMessage(PLT)
.LVL92:
	.loc 1 436 0
	mov	r3, #14272
	ldr	r1, [r7, r3]
	ldr	r2, [r8, #56]
	add	r0, r7, #44
	bl	GetRandomSensorReachableViaDirectedGraph(PLT)
	.loc 1 437 0
	ldr	r3, [r8, #56]
	.loc 1 436 0
	mov	ip, r0
	str	r0, [r8, #64]
	.loc 1 439 0
	ldr	r0, .L138+8
	.loc 1 437 0
	str	r3, [r8, #60]
	.loc 1 439 0
	add	r0, sl, r0
	ldr	r1, [r3, #0]
	ldr	r2, [ip, #0]
	bl	PrintMessage(PLT)
	add	r5, r7, #14272
	add	r5, r5, #4
	mov	r4, #0
.LVL93:
	mov	r6, #85
.L128:
	.loc 1 444 0
	mov	r1, r4
	.loc 1 443 0
	str	r6, [r5], #4
	.loc 1 442 0
	add	r4, r4, #1
	.loc 1 444 0
	mov	r0, r7
	mov	r2, r6
	bl	QueueSwitchState(PLT)
	.loc 1 442 0
	cmp	r4, #256
	bne	.L128
.LVL94:
	.loc 1 447 0
	sub	r4, r4, #256
	.loc 1 448 0
	mov	r3, #14272
	add	ip, r8, #1264
	ldr	r1, [r7, r3]
	ldr	r2, [r8, #56]
	ldr	r3, [r8, #64]
	.loc 1 447 0
	str	r4, [r8, #1272]
	.loc 1 448 0
	add	ip, ip, #8
	add	r0, r8, #68
	str	ip, [sp, #8]
	str	r4, [sp, #0]
	str	r4, [sp, #4]
	bl	PopulateRouteNodeInfo(PLT)
	.loc 1 452 0
	ldr	r2, [r8, #1272]
	cmp	r2, r4
	ble	.L130
	mov	r3, r4
.LVL95:
.L132:
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L132
.L130:
	.loc 1 456 0
	mov	r3, #3
.LVL96:
	.loc 1 457 0
	mov	r1, r8
	mov	r0, r7
	.loc 1 456 0
	str	r3, [r8, #8]
	.loc 1 457 0
	bl	TrainServer_QueueSwitchStates(PLT)
	.loc 1 458 0
	ldr	r2, [r8, #4]
	mov	r0, r7
	mov	r1, #24
	.loc 1 459 0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	.loc 1 458 0
	b	TrainServer_SetTrainSpeed(PLT)
.L139:
	.align	2
.L138:
	.word	_GLOBAL_OFFSET_TABLE_-(.L137+8)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
.LFE18:
	.size	TrainServer_ProcessEngineFoundStartingPosition, .-TrainServer_ProcessEngineFoundStartingPosition
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"Invalid code in TrainServer_HandleSetSwitch.\000"
	.text
	.align	2
	.global	TrainServer_HandleSetSwitch
	.type	TrainServer_HandleSetSwitch, %function
TrainServer_HandleSetSwitch:
.LFB14:
	.loc 1 367 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL97:
	stmfd	sp!, {r4, sl, lr}
.LCFI15:
	.loc 1 373 0
	ldrb	ip, [r0, #8]	@ zero_extendqisi2
	.loc 1 367 0
	ldr	sl, .L149
	.loc 1 371 0
	mov	r3, #10
	.loc 1 376 0
	cmp	ip, #34
	.loc 1 367 0
.L147:
	add	sl, pc, sl
	.loc 1 377 0
	mov	r2, #67
	.loc 1 367 0
	mov	r4, r0
	.loc 1 371 0
	str	r3, [r0, #16]
	.loc 1 374 0
	ldrb	r1, [r0, #9]	@ zero_extendqisi2
.LVL98:
	.loc 1 376 0
	beq	.L148
	.loc 1 378 0
	cmp	ip, #33
	.loc 1 379 0
	mov	r2, #83
	.loc 1 378 0
	beq	.L148
	.loc 1 381 0
	ldr	r1, .L149+4
.LVL99:
	mov	r0, #0
.LVL100:
	add	r1, sl, r1
	bl	assert(PLT)
.L143:
	.loc 1 384 0
	ldr	r0, [r4, #420]
	add	r1, r4, #16
	mov	r2, #16
	.loc 1 385 0
	ldmfd	sp!, {r4, sl, lr}
	.loc 1 384 0
	b	Reply(PLT)
.LVL101:
.L148:
	.loc 1 379 0
	bl	QueueSwitchState(PLT)
.LVL102:
	b	.L143
.L150:
	.align	2
.L149:
	.word	_GLOBAL_OFFSET_TABLE_-(.L147+8)
	.word	.LC13(GOTOFF)
.LFE14:
	.size	TrainServer_HandleSetSwitch, .-TrainServer_HandleSetSwitch
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"\033[31;44mAttempting to tell switch master to set "
	.ascii	"to switch %d unknown state.\000"
	.align	2
.LC15:
	.ascii	"\033[31;44mQueue contains %d.\000"
	.align	2
.LC16:
	.ascii	"Invalid switch state.\000"
	.align	2
.LC17:
	.ascii	"Telling switchmaster to set %d to be %c\000"
	.text
	.align	2
	.global	TrainServer_HandleGetSwitchRequest
	.type	TrainServer_HandleGetSwitchRequest, %function
TrainServer_HandleGetSwitchRequest:
.LFB13:
	.loc 1 324 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL103:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI16:
	.loc 1 329 0
	add	r4, r0, #16320
	.loc 1 324 0
	ldr	sl, .L170
	.loc 1 327 0
	mov	r3, #11
	.loc 1 329 0
	add	r4, r4, #4
	.loc 1 324 0
.L167:
	add	sl, pc, sl
	mov	r5, r0
	.loc 1 327 0
	str	r3, [r0, #16]
	.loc 1 329 0
	mov	r0, r4
.LVL104:
	bl	Queue_CurrentCount(PLT)
	.loc 1 329 0
	cmp	r0, #0
	.loc 1 325 0
	add	r7, r5, #16
	.loc 1 329 0
	bne	.L168
.LVL105:
.L152:
	.loc 1 364 0
	ldr	r0, [r5, #420]
	mov	r1, r7
	mov	r2, #16
	.loc 1 365 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.loc 1 364 0
	b	Reply(PLT)
.LVL106:
.L168:
.LBB8:
	.loc 1 330 0
	mov	r3, #10
	str	r3, [r5, #16]
	.loc 1 332 0
	mov	r0, r4
	bl	Queue_PopStart(PLT)
	mov	r6, r0
.LVL107:
	.loc 1 335 0
	mov	r1, r6
	mov	r0, r5
	bl	GetQueuedSwitchState(PLT)
	cmp	r0, #67
	beq	.L154
	.loc 1 337 0
	mov	r0, r5
	mov	r1, r6
	bl	GetQueuedSwitchState(PLT)
	cmp	r0, #83
	moveq	r9, #33
.LVL108:
	beq	.L158
	.loc 1 339 0
	mov	r0, r5
	mov	r1, r6
	bl	GetQueuedSwitchState(PLT)
	cmp	r0, #85
	beq	.L169
	.loc 1 347 0
	ldr	r1, .L170+4
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	mov	r9, #34
.L158:
	.loc 1 351 0
	ldr	fp, .L170+8
	add	r8, r5, r6, asl #2
	mov	r0, r5
	mov	r1, r6
	ldr	r4, [r8, fp]
	bl	GetQueuedSwitchState(PLT)
	cmp	r4, r0
	.loc 1 353 0
	moveq	r3, #11
	streq	r3, [r7, #0]
	.loc 1 351 0
	beq	.L165
	.loc 1 355 0
	mov	r1, r6
	mov	r0, r5
	bl	GetQueuedSwitchState(PLT)
	mov	r2, r0
	ldr	r0, .L170+12
	mov	r1, r6
	add	r0, sl, r0
	bl	PrintMessage(PLT)
	.loc 1 356 0
	strb	r9, [r7, #8]
	.loc 1 357 0
	strb	r6, [r7, #9]
	.loc 1 358 0
	mov	r0, r5
	mov	r1, r6
	bl	GetQueuedSwitchState(PLT)
	str	r0, [r8, fp]
.L165:
	.loc 1 361 0
	mov	r1, r6
	mov	r0, r5
	mov	r2, #85
	bl	QueueSwitchState(PLT)
	b	.L152
.L169:
	.loc 1 340 0
	ldr	r0, .L170+16
	mov	r1, r6
	add	r0, sl, r0
	bl	PrintMessage(PLT)
	ldr	r8, .L170+20
	b	.L161
.L162:
.LBB9:
	.loc 1 342 0
	bl	Queue_PopStart(PLT)
	mov	r1, r0
	.loc 1 343 0
	add	r0, sl, r8
	bl	PrintMessage(PLT)
.L161:
.LBE9:
	.loc 1 341 0
	mov	r0, r4
	bl	Queue_CurrentCount(PLT)
	cmp	r0, #0
.LBB10:
	.loc 1 342 0
	mov	r0, r4
.LBE10:
	.loc 1 341 0
	bne	.L162
.L154:
	.loc 1 347 0
	mov	r9, #34
	b	.L158
.L171:
	.align	2
.L170:
	.word	_GLOBAL_OFFSET_TABLE_-(.L167+8)
	.word	.LC16(GOTOFF)
	.word	14276
	.word	.LC17(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
.LBE8:
.LFE13:
	.size	TrainServer_HandleGetSwitchRequest, .-TrainServer_HandleGetSwitchRequest
	.global	__extendsfdf2
	.global	__subdf3
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"At destination %s.\000"
	.global	__adddf3
	.align	2
.LC19:
	.ascii	"Slowing down\000"
	.text
	.align	2
	.global	TrainServer_ProcessSensorData
	.type	TrainServer_ProcessSensorData, %function
TrainServer_ProcessSensorData:
.LFB23:
	.loc 1 506 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL109:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI17:
	ldr	sl, .L190
	mov	r6, r1
.L188:
	add	sl, pc, sl
	mov	r9, r0
	.loc 1 507 0
	bl	TimeSeconds(PLT)
.LVL110:
	.loc 1 507 0
	bl	__extendsfdf2(PLT)
	mov	r7, r0
.LVL111:
	.loc 1 509 0
	ldr	r0, [r6, #52]
	.loc 1 507 0
	mov	r8, r1
.LVL112:
	.loc 1 509 0
	bl	__floatsidf(PLT)
	add	r2, r6, #44
	ldmia	r2, {r2-r3}
	mov	r4, r0
	mov	r5, r1
	mov	r0, r7
	mov	r1, r8
	bl	__subdf3(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__divdf3(PLT)
	.loc 1 514 0
	ldr	r3, [r6, #64]
	ldr	ip, [r6, #56]
	.loc 1 512 0
	mov	r2, #0
	.loc 1 514 0
	cmp	ip, r3
	.loc 1 509 0
	str	r0, [r6, #20]
	str	r1, [r6, #24]
	.loc 1 511 0
	add	r3, r6, #28
	ldmia	r3, {r3-r4}
	.loc 1 510 0
	str	r7, [r6, #44]
	str	r8, [r6, #48]
	.loc 1 511 0
	str	r3, [r6, #36]
	str	r4, [r6, #40]
	.loc 1 512 0
	str	r2, [r6, #12]
	.loc 1 514 0
	beq	.L189
	.loc 1 523 0
	ldr	r1, [r6, #1268]
	ldr	lr, [r6, #1272]
	mov	r4, r1
.LVL113:
	cmp	r1, lr
	bge	.L176
	.loc 1 524 0
	mov	r5, r1, asl #1
	add	r3, r5, r1
	mov	r0, r3, asl #2
	add	r2, r0, r6
	ldr	r3, [r2, #68]
	cmp	ip, r3
	addne	r3, r0, #68
	addne	r2, r6, r3
	rsbne	lr, r1, lr
	movne	r0, r1
.LVL114:
	beq	.L180
.L178:
	.loc 1 523 0
	add	r0, r0, #1
	add	r3, r1, lr
	cmp	r0, r3
	beq	.L176
	.loc 1 524 0
	ldr	r3, [r2, #12]
	add	r2, r2, #12
	cmp	ip, r3
	bne	.L178
	mov	r4, r0
.L180:
	.loc 1 526 0
	mov	r1, r4
.LVL115:
	str	r4, [r6, #1268]
.LVL116:
.L176:
	.loc 1 535 0
	add	r4, r6, #68
.LVL117:
	mov	r0, r4
.LVL118:
	bl	DistanceToNextSensor(PLT)
	str	r0, [r6, #52]
	.loc 1 536 0
	bl	__floatsidf(PLT)
	add	r2, r6, #20
	ldmia	r2, {r2-r3}
	bl	__divdf3(PLT)
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	bl	__adddf3(PLT)
	str	r0, [r6, #28]
	str	r1, [r6, #32]
	.loc 1 538 0
	mov	r1, r6
	mov	r0, r9
	bl	TrainServer_QueueSwitchStates(PLT)
	.loc 1 540 0
	mov	r0, r4
	ldr	r1, [r6, #1268]
	bl	GetNextSensor(PLT)
	.loc 1 542 0
	cmp	r0, #0
.LVL119:
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	ldr	r3, [r6, #64]
	cmp	r0, r3
	ldmnefd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
	.loc 1 543 0
	mov	r0, r9
.LVL120:
	ldr	r2, [r6, #4]
	mov	r1, #3
	bl	TrainServer_SetTrainSpeed(PLT)
	.loc 1 544 0
	ldr	r0, .L190+4
	add	r0, sl, r0
	.loc 1 546 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	.loc 1 544 0
	b	PrintMessage(PLT)
.L189:
	.loc 1 515 0
	mov	r3, #4
	str	r3, [r6, #8]
	.loc 1 516 0
	mov	r0, r9
	mov	r1, r2
	ldr	r2, [r6, #4]
	bl	TrainServer_SetTrainSpeed(PLT)
	.loc 1 517 0
	ldr	r3, [r6, #56]
	ldr	r0, .L190+8
	ldr	r1, [r3, #0]
	add	r0, sl, r0
	.loc 1 546 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	.loc 1 517 0
	b	PrintMessage(PLT)
.L191:
	.align	2
.L190:
	.word	_GLOBAL_OFFSET_TABLE_-(.L188+8)
	.word	.LC19(GOTOFF)
	.word	.LC18(GOTOFF)
.LFE23:
	.size	TrainServer_ProcessSensorData, .-TrainServer_ProcessSensorData
	.align	2
	.global	TrainServer_ProcessEngineAtDestination
	.type	TrainServer_ProcessEngineAtDestination, %function
TrainServer_ProcessEngineAtDestination:
.LFB24:
	.loc 1 548 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL121:
	stmfd	sp!, {r4, r5, r6, lr}
.LCFI18:
	.loc 1 548 0
	mov	r6, r1
	mov	r5, r0
	.loc 1 550 0
	bl	Time(PLT)
.LVL122:
	ldr	r2, .L196
	mov	r4, r0
	smull	lr, ip, r2, r4
	mov	r3, r4, asr #31
	rsb	r3, r3, ip, asr #4
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r4, r4, r3, asl #1
	cmp	r4, #0
	.loc 1 551 0
	mov	r1, #16
	mov	r0, r5
	.loc 1 550 0
	ldmnefd	sp!, {r4, r5, r6, pc}
.LVL123:
	.loc 1 551 0
	ldr	r2, [r6, #4]
	bl	TrainServer_SetTrainSpeed(PLT)
.LVL124:
	.loc 1 552 0
	mov	r0, #1
	bl	Delay(PLT)
	.loc 1 553 0
	ldr	r2, [r6, #4]
	mov	r0, r5
	mov	r1, r4
	.loc 1 555 0
	ldmfd	sp!, {r4, r5, r6, lr}
	.loc 1 553 0
	b	TrainServer_SetTrainSpeed(PLT)
.L197:
	.align	2
.L196:
	.word	1374389535
.LFE24:
	.size	TrainServer_ProcessEngineAtDestination, .-TrainServer_ProcessEngineAtDestination
	.align	2
	.global	TrainServer_GetEnginePosition
	.type	TrainServer_GetEnginePosition, %function
TrainServer_GetEnginePosition:
.LFB25:
	.loc 1 557 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL125:
	stmfd	sp!, {r4, lr}
.LCFI19:
	.loc 1 557 0
	mov	r1, #0
.LVL126:
	mov	lr, r0
.LVL127:
	mov	r4, r0
.LVL128:
.LVL129:
.L199:
	.loc 1 563 0
	ldr	ip, [lr, #60]
	mov	r2, #0
.L200:
	mov	r3, ip, asr r2
	ands	r0, r3, #1
	bne	.L211
	.loc 1 562 0
	add	r2, r2, #1
	cmp	r2, #16
	bne	.L200
	.loc 1 561 0
	add	r1, r1, #1
	cmp	r1, #5
	add	lr, lr, #4
	bne	.L199
	.loc 1 570 0
	ldmfd	sp!, {r4, pc}
.L211:
	.loc 1 564 0
	mov	r3, #14272
	ldr	r0, [r4, r3]
	.loc 1 570 0
	ldmfd	sp!, {r4, lr}
	.loc 1 564 0
	b	SensorToTrackNode(PLT)
.LVL130:
.LFE25:
	.size	TrainServer_GetEnginePosition, .-TrainServer_GetEnginePosition
	.align	2
	.global	TrainServer_ProcessEngineRunning
	.type	TrainServer_ProcessEngineRunning, %function
TrainServer_ProcessEngineRunning:
.LFB19:
	.loc 1 461 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL131:
	stmfd	sp!, {r4, r5, lr}
.LCFI20:
	.loc 1 461 0
	mov	r4, r1
	mov	r5, r0
	.loc 1 462 0
	bl	TrainServer_GetEnginePosition(PLT)
.LVL132:
	.loc 1 464 0
	subs	r2, r0, #0
.LVL133:
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r3, [r4, #56]
	.loc 1 466 0
	mov	r0, r5
	.loc 1 464 0
	cmp	r2, r3
	.loc 1 466 0
	mov	r1, r4
	.loc 1 464 0
	ldmeqfd	sp!, {r4, r5, pc}
.LVL134:
	.loc 1 465 0
	str	r2, [r4, #56]
	.loc 1 468 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 466 0
	b	TrainServer_ProcessSensorData(PLT)
.LVL135:
.LFE19:
	.size	TrainServer_ProcessEngineRunning, .-TrainServer_ProcessEngineRunning
	.align	2
	.global	TrainServer_ProcessEngineFindingPosition
	.type	TrainServer_ProcessEngineFindingPosition, %function
TrainServer_ProcessEngineFindingPosition:
.LFB17:
	.loc 1 423 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL136:
	stmfd	sp!, {r4, r5, lr}
.LCFI21:
	.loc 1 423 0
	mov	r5, r1
	mov	r4, r0
	.loc 1 424 0
	bl	TrainServer_GetEnginePosition(PLT)
.LVL137:
	.loc 1 426 0
	subs	r2, r0, #0
.LVL138:
	.loc 1 429 0
	mov	r1, #0
	mov	r0, r4
	.loc 1 426 0
	ldmeqfd	sp!, {r4, r5, pc}
.LVL139:
	.loc 1 428 0
	str	r2, [r5, #56]
	.loc 1 429 0
	ldr	r2, [r5, #4]
.LVL140:
	.loc 1 427 0
	mov	r3, #2
	str	r3, [r5, #8]
	.loc 1 431 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 429 0
	b	TrainServer_SetTrainSpeed(PLT)
.LVL141:
.LFE17:
	.size	TrainServer_ProcessEngineFindingPosition, .-TrainServer_ProcessEngineFindingPosition
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"Unknown Train Engine State\000"
	.text
	.align	2
	.global	TrainServer_ProcessEngine
	.type	TrainServer_ProcessEngine, %function
TrainServer_ProcessEngine:
.LFB15:
	.loc 1 387 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL142:
	str	sl, [sp, #-4]!
.LCFI22:
	.loc 1 388 0
	ldr	r3, [r1, #4]
	.loc 1 387 0
	ldr	sl, .L234
	.loc 1 388 0
	cmp	r3, #0
	.loc 1 387 0
.L233:
	add	sl, pc, sl
	@ lr needed for prologue
	.loc 1 388 0
	beq	.L232
	.loc 1 392 0
	ldr	r3, [r1, #8]
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L224
	.p2align 2
.L231:
	b	.L225
	b	.L226
	b	.L227
	b	.L228
	b	.L229
	b	.L230
.L232:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	bx	lr
.L224:
	.loc 1 412 0
	ldr	r1, .L234+4
.LVL143:
	mov	r0, #0
.LVL144:
	add	r1, sl, r1
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 412 0
	b	assert(PLT)
.LVL145:
.L230:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 409 0
	b	TrainServer_ProcessEngineCalibratingSpeed(PLT)
.LVL146:
.L229:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 406 0
	b	TrainServer_ProcessEngineAtDestination(PLT)
.LVL147:
.L228:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 403 0
	b	TrainServer_ProcessEngineRunning(PLT)
.LVL148:
.L227:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 400 0
	b	TrainServer_ProcessEngineFoundStartingPosition(PLT)
.LVL149:
.L226:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 397 0
	b	TrainServer_ProcessEngineFindingPosition(PLT)
.LVL150:
.L225:
	.loc 1 415 0
	ldmfd	sp!, {sl}
	.loc 1 394 0
	b	TrainServer_ProcessEngineIdle(PLT)
.LVL151:
.L235:
	.align	2
.L234:
	.word	_GLOBAL_OFFSET_TABLE_-(.L233+8)
	.word	.LC20(GOTOFF)
.LFE15:
	.size	TrainServer_ProcessEngine, .-TrainServer_ProcessEngine
	.section	.rodata
	.align	2
	.type	__func__.1906, %object
	.size	__func__.1906, 18
__func__.1906:
	.ascii	"TrainServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC21:
	.ascii	"TrainServer did not get ACK reply from train comman"
	.ascii	"d server shutdown\000"
	.align	2
.LC22:
	.ascii	"TrainServer: unknown message type\000"
	.align	2
.LC23:
	.ascii	"TrainServer: did not get admin tid\000"
	.align	2
.LC24:
	.ascii	"TrainServer: failed to set ack message\000"
	.text
	.align	2
	.global	TrainServer_Start
	.type	TrainServer_Start, %function
TrainServer_Start:
.LFB2:
	.loc 1 10 0
	@ args = 0, pretend = 0, frame = 18696
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL152:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI23:
	ldr	sl, .L263
	sub	sp, sp, #18688
.LCFI24:
.LVL153:
	.loc 1 11 0
	ldr	r3, .L263+4
	.loc 1 10 0
	sub	sp, sp, #12
.LCFI25:
.LVL154:
	.loc 1 11 0
	ldr	r2, .L263+8
	.loc 1 10 0
.L261:
	add	sl, pc, sl
	.loc 1 13 0
	add	r4, sp, #12
	.loc 1 11 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	.loc 1 13 0
	sub	r4, r4, #8
	.loc 1 11 0
	bl	DebugRegisterFunction(PLT)
	.loc 1 13 0
	mov	r0, r4
	bl	TrainServer_Initialize(PLT)
	.loc 1 16 0
	ldr	r3, [r4, #424]
	.loc 1 13 0
	mov	r5, #0
.LVL155:
	.loc 1 16 0
	cmp	r3, #0
	beq	.L262
.L238:
.LBB11:
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
	b	.L239
	.p2align 2
.L254:
	b	.L240
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L239
	b	.L241
	b	.L239
	b	.L239
	b	.L242
	b	.L243
	b	.L239
	b	.L244
	b	.L245
	b	.L246
	b	.L247
	b	.L248
	b	.L249
	b	.L250
	b	.L239
	b	.L251
	b	.L252
	b	.L253
.L240:
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
	ldr	r1, .L263+12
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
.L255:
	.loc 1 98 0
	add	r1, r4, #17152
	add	r1, r1, #212
	mov	r0, r4
	bl	TrainServer_ProcessEngine(PLT)
.LBE11:
	.loc 1 16 0
	ldr	r3, [r4, #424]
	cmp	r3, #0
	bne	.L238
.L262:
	.loc 1 101 0
	ldr	r1, .L263+16
	mov	r0, r5
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 102 0
	ldr	r2, [r4, #36]
	.loc 1 103 0
	ldr	r1, .L263+20
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
	add	sp, sp, #268
	add	sp, sp, #18432
	ldmfd	sp!, {r4, r5, sl, pc}
.L241:
.LBB12:
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
	b	.L255
.L242:
	.loc 1 46 0
	mov	r0, r4
	bl	TrainServer_HandleSensorReaderData(PLT)
	b	.L255
.L243:
	.loc 1 50 0
	mov	r0, r4
	bl	TrainServer_HandleSwitchData(PLT)
	b	.L255
.L244:
	.loc 1 54 0
	mov	r0, r4
	bl	TrainServer_HandleSensorQuery(PLT)
	b	.L255
.L245:
	.loc 1 58 0
	mov	r0, r4
	bl	TrainServer_HandleSwitchQuery(PLT)
	b	.L255
.L246:
	.loc 1 62 0
	ldr	r2, [r4, #420]
	.loc 1 61 0
	mov	r3, #2
	str	r3, [r4, #40]
	.loc 1 62 0
	str	r2, [r4, #436]
	b	.L255
.L247:
	.loc 1 67 0
	mov	r0, r4
	bl	TrainServer_HandleSelectTrack(PLT)
	b	.L255
.L248:
	.loc 1 71 0
	mov	r0, r4
	bl	TrainServer_HandleSetTrain(PLT)
	b	.L255
.L249:
	.loc 1 75 0
	mov	r0, r4
	bl	TrainServer_HandleSetDestination(PLT)
	b	.L255
.L250:
	.loc 1 79 0
	mov	r0, r4
	bl	TrainServer_HandleQueryTrainEngine(PLT)
	b	.L255
.L239:
	.loc 1 93 0
	ldr	r1, .L263+24
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	b	.L255
.L251:
	.loc 1 83 0
	mov	r0, r4
	bl	TrainServer_HandleTrainEngineClientCommandRequest(PLT)
	b	.L255
.L252:
	.loc 1 87 0
	mov	r0, r4
	bl	TrainServer_HandleGetSwitchRequest(PLT)
	b	.L255
.L253:
	.loc 1 90 0
	mov	r0, r4
	bl	TrainServer_HandleSetSwitch(PLT)
	b	.L255
.L264:
	.align	2
.L263:
	.word	_GLOBAL_OFFSET_TABLE_-(.L261+8)
	.word	TrainServer_Start(GOT)
	.word	__func__.1906(GOT)
	.word	.LC21(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC22(GOTOFF)
.LBE12:
.LFE2:
	.size	TrainServer_Start, .-TrainServer_Start
	.section	.rodata
	.align	2
	.type	__func__.2371, %object
	.size	__func__.2371, 23
__func__.2371:
	.ascii	"TrainServerTimer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC25:
	.ascii	"TrainServerTimer failed to register name\000"
	.align	2
.LC26:
	.ascii	"TrainServerTimer: server tid not found\000"
	.align	2
.LC27:
	.ascii	"TrainServerTimer: didn't get ACK message\000"
	.text
	.align	2
	.global	TrainServerTimer_Start
	.type	TrainServerTimer_Start, %function
TrainServerTimer_Start:
.LFB28:
	.loc 1 613 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL156:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI26:
	ldr	sl, .L272
	.loc 1 614 0
	ldr	r2, .L272+4
	ldr	r3, .L272+8
	.loc 1 613 0
.L271:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI27:
.LVL157:
	.loc 1 614 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 615 0
	ldr	r3, .L272+12
	ldr	r8, .L272+16
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 616 0
	ldr	r1, .L272+20
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 621 0
	ldr	r3, .L272+24
	.loc 1 620 0
	add	r7, sp, #4
	.loc 1 621 0
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 622 0
	ldr	r1, .L272+28
	.loc 1 621 0
	mov	r5, r0
.LVL158:
	.loc 1 622 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 624 0
	mov	r3, #22
	add	r6, sp, #20
	str	r3, [sp, #20]
	mov	r4, #16
.L266:
	.loc 1 627 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 628 0
	mov	r3, r7
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	str	r4, [sp, #0]
	bl	Send(PLT)
	.loc 1 629 0
	ldr	r0, [sp, #4]
	add	r1, sl, r8
	cmp	r0, #12
	cmpne	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
	.loc 1 632 0
	ldr	r3, [sp, #4]
	cmp	r3, #12
	bne	.L266
	.loc 1 637 0
	bl	Exit(PLT)
	.loc 1 638 0
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L273:
	.align	2
.L272:
	.word	_GLOBAL_OFFSET_TABLE_-(.L271+8)
	.word	__func__.2371(GOT)
	.word	TrainServerTimer_Start(GOT)
	.word	TRAIN_SERVER_TIMER_NAME(GOT)
	.word	.LC27(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC26(GOTOFF)
.LFE28:
	.size	TrainServerTimer_Start, .-TrainServerTimer_Start
	.section	.rodata
	.align	2
	.type	__func__.2390, %object
	.size	__func__.2390, 25
__func__.2390:
	.ascii	"TrainCommandServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC28:
	.ascii	"TrainCommandServer failed to register\000"
	.align	2
.LC29:
	.ascii	"TrainCommandServer_Start: failed to get train serve"
	.ascii	"r tid\000"
	.align	2
.LC30:
	.ascii	"TrainCommandServer did not get train command\000"
	.align	2
.LC31:
	.ascii	"module_num out of range (not using 0-indexed?)\000"
	.align	2
.LC32:
	.ascii	"Unknown train command\000"
	.text
	.align	2
	.global	TrainCommandServer_Start
	.type	TrainCommandServer_Start, %function
TrainCommandServer_Start:
.LFB29:
	.loc 1 640 0
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL159:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI28:
	ldr	sl, .L290
	.loc 1 641 0
	ldr	r2, .L290+4
	ldr	r3, .L290+8
	.loc 1 640 0
.L288:
	add	sl, pc, sl
	sub	sp, sp, #76
.LCFI29:
.LVL160:
	.loc 1 641 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 643 0
	ldr	r3, .L290+12
	.loc 1 648 0
	add	r6, sp, #56
	.loc 1 643 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 644 0
	ldr	r1, .L290+16
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 652 0
	ldr	r3, .L290+20
	add	r7, sp, #72
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 654 0
	ldr	r1, .L290+24
	.loc 1 649 0
	add	r5, sp, #40
	.loc 1 654 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 660 0
	mov	r0, r7
	mov	r1, r6
	mov	r2, #16
	bl	Receive(PLT)
	.loc 1 662 0
	ldr	r0, [sp, #56]
	cmp	r0, #12
	beq	.L289
.LVL161:
.L276:
	.loc 1 667 0
	ldr	r1, .L290+28
	cmp	r0, #27
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 670 0
	ldr	r3, [sp, #60]
	sub	r3, r3, #2
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L278
	.p2align 2
.L285:
	b	.L279
	b	.L280
	b	.L281
	b	.L282
	b	.L283
	b	.L284
.L278:
	.loc 1 731 0
	ldr	r1, .L290+32
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.L286:
	.loc 1 735 0
	mov	r3, #10
	.loc 1 736 0
	mov	r1, r5
	mov	r2, #16
	ldr	r0, [sp, #72]
	.loc 1 735 0
	str	r3, [r5, #0]
	.loc 1 736 0
	bl	Reply(PLT)
	.loc 1 660 0
	mov	r0, r7
	mov	r1, r6
	mov	r2, #16
	bl	Receive(PLT)
	.loc 1 662 0
	ldr	r0, [sp, #56]
	cmp	r0, #12
	bne	.L276
.L289:
	.loc 1 663 0
	mov	r3, #10
	.loc 1 664 0
	mov	r1, r5
	mov	r2, #16
	ldr	r0, [sp, #72]
	.loc 1 663 0
	str	r3, [r5, #0]
	.loc 1 664 0
	bl	Reply(PLT)
	.loc 1 739 0
	bl	Exit(PLT)
	.loc 1 740 0
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L279:
	.loc 1 674 0
	mov	r1, #2
	ldrb	r2, [r6, #8]	@ zero_extendqisi2
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	mov	r0, #0
	bl	PutcAtomic(PLT)
	b	.L286
.L280:
	.loc 1 678 0
	ldrb	r4, [r6, #8]	@ zero_extendqisi2
	mov	r0, #0
	mov	r3, r4
	mov	r1, #2
	mov	r2, r0
	bl	PutcAtomic(PLT)
	.loc 1 679 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 680 0
	mov	r3, r4
	mov	r1, #2
	mov	r2, #15
	mov	r0, #0
	bl	PutcAtomic(PLT)
	.loc 1 681 0
	mov	r0, #1056964608
	bl	DelaySeconds(PLT)
	.loc 1 682 0
	mov	r3, r4
	mov	r1, #2
	mov	r2, #5
	mov	r0, #0
	bl	PutcAtomic(PLT)
	b	.L286
.L281:
	.loc 1 687 0
	ldrb	r2, [r6, #8]	@ zero_extendqisi2
	ldrb	r3, [r6, #9]	@ zero_extendqisi2
	mov	r1, #2
	mov	r0, #0
	bl	PutcAtomic(PLT)
	.loc 1 688 0
	ldr	r0, .L290+36
	bl	DelaySeconds(PLT)
	.loc 1 689 0
	mov	r1, #32
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 692 0
	ldr	r0, .L290+40
	bl	DelaySeconds(PLT)
	.loc 1 693 0
	mov	r1, #32
	mov	r0, #0
	bl	Putc(PLT)
	b	.L286
.L282:
	.loc 1 697 0
	ldrb	r4, [r6, #8]	@ zero_extendqisi2
.LVL162:
	.loc 1 698 0
	ldr	r1, .L290+44
	cmp	r4, #4
	movhi	r0, #0
	movls	r0, #1
	.loc 1 699 0
	add	r4, r4, #1
.LVL163:
	mvn	r4, r4, asl #26
	mvn	r4, r4, lsr #26
	.loc 1 698 0
	add	r1, sl, r1
	.loc 1 699 0
	and	r4, r4, #255
	.loc 1 698 0
	bl	assert(PLT)
	.loc 1 699 0
	mov	r1, r4
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 702 0
	mov	r0, #0
	bl	Getc(PLT)
	mov	r4, r0
	.loc 1 703 0
	mov	r0, #0
	bl	Getc(PLT)
	.loc 1 705 0
	strb	r4, [r5, #8]
	.loc 1 706 0
	strb	r0, [r5, #9]
	b	.L286
.L283:
	.loc 1 710 0
	ldrb	r0, [r6, #8]	@ zero_extendqisi2
	ldr	r1, .L290+44
	cmp	r0, #4
	movhi	r0, #0
	movls	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 711 0
	mov	r1, #133
	mov	r0, #0
	bl	Putc(PLT)
	.loc 1 714 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #20]
	.loc 1 715 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #0]
	.loc 1 716 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #24]
	.loc 1 717 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #4]
	.loc 1 718 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #28]
	.loc 1 719 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #8]
	.loc 1 720 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #32]
	.loc 1 721 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #12]
	.loc 1 722 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #36]
	.loc 1 723 0
	mov	r0, #0
	bl	Getc(PLT)
	str	r0, [sp, #16]
	b	.L286
.L284:
	.loc 1 727 0
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	add	r2, sp, #76
	add	r1, r2, r3, asl #2
	ldr	r2, [r1, #-56]
	strb	r2, [r5, #8]
	.loc 1 728 0
	ldr	r3, [r1, #-76]
	strb	r3, [r5, #9]
	b	.L286
.L291:
	.align	2
.L290:
	.word	_GLOBAL_OFFSET_TABLE_-(.L288+8)
	.word	__func__.2390(GOT)
	.word	TrainCommandServer_Start(GOT)
	.word	TRAIN_COMMAND_SERVER_NAME(GOT)
	.word	.LC28(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	1041865114
	.word	1045220557
	.word	.LC31(GOTOFF)
.LFE29:
	.size	TrainCommandServer_Start, .-TrainCommandServer_Start
	.section	.rodata
	.align	2
	.type	__func__.2454, %object
	.size	__func__.2454, 24
__func__.2454:
	.ascii	"TrainSensorReader_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC33:
	.ascii	"TrainSensorMessage size too big\000"
	.align	2
.LC34:
	.ascii	"TrainSensorReader failed to get server tid\000"
	.align	2
.LC35:
	.ascii	"TrainSensorReader failed to get ACK message\000"
	.text
	.align	2
	.global	TrainSensorReader_Start
	.type	TrainSensorReader_Start, %function
TrainSensorReader_Start:
.LFB30:
	.loc 1 742 0
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL164:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI30:
	ldr	sl, .L305
	.loc 1 743 0
	ldr	r3, .L305+4
	ldr	r2, .L305+8
	.loc 1 742 0
.L303:
	add	sl, pc, sl
	sub	sp, sp, #48
.LCFI31:
.LVL165:
	.loc 1 743 0
	ldr	r0, [sl, r3]
	ldr	r1, [sl, r2]
	bl	DebugRegisterFunction(PLT)
	.loc 1 755 0
	ldr	r1, .L305+12
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	ldr	r6, .L305+16
	ldr	r5, .L305+20
	.loc 1 748 0
	add	r3, sp, #12
	.loc 1 747 0
	add	r8, sp, #28
	.loc 1 755 0
	mov	r4, #0
.LVL166:
	.loc 1 748 0
	str	r3, [sp, #8]
	b	.L293
.LVL167:
.L304:
	.loc 1 766 0
	cmp	r4, #99
	movgt	r0, #0
	movle	r0, #1
	bl	assert(PLT)
.L293:
	.loc 1 759 0
	ldr	r0, [sl, r6]
	bl	WhoIs(PLT)
	.loc 1 761 0
	subs	r9, r0, #0
	.loc 1 765 0
	add	r4, r4, #1
	.loc 1 766 0
	add	r1, sl, r5
	.loc 1 761 0
	beq	.L304
	.loc 1 769 0
	mov	r0, #1065353216
	bl	DelaySeconds(PLT)
	add	r3, sp, #47
	str	r3, [sp, #4]
	add	fp, sp, #46
.LVL168:
.L296:
	.loc 1 772 0
	mov	r1, #0
	mov	r0, #6
	mov	r2, r1
	str	fp, [sp, #0]
	bl	SendTrainCommand(PLT)
	mov	r7, #0
.L297:
.LBB13:
	.loc 1 774 0
	mov	r1, r7
	mov	r2, #0
	ldr	r3, [sp, #4]
	mov	r0, #7
	str	fp, [sp, #0]
	bl	SendTrainCommand(PLT)
	.loc 1 778 0
	ldrb	r3, [sp, #46]	@ zero_extendqisi2
.LVL169:
	.loc 1 779 0
	ldrb	r2, [sp, #47]	@ zero_extendqisi2
.LVL170:
	.loc 1 781 0
	ldr	r4, .L305+24
.LVL171:
	ldr	r0, .L305+28
	add	r3, r3, r3, asl #10
.LVL172:
	.loc 1 783 0
	add	r2, r2, r2, asl #10
.LVL173:
	.loc 1 781 0
	mov	ip, r3, asl #5
	.loc 1 783 0
	mov	r5, r2, asl #5
	mov	lr, r4
	mov	r1, r0
	.loc 1 781 0
	mov	r3, r3, asl #1
	.loc 1 783 0
	mov	r2, r2, asl #1
	.loc 1 781 0
	and	r0, ip, r0
	.loc 1 783 0
	and	r1, r5, r1
	.loc 1 781 0
	and	r4, r3, r4
	.loc 1 783 0
	and	lr, r2, lr
	.loc 1 781 0
	orr	r4, r4, r0
	.loc 1 783 0
	orr	lr, lr, r1
	.loc 1 781 0
	add	r3, r4, r4, asl #8
	.loc 1 783 0
	add	r2, lr, lr, asl #8
	.loc 1 781 0
	add	r4, r4, r3, asl #8
	.loc 1 783 0
	add	lr, lr, r2, asl #8
	.loc 1 781 0
	mov	r4, r4, lsr #16
	.loc 1 783 0
	mov	lr, lr, lsr #16
	and	lr, lr, #255
	.loc 1 781 0
	and	r4, r4, #255
	.loc 1 789 0
	mov	r6, #16
	.loc 1 786 0
	orr	r5, lr, r4, asl #8
	.loc 1 789 0
	mov	r1, r8
	.loc 1 785 0
	mov	ip, #25
	.loc 1 789 0
	mov	r2, r6
	ldr	r3, [sp, #8]
	mov	r0, r9
	.loc 1 787 0
	str	r7, [r8, #4]
	.loc 1 785 0
	str	ip, [r8, #0]
	.loc 1 786 0
	str	r5, [r8, #8]
	.loc 1 781 0
	strb	r4, [sp, #46]
	.loc 1 783 0
	strb	lr, [sp, #47]
	.loc 1 789 0
	str	r6, [sp, #0]
	bl	Send(PLT)
	.loc 1 791 0
	ldr	r0, [sp, #12]
	.loc 1 796 0
	ldr	r1, .L305+32
	.loc 1 791 0
	cmp	r0, #12
	.loc 1 796 0
	add	r7, r7, #1
	add	r1, sl, r1
	.loc 1 791 0
	beq	.L298
	.loc 1 796 0
	cmp	r0, #10
	movne	r0, #0
	moveq	r0, #1
	bl	assert(PLT)
.LBE13:
	.loc 1 773 0
	cmp	r7, #5
	bne	.L297
	ldr	r3, [sp, #4]
	b	.L296
.L298:
	.loc 1 805 0
	bl	Exit(PLT)
	.loc 1 806 0
	add	sp, sp, #48
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L306:
	.align	2
.L305:
	.word	_GLOBAL_OFFSET_TABLE_-(.L303+8)
	.word	TrainSensorReader_Start(GOT)
	.word	__func__.2454(GOT)
	.word	.LC33(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC34(GOTOFF)
	.word	139536
	.word	558144
	.word	.LC35(GOTOFF)
.LFE30:
	.size	TrainSensorReader_Start, .-TrainSensorReader_Start
	.align	2
	.global	TrainEngine_SetInitialSwitches
	.type	TrainEngine_SetInitialSwitches, %function
TrainEngine_SetInitialSwitches:
.LFB33:
	.loc 1 856 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL174:
	str	lr, [sp, #-4]!
.LCFI32:
	.loc 1 857 0
	mov	r1, #11
	mov	r0, #34
	bl	SetTrainSwitch(PLT)
	.loc 1 858 0
	mov	r1, #14
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 859 0
	mov	r1, #15
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 860 0
	mov	r1, #6
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 861 0
	mov	r1, #7
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 862 0
	mov	r1, #8
	mov	r0, #33
	bl	SetTrainSwitch(PLT)
	.loc 1 863 0
	mov	r0, #33
	mov	r1, #9
	.loc 1 864 0
	ldr	lr, [sp], #4
	.loc 1 863 0
	b	SetTrainSwitch(PLT)
.LFE33:
	.size	TrainEngine_SetInitialSwitches, .-TrainEngine_SetInitialSwitches
	.section	.rodata
	.align	2
	.type	__func__.2505, %object
	.size	__func__.2505, 24
__func__.2505:
	.ascii	"TrainEngineClient_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC36:
	.ascii	"TrainEngineClient failed to get server tid\000"
	.align	2
.LC37:
	.ascii	"TrainEngineClient: unknown message type %d\000"
	.text
	.align	2
	.global	TrainEngineClient_Start
	.type	TrainEngineClient_Start, %function
TrainEngineClient_Start:
.LFB32:
	.loc 1 823 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL175:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI33:
	ldr	sl, .L324
	.loc 1 824 0
	ldr	r3, .L324+4
	ldr	r2, .L324+8
	.loc 1 823 0
.L321:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI34:
.LVL176:
	.loc 1 824 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 829 0
	bl	MyParentTid(PLT)
	.loc 1 830 0
	ldr	r1, .L324+12
	.loc 1 829 0
	mov	r5, r0
.LVL177:
	.loc 1 830 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 832 0
	mov	r3, #36
	str	r3, [sp, #20]
	.loc 1 834 0
	bl	TrainEngine_SetInitialSwitches(PLT)
	ldr	r7, .L324+16
	.loc 1 828 0
	add	r4, sp, #4
	add	r6, sp, #20
.L322:
	.loc 1 837 0
	mov	ip, #16
	mov	r3, r4
	mov	r2, ip
	mov	r1, r6
	mov	r0, r5
	str	ip, [sp, #0]
	bl	Send(PLT)
	.loc 1 839 0
	ldr	r3, [sp, #8]
	.loc 1 842 0
	ldr	r0, .L324+20
	.loc 1 839 0
	cmp	r3, #0
	beq	.L312
	cmp	r3, #1
	.loc 1 848 0
	mov	r2, r3
	mov	r0, #0
	add	r1, sl, r7
	.loc 1 839 0
	beq	.L323
	.loc 1 848 0
	bl	assertf(PLT)
	b	.L322
.L312:
	.loc 1 842 0
	bl	DelaySeconds(PLT)
	b	.L322
.L323:
	.loc 1 845 0
	mov	ip, #0
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	ldrb	r2, [r4, #9]	@ zero_extendqisi2
	mov	r3, ip
	mov	r0, #2
	str	ip, [sp, #0]
	bl	SendTrainCommand(PLT)
	b	.L322
.L325:
	.align	2
.L324:
	.word	_GLOBAL_OFFSET_TABLE_-(.L321+8)
	.word	TrainEngineClient_Start(GOT)
	.word	__func__.2505(GOT)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	1008981770
.LFE32:
	.size	TrainEngineClient_Start, .-TrainEngineClient_Start
	.section	.rodata
	.align	2
	.type	__func__.2527, %object
	.size	__func__.2527, 24
__func__.2527:
	.ascii	"TrainSwitchMaster_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC38:
	.ascii	"TrainSwitchMaster failed to register\000"
	.align	2
.LC39:
	.ascii	"TrainSwitchMaster_Start: failed to get train server"
	.ascii	" tid\000"
	.text
	.align	2
	.global	TrainSwitchMaster_Start
	.type	TrainSwitchMaster_Start, %function
TrainSwitchMaster_Start:
.LFB34:
	.loc 1 866 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL178:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI35:
	ldr	sl, .L338
	.loc 1 867 0
	ldr	r2, .L338+4
	ldr	r3, .L338+8
	.loc 1 866 0
.L336:
	add	sl, pc, sl
	sub	sp, sp, #36
.LCFI36:
.LVL179:
	.loc 1 867 0
	ldr	r1, [sl, r2]
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 869 0
	ldr	r3, .L338+12
	.loc 1 875 0
	add	r6, sp, #4
	.loc 1 869 0
	ldr	r0, [sl, r3]
	bl	RegisterAs(PLT)
	.loc 1 870 0
	ldr	r1, .L338+16
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 877 0
	ldr	r3, .L338+20
	add	r5, sp, #20
	ldr	r0, [sl, r3]
	bl	WhoIs(PLT)
	.loc 1 879 0
	ldr	r1, .L338+24
	.loc 1 877 0
	mov	r4, r0
.LVL180:
	.loc 1 879 0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 881 0
	mov	r3, #37
	str	r3, [sp, #20]
	b	.L337
.L328:
	.loc 1 891 0
	ldr	r0, .L338+28
	bl	DelaySeconds(PLT)
.L337:
	.loc 1 884 0
	mov	ip, #16
	mov	r2, ip
	mov	r3, r6
	mov	r1, r5
	mov	r0, r4
	str	ip, [sp, #0]
	bl	Send(PLT)
	.loc 1 886 0
	ldr	r2, [sp, #4]
	.loc 1 889 0
	mov	ip, #0
	.loc 1 886 0
	cmp	r2, #10
	.loc 1 889 0
	mov	r3, ip
	mov	r0, #4
	.loc 1 886 0
	bne	.L328
	.loc 1 889 0
	ldrb	r1, [sp, #12]	@ zero_extendqisi2
	ldrb	r2, [sp, #13]	@ zero_extendqisi2
	str	ip, [sp, #0]
	bl	SendTrainCommand(PLT)
	b	.L337
.L339:
	.align	2
.L338:
	.word	_GLOBAL_OFFSET_TABLE_-(.L336+8)
	.word	__func__.2527(GOT)
	.word	TrainSwitchMaster_Start(GOT)
	.word	TRAIN_SWITCH_MASTER_NAME(GOT)
	.word	.LC38(GOTOFF)
	.word	TRAIN_SERVER_NAME(GOT)
	.word	.LC39(GOTOFF)
	.word	1028443341
.LFE34:
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
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x4
	.4byte	.LCFI1-.LFB31
	.byte	0xe
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI2-.LFB9
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI3-.LFB3
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
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI4-.LFB4
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
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI5-.LFB10
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
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI6-.LFB12
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
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x4
	.4byte	.LCFI7-.LFB27
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
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x4
	.4byte	.LCFI8-.LFB26
	.byte	0xe
	.uleb128 0x18
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
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI10-.LFB21
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
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x20
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI12-.LFB22
	.byte	0xe
	.uleb128 0x1c
	.byte	0x8e
	.uleb128 0x1
	.byte	0x89
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
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI13-.LFB18
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
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI15-.LFB14
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
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
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI17-.LFB23
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
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI18-.LFB24
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
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI19-.LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x4
	.4byte	.LCFI20-.LFB19
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI21-.LFB17
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
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
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
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
	.uleb128 0x4910
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x491c
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI26-.LFB28
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
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x4
	.4byte	.LCFI28-.LFB29
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
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x4
	.4byte	.LCFI30-.LFB30
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
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI32-.LFB33
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI33-.LFB32
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
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI35-.LFB34
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
.LEFDE64:
	.file 2 "train.h"
	.file 3 "message.h"
	.file 4 "random.h"
	.file 5 "tracks/track_node.h"
	.file 6 "queue.h"
	.file 7 "route.h"
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
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL28-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL39-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL45-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL52-.Ltext0
	.4byte	.LFE27-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL53-.Ltext0
	.4byte	.LFE27-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL54-.Ltext0
	.4byte	.LFE27-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58-.Ltext0
	.4byte	.LFE26-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL61-.Ltext0
	.4byte	.LFE26-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST30:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL66-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST31:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL67-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST32:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL69-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST33:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL72-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL74-.Ltext0
	.4byte	.LVL76-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL76-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST34:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST35:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL70-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST36:
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL81-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL84-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL85-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL87-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST37:
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL80-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST38:
	.4byte	.LVL78-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST39:
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL87-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST40:
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL86-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL87-.Ltext0
	.4byte	.LFE22-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST41:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL91-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST42:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL90-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL90-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST43:
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL92-.Ltext0
	.4byte	.LFE18-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST44:
	.4byte	.LVL93-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST45:
	.4byte	.LVL95-.Ltext0
	.4byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST46:
	.4byte	.LVL97-.Ltext0
	.4byte	.LVL100-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL100-.Ltext0
	.4byte	.LVL101-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL101-.Ltext0
	.4byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL102-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST47:
	.4byte	.LVL98-.Ltext0
	.4byte	.LVL99-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL101-.Ltext0
	.4byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST48:
	.4byte	.LVL103-.Ltext0
	.4byte	.LVL104-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL104-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST49:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL107-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST50:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL108-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST51:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL110-.Ltext0
	.4byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST52:
	.4byte	.LVL109-.Ltext0
	.4byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL110-.Ltext0
	.4byte	.LFE23-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST53:
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL114-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL114-.Ltext0
	.4byte	.LVL115-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL116-.Ltext0
	.4byte	.LVL117-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST54:
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL120-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST55:
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL122-.Ltext0
	.4byte	.LVL123-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL123-.Ltext0
	.4byte	.LVL124-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL124-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST56:
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL122-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL122-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST57:
	.4byte	.LVL125-.Ltext0
	.4byte	.LVL127-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL128-.Ltext0
	.4byte	.LFE25-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST58:
	.4byte	.LVL126-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST59:
	.4byte	.LVL129-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST60:
	.4byte	.LVL131-.Ltext0
	.4byte	.LVL132-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL132-.Ltext0
	.4byte	.LVL134-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL134-.Ltext0
	.4byte	.LVL135-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL135-.Ltext0
	.4byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST61:
	.4byte	.LVL131-.Ltext0
	.4byte	.LVL132-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL132-.Ltext0
	.4byte	.LVL134-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL134-.Ltext0
	.4byte	.LVL135-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL135-.Ltext0
	.4byte	.LFE19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST62:
	.4byte	.LVL133-.Ltext0
	.4byte	.LVL135-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST63:
	.4byte	.LVL136-.Ltext0
	.4byte	.LVL137-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL137-.Ltext0
	.4byte	.LVL139-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL139-.Ltext0
	.4byte	.LVL141-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL141-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST64:
	.4byte	.LVL136-.Ltext0
	.4byte	.LVL137-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL137-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST65:
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL140-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST66:
	.4byte	.LVL142-.Ltext0
	.4byte	.LVL144-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL145-.Ltext0
	.4byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL146-.Ltext0
	.4byte	.LVL147-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL147-.Ltext0
	.4byte	.LVL148-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL148-.Ltext0
	.4byte	.LVL149-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL149-.Ltext0
	.4byte	.LVL150-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL150-.Ltext0
	.4byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST67:
	.4byte	.LVL142-.Ltext0
	.4byte	.LVL143-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL145-.Ltext0
	.4byte	.LVL146-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL146-.Ltext0
	.4byte	.LVL147-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL147-.Ltext0
	.4byte	.LVL148-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL148-.Ltext0
	.4byte	.LVL149-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL149-.Ltext0
	.4byte	.LVL150-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL150-.Ltext0
	.4byte	.LVL151-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST68:
	.4byte	.LVL152-.Ltext0
	.4byte	.LVL153-.Ltext0
	.2byte	0x4
	.byte	0x7d
	.sleb128 -18700
	.4byte	.LVL153-.Ltext0
	.4byte	.LVL154-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL154-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST69:
	.4byte	.LVL156-.Ltext0
	.4byte	.LVL157-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL157-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST70:
	.4byte	.LVL159-.Ltext0
	.4byte	.LVL160-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -76
	.4byte	.LVL160-.Ltext0
	.4byte	.LFE29-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST71:
	.4byte	.LVL162-.Ltext0
	.4byte	.LVL163-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST72:
	.4byte	.LVL164-.Ltext0
	.4byte	.LVL165-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -48
	.4byte	.LVL165-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST73:
	.4byte	.LVL166-.Ltext0
	.4byte	.LVL171-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST74:
	.4byte	.LVL169-.Ltext0
	.4byte	.LVL172-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST75:
	.4byte	.LVL170-.Ltext0
	.4byte	.LVL173-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST76:
	.4byte	.LVL175-.Ltext0
	.4byte	.LVL176-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL176-.Ltext0
	.4byte	.LFE32-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST77:
	.4byte	.LVL178-.Ltext0
	.4byte	.LVL179-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -36
	.4byte	.LVL179-.Ltext0
	.4byte	.LFE34-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x17d9
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF247
	.byte	0x1
	.4byte	.LASF248
	.4byte	.LASF249
	.uleb128 0x2
	.4byte	0x40
	.4byte	.LASF2
	.byte	0x4
	.byte	0x6
	.byte	0x31
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x6
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
	.byte	0x6
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
	.4byte	0x6b
	.4byte	0x42
	.uleb128 0x8
	.4byte	0x54
	.byte	0x9
	.byte	0x0
	.uleb128 0x9
	.4byte	0xbf
	.4byte	.LASF3
	.2byte	0x410
	.byte	0x6
	.byte	0x4e
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x6
	.byte	0x4f
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x6
	.byte	0x50
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x6
	.byte	0x51
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x6
	.byte	0x52
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x6
	.byte	0x53
	.4byte	0xbf
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x7
	.4byte	0xcf
	.4byte	0x42
	.uleb128 0x8
	.4byte	0x54
	.byte	0xff
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x6
	.byte	0x54
	.4byte	0x6b
	.uleb128 0x2
	.4byte	0x12d
	.4byte	.LASF9
	.byte	0x38
	.byte	0x6
	.byte	0x56
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x6
	.byte	0x57
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x6
	.byte	0x58
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x6
	.byte	0x59
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x6
	.byte	0x5a
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x6
	.byte	0x5b
	.4byte	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x6
	.byte	0x5c
	.4byte	0xda
	.uleb128 0xb
	.4byte	0x22f
	.4byte	.LASF49
	.byte	0x4
	.byte	0x3
	.byte	0x9
	.uleb128 0xc
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF11
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF12
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF13
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF14
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF15
	.sleb128 5
	.uleb128 0xc
	.4byte	.LASF16
	.sleb128 6
	.uleb128 0xc
	.4byte	.LASF17
	.sleb128 7
	.uleb128 0xc
	.4byte	.LASF18
	.sleb128 8
	.uleb128 0xc
	.4byte	.LASF19
	.sleb128 9
	.uleb128 0xc
	.4byte	.LASF20
	.sleb128 10
	.uleb128 0xc
	.4byte	.LASF21
	.sleb128 11
	.uleb128 0xc
	.4byte	.LASF22
	.sleb128 12
	.uleb128 0xc
	.4byte	.LASF23
	.sleb128 13
	.uleb128 0xc
	.4byte	.LASF24
	.sleb128 14
	.uleb128 0xc
	.4byte	.LASF25
	.sleb128 15
	.uleb128 0xc
	.4byte	.LASF26
	.sleb128 16
	.uleb128 0xc
	.4byte	.LASF27
	.sleb128 17
	.uleb128 0xc
	.4byte	.LASF28
	.sleb128 18
	.uleb128 0xc
	.4byte	.LASF29
	.sleb128 19
	.uleb128 0xc
	.4byte	.LASF30
	.sleb128 20
	.uleb128 0xc
	.4byte	.LASF31
	.sleb128 21
	.uleb128 0xc
	.4byte	.LASF32
	.sleb128 22
	.uleb128 0xc
	.4byte	.LASF33
	.sleb128 23
	.uleb128 0xc
	.4byte	.LASF34
	.sleb128 24
	.uleb128 0xc
	.4byte	.LASF35
	.sleb128 25
	.uleb128 0xc
	.4byte	.LASF36
	.sleb128 26
	.uleb128 0xc
	.4byte	.LASF37
	.sleb128 27
	.uleb128 0xc
	.4byte	.LASF38
	.sleb128 28
	.uleb128 0xc
	.4byte	.LASF39
	.sleb128 29
	.uleb128 0xc
	.4byte	.LASF40
	.sleb128 30
	.uleb128 0xc
	.4byte	.LASF41
	.sleb128 31
	.uleb128 0xc
	.4byte	.LASF42
	.sleb128 32
	.uleb128 0xc
	.4byte	.LASF43
	.sleb128 33
	.uleb128 0xc
	.4byte	.LASF44
	.sleb128 34
	.uleb128 0xc
	.4byte	.LASF45
	.sleb128 35
	.uleb128 0xc
	.4byte	.LASF46
	.sleb128 36
	.uleb128 0xc
	.4byte	.LASF47
	.sleb128 37
	.uleb128 0xc
	.4byte	.LASF48
	.sleb128 38
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF49
	.byte	0x3
	.byte	0x31
	.4byte	0x138
	.uleb128 0xd
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x7
	.4byte	0x251
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0xf
	.byte	0x0
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x1
	.byte	0x8
	.uleb128 0xe
	.byte	0x4
	.4byte	0x251
	.uleb128 0x2
	.4byte	0x279
	.4byte	.LASF51
	.byte	0x4
	.byte	0x3
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x3
	.byte	0x41
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF51
	.byte	0x3
	.byte	0x42
	.4byte	0x25e
	.uleb128 0xf
	.4byte	0x2c1
	.ascii	"RNG\000"
	.byte	0x10
	.byte	0x4
	.byte	0x4
	.uleb128 0xa
	.ascii	"a\000"
	.byte	0x4
	.byte	0x5
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"c\000"
	.byte	0x4
	.byte	0x6
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x4
	.byte	0x7
	.4byte	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
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
	.4byte	0x284
	.uleb128 0x11
	.4byte	0x2f9
	.byte	0x4
	.byte	0x5
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF53
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF54
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF55
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF56
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF57
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF58
	.sleb128 5
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF59
	.byte	0x5
	.byte	0xb
	.4byte	0x2cc
	.uleb128 0x5
	.4byte	.LASF60
	.byte	0x5
	.byte	0x12
	.4byte	0x30f
	.uleb128 0x2
	.4byte	0x362
	.4byte	.LASF60
	.byte	0x30
	.byte	0x5
	.byte	0x11
	.uleb128 0x3
	.4byte	.LASF61
	.byte	0x5
	.byte	0x1c
	.4byte	0x3be
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0x5
	.byte	0x1d
	.4byte	0x2f9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.ascii	"num\000"
	.byte	0x5
	.byte	0x1e
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0x5
	.byte	0x1f
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x5
	.byte	0x20
	.4byte	0x3c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF65
	.byte	0x5
	.byte	0x13
	.4byte	0x36d
	.uleb128 0x2
	.4byte	0x3b2
	.4byte	.LASF65
	.byte	0x10
	.byte	0x5
	.byte	0x13
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0x5
	.byte	0x16
	.4byte	0x3b2
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"src\000"
	.byte	0x5
	.byte	0x17
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF66
	.byte	0x5
	.byte	0x17
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF67
	.byte	0x5
	.byte	0x18
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x362
	.uleb128 0xe
	.byte	0x4
	.4byte	0x304
	.uleb128 0xe
	.byte	0x4
	.4byte	0x3c4
	.uleb128 0x12
	.4byte	0x251
	.uleb128 0x7
	.4byte	0x3d9
	.4byte	0x362
	.uleb128 0x8
	.4byte	0x54
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.4byte	0x416
	.4byte	.LASF68
	.byte	0x4
	.byte	0x2
	.byte	0x12
	.uleb128 0xc
	.4byte	.LASF69
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF70
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF71
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF72
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF73
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF74
	.sleb128 5
	.uleb128 0xc
	.4byte	.LASF75
	.sleb128 6
	.uleb128 0xc
	.4byte	.LASF76
	.sleb128 7
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF68
	.byte	0x2
	.byte	0x1b
	.4byte	0x3d9
	.uleb128 0xb
	.4byte	0x440
	.4byte	.LASF77
	.byte	0x4
	.byte	0x2
	.byte	0x26
	.uleb128 0xc
	.4byte	.LASF78
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF79
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF80
	.sleb128 2
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF77
	.byte	0x2
	.byte	0x2a
	.4byte	0x421
	.uleb128 0xb
	.4byte	0x46d
	.4byte	.LASF81
	.byte	0x4
	.byte	0x2
	.byte	0x2c
	.uleb128 0xc
	.4byte	.LASF82
	.sleb128 85
	.uleb128 0xc
	.4byte	.LASF83
	.sleb128 83
	.uleb128 0xc
	.4byte	.LASF84
	.sleb128 67
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF81
	.byte	0x2
	.byte	0x30
	.4byte	0x44b
	.uleb128 0xb
	.4byte	0x4a9
	.4byte	.LASF85
	.byte	0x4
	.byte	0x2
	.byte	0x37
	.uleb128 0xc
	.4byte	.LASF86
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF87
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF88
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF89
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF90
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF91
	.sleb128 5
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF85
	.byte	0x2
	.byte	0x3e
	.4byte	0x478
	.uleb128 0xb
	.4byte	0x4cd
	.4byte	.LASF92
	.byte	0x4
	.byte	0x2
	.byte	0x40
	.uleb128 0xc
	.4byte	.LASF93
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF94
	.sleb128 1
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF92
	.byte	0x2
	.byte	0x43
	.4byte	0x4b4
	.uleb128 0x2
	.4byte	0x51b
	.4byte	.LASF95
	.byte	0xc
	.byte	0x2
	.byte	0x45
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x2
	.byte	0x46
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF96
	.byte	0x2
	.byte	0x47
	.4byte	0x416
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.ascii	"c1\000"
	.byte	0x2
	.byte	0x48
	.4byte	0x251
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.ascii	"c2\000"
	.byte	0x2
	.byte	0x49
	.4byte	0x251
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF95
	.byte	0x2
	.byte	0x4a
	.4byte	0x4d8
	.uleb128 0x2
	.4byte	0x569
	.4byte	.LASF97
	.byte	0xc
	.byte	0x2
	.byte	0x4c
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x2
	.byte	0x4d
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF96
	.byte	0x2
	.byte	0x4e
	.4byte	0x4cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.ascii	"c1\000"
	.byte	0x2
	.byte	0x4f
	.4byte	0x251
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.ascii	"c2\000"
	.byte	0x2
	.byte	0x50
	.4byte	0x251
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF97
	.byte	0x2
	.byte	0x51
	.4byte	0x526
	.uleb128 0x2
	.4byte	0x5ab
	.4byte	.LASF98
	.byte	0xc
	.byte	0x2
	.byte	0x53
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x2
	.byte	0x54
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF99
	.byte	0x2
	.byte	0x55
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF100
	.byte	0x2
	.byte	0x56
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF98
	.byte	0x2
	.byte	0x57
	.4byte	0x574
	.uleb128 0x2
	.4byte	0x5fb
	.4byte	.LASF101
	.byte	0x10
	.byte	0x2
	.byte	0x59
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x2
	.byte	0x5a
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF102
	.byte	0x2
	.byte	0x5b
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF103
	.byte	0x2
	.byte	0x5c
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF104
	.byte	0x2
	.byte	0x5d
	.4byte	0x258
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF101
	.byte	0x2
	.byte	0x5e
	.4byte	0x5b6
	.uleb128 0x5
	.4byte	.LASF105
	.byte	0x2
	.byte	0x60
	.4byte	0x611
	.uleb128 0x9
	.4byte	0x701
	.4byte	.LASF105
	.2byte	0x4fc
	.byte	0x2
	.byte	0x60
	.uleb128 0xa
	.ascii	"tid\000"
	.byte	0x2
	.byte	0x79
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF106
	.byte	0x2
	.byte	0x7a
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF107
	.byte	0x2
	.byte	0x7b
	.4byte	0x4a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.4byte	.LASF108
	.byte	0x2
	.byte	0x7c
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.4byte	.LASF109
	.byte	0x2
	.byte	0x7d
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x3
	.4byte	.LASF110
	.byte	0x2
	.byte	0x7e
	.4byte	0x77d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x3
	.4byte	.LASF111
	.byte	0x2
	.byte	0x7f
	.4byte	0x77d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x3
	.4byte	.LASF112
	.byte	0x2
	.byte	0x80
	.4byte	0x77d
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x3
	.4byte	.LASF113
	.byte	0x2
	.byte	0x81
	.4byte	0x77d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x3
	.4byte	.LASF114
	.byte	0x2
	.byte	0x82
	.4byte	0x23a
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x3
	.4byte	.LASF115
	.byte	0x2
	.byte	0x83
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x3
	.4byte	.LASF116
	.byte	0x2
	.byte	0x84
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x3
	.4byte	.LASF117
	.byte	0x2
	.byte	0x85
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x3
	.4byte	.LASF118
	.byte	0x2
	.byte	0x86
	.4byte	0x784
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x3
	.4byte	.LASF119
	.byte	0x2
	.byte	0x87
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x4f4
	.uleb128 0x3
	.4byte	.LASF120
	.byte	0x2
	.byte	0x88
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x4f8
	.byte	0x0
	.uleb128 0x2
	.4byte	0x72a
	.4byte	.LASF121
	.byte	0x8
	.byte	0x2
	.byte	0x62
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x2
	.byte	0x63
	.4byte	0x22f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF122
	.byte	0x2
	.byte	0x6a
	.4byte	0x72a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x606
	.uleb128 0x5
	.4byte	.LASF121
	.byte	0x2
	.byte	0x6b
	.4byte	0x701
	.uleb128 0x5
	.4byte	.LASF123
	.byte	0x7
	.byte	0x3
	.4byte	0x746
	.uleb128 0x2
	.4byte	0x77d
	.4byte	.LASF123
	.byte	0xc
	.byte	0x7
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF124
	.byte	0x7
	.byte	0xf
	.4byte	0x3b8
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x7
	.byte	0x10
	.4byte	0x3b2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF125
	.byte	0x7
	.byte	0x11
	.4byte	0x46d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x6
	.4byte	.LASF126
	.byte	0x8
	.byte	0x4
	.uleb128 0x7
	.4byte	0x794
	.4byte	0x73b
	.uleb128 0x8
	.4byte	0x54
	.byte	0x63
	.byte	0x0
	.uleb128 0x9
	.4byte	0x903
	.4byte	.LASF127
	.2byte	0x4908
	.byte	0x2
	.byte	0x8b
	.uleb128 0x3
	.4byte	.LASF128
	.byte	0x2
	.byte	0x8c
	.4byte	0x241
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF129
	.byte	0x2
	.byte	0x8d
	.4byte	0x241
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x3
	.4byte	.LASF130
	.byte	0x2
	.byte	0x8e
	.4byte	0x903
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x3
	.4byte	.LASF131
	.byte	0x2
	.byte	0x8f
	.4byte	0x903
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x3
	.4byte	.LASF107
	.byte	0x2
	.byte	0x90
	.4byte	0x440
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xa
	.ascii	"rng\000"
	.byte	0x2
	.byte	0x91
	.4byte	0x2c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x3
	.4byte	.LASF132
	.byte	0x2
	.byte	0x98
	.4byte	0x909
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x3
	.4byte	.LASF133
	.byte	0x2
	.byte	0x99
	.4byte	0x909
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x3
	.4byte	.LASF134
	.byte	0x2
	.byte	0x9a
	.4byte	0x919
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x3
	.4byte	.LASF135
	.byte	0x2
	.byte	0x9b
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1a4
	.uleb128 0x3
	.4byte	.LASF136
	.byte	0x2
	.byte	0x9c
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1a8
	.uleb128 0x3
	.4byte	.LASF137
	.byte	0x2
	.byte	0x9d
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1ac
	.uleb128 0x3
	.4byte	.LASF138
	.byte	0x2
	.byte	0x9e
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b0
	.uleb128 0x3
	.4byte	.LASF139
	.byte	0x2
	.byte	0x9f
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b4
	.uleb128 0x3
	.4byte	.LASF140
	.byte	0x2
	.byte	0xa0
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1b8
	.uleb128 0x3
	.4byte	.LASF141
	.byte	0x2
	.byte	0xa1
	.4byte	0x23a
	.byte	0x3
	.byte	0x23
	.uleb128 0x1bc
	.uleb128 0x3
	.4byte	.LASF142
	.byte	0x2
	.byte	0xa3
	.4byte	0x92f
	.byte	0x3
	.byte	0x23
	.uleb128 0x1c0
	.uleb128 0x3
	.4byte	.LASF143
	.byte	0x2
	.byte	0xa4
	.4byte	0x92f
	.byte	0x3
	.byte	0x23
	.uleb128 0x1cc0
	.uleb128 0x3
	.4byte	.LASF144
	.byte	0x2
	.byte	0xa5
	.4byte	0x3b8
	.byte	0x3
	.byte	0x23
	.uleb128 0x37c0
	.uleb128 0x3
	.4byte	.LASF145
	.byte	0x2
	.byte	0xa7
	.4byte	0x93f
	.byte	0x3
	.byte	0x23
	.uleb128 0x37c4
	.uleb128 0x3
	.4byte	.LASF146
	.byte	0x2
	.byte	0xa8
	.4byte	0x93f
	.byte	0x3
	.byte	0x23
	.uleb128 0x3bc4
	.uleb128 0x3
	.4byte	.LASF147
	.byte	0x2
	.byte	0xa9
	.4byte	0xcf
	.byte	0x3
	.byte	0x23
	.uleb128 0x3fc4
	.uleb128 0x3
	.4byte	.LASF148
	.byte	0x2
	.byte	0xab
	.4byte	0x94f
	.byte	0x4
	.byte	0x23
	.uleb128 0x43d4
	.uleb128 0x3
	.4byte	.LASF149
	.byte	0x2
	.byte	0xac
	.4byte	0x12d
	.byte	0x4
	.byte	0x23
	.uleb128 0x48d0
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x279
	.uleb128 0x7
	.4byte	0x919
	.4byte	0x23a
	.uleb128 0x8
	.4byte	0x54
	.byte	0x4
	.byte	0x0
	.uleb128 0x7
	.4byte	0x92f
	.4byte	0x23a
	.uleb128 0x8
	.4byte	0x54
	.byte	0x4
	.uleb128 0x8
	.4byte	0x54
	.byte	0xf
	.byte	0x0
	.uleb128 0x7
	.4byte	0x93f
	.4byte	0x304
	.uleb128 0x8
	.4byte	0x54
	.byte	0x8f
	.byte	0x0
	.uleb128 0x7
	.4byte	0x94f
	.4byte	0x46d
	.uleb128 0x8
	.4byte	0x54
	.byte	0xff
	.byte	0x0
	.uleb128 0x7
	.4byte	0x95f
	.4byte	0x606
	.uleb128 0x8
	.4byte	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF127
	.byte	0x2
	.byte	0xad
	.4byte	0x794
	.uleb128 0x6
	.4byte	.LASF150
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF151
	.byte	0x2
	.byte	0x5
	.uleb128 0x13
	.4byte	0x9b6
	.byte	0x1
	.4byte	.LASF152
	.byte	0x1
	.byte	0xdc
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0xdc
	.4byte	0x9b6
	.4byte	.LLST0
	.uleb128 0x15
	.4byte	.LASF130
	.byte	0x1
	.byte	0xdd
	.4byte	0x9bc
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.byte	0xde
	.4byte	0x9bc
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x95f
	.uleb128 0xe
	.byte	0x4
	.4byte	0x51b
	.uleb128 0x13
	.4byte	0xa13
	.byte	0x1
	.4byte	.LASF153
	.byte	0x1
	.byte	0xce
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0xce
	.4byte	0x9b6
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x1
	.byte	0xcf
	.4byte	0xa13
	.uleb128 0x16
	.4byte	.LASF156
	.byte	0x1
	.byte	0xd0
	.4byte	0xa13
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LASF99
	.byte	0x1
	.byte	0xd2
	.4byte	0x23a
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x5ab
	.uleb128 0x13
	.4byte	0xa5b
	.byte	0x1
	.4byte	.LASF157
	.byte	0x1
	.byte	0xea
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0xea
	.4byte	0x9b6
	.4byte	.LLST4
	.uleb128 0x15
	.4byte	.LASF130
	.byte	0x1
	.byte	0xeb
	.4byte	0xa5b
	.uleb128 0x16
	.4byte	.LASF131
	.byte	0x1
	.byte	0xec
	.4byte	0xa5b
	.4byte	.LLST5
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x5fb
	.uleb128 0x13
	.4byte	0xa9f
	.byte	0x1
	.4byte	.LASF158
	.byte	0x1
	.byte	0xf4
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0xf4
	.4byte	0x9b6
	.4byte	.LLST6
	.uleb128 0x15
	.4byte	.LASF130
	.byte	0x1
	.byte	0xf5
	.4byte	0xa5b
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.byte	0xf6
	.4byte	0x903
	.byte	0x0
	.uleb128 0x17
	.4byte	0xad9
	.byte	0x1
	.4byte	.LASF159
	.byte	0x1
	.2byte	0x11a
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x11a
	.4byte	0x9b6
	.4byte	.LLST7
	.uleb128 0x19
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x11b
	.4byte	0xad9
	.4byte	.LLST8
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x730
	.uleb128 0x17
	.4byte	0xb15
	.byte	0x1
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x328
	.byte	0x1
	.4byte	.LFB31
	.4byte	.LFE31
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x328
	.4byte	0x72a
	.byte	0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x328
	.4byte	0x23a
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x17
	.4byte	0xb57
	.byte	0x1
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x102
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x102
	.4byte	0x9b6
	.4byte	.LLST9
	.uleb128 0x1b
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x103
	.4byte	0xa5b
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x104
	.4byte	0x903
	.byte	0x0
	.uleb128 0x13
	.4byte	0xbca
	.byte	0x1
	.4byte	.LASF163
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0x6e
	.4byte	0x9b6
	.4byte	.LLST10
	.uleb128 0x15
	.4byte	.LASF164
	.byte	0x1
	.byte	0x6f
	.4byte	0x23a
	.uleb128 0x16
	.4byte	.LASF99
	.byte	0x1
	.byte	0x87
	.4byte	0x23a
	.4byte	.LLST11
	.uleb128 0x16
	.4byte	.LASF165
	.byte	0x1
	.byte	0x97
	.4byte	0x23a
	.4byte	.LLST12
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa0
	.4byte	0x23a
	.uleb128 0x1d
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x16
	.4byte	.LASF166
	.byte	0x1
	.byte	0x8d
	.4byte	0x23a
	.4byte	.LLST13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0xc31
	.byte	0x1
	.4byte	.LASF167
	.byte	0x1
	.byte	0xab
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.byte	0xab
	.4byte	0x9b6
	.4byte	.LLST14
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x1
	.byte	0xac
	.4byte	0xa13
	.uleb128 0x1e
	.4byte	.LASF99
	.byte	0x1
	.byte	0xb8
	.4byte	0x23a
	.byte	0x1
	.byte	0x57
	.uleb128 0x1e
	.4byte	.LASF100
	.byte	0x1
	.byte	0xb9
	.4byte	0x23a
	.byte	0x1
	.byte	0x56
	.uleb128 0x1e
	.4byte	.LASF166
	.byte	0x1
	.byte	0xbf
	.4byte	0x23a
	.byte	0x1
	.byte	0x54
	.uleb128 0x1e
	.4byte	.LASF168
	.byte	0x1
	.byte	0xc0
	.4byte	0x23a
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x17
	.4byte	0xc73
	.byte	0x1
	.4byte	.LASF169
	.byte	0x1
	.2byte	0x10e
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x10e
	.4byte	0x9b6
	.4byte	.LLST15
	.uleb128 0x1b
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x10f
	.4byte	0xa5b
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x110
	.4byte	0x903
	.byte	0x0
	.uleb128 0x17
	.4byte	0xcdb
	.byte	0x1
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x12f
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x12f
	.4byte	0x9b6
	.4byte	.LLST16
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x130
	.4byte	0xcdb
	.uleb128 0x1b
	.4byte	.LASF171
	.byte	0x1
	.2byte	0x134
	.4byte	0x23a
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x19
	.4byte	.LASF172
	.byte	0x1
	.2byte	0x138
	.4byte	0x23a
	.4byte	.LLST17
	.uleb128 0x19
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x139
	.4byte	0x23a
	.4byte	.LLST18
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.byte	0x4
	.4byte	0x569
	.uleb128 0x20
	.4byte	0xd1f
	.byte	0x1
	.4byte	.LASF173
	.byte	0x1
	.2byte	0x1d6
	.byte	0x1
	.4byte	0x46d
	.4byte	.LFB20
	.4byte	.LFE20
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1d6
	.4byte	0x9b6
	.4byte	.LLST19
	.uleb128 0x18
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1d6
	.4byte	0x23a
	.4byte	.LLST20
	.byte	0x0
	.uleb128 0x17
	.4byte	0xd7f
	.byte	0x1
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x258
	.byte	0x1
	.4byte	.LFB27
	.4byte	.LFE27
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x258
	.4byte	0x9b6
	.4byte	.LLST21
	.uleb128 0x18
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x258
	.4byte	0x23a
	.4byte	.LLST22
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x258
	.4byte	0x23a
	.4byte	.LLST23
	.uleb128 0x1b
	.4byte	.LASF171
	.byte	0x1
	.2byte	0x259
	.4byte	0x23a
	.uleb128 0x21
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x25c
	.4byte	0x23a
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe0c
	.byte	0x1
	.4byte	.LASF176
	.byte	0x1
	.2byte	0x23c
	.byte	0x1
	.4byte	.LFB26
	.4byte	.LFE26
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x23c
	.4byte	0x9b6
	.4byte	.LLST24
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x23c
	.4byte	0x72a
	.4byte	.LLST25
	.uleb128 0x22
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x23e
	.4byte	0x77d
	.byte	0x6
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.byte	0x56
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x19
	.4byte	.LASF178
	.byte	0x1
	.2byte	0x241
	.4byte	0x23a
	.4byte	.LLST26
	.uleb128 0x19
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x242
	.4byte	0x23a
	.4byte	.LLST27
	.uleb128 0x19
	.4byte	.LASF180
	.byte	0x1
	.2byte	0x243
	.4byte	0x23a
	.4byte	.LLST28
	.uleb128 0x19
	.4byte	.LASF181
	.byte	0x1
	.2byte	0x244
	.4byte	0x23a
	.4byte	.LLST29
	.byte	0x0
	.uleb128 0x17
	.4byte	0xe46
	.byte	0x1
	.4byte	.LASF182
	.byte	0x1
	.2byte	0x1a1
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x9b6
	.4byte	.LLST30
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1a1
	.4byte	0x72a
	.4byte	.LLST31
	.byte	0x0
	.uleb128 0x23
	.4byte	0xe91
	.byte	0x1
	.4byte	.LASF183
	.byte	0x1
	.2byte	0x1da
	.byte	0x1
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LLST32
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1da
	.4byte	0x9b6
	.4byte	.LLST33
	.uleb128 0x18
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1da
	.4byte	0x23a
	.4byte	.LLST34
	.uleb128 0x18
	.4byte	.LASF184
	.byte	0x1
	.2byte	0x1da
	.4byte	0x46d
	.4byte	.LLST35
	.byte	0x0
	.uleb128 0x17
	.4byte	0xf0d
	.byte	0x1
	.4byte	.LASF185
	.byte	0x1
	.2byte	0x1e8
	.byte	0x1
	.4byte	.LFB22
	.4byte	.LFE22
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1e8
	.4byte	0x9b6
	.4byte	.LLST36
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1e8
	.4byte	0x72a
	.4byte	.LLST37
	.uleb128 0x19
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x1e9
	.4byte	0x23a
	.4byte	.LLST38
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x20
	.uleb128 0x19
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1ec
	.4byte	0x23a
	.4byte	.LLST39
	.uleb128 0x19
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x1ed
	.4byte	0x23a
	.4byte	.LLST40
	.uleb128 0x1b
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x1ee
	.4byte	0x23a
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.4byte	0xf66
	.byte	0x1
	.4byte	.LASF189
	.byte	0x1
	.2byte	0x1b2
	.byte	0x1
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LLST41
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1b2
	.4byte	0x9b6
	.4byte	.LLST42
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1b2
	.4byte	0x72a
	.4byte	.LLST43
	.uleb128 0x19
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1b9
	.4byte	0x23a
	.4byte	.LLST44
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x1c2
	.4byte	0x23a
	.4byte	.LLST45
	.byte	0x0
	.uleb128 0x17
	.4byte	0xfc4
	.byte	0x1
	.4byte	.LASF190
	.byte	0x1
	.2byte	0x16f
	.byte	0x1
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x16f
	.4byte	0x9b6
	.4byte	.LLST46
	.uleb128 0x1b
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x170
	.4byte	0x9bc
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x171
	.4byte	0x9bc
	.uleb128 0x1b
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x175
	.4byte	0x23a
	.uleb128 0x19
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x176
	.4byte	0x23a
	.4byte	.LLST47
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1034
	.byte	0x1
	.4byte	.LASF192
	.byte	0x1
	.2byte	0x144
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x144
	.4byte	0x9b6
	.4byte	.LLST48
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x145
	.4byte	0x9bc
	.uleb128 0x1d
	.4byte	.LBB8
	.4byte	.LBE8
	.uleb128 0x19
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x14c
	.4byte	0x23a
	.4byte	.LLST49
	.uleb128 0x19
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x14d
	.4byte	0x23a
	.4byte	.LLST50
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x38
	.uleb128 0x21
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x156
	.4byte	0x23a
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.4byte	0x10b7
	.byte	0x1
	.4byte	.LASF193
	.byte	0x1
	.2byte	0x1fa
	.byte	0x1
	.4byte	.LFB23
	.4byte	.LFE23
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1fa
	.4byte	0x9b6
	.4byte	.LLST51
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1fa
	.4byte	0x72a
	.4byte	.LLST52
	.uleb128 0x22
	.4byte	.LASF194
	.byte	0x1
	.2byte	0x1fb
	.4byte	0x77d
	.byte	0x6
	.byte	0x57
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x1b
	.4byte	.LASF195
	.byte	0x1
	.2byte	0x1fc
	.4byte	0x77d
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x209
	.4byte	0x23a
	.4byte	.LLST53
	.uleb128 0x1b
	.4byte	.LASF196
	.byte	0x1
	.2byte	0x20a
	.4byte	0x23a
	.uleb128 0x19
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x21c
	.4byte	0x3b8
	.4byte	.LLST54
	.byte	0x0
	.uleb128 0x17
	.4byte	0x10f1
	.byte	0x1
	.4byte	.LASF197
	.byte	0x1
	.2byte	0x224
	.byte	0x1
	.4byte	.LFB24
	.4byte	.LFE24
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x224
	.4byte	0x9b6
	.4byte	.LLST55
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x224
	.4byte	0x72a
	.4byte	.LLST56
	.byte	0x0
	.uleb128 0x20
	.4byte	0x113f
	.byte	0x1
	.4byte	.LASF198
	.byte	0x1
	.2byte	0x22d
	.byte	0x1
	.4byte	0x3b8
	.4byte	.LFB25
	.4byte	.LFE25
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x22d
	.4byte	0x9b6
	.4byte	.LLST57
	.uleb128 0x19
	.4byte	.LASF199
	.byte	0x1
	.2byte	0x22e
	.4byte	0x23a
	.4byte	.LLST58
	.uleb128 0x19
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x22f
	.4byte	0x23a
	.4byte	.LLST59
	.byte	0x0
	.uleb128 0x17
	.4byte	0x1189
	.byte	0x1
	.4byte	.LASF200
	.byte	0x1
	.2byte	0x1cd
	.byte	0x1
	.4byte	.LFB19
	.4byte	.LFE19
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1cd
	.4byte	0x9b6
	.4byte	.LLST60
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1cd
	.4byte	0x72a
	.4byte	.LLST61
	.uleb128 0x19
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x3b8
	.4byte	.LLST62
	.byte	0x0
	.uleb128 0x17
	.4byte	0x11d3
	.byte	0x1
	.4byte	.LASF201
	.byte	0x1
	.2byte	0x1a7
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x9b6
	.4byte	.LLST63
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1a7
	.4byte	0x72a
	.4byte	.LLST64
	.uleb128 0x19
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x3b8
	.4byte	.LLST65
	.byte	0x0
	.uleb128 0x17
	.4byte	0x120d
	.byte	0x1
	.4byte	.LASF202
	.byte	0x1
	.2byte	0x183
	.byte	0x1
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x183
	.4byte	0x9b6
	.4byte	.LLST66
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x183
	.4byte	0x72a
	.4byte	.LLST67
	.byte	0x0
	.uleb128 0x25
	.4byte	0x1260
	.byte	0x1
	.4byte	.LASF203
	.byte	0x1
	.byte	0xa
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST68
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x1270
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.1906
	.uleb128 0x1e
	.4byte	.LASF154
	.byte	0x1
	.byte	0xc
	.4byte	0x95f
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1e
	.4byte	.LASF205
	.byte	0x1
	.byte	0xe
	.4byte	0x23a
	.byte	0x1
	.byte	0x55
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0x50
	.uleb128 0x1c
	.ascii	"i\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x23a
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x1270
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x11
	.byte	0x0
	.uleb128 0x12
	.4byte	0x1260
	.uleb128 0x27
	.4byte	0x12ef
	.byte	0x1
	.4byte	.LASF206
	.byte	0x1
	.2byte	0x265
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LLST69
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x12ff
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2371
	.uleb128 0x1b
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x267
	.4byte	0x23a
	.uleb128 0x22
	.4byte	.LASF207
	.byte	0x1
	.2byte	0x269
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x26a
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF208
	.byte	0x1
	.2byte	0x26b
	.4byte	0x903
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x26c
	.4byte	0x903
	.uleb128 0x22
	.4byte	.LASF209
	.byte	0x1
	.2byte	0x26d
	.4byte	0x23a
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x7
	.4byte	0x12ff
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x16
	.byte	0x0
	.uleb128 0x12
	.4byte	0x12ef
	.uleb128 0x27
	.4byte	0x1402
	.byte	0x1
	.4byte	.LASF210
	.byte	0x1
	.2byte	0x280
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LLST70
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x1412
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2390
	.uleb128 0x1b
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x283
	.4byte	0x23a
	.uleb128 0x22
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x286
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 56
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x287
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 40
	.uleb128 0x1b
	.4byte	.LASF211
	.byte	0x1
	.2byte	0x288
	.4byte	0x9bc
	.uleb128 0x1b
	.4byte	.LASF212
	.byte	0x1
	.2byte	0x289
	.4byte	0x9bc
	.uleb128 0x22
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x28a
	.4byte	0x23a
	.byte	0x3
	.byte	0x7d
	.sleb128 72
	.uleb128 0x1b
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x19
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.4byte	.LLST71
	.uleb128 0x1b
	.4byte	.LASF213
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF214
	.byte	0x1
	.2byte	0x28b
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF215
	.byte	0x1
	.2byte	0x28c
	.4byte	0x23a
	.uleb128 0x22
	.4byte	.LASF216
	.byte	0x1
	.2byte	0x290
	.4byte	0x909
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x22
	.4byte	.LASF217
	.byte	0x1
	.2byte	0x291
	.4byte	0x909
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x1412
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x18
	.byte	0x0
	.uleb128 0x12
	.4byte	0x1402
	.uleb128 0x27
	.4byte	0x14f3
	.byte	0x1
	.4byte	.LASF218
	.byte	0x1
	.2byte	0x2e6
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LLST72
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x1503
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2454
	.uleb128 0x22
	.4byte	.LASF207
	.byte	0x1
	.2byte	0x2e9
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 28
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x2ea
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 12
	.uleb128 0x1b
	.4byte	.LASF208
	.byte	0x1
	.2byte	0x2eb
	.4byte	0xa13
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x2ec
	.4byte	0x903
	.uleb128 0x1b
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x2ed
	.4byte	0x251
	.uleb128 0x22
	.4byte	.LASF213
	.byte	0x1
	.2byte	0x2ee
	.4byte	0x251
	.byte	0x2
	.byte	0x7d
	.sleb128 47
	.uleb128 0x22
	.4byte	.LASF214
	.byte	0x1
	.2byte	0x2ef
	.4byte	0x251
	.byte	0x2
	.byte	0x7d
	.sleb128 46
	.uleb128 0x22
	.4byte	.LASF209
	.byte	0x1
	.2byte	0x2f0
	.4byte	0x23a
	.byte	0x1
	.byte	0x59
	.uleb128 0x1b
	.4byte	.LASF219
	.byte	0x1
	.2byte	0x2f1
	.4byte	0x971
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x2f5
	.4byte	0x23a
	.4byte	.LLST73
	.uleb128 0x1d
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x19
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x30a
	.4byte	0x4d
	.4byte	.LLST74
	.uleb128 0x19
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x30b
	.4byte	0x4d
	.4byte	.LLST75
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.4byte	0x1503
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x17
	.byte	0x0
	.uleb128 0x12
	.4byte	0x14f3
	.uleb128 0x28
	.byte	0x1
	.4byte	.LASF250
	.byte	0x1
	.2byte	0x358
	.4byte	.LFB33
	.4byte	.LFE33
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x27
	.4byte	0x158a
	.byte	0x1
	.4byte	.LASF222
	.byte	0x1
	.2byte	0x337
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LLST76
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x158a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2505
	.uleb128 0x22
	.4byte	.LASF207
	.byte	0x1
	.2byte	0x339
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x33a
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF208
	.byte	0x1
	.2byte	0x33b
	.4byte	0x903
	.uleb128 0x1b
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x33c
	.4byte	0xcdb
	.uleb128 0x22
	.4byte	.LASF209
	.byte	0x1
	.2byte	0x33d
	.4byte	0x23a
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x12
	.4byte	0x14f3
	.uleb128 0x27
	.4byte	0x1621
	.byte	0x1
	.4byte	.LASF223
	.byte	0x1
	.2byte	0x362
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LLST77
	.uleb128 0x26
	.4byte	.LASF204
	.4byte	0x1621
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.2527
	.uleb128 0x1b
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x365
	.4byte	0x23a
	.uleb128 0x22
	.4byte	.LASF207
	.byte	0x1
	.2byte	0x368
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 20
	.uleb128 0x22
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x369
	.4byte	0x241
	.byte	0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1b
	.4byte	.LASF224
	.byte	0x1
	.2byte	0x36a
	.4byte	0x9bc
	.uleb128 0x1b
	.4byte	.LASF212
	.byte	0x1
	.2byte	0x36b
	.4byte	0x9bc
	.uleb128 0x1b
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x36c
	.4byte	0x251
	.uleb128 0x1b
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x36c
	.4byte	0x251
	.uleb128 0x22
	.4byte	.LASF215
	.byte	0x1
	.2byte	0x36d
	.4byte	0x23a
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x12
	.4byte	0x14f3
	.uleb128 0x29
	.4byte	.LASF225
	.byte	0x6
	.byte	0xb
	.4byte	0x1632
	.sleb128 -1
	.uleb128 0x12
	.4byte	0x23a
	.uleb128 0x29
	.4byte	.LASF226
	.byte	0x6
	.byte	0xc
	.4byte	0x1632
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x1653
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x1e
	.4byte	.LASF227
	.byte	0x2
	.byte	0xb
	.4byte	0x1664
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_NAME
	.uleb128 0x12
	.4byte	0x1643
	.uleb128 0x7
	.4byte	0x1679
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x1e
	.4byte	.LASF228
	.byte	0x2
	.byte	0xc
	.4byte	0x168a
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_COMMAND_SERVER_NAME
	.uleb128 0x12
	.4byte	0x1669
	.uleb128 0x7
	.4byte	0x169f
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x1e
	.4byte	.LASF229
	.byte	0x2
	.byte	0xd
	.4byte	0x16b0
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SERVER_TIMER_NAME
	.uleb128 0x12
	.4byte	0x168f
	.uleb128 0x7
	.4byte	0x16c5
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x6
	.byte	0x0
	.uleb128 0x1e
	.4byte	.LASF230
	.byte	0x2
	.byte	0xe
	.4byte	0x16d6
	.byte	0x5
	.byte	0x3
	.4byte	TRAIN_SWITCH_MASTER_NAME
	.uleb128 0x12
	.4byte	0x16b5
	.uleb128 0x2a
	.4byte	.LASF231
	.byte	0x2
	.byte	0x10
	.4byte	0x1632
	.byte	0x10
	.uleb128 0x7
	.4byte	0x16fd
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x5
	.uleb128 0x8
	.4byte	0x54
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF232
	.byte	0x2
	.byte	0x6d
	.4byte	0x1708
	.uleb128 0x12
	.4byte	0x16e7
	.uleb128 0x29
	.4byte	.LASF233
	.byte	0x8
	.byte	0x7
	.4byte	0x1632
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF234
	.byte	0x8
	.byte	0x8
	.4byte	0x1632
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF235
	.byte	0x8
	.byte	0x9
	.4byte	0x1632
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF236
	.byte	0x8
	.byte	0xa
	.4byte	0x1632
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF237
	.byte	0x8
	.byte	0xb
	.4byte	0x1632
	.sleb128 -2
	.uleb128 0x2a
	.4byte	.LASF238
	.byte	0x8
	.byte	0xc
	.4byte	0x1632
	.byte	0x2
	.uleb128 0x29
	.4byte	.LASF239
	.byte	0x8
	.byte	0xd
	.4byte	0x1632
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF240
	.byte	0x8
	.byte	0xe
	.4byte	0x1632
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF241
	.byte	0x8
	.byte	0xf
	.4byte	0x1632
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF242
	.byte	0x8
	.byte	0x10
	.4byte	0x1632
	.sleb128 -4
	.uleb128 0x2b
	.4byte	.LASF243
	.byte	0x8
	.byte	0x11
	.4byte	0x1799
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x12
	.4byte	0x77d
	.uleb128 0x7
	.4byte	0x17b4
	.4byte	0x251
	.uleb128 0x8
	.4byte	0x54
	.byte	0x6
	.uleb128 0x8
	.4byte	0x54
	.byte	0x13
	.byte	0x0
	.uleb128 0x15
	.4byte	.LASF244
	.byte	0x9
	.byte	0x27
	.4byte	0x17bf
	.uleb128 0x12
	.4byte	0x179e
	.uleb128 0x29
	.4byte	.LASF245
	.byte	0xa
	.byte	0x5
	.4byte	0x1632
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF246
	.byte	0xa
	.byte	0x6
	.4byte	0x1632
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0x0
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
	.uleb128 0x18
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
	.uleb128 0x2
	.uleb128 0x6
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0x2
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
	.uleb128 0x24
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
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
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
	.uleb128 0xb
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x46f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x17dd
	.4byte	0x978
	.ascii	"TrainServer_HandleSwitchData\000"
	.4byte	0x9c2
	.ascii	"TrainServer_HandleSensorQuery\000"
	.4byte	0xa19
	.ascii	"TrainServer_HandleSwitchQuery\000"
	.4byte	0xa61
	.ascii	"TrainServer_HandleSelectTrack\000"
	.4byte	0xa9f
	.ascii	"TrainServer_HandleQueryTrainEngine\000"
	.4byte	0xadf
	.ascii	"TrainEngine_Initialize\000"
	.4byte	0xb15
	.ascii	"TrainServer_HandleSetTrain\000"
	.4byte	0xb57
	.ascii	"TrainServer_Initialize\000"
	.4byte	0xbca
	.ascii	"TrainServer_HandleSensorReaderData\000"
	.4byte	0xc31
	.ascii	"TrainServer_HandleSetDestination\000"
	.4byte	0xc73
	.ascii	"TrainServer_HandleTrainEngineClientCommandRequest\000"
	.4byte	0xce1
	.ascii	"GetQueuedSwitchState\000"
	.4byte	0xd1f
	.ascii	"TrainServer_SetTrainSpeed\000"
	.4byte	0xd7f
	.ascii	"TrainServer_ProcessEngineCalibratingSpeed\000"
	.4byte	0xe0c
	.ascii	"TrainServer_ProcessEngineIdle\000"
	.4byte	0xe46
	.ascii	"QueueSwitchState\000"
	.4byte	0xe91
	.ascii	"TrainServer_QueueSwitchStates\000"
	.4byte	0xf0d
	.ascii	"TrainServer_ProcessEngineFoundStartingPosition\000"
	.4byte	0xf66
	.ascii	"TrainServer_HandleSetSwitch\000"
	.4byte	0xfc4
	.ascii	"TrainServer_HandleGetSwitchRequest\000"
	.4byte	0x1034
	.ascii	"TrainServer_ProcessSensorData\000"
	.4byte	0x10b7
	.ascii	"TrainServer_ProcessEngineAtDestination\000"
	.4byte	0x10f1
	.ascii	"TrainServer_GetEnginePosition\000"
	.4byte	0x113f
	.ascii	"TrainServer_ProcessEngineRunning\000"
	.4byte	0x1189
	.ascii	"TrainServer_ProcessEngineFindingPosition\000"
	.4byte	0x11d3
	.ascii	"TrainServer_ProcessEngine\000"
	.4byte	0x120d
	.ascii	"TrainServer_Start\000"
	.4byte	0x1275
	.ascii	"TrainServerTimer_Start\000"
	.4byte	0x1304
	.ascii	"TrainCommandServer_Start\000"
	.4byte	0x1417
	.ascii	"TrainSensorReader_Start\000"
	.4byte	0x1508
	.ascii	"TrainEngine_SetInitialSwitches\000"
	.4byte	0x151c
	.ascii	"TrainEngineClient_Start\000"
	.4byte	0x158f
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
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF205:
	.ascii	"admin_tid\000"
.LASF73:
	.ascii	"TRAIN_SWITCH\000"
.LASF247:
	.ascii	"GNU C 4.0.2\000"
.LASF153:
	.ascii	"TrainServer_HandleSensorQuery\000"
.LASF59:
	.ascii	"node_type\000"
.LASF6:
	.ascii	"current_count\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF170:
	.ascii	"TrainServer_HandleTrainEngineClientCommandRequest\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF72:
	.ascii	"TRAIN_REVERSE\000"
.LASF173:
	.ascii	"GetQueuedSwitchState\000"
.LASF214:
	.ascii	"upper\000"
.LASF82:
	.ascii	"SWITCH_UNKNOWN\000"
.LASF203:
	.ascii	"TrainServer_Start\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF167:
	.ascii	"TrainServer_HandleSensorReaderData\000"
.LASF139:
	.ascii	"blocked_tid\000"
.LASF131:
	.ascii	"reply_message\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF88:
	.ascii	"TRAIN_ENGINE_FOUND_STARTING_POSITION\000"
.LASF191:
	.ascii	"direction_code\000"
.LASF41:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF140:
	.ascii	"train_server_timer_tid\000"
.LASF220:
	.ascii	"upper_word\000"
.LASF97:
	.ascii	"TrainEngineClientMessage\000"
.LASF135:
	.ascii	"source_tid\000"
.LASF243:
	.ascii	"TICK_SIZE\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF184:
	.ascii	"new_state\000"
.LASF244:
	.ascii	"TASK_STATE_NAMES\000"
.LASF9:
	.ascii	"TrainSpeedQueue\000"
.LASF222:
	.ascii	"TrainEngineClient_Start\000"
.LASF95:
	.ascii	"TrainCommandMessage\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF240:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF250:
	.ascii	"TrainEngine_SetInitialSwitches\000"
.LASF196:
	.ascii	"found\000"
.LASF175:
	.ascii	"speed\000"
.LASF213:
	.ascii	"lower\000"
.LASF63:
	.ascii	"reverse\000"
.LASF71:
	.ascii	"TRAIN_SPEED\000"
.LASF183:
	.ascii	"QueueSwitchState\000"
.LASF113:
	.ascii	"actual_time_at_last_sensor\000"
.LASF114:
	.ascii	"distance_to_next_sensor\000"
.LASF237:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF53:
	.ascii	"NODE_NONE\000"
.LASF42:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF3:
	.ascii	"SwitchQueue\000"
.LASF142:
	.ascii	"track_a_nodes\000"
.LASF215:
	.ascii	"train_server_tid\000"
.LASF179:
	.ascii	"t_12\000"
.LASF145:
	.ascii	"switch_states\000"
.LASF77:
	.ascii	"TrainServerState\000"
.LASF154:
	.ascii	"server\000"
.LASF174:
	.ascii	"TrainServer_SetTrainSpeed\000"
.LASF197:
	.ascii	"TrainServer_ProcessEngineAtDestination\000"
.LASF223:
	.ascii	"TrainSwitchMaster_Start\000"
.LASF68:
	.ascii	"TrainCommand\000"
.LASF242:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF232:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF106:
	.ascii	"train_num\000"
.LASF52:
	.ascii	"message_type\000"
.LASF58:
	.ascii	"NODE_EXIT\000"
.LASF207:
	.ascii	"send_buffer\000"
.LASF89:
	.ascii	"TRAIN_ENGINE_RUNNING\000"
.LASF235:
	.ascii	"ERR_K_DEFAULT\000"
.LASF217:
	.ascii	"upper_buffer\000"
.LASF219:
	.ascii	"shutdown\000"
.LASF194:
	.ascii	"time\000"
.LASF81:
	.ascii	"SwitchState\000"
.LASF65:
	.ascii	"track_edge\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF67:
	.ascii	"dist\000"
.LASF168:
	.ascii	"current_time\000"
.LASF199:
	.ascii	"sensor_module\000"
.LASF47:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF136:
	.ascii	"num_child_task_running\000"
.LASF216:
	.ascii	"lower_buffer\000"
.LASF231:
	.ascii	"LIGHTS_MASK\000"
.LASF91:
	.ascii	"TRAIN_ENGINE_CALIBRATING_SPEED\000"
.LASF8:
	.ascii	"items\000"
.LASF178:
	.ascii	"t_11\000"
.LASF163:
	.ascii	"TrainServer_Initialize\000"
.LASF121:
	.ascii	"TrainEngineStatusMessage\000"
.LASF147:
	.ascii	"queued_switch_changes\000"
.LASF201:
	.ascii	"TrainServer_ProcessEngineFindingPosition\000"
.LASF164:
	.ascii	"return_code\000"
.LASF169:
	.ascii	"TrainServer_HandleSetDestination\000"
.LASF64:
	.ascii	"edge\000"
.LASF227:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF87:
	.ascii	"TRAIN_ENGINE_FINDING_POSITION\000"
.LASF166:
	.ascii	"sensor_num\000"
.LASF165:
	.ascii	"switch_num\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF180:
	.ascii	"t_21\000"
.LASF181:
	.ascii	"t_22\000"
.LASF122:
	.ascii	"train_engine\000"
.LASF49:
	.ascii	"MessageType\000"
.LASF221:
	.ascii	"lower_word\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF50:
	.ascii	"char\000"
.LASF76:
	.ascii	"TRAIN_GET_CACHED_SENSOR_DATA\000"
.LASF157:
	.ascii	"TrainServer_HandleSwitchQuery\000"
.LASF56:
	.ascii	"NODE_MERGE\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF102:
	.ascii	"int1\000"
.LASF103:
	.ascii	"int2\000"
.LASF193:
	.ascii	"TrainServer_ProcessSensorData\000"
.LASF144:
	.ascii	"current_track_nodes\000"
.LASF158:
	.ascii	"TrainServer_HandleSelectTrack\000"
.LASF128:
	.ascii	"receive_buffer\000"
.LASF104:
	.ascii	"char1\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF239:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF192:
	.ascii	"TrainServer_HandleGetSwitchRequest\000"
.LASF105:
	.ascii	"TrainEngine\000"
.LASF162:
	.ascii	"TrainServer_HandleSetTrain\000"
.LASF108:
	.ascii	"next_node\000"
.LASF98:
	.ascii	"TrainSensorMessage\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF211:
	.ascii	"command_receive_message\000"
.LASF123:
	.ascii	"RouteNodeInfo\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF85:
	.ascii	"TrainEngineState\000"
.LASF84:
	.ascii	"SWITCH_CURVED\000"
.LASF116:
	.ascii	"source_node\000"
.LASF125:
	.ascii	"switch_state\000"
.LASF137:
	.ascii	"train_command_server_tid\000"
.LASF118:
	.ascii	"route_node_info\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF218:
	.ascii	"TrainSensorReader_Start\000"
.LASF86:
	.ascii	"TRAIN_ENGINE_IDLE\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF7:
	.ascii	"size\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF96:
	.ascii	"command\000"
.LASF80:
	.ascii	"TRAIN_SERVER_BLOCK_UNTIL_SENSOR\000"
.LASF117:
	.ascii	"destination_node\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
.LASF225:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF4:
	.ascii	"item\000"
.LASF138:
	.ascii	"train_sensor_reader_tid\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF152:
	.ascii	"TrainServer_HandleSwitchData\000"
.LASF228:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF149:
	.ascii	"train_speed_queue\000"
.LASF69:
	.ascii	"TRAIN_STOP\000"
.LASF224:
	.ascii	"command_send_message\000"
.LASF101:
	.ascii	"GenericTrainMessage\000"
.LASF132:
	.ascii	"sensor_bit_flags\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF100:
	.ascii	"sensor_bit_flag\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF2:
	.ascii	"QueueItem\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF112:
	.ascii	"expected_time_at_last_sensor\000"
.LASF245:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF160:
	.ascii	"TrainEngine_Initialize\000"
.LASF93:
	.ascii	"TRAIN_ENGINE_CLIENT_DO_NOTHING\000"
.LASF115:
	.ascii	"current_node\000"
.LASF45:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF187:
	.ascii	"next_switch_state\000"
.LASF60:
	.ascii	"track_node\000"
.LASF161:
	.ascii	"engine\000"
.LASF120:
	.ascii	"route_nodes_length\000"
.LASF204:
	.ascii	"__func__\000"
.LASF249:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF151:
	.ascii	"short int\000"
.LASF238:
	.ascii	"NAMESERVER_TID\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF43:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF111:
	.ascii	"expected_time_at_next_sensor\000"
.LASF44:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF129:
	.ascii	"reply_buffer\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF48:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF248:
	.ascii	"train.c\000"
.LASF189:
	.ascii	"TrainServer_ProcessEngineFoundStartingPosition\000"
.LASF188:
	.ascii	"queued_switch_state\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF226:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF124:
	.ascii	"node\000"
.LASF206:
	.ascii	"TrainServerTimer_Start\000"
.LASF133:
	.ascii	"new_sensor_bit_flags_for_ui\000"
.LASF190:
	.ascii	"TrainServer_HandleSetSwitch\000"
.LASF110:
	.ascii	"calculated_speed\000"
.LASF78:
	.ascii	"TRAIN_SERVER_IDLE\000"
.LASF92:
	.ascii	"TrainEngineClientCommand\000"
.LASF146:
	.ascii	"switches_to_change\000"
.LASF186:
	.ascii	"current_route_node_index\000"
.LASF61:
	.ascii	"name\000"
.LASF5:
	.ascii	"start\000"
.LASF74:
	.ascii	"TRAIN_READ_SENSOR\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF143:
	.ascii	"track_b_nodes\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF46:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF210:
	.ascii	"TrainCommandServer_Start\000"
.LASF230:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF200:
	.ascii	"TrainServer_ProcessEngineRunning\000"
.LASF51:
	.ascii	"GenericMessage\000"
.LASF148:
	.ascii	"train_engines\000"
.LASF246:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF107:
	.ascii	"state\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF234:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF172:
	.ascii	"train_speed\000"
.LASF62:
	.ascii	"type\000"
.LASF109:
	.ascii	"speed_setting\000"
.LASF150:
	.ascii	"unsigned char\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF195:
	.ascii	"time_difference\000"
.LASF70:
	.ascii	"TRAIN_GO\000"
.LASF171:
	.ascii	"train_speed_settings\000"
.LASF233:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF185:
	.ascii	"TrainServer_QueueSwitchStates\000"
.LASF236:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF90:
	.ascii	"TRAIN_ENGINE_AT_DESTINATION\000"
.LASF155:
	.ascii	"recv_sensor_message\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF208:
	.ascii	"send_message\000"
.LASF119:
	.ascii	"route_node_index\000"
.LASF209:
	.ascii	"server_tid\000"
.LASF156:
	.ascii	"reply_sensor_message\000"
.LASF99:
	.ascii	"module_num\000"
.LASF177:
	.ascii	"difference\000"
.LASF202:
	.ascii	"TrainServer_ProcessEngine\000"
.LASF159:
	.ascii	"TrainServer_HandleQueryTrainEngine\000"
.LASF198:
	.ascii	"TrainServer_GetEnginePosition\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF54:
	.ascii	"NODE_SENSOR\000"
.LASF229:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF134:
	.ascii	"sensor_time_log\000"
.LASF212:
	.ascii	"command_reply_message\000"
.LASF83:
	.ascii	"SWITCH_STRAIGHT\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF126:
	.ascii	"double\000"
.LASF182:
	.ascii	"TrainServer_ProcessEngineIdle\000"
.LASF127:
	.ascii	"TrainServer\000"
.LASF241:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF79:
	.ascii	"TRAIN_SERVER_SHUTDOWN\000"
.LASF75:
	.ascii	"TRAIN_CACHE_ALL_SENSORS\000"
.LASF130:
	.ascii	"receive_message\000"
.LASF176:
	.ascii	"TrainServer_ProcessEngineCalibratingSpeed\000"
.LASF55:
	.ascii	"NODE_BRANCH\000"
.LASF66:
	.ascii	"dest\000"
.LASF57:
	.ascii	"NODE_ENTER\000"
.LASF94:
	.ascii	"TRAIN_ENGINE_CLIENT_SET_SPEED\000"
.LASF141:
	.ascii	"switch_master_tid\000"
	.ident	"GCC: (GNU) 4.0.2"
