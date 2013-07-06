	.file	"queue.c"
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
	.type	ERR_QUEUE_PRIORITY, %object
	.size	ERR_QUEUE_PRIORITY, 4
ERR_QUEUE_PRIORITY:
	.word	-2
	.text
	.align	2
	.global	Queue_Initialize
	.type	Queue_Initialize, %function
Queue_Initialize:
.LFB2:
	.file 1 "queue.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 5 0
	mov	r3, #0
	.loc 1 4 0
	@ lr needed for prologue
	.loc 1 8 0
	str	r1, [r0, #12]
	.loc 1 7 0
	str	r3, [r0, #8]
	.loc 1 5 0
	str	r3, [r0, #0]
	.loc 1 6 0
	str	r3, [r0, #4]
	.loc 1 9 0
	bx	lr
.LFE2:
	.size	Queue_Initialize, .-Queue_Initialize
	.global	__umodsi3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Queue is full. Size is %d.\012\000"
	.align	2
.LC1:
	.ascii	"Queue_PushEnd: item=0\000"
	.text
	.align	2
	.global	Queue_PushEnd
	.type	Queue_PushEnd, %function
Queue_PushEnd:
.LFB3:
	.loc 1 11 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI0:
	mov	r5, r0
	.loc 1 12 0
	ldr	r4, [r0, #12]
	.loc 1 11 0
	ldr	sl, .L11
	.loc 1 12 0
	ldr	r0, [r0, #4]
.LVL2:
	.loc 1 11 0
.L8:
	add	sl, pc, sl
	mov	r6, r1
	.loc 1 12 0
	add	r0, r0, #1
	mov	r1, r4
.LVL3:
	bl	__umodsi3(PLT)
	.loc 1 12 0
	ldr	r3, [r5, #0]
	.loc 1 17 0
	ldr	r1, .L11+4
	.loc 1 12 0
	cmp	r0, r3
	.loc 1 17 0
	add	r1, sl, r1
	.loc 1 13 0
	mov	r2, r4
	.loc 1 17 0
	mov	r0, r6
	.loc 1 12 0
	beq	.L10
.LVL4:
	.loc 1 17 0
	bl	assert(PLT)
.LVL5:
	.loc 1 19 0
	ldr	r0, [r5, #4]
	.loc 1 20 0
	ldr	r1, [r5, #12]
	.loc 1 19 0
	add	r3, r5, r0, asl #2
	str	r6, [r3, #16]
	.loc 1 20 0
	add	r0, r0, #1
	bl	__umodsi3(PLT)
	.loc 1 21 0
	ldr	r3, [r5, #8]
	.loc 1 20 0
	str	r0, [r5, #4]
	.loc 1 21 0
	add	r3, r3, #1
	mov	r0, #0
	str	r3, [r5, #8]
	.loc 1 24 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.LVL6:
.L10:
	.loc 1 13 0
	ldr	r1, .L11+8
	mov	r0, #0
.LVL7:
	add	r1, sl, r1
	bl	assertf(PLT)
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC1(GOTOFF)
	.word	.LC0(GOTOFF)
.LFE3:
	.size	Queue_PushEnd, .-Queue_PushEnd
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Queue_PopStart: item=0\000"
	.text
	.align	2
	.global	Queue_PopStart
	.type	Queue_PopStart, %function
Queue_PopStart:
.LFB4:
	.loc 1 26 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI1:
	ldr	sl, .L19
	.loc 1 27 0
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	.loc 1 33 0
	ldr	r1, .L19+4
	.loc 1 26 0
.L18:
	add	sl, pc, sl
	.loc 1 27 0
	cmp	r3, r2
	.loc 1 26 0
	mov	r4, r0
	.loc 1 33 0
	add	r1, sl, r1
	.loc 1 31 0
	add	r0, r0, r3, asl #2
.LVL9:
	.loc 1 27 0
	mov	r5, #0
.LVL10:
	beq	.L16
	.loc 1 31 0
	ldr	r5, [r0, #16]
	.loc 1 33 0
	mov	r0, r5
	bl	assert(PLT)
	.loc 1 35 0
	ldr	r0, [r4, #0]
	ldr	r1, [r4, #12]
	add	r0, r0, #1
	bl	__umodsi3(PLT)
	.loc 1 36 0
	ldr	r3, [r4, #8]
	.loc 1 35 0
	str	r0, [r4, #0]
	.loc 1 36 0
	sub	r3, r3, #1
	str	r3, [r4, #8]
.L16:
	.loc 1 38 0
	mov	r0, r5
	ldmfd	sp!, {r4, r5, sl, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	.LC2(GOTOFF)
.LFE4:
	.size	Queue_PopStart, .-Queue_PopStart
	.align	2
	.global	Queue_CurrentCount
	.type	Queue_CurrentCount, %function
Queue_CurrentCount:
.LFB5:
	.loc 1 40 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL11:
	.loc 1 42 0
	ldr	r0, [r0, #8]
.LVL12:
	.loc 1 40 0
	@ lr needed for prologue
	.loc 1 42 0
	bx	lr
.LFE5:
	.size	Queue_CurrentCount, .-Queue_CurrentCount
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"This function has a bug in it because I though we n"
	.ascii	"eeded it but I guess not.  Gonna leave it here just"
	.ascii	" in case.\000"
	.align	2
.LC4:
	.ascii	"Precondition violated.\000"
	.align	2
.LC5:
	.ascii	"Attempting to remove item %d from queue of size %d."
	.ascii	"\012\000"
	.align	2
.LC6:
	.ascii	"Attempting to remove item from empty queue.\012\000"
	.text
	.align	2
	.global	Queue_RemoveItem
	.type	Queue_RemoveItem, %function
Queue_RemoveItem:
.LFB6:
	.loc 1 44 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL13:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI2:
	ldr	sl, .L37
	mov	r8, r1
	.loc 1 45 0
	ldr	r1, .L37+4
.LVL14:
	.loc 1 44 0
.L35:
	add	sl, pc, sl
	mov	r5, r0
	.loc 1 45 0
	add	r1, sl, r1
	mov	r0, #0
.LVL15:
	bl	assert(PLT)
	.loc 1 48 0
	ldr	r1, .L37+8
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 54 0
	add	r3, r5, #16
	.loc 1 55 0
	ldr	r4, [r5, #12]
	.loc 1 54 0
	rsb	r3, r3, r8
	.loc 1 55 0
	ldr	r1, .L37+12
	mov	r7, r3, lsr #2
.LVL16:
	cmp	r7, r4
	movcs	r0, #0
	movcc	r0, #1
	mov	r3, r4
	add	r1, sl, r1
	mov	r2, r7
	bl	assertf(PLT)
	.loc 1 57 0
	ldr	r3, [r5, #0]
	ldr	r0, [r5, #4]
	ldr	r1, .L37+16
	subs	r0, r3, r0
	movne	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 60 0
	ldr	r3, [r5, #0]
	cmp	r3, r7
	beq	.L36
	ldr	r6, [r5, #4]
	ldr	r4, [r5, #12]
.L29:
	.loc 1 65 0
	add	r3, r5, r6, asl #2
	ldr	r1, [r3, #16]
	add	r2, r5, r7, asl #2
	.loc 1 66 0
	add	r0, r6, r4
	.loc 1 65 0
	str	r1, [r2, #16]
	.loc 1 66 0
	sub	r0, r0, #1
	mov	r1, r4
	bl	__umodsi3(PLT)
	str	r0, [r5, #4]
.L32:
	.loc 1 68 0
	ldr	r3, [r5, #8]
	.loc 1 70 0
	mov	r0, r8
	.loc 1 68 0
	sub	r3, r3, #1
	str	r3, [r5, #8]
	.loc 1 70 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L36:
	.loc 1 60 0
	ldr	r6, [r5, #4]
	ldr	r4, [r5, #12]
	add	r0, r6, r4
	sub	r0, r0, #1
	mov	r1, r4
	bl	__umodsi3(PLT)
	cmp	r7, r0
	.loc 1 62 0
	streq	r7, [r5, #4]
	.loc 1 60 0
	bne	.L29
	b	.L32
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
.LFE6:
	.size	Queue_RemoveItem, .-Queue_RemoveItem
	.align	2
	.global	PriorityQueue_Initialize
	.type	PriorityQueue_Initialize, %function
PriorityQueue_Initialize:
.LFB7:
	.loc 1 72 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL17:
	stmfd	sp!, {r4, r5, r6, lr}
.LCFI3:
	ldr	r6, .L45
	.loc 1 72 0
	mov	r5, r0
	mov	r4, #0
.LVL18:
.L40:
	.loc 1 75 0
	add	r0, r5, r4
	add	r4, r4, #6272
	add	r4, r4, #24
	ldr	r1, .L45+4
	bl	Queue_Initialize(PLT)
	.loc 1 74 0
	cmp	r4, r6
	bne	.L40
	.loc 1 77 0
	mov	r3, #0
	str	r3, [r5, r4]
	.loc 1 78 0
	ldmfd	sp!, {r4, r5, r6, pc}
.L46:
	.align	2
.L45:
	.word	201472
	.word	1570
.LFE7:
	.size	PriorityQueue_Initialize, .-PriorityQueue_Initialize
	.align	2
	.global	Queue_IsValidPriority
	.type	Queue_IsValidPriority, %function
Queue_IsValidPriority:
.LFB12:
	.loc 1 138 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	.loc 1 144 0
	cmp	r0, #31
	movhi	r0, #0
	movls	r0, #1
.LVL20:
	.loc 1 138 0
	@ lr needed for prologue
	.loc 1 144 0
	bx	lr
.LFE12:
	.size	Queue_IsValidPriority, .-Queue_IsValidPriority
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"PriorityQueue_Put: Unknown priority %d\000"
	.text
	.align	2
	.global	PriorityQueue_Put
	.type	PriorityQueue_Put, %function
PriorityQueue_Put:
.LFB8:
	.loc 1 80 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL21:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI4:
	ldr	sl, .L56
	mov	r6, r0
.L55:
	add	sl, pc, sl
	.loc 1 81 0
	mov	r0, r2
.LVL22:
	.loc 1 80 0
	mov	r4, r2
	mov	r5, r1
	.loc 1 81 0
	bl	Queue_IsValidPriority(PLT)
.LVL23:
	.loc 1 89 0
	add	r3, r4, r4, asl #6
	add	r3, r4, r3, asl #1
	rsb	r3, r3, r3, asl #2
	.loc 1 81 0
	cmp	r0, #0
	.loc 1 87 0
	ldr	lr, .L56+4
	rsb	ip, r4, #31
	.loc 1 89 0
	add	r3, r4, r3, asl #1
	mov	r1, r5
	.loc 1 82 0
	mov	r2, r4
	.loc 1 81 0
	beq	.L54
.LVL24:
	.loc 1 87 0
	ldr	r2, [r6, lr]
.LVL25:
	.loc 1 89 0
	add	r0, r6, r3, asl #3
	.loc 1 87 0
	mov	r3, #1
	orr	r2, r2, r3, asl ip
	str	r2, [r6, lr]
	.loc 1 90 0
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 89 0
	b	Queue_PushEnd(PLT)
.LVL26:
.L54:
	.loc 1 82 0
	ldr	r1, .L56+8
.LVL27:
	add	r1, sl, r1
	bl	assertf(PLT)
.LVL28:
	.loc 1 90 0
	mvn	r0, #1
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	201472
	.word	.LC7(GOTOFF)
.LFE8:
	.size	PriorityQueue_Put, .-PriorityQueue_Put
	.align	2
	.global	PriorityQueue_Remove
	.type	PriorityQueue_Remove, %function
PriorityQueue_Remove:
.LFB10:
	.loc 1 96 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL29:
	.loc 1 97 0
	add	r3, r1, r1, asl #6
	add	r3, r1, r3, asl #1
	rsb	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	.loc 1 96 0
	stmfd	sp!, {r4, r5, lr}
.LCFI5:
	.loc 1 96 0
	mov	r5, r0
	mov	r4, r1
	.loc 1 97 0
	add	r0, r0, r3, asl #3
.LVL30:
	mov	r1, r2
.LVL31:
	bl	Queue_RemoveItem(PLT)
.LVL32:
	.loc 1 100 0
	ldr	ip, .L62
	.loc 1 99 0
	cmp	r0, #0
	.loc 1 100 0
	ldreq	r2, [r5, ip]
	rsb	r1, r4, #31
	moveq	r3, #1
	eoreq	r2, r2, r3, asl r1
	streq	r2, [r5, ip]
	.loc 1 103 0
	ldmfd	sp!, {r4, r5, pc}
.L63:
	.align	2
.L62:
	.word	201472
.LFE10:
	.size	PriorityQueue_Remove, .-PriorityQueue_Remove
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"PriorityQueue_GetLower: Unknown min_priority %d\000"
	.global	__clzsi2
	.align	2
.LC9:
	.ascii	"PriorityQueue_GetLower: Got bad priority %d from CL"
	.ascii	"Z\000"
	.align	2
.LC10:
	.ascii	"PriorityQueue_GetLower: Got bad priority %d from CL"
	.ascii	"Z  -- b\000"
	.text
	.align	2
	.global	PriorityQueue_GetLower
	.type	PriorityQueue_GetLower, %function
PriorityQueue_GetLower:
.LFB11:
	.loc 1 105 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI6:
	ldr	sl, .L75
	mov	r7, r0
.L74:
	add	sl, pc, sl
	.loc 1 106 0
	mov	r0, r1
.LVL34:
	.loc 1 105 0
	mov	r4, r1
	mov	r6, r2
	.loc 1 106 0
	bl	Queue_IsValidPriority(PLT)
.LVL35:
	.loc 1 107 0
	ldr	r1, .L75+4
	.loc 1 106 0
	cmp	r0, #0
	.loc 1 116 0
	mov	r9, #1
	rsb	r3, r4, #32
	.loc 1 107 0
	mov	r2, r4
	add	r1, sl, r1
	.loc 1 111 0
	ldr	r8, .L75+8
	.loc 1 106 0
	bne	.L65
.LVL36:
	.loc 1 107 0
	bl	assertf(PLT)
.LVL37:
	mvn	r1, #1
.LVL38:
.L67:
	.loc 1 136 0
	mov	r0, r1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.LVL39:
.L65:
	.loc 1 116 0
	mov	r0, r9, asl r3
	.loc 1 111 0
	ldr	r3, [r7, r8]
.LVL40:
	.loc 1 116 0
	sub	r0, r0, #1
	and	r0, r3, r0
	bl	__clzsi2(PLT)
.LVL41:
	.loc 1 118 0
	cmp	r6, #0
	.loc 1 116 0
	mov	r5, r0
.LVL42:
	.loc 1 119 0
	strne	r5, [r6, #0]
	.loc 1 122 0
	cmp	r5, #32
	mov	r1, #0
.LVL43:
	beq	.L67
	.loc 1 127 0
	bl	Queue_IsValidPriority(PLT)
.LVL44:
	ldr	r1, .L75+12
	mov	r2, r5
	add	r1, sl, r1
	bl	assertf(PLT)
	.loc 1 128 0
	ldr	r1, .L75+16
	cmp	r4, r5
	movhi	r0, #0
	movls	r0, #1
	add	r1, sl, r1
	mov	r2, r5
	bl	assertf(PLT)
	.loc 1 130 0
	add	r0, r5, r5, asl #6
	add	r0, r5, r0, asl #1
	rsb	r0, r0, r0, asl #2
	add	r0, r5, r0, asl #1
	add	r0, r7, r0, asl #3
	bl	Queue_PopStart(PLT)
	.loc 1 132 0
	subs	r1, r0, #0
.LVL45:
	.loc 1 133 0
	ldreq	r3, [r7, r8]
	rsb	r2, r5, #31
	eoreq	r3, r3, r9, asl r2
	streq	r3, [r7, r8]
	b	.L67
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	.LC8(GOTOFF)
	.word	201472
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
.LFE11:
	.size	PriorityQueue_GetLower, .-PriorityQueue_GetLower
	.align	2
	.global	PriorityQueue_Get
	.type	PriorityQueue_Get, %function
PriorityQueue_Get:
.LFB9:
	.loc 1 92 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL46:
	.loc 1 93 0
	mov	r1, #0
	mov	r2, r1
	.loc 1 92 0
	@ lr needed for prologue
	.loc 1 94 0
	.loc 1 93 0
	b	PriorityQueue_GetLower(PLT)
.LVL47:
.LFE9:
	.size	PriorityQueue_Get, .-PriorityQueue_Get
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"PQ=%d \000"
	.align	2
.LC12:
	.ascii	"%d=%d \000"
	.align	2
.LC13:
	.ascii	"\012\000"
	.text
	.align	2
	.global	PriorityQueue_PrintItems
	.type	PriorityQueue_PrintItems, %function
PriorityQueue_PrintItems:
.LFB13:
	.loc 1 146 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL48:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI7:
	ldr	sl, .L86
	mov	r5, r0
	.loc 1 150 0
	ldr	r0, .L86+4
.LVL49:
	.loc 1 146 0
.L85:
	add	sl, pc, sl
	.loc 1 150 0
	add	r0, sl, r0
	mov	r1, r5
	bl	robprintfbusy(PLT)
	.loc 1 150 0
	ldr	r3, .L86+8
	ldr	r8, .L86+12
	add	r7, sl, r3
	mov	r4, #0
.LVL50:
	mov	r6, #1
.L80:
	.loc 1 154 0
	ldr	r3, [r5, r8]
	rsb	r2, r4, #31
	mov	r1, r4
	and	r2, r3, r6, asl r2
	.loc 1 152 0
	add	r4, r4, #1
	.loc 1 154 0
	mov	r0, r7
	bl	robprintfbusy(PLT)
	.loc 1 152 0
	cmp	r4, #32
	bne	.L80
	.loc 1 157 0
	ldr	r0, .L86+16
	mov	r1, r5
	add	r0, sl, r0
	.loc 1 158 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	.loc 1 157 0
	b	robprintfbusy(PLT)
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L85+8)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	201472
	.word	.LC13(GOTOFF)
.LFE13:
	.size	PriorityQueue_PrintItems, .-PriorityQueue_PrintItems
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI0-.LFB3
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI1-.LFB4
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
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI2-.LFB6
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI3-.LFB7
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI4-.LFB8
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI5-.LFB10
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI6-.LFB11
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
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI7-.LFB13
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
.LEFDE22:
	.file 2 "queue.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL27-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL28-.Ltext0
	.4byte	.LFE8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL31-.Ltext0
	.4byte	.LFE10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL45-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x59f
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF69
	.byte	0x1
	.4byte	.LASF70
	.4byte	.LASF71
	.uleb128 0x2
	.4byte	0xf2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x2
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
	.byte	0x2
	.byte	0x2f
	.4byte	0x25
	.uleb128 0x5
	.4byte	0x118
	.4byte	.LASF33
	.byte	0x4
	.byte	0x2
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x2
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
	.byte	0x2
	.byte	0x33
	.4byte	0xfd
	.uleb128 0x5
	.4byte	0x178
	.4byte	.LASF34
	.byte	0x10
	.byte	0x2
	.byte	0x35
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x2
	.byte	0x37
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii	"end\000"
	.byte	0x2
	.byte	0x38
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x2
	.byte	0x39
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x2
	.byte	0x3a
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x2
	.byte	0x3b
	.4byte	0x17f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x4
	.byte	0x7
	.uleb128 0xa
	.4byte	0x18e
	.4byte	0x11a
	.uleb128 0xb
	.4byte	0x18e
	.byte	0x0
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x4
	.byte	0x7
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x2
	.byte	0x3c
	.4byte	0x125
	.uleb128 0xc
	.4byte	0x1f4
	.4byte	.LASF42
	.2byte	0x1898
	.byte	0x2
	.byte	0x3e
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x2
	.byte	0x3f
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.ascii	"end\000"
	.byte	0x2
	.byte	0x40
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x2
	.byte	0x41
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x2
	.byte	0x42
	.4byte	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x2
	.byte	0x43
	.4byte	0x1f4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xa
	.4byte	0x205
	.4byte	0x11a
	.uleb128 0xd
	.4byte	0x18e
	.2byte	0x621
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x2
	.byte	0x44
	.4byte	0x1a0
	.uleb128 0xe
	.4byte	0x23e
	.4byte	.LASF43
	.4byte	0x31304
	.byte	0x2
	.byte	0x5e
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x2
	.byte	0x5f
	.4byte	0x23e
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x2
	.byte	0x62
	.4byte	0x178
	.byte	0x4
	.byte	0x23
	.uleb128 0x31300
	.byte	0x0
	.uleb128 0xa
	.4byte	0x24e
	.4byte	0x205
	.uleb128 0xf
	.4byte	0x18e
	.byte	0x1f
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x2
	.byte	0x63
	.4byte	0x210
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF47
	.byte	0x1
	.byte	0x8
	.uleb128 0x10
	.4byte	0x29a
	.byte	0x1
	.4byte	.LASF49
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x1
	.byte	0x4
	.4byte	0x29a
	.byte	0x1
	.byte	0x50
	.uleb128 0x11
	.4byte	.LASF38
	.byte	0x1
	.byte	0x4
	.4byte	0x178
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x195
	.uleb128 0x13
	.4byte	0x2db
	.byte	0x1
	.4byte	.LASF50
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.4byte	0x2db
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0xb
	.4byte	0x29a
	.4byte	.LLST0
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0xb
	.4byte	0x118
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x15
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x13
	.4byte	0x31b
	.byte	0x1
	.4byte	.LASF51
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x1a
	.4byte	0x29a
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0x1f
	.4byte	0x118
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x13
	.4byte	0x347
	.byte	0x1
	.4byte	.LASF52
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.4byte	0x2db
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x28
	.4byte	0x29a
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x13
	.4byte	0x39a
	.byte	0x1
	.4byte	.LASF53
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x2c
	.4byte	0x29a
	.4byte	.LLST4
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0x2c
	.4byte	0x118
	.4byte	.LLST5
	.uleb128 0x17
	.4byte	.LASF54
	.byte	0x1
	.byte	0x35
	.4byte	0x118
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0x1
	.byte	0x36
	.4byte	0x2db
	.byte	0x1
	.byte	0x57
	.byte	0x0
	.uleb128 0x10
	.4byte	0x3cb
	.byte	0x1
	.4byte	.LASF56
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x48
	.4byte	0x3cb
	.4byte	.LLST6
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x2db
	.byte	0x0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x24e
	.uleb128 0x13
	.4byte	0x3fd
	.byte	0x1
	.4byte	.LASF57
	.byte	0x1
	.byte	0x8a
	.byte	0x1
	.4byte	0x2db
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x1
	.byte	0x8a
	.4byte	0xf2
	.4byte	.LLST7
	.byte	0x0
	.uleb128 0x13
	.4byte	0x447
	.byte	0x1
	.4byte	.LASF59
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.4byte	0x2db
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x50
	.4byte	0x3cb
	.4byte	.LLST8
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0x50
	.4byte	0x118
	.4byte	.LLST9
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x1
	.byte	0x50
	.4byte	0xf2
	.4byte	.LLST10
	.byte	0x0
	.uleb128 0x13
	.4byte	0x499
	.byte	0x1
	.4byte	.LASF60
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x60
	.4byte	0x3cb
	.4byte	.LLST11
	.uleb128 0x19
	.ascii	"p\000"
	.byte	0x1
	.byte	0x60
	.4byte	0xf2
	.4byte	.LLST12
	.uleb128 0x19
	.ascii	"it\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x118
	.4byte	.LLST13
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.byte	0x61
	.4byte	0x118
	.byte	0x0
	.uleb128 0x13
	.4byte	0x510
	.byte	0x1
	.4byte	.LASF61
	.byte	0x1
	.byte	0x69
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x69
	.4byte	0x3cb
	.4byte	.LLST14
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.byte	0x69
	.4byte	0xf2
	.4byte	.LLST15
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x1
	.byte	0x69
	.4byte	0x510
	.4byte	.LLST16
	.uleb128 0x1a
	.4byte	.LASF45
	.byte	0x1
	.byte	0x6f
	.4byte	0x2db
	.4byte	.LLST17
	.uleb128 0x1a
	.4byte	.LASF58
	.byte	0x1
	.byte	0x74
	.4byte	0x2db
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.byte	0x82
	.4byte	0x118
	.4byte	.LLST19
	.byte	0x0
	.uleb128 0x12
	.byte	0x4
	.4byte	0xf2
	.uleb128 0x13
	.4byte	0x542
	.byte	0x1
	.4byte	.LASF64
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x5c
	.4byte	0x3cb
	.4byte	.LLST20
	.byte	0x0
	.uleb128 0x10
	.4byte	0x580
	.byte	0x1
	.4byte	.LASF65
	.byte	0x1
	.byte	0x92
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x92
	.4byte	0x3cb
	.4byte	.LLST21
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.byte	0x93
	.4byte	0x2db
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.4byte	.LASF66
	.byte	0x1
	.byte	0x94
	.4byte	0x2db
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF67
	.byte	0x2
	.byte	0xb
	.4byte	0x58c
	.sleb128 -1
	.uleb128 0x1d
	.4byte	0x2db
	.uleb128 0x16
	.4byte	.LASF68
	.byte	0x2
	.byte	0xc
	.4byte	0x58c
	.byte	0x5
	.byte	0x3
	.4byte	ERR_QUEUE_PRIORITY
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x128
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x5a3
	.4byte	0x267
	.ascii	"Queue_Initialize\000"
	.4byte	0x2a0
	.ascii	"Queue_PushEnd\000"
	.4byte	0x2e2
	.ascii	"Queue_PopStart\000"
	.4byte	0x31b
	.ascii	"Queue_CurrentCount\000"
	.4byte	0x347
	.ascii	"Queue_RemoveItem\000"
	.4byte	0x39a
	.ascii	"PriorityQueue_Initialize\000"
	.4byte	0x3d1
	.ascii	"Queue_IsValidPriority\000"
	.4byte	0x3fd
	.ascii	"PriorityQueue_Put\000"
	.4byte	0x447
	.ascii	"PriorityQueue_Remove\000"
	.4byte	0x499
	.ascii	"PriorityQueue_GetLower\000"
	.4byte	0x516
	.ascii	"PriorityQueue_Get\000"
	.4byte	0x542
	.ascii	"PriorityQueue_PrintItems\000"
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
.LASF34:
	.ascii	"Queue\000"
.LASF42:
	.ascii	"TaskQueue\000"
.LASF8:
	.ascii	"PRIORITY_8\000"
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
.LASF35:
	.ascii	"item\000"
.LASF26:
	.ascii	"PRIORITY_26\000"
.LASF27:
	.ascii	"PRIORITY_27\000"
.LASF28:
	.ascii	"PRIORITY_28\000"
.LASF29:
	.ascii	"PRIORITY_29\000"
.LASF49:
	.ascii	"Queue_Initialize\000"
.LASF55:
	.ascii	"item_index\000"
.LASF56:
	.ascii	"PriorityQueue_Initialize\000"
.LASF0:
	.ascii	"PRIORITY_0\000"
.LASF1:
	.ascii	"PRIORITY_1\000"
.LASF2:
	.ascii	"PRIORITY_2\000"
.LASF3:
	.ascii	"PRIORITY_3\000"
.LASF4:
	.ascii	"PRIORITY_4\000"
.LASF5:
	.ascii	"PRIORITY_5\000"
.LASF6:
	.ascii	"PRIORITY_6\000"
.LASF7:
	.ascii	"PRIORITY_7\000"
.LASF9:
	.ascii	"PRIORITY_9\000"
.LASF52:
	.ascii	"Queue_CurrentCount\000"
.LASF38:
	.ascii	"size\000"
.LASF71:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF65:
	.ascii	"PriorityQueue_PrintItems\000"
.LASF69:
	.ascii	"GNU C 4.0.2\000"
.LASF53:
	.ascii	"Queue_RemoveItem\000"
.LASF41:
	.ascii	"long unsigned int\000"
.LASF70:
	.ascii	"queue.c\000"
.LASF43:
	.ascii	"PriorityQueue\000"
.LASF37:
	.ascii	"current_count\000"
.LASF61:
	.ascii	"PriorityQueue_GetLower\000"
.LASF47:
	.ascii	"unsigned char\000"
.LASF59:
	.ascii	"PriorityQueue_Put\000"
.LASF68:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF33:
	.ascii	"QueueItem\000"
.LASF44:
	.ascii	"queues\000"
.LASF50:
	.ascii	"Queue_PushEnd\000"
.LASF62:
	.ascii	"min_priority\000"
.LASF57:
	.ascii	"Queue_IsValidPriority\000"
.LASF10:
	.ascii	"PRIORITY_10\000"
.LASF11:
	.ascii	"PRIORITY_11\000"
.LASF12:
	.ascii	"PRIORITY_12\000"
.LASF39:
	.ascii	"items\000"
.LASF40:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"PRIORITY_13\000"
.LASF16:
	.ascii	"PRIORITY_16\000"
.LASF30:
	.ascii	"PRIORITY_30\000"
.LASF31:
	.ascii	"PRIORITY_31\000"
.LASF15:
	.ascii	"PRIORITY_15\000"
.LASF14:
	.ascii	"PRIORITY_14\000"
.LASF67:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF18:
	.ascii	"PRIORITY_18\000"
.LASF25:
	.ascii	"PRIORITY_25\000"
.LASF19:
	.ascii	"PRIORITY_19\000"
.LASF17:
	.ascii	"PRIORITY_17\000"
.LASF58:
	.ascii	"priority\000"
.LASF48:
	.ascii	"queue\000"
.LASF54:
	.ascii	"buffer_start\000"
.LASF46:
	.ascii	"char\000"
.LASF51:
	.ascii	"Queue_PopStart\000"
.LASF36:
	.ascii	"start\000"
.LASF45:
	.ascii	"queues_with_items\000"
.LASF60:
	.ascii	"PriorityQueue_Remove\000"
.LASF63:
	.ascii	"next_min_priority\000"
.LASF64:
	.ascii	"PriorityQueue_Get\000"
.LASF32:
	.ascii	"QueuePriority\000"
.LASF66:
	.ascii	"has_item\000"
	.ident	"GCC: (GNU) 4.0.2"
