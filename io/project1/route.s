	.file	"route.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"SensorToTrackNode: Unknown node for Module=%d, Sens"
	.ascii	"or=%d\000"
	.text
	.align	2
	.global	SensorToTrackNode
	.type	SensorToTrackNode, %function
SensorToTrackNode:
.LFB2:
	.file 1 "route.c"
	.loc 1 5 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, sl, lr}
.LCFI0:
	ldr	sl, .L13
	mov	r4, r2
.L10:
	add	sl, pc, sl
	.loc 1 6 0
	add	lr, r2, r1, asl #4
.LVL1:
	mov	ip, r0
	mov	r2, #0
.LVL2:
	b	.L2
.LVL3:
.L3:
	.loc 1 8 0
	cmp	r2, #144
	beq	.L12
.LVL4:
.L2:
	.loc 1 6 0
	mov	r0, ip
.LVL5:
.LBB2:
	.loc 1 11 0
	ldr	r3, [r0, #4]
.LBE2:
	.loc 1 8 0
	add	r2, r2, #1
.LBB3:
	.loc 1 11 0
	cmp	r3, #1
.LBE3:
	.loc 1 8 0
	add	ip, ip, #48
.LBB4:
	.loc 1 11 0
	bne	.L3
	ldr	r3, [r0, #8]
	cmp	lr, r3
	ldmeqfd	sp!, {r4, sl, pc}
.LBE4:
	.loc 1 8 0
	cmp	r2, #144
	bne	.L2
.L12:
	.loc 1 16 0
	mov	r2, r1
.LVL6:
	ldr	r1, .L13+4
.LVL7:
	mov	r3, r4
	add	r1, sl, r1
	mov	r0, #0
.LVL8:
	bl	assertf(PLT)
.LVL9:
	mov	r0, #0
.LVL10:
.LVL11:
	.loc 1 18 0
	ldmfd	sp!, {r4, sl, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC0(GOTOFF)
.LFE2:
	.size	SensorToTrackNode, .-SensorToTrackNode
	.align	2
	.global	NodeNameToTrackNode
	.type	NodeNameToTrackNode, %function
NodeNameToTrackNode:
.LFB3:
	.loc 1 20 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL12:
	stmfd	sp!, {r4, r5, r6, lr}
.LCFI1:
	.loc 1 20 0
	mov	r3, r0
	mov	r6, r1
	mov	r5, #0
.LVL13:
	b	.L16
.LVL14:
.L24:
	.loc 1 22 0
	cmp	r5, #144
	beq	.L23
.LVL15:
.L16:
.LBB5:
	.loc 1 25 0
	ldr	r1, [r3, #0]
	mov	r0, r6
.LVL16:
.LBE5:
	.loc 1 20 0
	mov	r4, r3
.LBB6:
	.loc 1 25 0
	bl	m_strcmp(PLT)
	cmp	r0, #0
.LBE6:
	.loc 1 22 0
	add	r5, r5, #1
	add	r3, r4, #48
.LBB7:
	.loc 1 25 0
	bne	.L24
.LBE7:
	.loc 1 31 0
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L23:
	.loc 1 22 0
	mov	r4, #0
	.loc 1 31 0
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.LFE3:
	.size	NodeNameToTrackNode, .-NodeNameToTrackNode
	.align	2
	.global	GetRandomSensor
	.type	GetRandomSensor, %function
GetRandomSensor:
.LFB4:
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL17:
	stmfd	sp!, {r4, r5, lr}
.LCFI2:
	mov	r5, r0
	mov	r4, r1
.LVL18:
.L36:
.LBB8:
	.loc 1 35 0
	mov	r0, r5
	bl	RNG_Get(PLT)
	.loc 1 36 0
	ldr	r2, .L37
	umull	r1, r3, r2, r0
	mov	r3, r3, lsr #5
	add	r3, r3, r3, asl #3
	sub	r0, r0, r3, asl #4
	add	r0, r0, r0, asl #1
	add	r0, r4, r0, asl #4
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [r0, #4]
	cmp	r3, #1
	bne	.L36
.LBE8:
	.loc 1 41 0
	ldmfd	sp!, {r4, r5, pc}
.L38:
	.align	2
.L37:
	.word	954437177
.LFE4:
	.size	GetRandomSensor, .-GetRandomSensor
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Case should not happen\000"
	.text
	.align	2
	.global	IsNodeReachableViaDirectedGraph
	.type	IsNodeReachableViaDirectedGraph, %function
IsNodeReachableViaDirectedGraph:
.LFB6:
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL19:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI3:
	ldr	sl, .L65
	.loc 1 57 0
	cmp	r3, #20
	.loc 1 55 0
.L59:
	add	sl, pc, sl
	mov	r8, r0
	.loc 1 55 0
	mov	r6, r1
	mov	r7, r2
	.loc 1 57 0
	ble	.L61
.LVL20:
	b	.L41
.L63:
	.loc 1 63 0
	ldr	r2, [r6, #4]
	cmp	r2, #3
	beq	.L60
	.loc 1 65 0
	cmp	r2, #1
	bne	.L62
.L60:
	.loc 1 66 0
	add	r3, r3, #1
	.loc 1 57 0
	cmp	r3, #20
	.loc 1 66 0
	ldr	r6, [r6, #24]
	.loc 1 57 0
	bgt	.L41
.LVL21:
.L61:
	.loc 1 61 0
	cmp	r7, r6
	bne	.L63
	.loc 1 77 0
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.LVL22:
.L41:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.LVL23:
.L62:
	.loc 1 67 0
	cmp	r2, #5
	beq	.L41
	.loc 1 69 0
	cmp	r2, #4
	beq	.L41
	.loc 1 71 0
	cmp	r2, #2
	beq	.L64
	.loc 1 76 0
	ldr	r1, .L65+4
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.LVL24:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.LVL25:
.L64:
.LBB9:
	.loc 1 72 0
	add	r4, r3, #1
	ldr	r1, [r6, #24]
	mov	r2, r7
	mov	r3, r4
.LVL26:
	mov	r0, r8
	bl	IsNodeReachableViaDirectedGraph(PLT)
	.loc 1 73 0
	ldr	r1, [r6, #40]
	.loc 1 72 0
	mov	r5, r0
.LVL27:
	.loc 1 73 0
	mov	r2, r7
	mov	r0, r8
	mov	r3, r4
	bl	IsNodeReachableViaDirectedGraph(PLT)
	.loc 1 74 0
	orrs	r5, r5, r0
.LVL28:
	moveq	r0, #0
	movne	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	.LC1(GOTOFF)
.LBE9:
.LFE6:
	.size	IsNodeReachableViaDirectedGraph, .-IsNodeReachableViaDirectedGraph
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Unable to find a sensor that was reachable via the "
	.ascii	"directed graph in current direction.\000"
	.text
	.align	2
	.global	GetRandomSensorReachableViaDirectedGraph
	.type	GetRandomSensorReachableViaDirectedGraph, %function
GetRandomSensorReachableViaDirectedGraph:
.LFB5:
	.loc 1 43 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI4:
	ldr	sl, .L75
	ldr	r9, .L75+4
.L73:
	add	sl, pc, sl
	mov	r8, r0
	mov	r6, r1
	mov	r7, r2
	mov	r5, #0
.LVL30:
	b	.L68
.LVL31:
.L74:
.LBB10:
	.loc 1 51 0
	cmp	r5, #99
	movgt	r0, #0
	movle	r0, #1
	bl	assert(PLT)
.LVL32:
.L68:
	.loc 1 46 0
	mov	r1, r6
	mov	r0, r8
	bl	GetRandomSensor(PLT)
	mov	r4, r0
	.loc 1 47 0
	mov	r1, r7
	mov	r0, r6
	mov	r2, r4
	mov	r3, #0
	bl	IsNodeReachableViaDirectedGraph(PLT)
	cmp	r0, #0
	.loc 1 50 0
	add	r5, r5, #1
	.loc 1 51 0
	add	r1, sl, r9
	.loc 1 47 0
	beq	.L74
.LBE10:
	.loc 1 53 0
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	.LC2(GOTOFF)
.LFE5:
	.size	GetRandomSensorReachableViaDirectedGraph, .-GetRandomSensorReachableViaDirectedGraph
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"This path requires that switch %d be set twice.\000"
	.text
	.align	2
	.global	QueueSwitchStatesForDirectedPath
	.type	QueueSwitchStatesForDirectedPath, %function
QueueSwitchStatesForDirectedPath:
.LFB7:
	.loc 1 81 0
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI5:
	sub	sp, sp, #4
.LCFI6:
.LVL34:
	ldr	r4, [sp, #36]
	ldr	sl, .L108
	.loc 1 84 0
	cmp	r4, #20
	.loc 1 81 0
.L101:
	add	sl, pc, sl
	mov	r7, r0
	.loc 1 81 0
	mov	r8, r1
	mov	r5, r2
	mov	r6, r3
	.loc 1 84 0
	ble	.L103
.LVL35:
	b	.L79
.L105:
	.loc 1 90 0
	ldr	r3, [r5, #4]
	cmp	r3, #3
	beq	.L102
	.loc 1 95 0
	cmp	r3, #1
	bne	.L104
.L102:
.LBB11:
	.loc 1 96 0
	add	r4, r4, #1
.LBE11:
	.loc 1 84 0
	cmp	r4, #20
.LBB12:
	.loc 1 96 0
	ldr	r5, [r5, #24]
.LBE12:
	.loc 1 84 0
	bgt	.L79
.LVL36:
.L103:
	.loc 1 88 0
	cmp	r6, r5
	bne	.L105
	.loc 1 118 0
	mov	r0, #1
.LVL37:
.LVL38:
.L97:
.LVL39:
	.loc 1 121 0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.LVL40:
.L79:
	.loc 1 118 0
	mov	r0, #0
.LVL41:
	b	.L97
.LVL42:
.L104:
	.loc 1 100 0
	cmp	r3, #5
	beq	.L79
	.loc 1 102 0
	cmp	r3, #4
	beq	.L79
	.loc 1 104 0
	cmp	r3, #2
	beq	.L106
	.loc 1 117 0
	ldr	r1, .L108+4
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	mov	r0, #0
.LVL43:
	b	.L97
.LVL44:
.L106:
.LBB13:
	.loc 1 105 0
	ldr	r2, [r5, #24]
	add	r4, r4, #1
.LVL45:
	mov	r1, r8
	mov	r3, r6
	mov	r0, r7
	str	r4, [sp, #0]
	bl	QueueSwitchStatesForDirectedPath(PLT)
	.loc 1 106 0
	ldr	r2, [r5, #40]
	.loc 1 105 0
	mov	r9, r0
.LVL46:
	.loc 1 106 0
	mov	r1, r8
	mov	r3, r6
	mov	r0, r7
	str	r4, [sp, #0]
	bl	QueueSwitchStatesForDirectedPath(PLT)
	.loc 1 107 0
	cmp	r9, #0
	.loc 1 106 0
	mov	r4, r0
.LVL47:
	.loc 1 107 0
	bne	.L107
	.loc 1 111 0
	cmp	r0, #0
	.loc 1 113 0
	ldrne	r2, [r5, #8]
	movne	r3, #67
	strne	r3, [r7, r2, asl #2]
.L95:
	.loc 1 115 0
	orrs	r9, r9, r4
.LVL48:
	moveq	r0, #0
	movne	r0, #1
.LVL49:
	b	.L97
.LVL50:
.L107:
	.loc 1 109 0
	ldr	r2, [r5, #8]
	ldr	r1, .L108+8
	ldr	r0, [r7, r2, asl #2]
	add	r1, sl, r1
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	assertf(PLT)
	.loc 1 110 0
	ldr	r2, [r5, #8]
	mov	r3, #83
	str	r3, [r7, r2, asl #2]
	b	.L95
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L101+8)
	.word	.LC1(GOTOFF)
	.word	.LC3(GOTOFF)
.LBE13:
.LFE7:
	.size	QueueSwitchStatesForDirectedPath, .-QueueSwitchStatesForDirectedPath
	.align	2
	.global	PopulateRouteNodeInfo
	.type	PopulateRouteNodeInfo, %function
PopulateRouteNodeInfo:
.LFB8:
	.loc 1 123 0
	@ args = 8, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL51:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI7:
	sub	sp, sp, #12
.LCFI8:
.LVL52:
	ldr	r5, [sp, #48]
	ldr	sl, .L138
	.loc 1 125 0
	cmp	r5, #20
	.loc 1 123 0
.L132:
	add	sl, pc, sl
	mov	r6, r2
	.loc 1 123 0
	mov	r8, r0
	mov	fp, r1
	mov	r7, r3
	ldr	r9, [sp, #52]
	.loc 1 125 0
	bgt	.L111
.LVL53:
	.loc 1 129 0
	cmp	r2, r3
	beq	.L135
.LVL54:
	.loc 1 134 0
	ldr	r2, [r2, #4]
.LVL55:
	cmp	r2, #3
	beq	.L134
	.loc 1 144 0
	cmp	r2, #1
	beq	.L134
	.loc 1 152 0
	cmp	r2, #5
	beq	.L111
	.loc 1 154 0
	cmp	r2, #4
	beq	.L111
	.loc 1 156 0
	cmp	r2, #2
	beq	.L136
	.loc 1 170 0
	ldr	r1, .L138+4
	mov	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
.LVL56:
	mov	r0, #0
.LVL57:
	b	.L115
.LVL58:
.L111:
	.loc 1 171 0
	mov	r0, #0
.LVL59:
.L115:
.LVL60:
	.loc 1 173 0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL61:
.L134:
.LBB14:
	.loc 1 145 0
	ldr	r2, [r6, #24]
	add	lr, r5, #1
	add	ip, r9, #1
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	bl	PopulateRouteNodeInfo(PLT)
.LVL62:
	.loc 1 146 0
	cmp	r0, #0
.LVL63:
	beq	.L115
	.loc 1 147 0
	add	r3, r9, r9, asl #1
	mov	r3, r3, asl #2
	add	r2, r8, r3
	.loc 1 149 0
	add	r1, r6, #16
	.loc 1 147 0
	str	r6, [r8, r3]
	.loc 1 148 0
	mov	r3, #0
	.loc 1 149 0
	stmib	r2, {r1, r3}	@ phole stm
	b	.L115
.LVL64:
.L136:
.LBE14:
.LBB15:
	.loc 1 157 0
	ldr	r2, [r6, #24]
	add	r5, r5, #1
.LVL65:
	add	r4, r9, #1
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	bl	PopulateRouteNodeInfo(PLT)
.LVL66:
	.loc 1 158 0
	ldr	r2, [r6, #40]
	.loc 1 157 0
	str	r0, [sp, #8]
.LVL67:
	.loc 1 158 0
	mov	r3, r7
	mov	r1, fp
	mov	r0, r8
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	bl	PopulateRouteNodeInfo(PLT)
	.loc 1 159 0
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L137
.LVL68:
	.loc 1 163 0
	cmp	r0, #0
	beq	.L129
	.loc 1 164 0
	add	r3, r9, r9, asl #1
	mov	r3, r3, asl #2
	add	r2, r8, r3
	.loc 1 166 0
	add	r1, r6, #32
	.loc 1 164 0
	str	r6, [r8, r3]
	.loc 1 165 0
	mov	r3, #67
	.loc 1 166 0
	stmib	r2, {r1, r3}	@ phole stm
	b	.L129
.LVL69:
.L135:
.LBE15:
	.loc 1 130 0
	add	r3, r9, r9, asl #1
.LVL70:
	mov	r3, r3, asl #2
	add	r1, r0, r3
	.loc 1 131 0
	mov	r2, #0
.LVL71:
	.loc 1 132 0
	mov	r0, #1
.LVL72:
	.loc 1 130 0
	str	r6, [r8, r3]
	.loc 1 132 0
	str	r2, [r1, #4]
	.loc 1 131 0
	str	r2, [r1, #8]
	b	.L115
.LVL73:
.L137:
.LBB16:
	.loc 1 160 0
	add	r3, r9, r9, asl #1
	mov	r3, r3, asl #2
	add	r2, r8, r3
	.loc 1 162 0
	add	r1, r6, #16
	.loc 1 160 0
	str	r6, [r8, r3]
	.loc 1 161 0
	mov	r3, #83
	.loc 1 162 0
	stmib	r2, {r1, r3}	@ phole stm
.LVL74:
.L129:
	.loc 1 168 0
	ldr	r3, [sp, #8]
	orrs	r3, r3, r0
	moveq	r0, #0
	movne	r0, #1
.LVL75:
	b	.L115
.L139:
	.align	2
.L138:
	.word	_GLOBAL_OFFSET_TABLE_-(.L132+8)
	.word	.LC1(GOTOFF)
.LBE16:
.LFE8:
	.size	PopulateRouteNodeInfo, .-PopulateRouteNodeInfo
	.align	2
	.global	DistanceToNextSensor
	.type	DistanceToNextSensor, %function
DistanceToNextSensor:
.LFB9:
	.loc 1 175 0
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL76:
	stmfd	sp!, {r4, r5, r6, r7, lr}
.LCFI9:
	.loc 1 179 0
	cmp	r1, #99
	.loc 1 175 0
	sub	sp, sp, #12
.LCFI10:
.LVL77:
	.loc 1 175 0
	mov	r5, r1
	.loc 1 179 0
	movgt	r7, #0
.LVL78:
	bgt	.L143
.LVL79:
.LBB17:
	.loc 1 180 0
	add	r3, r1, r1, asl #1
	add	r3, r0, r3, asl #2
	ldmia	r3, {r0, r1, r2}
.LVL80:
	stmia	sp, {r0, r1, r2}
	mov	r4, sp
	mov	lr, r1
	.loc 1 175 0
	mov	r6, r3
	mov	ip, r5
.LVL81:
	mov	r7, #0
.L145:
	.loc 1 186 0
	ldr	r3, [lr, #12]
.LBE17:
	.loc 1 179 0
	add	ip, ip, #1
.LBB18:
	.loc 1 180 0
	add	r0, r6, #12
.LBE18:
	.loc 1 179 0
	cmp	ip, #100
.LBB19:
	.loc 1 180 0
	mov	r6, r0
	.loc 1 186 0
	add	r7, r7, r3
.LBE19:
	.loc 1 179 0
	beq	.L143
.LBB20:
	.loc 1 180 0
	ldmia	r0, {r0, r1, r2}
	stmia	r4, {r0, r1, r2}
	.loc 1 182 0
	ldmia	sp, {r3, lr}	@ phole ldm
	ldr	r2, [r3, #4]
	cmp	r2, #1
	movne	r1, #0
	moveq	r1, #1
	cmp	r5, ip
	moveq	r1, #0
	cmp	r1, #0
	beq	.L145
.LVL82:
.L143:
.LBE20:
	.loc 1 190 0
	mov	r0, r7
.LVL83:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.LFE9:
	.size	DistanceToNextSensor, .-DistanceToNextSensor
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
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
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
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI3-.LFB6
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI4-.LFB5
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
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x24
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI7-.LFB8
	.byte	0xe
	.uleb128 0x24
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x30
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
	.uleb128 0x14
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x20
	.byte	0x8e
	.uleb128 0x1
	.byte	0x87
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x5
	.align	2
.LEFDE14:
	.file 2 "tracks/track_node.h"
	.file 3 "random.h"
	.file 4 "train.h"
	.file 5 "route.h"
	.file 6 "queue.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x5e
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL31-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL31-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -4
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 36
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 36
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL45-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 36
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL50-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL47-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL52-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL53-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x5b
	.4byte	0x0
	.4byte	0x0
.LLST29:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL71-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST30:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST31:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 48
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 48
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 48
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL73-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 48
	.4byte	0x0
	.4byte	0x0
.LLST32:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 52
	.4byte	.LVL53-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST33:
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST34:
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	.LVL73-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST35:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL74-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST36:
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL77-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST37:
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL80-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST38:
	.4byte	.LVL76-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL79-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x6d6
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF63
	.byte	0x1
	.4byte	.LASF64
	.4byte	.LASF65
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x5
	.byte	0x3
	.4byte	0x30
	.uleb128 0x3
	.4byte	0x67
	.4byte	.LASF6
	.byte	0xc
	.byte	0x5
	.byte	0x3
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x5
	.byte	0xf
	.4byte	0x1bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x5
	.byte	0x10
	.4byte	0x1b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x5
	.byte	0x11
	.4byte	0x1ff
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x8
	.uleb128 0x7
	.byte	0x4
	.4byte	0x7c
	.uleb128 0x8
	.4byte	0xc6
	.ascii	"RNG\000"
	.byte	0x10
	.byte	0x3
	.byte	0x4
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x3
	.byte	0x5
	.4byte	0x67
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x3
	.byte	0x6
	.4byte	0x67
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.ascii	"x\000"
	.byte	0x3
	.byte	0x7
	.4byte	0x67
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.ascii	"m\000"
	.byte	0x3
	.byte	0x8
	.4byte	0x67
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0xa
	.ascii	"RNG\000"
	.byte	0x3
	.byte	0x9
	.4byte	0x89
	.uleb128 0xb
	.4byte	0xfe
	.byte	0x4
	.byte	0x2
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF7
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF8
	.sleb128 1
	.uleb128 0xc
	.4byte	.LASF9
	.sleb128 2
	.uleb128 0xc
	.4byte	.LASF10
	.sleb128 3
	.uleb128 0xc
	.4byte	.LASF11
	.sleb128 4
	.uleb128 0xc
	.4byte	.LASF12
	.sleb128 5
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x2
	.byte	0xb
	.4byte	0xd1
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x2
	.byte	0x12
	.4byte	0x114
	.uleb128 0x3
	.4byte	0x167
	.4byte	.LASF14
	.byte	0x30
	.byte	0x2
	.byte	0x11
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x2
	.byte	0x1c
	.4byte	0x1c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x2
	.byte	0x1d
	.4byte	0xfe
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.ascii	"num\000"
	.byte	0x2
	.byte	0x1e
	.4byte	0x75
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x2
	.byte	0x1f
	.4byte	0x1bd
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x20
	.4byte	0x1ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x2
	.byte	0x13
	.4byte	0x172
	.uleb128 0x3
	.4byte	0x1b7
	.4byte	.LASF18
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x2
	.byte	0x16
	.4byte	0x1b7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x2
	.byte	0x17
	.4byte	0x1bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x2
	.byte	0x17
	.4byte	0x1bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x2
	.byte	0x18
	.4byte	0x75
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x167
	.uleb128 0x7
	.byte	0x4
	.4byte	0x109
	.uleb128 0x7
	.byte	0x4
	.4byte	0x1c9
	.uleb128 0xd
	.4byte	0x7c
	.uleb128 0xe
	.4byte	0x1de
	.4byte	0x167
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x1
	.byte	0x0
	.uleb128 0x10
	.4byte	0x1ff
	.4byte	.LASF24
	.byte	0x4
	.byte	0x4
	.byte	0x2c
	.uleb128 0xc
	.4byte	.LASF21
	.sleb128 0
	.uleb128 0xc
	.4byte	.LASF22
	.sleb128 83
	.uleb128 0xc
	.4byte	.LASF23
	.sleb128 67
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x4
	.byte	0x30
	.4byte	0x1de
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x8
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8
	.uleb128 0x11
	.4byte	0x293
	.byte	0x1
	.4byte	.LASF31
	.byte	0x1
	.byte	0x5
	.byte	0x1
	.4byte	0x1bd
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x5
	.4byte	0x1bd
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x1
	.byte	0x5
	.4byte	0x75
	.4byte	.LLST1
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x1
	.byte	0x5
	.4byte	0x75
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	.LASF30
	.byte	0x1
	.byte	0x6
	.4byte	0x75
	.4byte	.LLST3
	.uleb128 0x14
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x75
	.4byte	.LLST4
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x13
	.4byte	.LASF0
	.byte	0x1
	.byte	0x9
	.4byte	0x1bd
	.4byte	.LLST5
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x2ec
	.byte	0x1
	.4byte	.LASF32
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.4byte	0x1bd
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x14
	.4byte	0x1bd
	.4byte	.LLST6
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.byte	0x14
	.4byte	0x83
	.4byte	.LLST7
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x75
	.byte	0x1
	.byte	0x55
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0x20
	.uleb128 0x17
	.4byte	.LASF0
	.byte	0x1
	.byte	0x17
	.4byte	0x1bd
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x33c
	.byte	0x1
	.4byte	.LASF33
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.4byte	0x1bd
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.ascii	"rng\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x33c
	.4byte	.LLST8
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x21
	.4byte	0x1bd
	.4byte	.LLST9
	.uleb128 0x19
	.4byte	.LBB8
	.4byte	.LBE8
	.uleb128 0x1a
	.4byte	.LASF34
	.byte	0x1
	.byte	0x23
	.4byte	0x75
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xc6
	.uleb128 0x11
	.4byte	0x3bf
	.byte	0x1
	.4byte	.LASF35
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.4byte	0x75
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x37
	.4byte	0x1bd
	.4byte	.LLST10
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x37
	.4byte	0x1bd
	.4byte	.LLST11
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0x37
	.4byte	0x1bd
	.4byte	.LLST12
	.uleb128 0x12
	.4byte	.LASF38
	.byte	0x1
	.byte	0x37
	.4byte	0x75
	.4byte	.LLST13
	.uleb128 0x19
	.4byte	.LBB9
	.4byte	.LBE9
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x48
	.4byte	0x75
	.4byte	.LLST14
	.uleb128 0x1a
	.4byte	.LASF40
	.byte	0x1
	.byte	0x49
	.4byte	0x75
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x42b
	.byte	0x1
	.4byte	.LASF41
	.byte	0x1
	.byte	0x2b
	.byte	0x1
	.4byte	0x1bd
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x18
	.ascii	"rng\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x33c
	.4byte	.LLST15
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x2b
	.4byte	0x1bd
	.4byte	.LLST16
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x2b
	.4byte	0x1bd
	.4byte	.LLST17
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x75
	.byte	0x1
	.byte	0x55
	.uleb128 0x19
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.byte	0x2e
	.4byte	0x1bd
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.4byte	0x4cf
	.byte	0x1
	.4byte	.LASF43
	.byte	0x1
	.byte	0x51
	.byte	0x1
	.4byte	0x75
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LLST18
	.uleb128 0x12
	.4byte	.LASF44
	.byte	0x1
	.byte	0x51
	.4byte	0x4cf
	.4byte	.LLST19
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x51
	.4byte	0x1bd
	.4byte	.LLST20
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x51
	.4byte	0x1bd
	.4byte	.LLST21
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0x51
	.4byte	0x1bd
	.4byte	.LLST22
	.uleb128 0x12
	.4byte	.LASF38
	.byte	0x1
	.byte	0x51
	.4byte	0x75
	.4byte	.LLST23
	.uleb128 0x1c
	.4byte	0x4a6
	.4byte	.Ldebug_ranges0+0x40
	.uleb128 0x1d
	.ascii	"r\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x75
	.byte	0x0
	.uleb128 0x19
	.4byte	.LBB13
	.4byte	.LBE13
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x69
	.4byte	0x75
	.4byte	.LLST24
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x1
	.byte	0x6a
	.4byte	0x75
	.4byte	.LLST25
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x1ff
	.uleb128 0x1b
	.4byte	0x58c
	.byte	0x1
	.4byte	.LASF45
	.byte	0x1
	.byte	0x7b
	.byte	0x1
	.4byte	0x75
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LLST26
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x7b
	.4byte	0x58c
	.4byte	.LLST27
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x7b
	.4byte	0x1bd
	.4byte	.LLST28
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x7b
	.4byte	0x1bd
	.4byte	.LLST29
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0x7b
	.4byte	0x1bd
	.4byte	.LLST30
	.uleb128 0x12
	.4byte	.LASF38
	.byte	0x1
	.byte	0x7b
	.4byte	0x75
	.4byte	.LLST31
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.byte	0x7b
	.4byte	0x75
	.4byte	.LLST32
	.uleb128 0x1e
	.4byte	0x567
	.4byte	.LBB14
	.4byte	.LBE14
	.uleb128 0x14
	.ascii	"r\000"
	.byte	0x1
	.byte	0x91
	.4byte	0x75
	.4byte	.LLST33
	.byte	0x0
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0x58
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0x9d
	.4byte	0x75
	.4byte	.LLST34
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x1
	.byte	0x9e
	.4byte	0x75
	.4byte	.LLST35
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x25
	.uleb128 0x1b
	.4byte	0x5fa
	.byte	0x1
	.4byte	.LASF48
	.byte	0x1
	.byte	0xaf
	.byte	0x1
	.4byte	0x75
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LLST36
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0xaf
	.4byte	0x58c
	.4byte	.LLST37
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.byte	0xaf
	.4byte	0x75
	.4byte	.LLST38
	.uleb128 0x17
	.4byte	.LASF49
	.byte	0x1
	.byte	0xb0
	.4byte	0x75
	.byte	0x1
	.byte	0x57
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.byte	0xb1
	.4byte	0x75
	.byte	0x1
	.byte	0x5c
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0x70
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.byte	0xb4
	.4byte	0x25
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.4byte	.LASF51
	.byte	0x6
	.byte	0x9
	.4byte	0x606
	.sleb128 -1
	.uleb128 0xd
	.4byte	0x75
	.uleb128 0x1f
	.4byte	.LASF52
	.byte	0x6
	.byte	0xa
	.4byte	0x606
	.sleb128 -2
	.uleb128 0xe
	.4byte	0x627
	.4byte	0x7c
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x6
	.byte	0x0
	.uleb128 0x20
	.4byte	.LASF53
	.byte	0x4
	.byte	0xb
	.4byte	0x636
	.4byte	.LASF54
	.uleb128 0xd
	.4byte	0x617
	.uleb128 0xe
	.4byte	0x64b
	.4byte	0x7c
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x6
	.byte	0x0
	.uleb128 0x20
	.4byte	.LASF55
	.byte	0x4
	.byte	0xc
	.4byte	0x65a
	.4byte	.LASF56
	.uleb128 0xd
	.4byte	0x63b
	.uleb128 0xe
	.4byte	0x66f
	.4byte	0x7c
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x6
	.byte	0x0
	.uleb128 0x20
	.4byte	.LASF57
	.byte	0x4
	.byte	0xd
	.4byte	0x67e
	.4byte	.LASF58
	.uleb128 0xd
	.4byte	0x65f
	.uleb128 0xe
	.4byte	0x693
	.4byte	0x7c
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x6
	.byte	0x0
	.uleb128 0x20
	.4byte	.LASF59
	.byte	0x4
	.byte	0xe
	.4byte	0x6a2
	.4byte	.LASF60
	.uleb128 0xd
	.4byte	0x683
	.uleb128 0x21
	.4byte	.LASF61
	.byte	0x4
	.byte	0x10
	.4byte	0x606
	.byte	0x10
	.uleb128 0xe
	.4byte	0x6c9
	.4byte	0x7c
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x5
	.uleb128 0xf
	.4byte	0x6e
	.byte	0x13
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LASF62
	.byte	0x4
	.byte	0x6d
	.4byte	0x6d4
	.uleb128 0xd
	.4byte	0x6b3
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0xd
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xe
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xf9
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x6da
	.4byte	0x218
	.ascii	"SensorToTrackNode\000"
	.4byte	0x293
	.ascii	"NodeNameToTrackNode\000"
	.4byte	0x2ec
	.ascii	"GetRandomSensor\000"
	.4byte	0x342
	.ascii	"IsNodeReachableViaDirectedGraph\000"
	.4byte	0x3bf
	.ascii	"GetRandomSensorReachableViaDirectedGraph\000"
	.4byte	0x42b
	.ascii	"QueueSwitchStatesForDirectedPath\000"
	.4byte	0x4d5
	.ascii	"PopulateRouteNodeInfo\000"
	.4byte	0x592
	.ascii	"DistanceToNextSensor\000"
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
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB11-.Ltext0
	.4byte	.LBE11-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB15-.Ltext0
	.4byte	.LBE15-.Ltext0
	.4byte	.LBB16-.Ltext0
	.4byte	.LBE16-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB17-.Ltext0
	.4byte	.LBE17-.Ltext0
	.4byte	.LBB20-.Ltext0
	.4byte	.LBE20-.Ltext0
	.4byte	.LBB19-.Ltext0
	.4byte	.LBE19-.Ltext0
	.4byte	.LBB18-.Ltext0
	.4byte	.LBE18-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF24:
	.ascii	"SwitchState\000"
.LASF1:
	.ascii	"edge\000"
.LASF56:
	.ascii	"TCmSvr\000"
.LASF44:
	.ascii	"switch_queue\000"
.LASF16:
	.ascii	"type\000"
.LASF34:
	.ascii	"index\000"
.LASF39:
	.ascii	"rtn1\000"
.LASF31:
	.ascii	"SensorToTrackNode\000"
.LASF22:
	.ascii	"SWITCH_STRAIGHT\000"
.LASF7:
	.ascii	"NODE_NONE\000"
.LASF14:
	.ascii	"track_node\000"
.LASF38:
	.ascii	"levels\000"
.LASF30:
	.ascii	"indexed_sensor_num\000"
.LASF55:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF47:
	.ascii	"array_index\000"
.LASF25:
	.ascii	"double\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF28:
	.ascii	"module_num\000"
.LASF4:
	.ascii	"long unsigned int\000"
.LASF12:
	.ascii	"NODE_EXIT\000"
.LASF17:
	.ascii	"reverse\000"
.LASF65:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF15:
	.ascii	"name\000"
.LASF51:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF32:
	.ascii	"NodeNameToTrackNode\000"
.LASF0:
	.ascii	"node\000"
.LASF35:
	.ascii	"IsNodeReachableViaDirectedGraph\000"
.LASF58:
	.ascii	"TrSTmr\000"
.LASF52:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF62:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF36:
	.ascii	"start_node\000"
.LASF64:
	.ascii	"route.c\000"
.LASF59:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF27:
	.ascii	"track_nodes\000"
.LASF53:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF60:
	.ascii	"TrSwMr\000"
.LASF41:
	.ascii	"GetRandomSensorReachableViaDirectedGraph\000"
.LASF18:
	.ascii	"track_edge\000"
.LASF48:
	.ascii	"DistanceToNextSensor\000"
.LASF13:
	.ascii	"node_type\000"
.LASF19:
	.ascii	"dest\000"
.LASF57:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF40:
	.ascii	"rtn2\000"
.LASF2:
	.ascii	"switch_state\000"
.LASF23:
	.ascii	"SWITCH_CURVED\000"
.LASF54:
	.ascii	"TrnSvr\000"
.LASF33:
	.ascii	"GetRandomSensor\000"
.LASF8:
	.ascii	"NODE_SENSOR\000"
.LASF42:
	.ascii	"random_sensor\000"
.LASF9:
	.ascii	"NODE_BRANCH\000"
.LASF10:
	.ascii	"NODE_MERGE\000"
.LASF5:
	.ascii	"char\000"
.LASF43:
	.ascii	"QueueSwitchStatesForDirectedPath\000"
.LASF50:
	.ascii	"info\000"
.LASF49:
	.ascii	"distance\000"
.LASF6:
	.ascii	"RouteNodeInfo\000"
.LASF21:
	.ascii	"SWITCH_UNKNOWN\000"
.LASF45:
	.ascii	"PopulateRouteNodeInfo\000"
.LASF11:
	.ascii	"NODE_ENTER\000"
.LASF26:
	.ascii	"unsigned char\000"
.LASF63:
	.ascii	"GNU C 4.0.2\000"
.LASF20:
	.ascii	"dist\000"
.LASF61:
	.ascii	"LIGHTS_MASK\000"
.LASF37:
	.ascii	"dest_node\000"
.LASF46:
	.ascii	"info_array\000"
.LASF29:
	.ascii	"sensor_num\000"
	.ident	"GCC: (GNU) 4.0.2"
