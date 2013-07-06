	.file	"buffer.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	RingBufferIndex_Initialize
	.type	RingBufferIndex_Initialize, %function
RingBufferIndex_Initialize:
.LFB2:
	.file 1 "buffer.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 5 0
	mov	r3, #0
	.loc 1 4 0
	@ lr needed for prologue
	.loc 1 7 0
	str	r1, [r0, #8]
	.loc 1 6 0
	str	r3, [r0, #4]
	.loc 1 5 0
	str	r3, [r0, #0]
	.loc 1 8 0
	bx	lr
.LFE2:
	.size	RingBufferIndex_Initialize, .-RingBufferIndex_Initialize
	.global	__umodsi3
	.align	2
	.global	RingBufferIndex_Put
	.type	RingBufferIndex_Put, %function
RingBufferIndex_Put:
.LFB3:
	.loc 1 10 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	stmfd	sp!, {r4, r5, lr}
.LCFI0:
	.loc 1 11 0
	ldr	r5, [r0, #4]
	.loc 1 10 0
	mov	r4, r0
	.loc 1 11 0
	ldr	r1, [r0, #8]
	add	r0, r5, #1
.LVL2:
	bl	__umodsi3(PLT)
	ldr	r3, [r4, #0]
	mvn	r2, #0
.LVL3:
	cmp	r0, r3
	.loc 1 14 0
	movne	r2, r5
	.loc 1 16 0
	strne	r0, [r4, #4]
	.loc 1 19 0
	mov	r0, r2
	ldmfd	sp!, {r4, r5, pc}
.LFE3:
	.size	RingBufferIndex_Put, .-RingBufferIndex_Put
	.align	2
	.global	RingBufferIndex_Get
	.type	RingBufferIndex_Get, %function
RingBufferIndex_Get:
.LFB4:
	.loc 1 22 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL4:
	stmfd	sp!, {r4, r5, lr}
.LCFI1:
	.loc 1 23 0
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	.loc 1 22 0
	mov	r4, r0
	.loc 1 23 0
	cmp	r3, r2
	.loc 1 27 0
	mov	r5, r3
.LVL5:
	.loc 1 28 0
	add	r0, r3, #1
.LVL6:
	.loc 1 23 0
	mvneq	r5, #1
	beq	.L11
	.loc 1 28 0
	ldr	r1, [r4, #8]
	bl	__umodsi3(PLT)
	str	r0, [r4, #0]
.LVL7:
.L11:
	.loc 1 30 0
	mov	r0, r5
	ldmfd	sp!, {r4, r5, pc}
.LFE4:
	.size	RingBufferIndex_Get, .-RingBufferIndex_Get
	.align	2
	.global	CharBuffer_Initialize
	.type	CharBuffer_Initialize, %function
CharBuffer_Initialize:
.LFB5:
	.loc 1 32 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL8:
	.loc 1 33 0
	add	r0, r0, #100
.LVL9:
	mov	r1, #100
	.loc 1 32 0
	@ lr needed for prologue
	.loc 1 34 0
	.loc 1 33 0
	b	RingBufferIndex_Initialize(PLT)
.LFE5:
	.size	CharBuffer_Initialize, .-CharBuffer_Initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"CharBuffer_PutChar: buffer is full\000"
	.text
	.align	2
	.global	CharBuffer_PutChar
	.type	CharBuffer_PutChar, %function
CharBuffer_PutChar:
.LFB6:
	.loc 1 36 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL10:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI2:
	ldr	sl, .L23
	mov	r5, r0
.L21:
	add	sl, pc, sl
	.loc 1 37 0
	add	r0, r0, #100
.LVL11:
	.loc 1 36 0
	and	r6, r1, #255
	.loc 1 37 0
	bl	RingBufferIndex_Put(PLT)
.LVL12:
	.loc 1 37 0
	mov	r4, r0
.LVL13:
	.loc 1 40 0
	ldr	r1, .L23+4
	.loc 1 39 0
	cmn	r4, #1
	.loc 1 40 0
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 39 0
	beq	.L22
	.loc 1 44 0
	mov	r0, #0
	strb	r6, [r5, r4]
	.loc 1 47 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L22:
	.loc 1 40 0
	bl	assert(PLT)
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	.LC0(GOTOFF)
.LFE6:
	.size	CharBuffer_PutChar, .-CharBuffer_PutChar
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"CharBuffer_GetChar: empty!\000"
	.text
	.align	2
	.global	CharBuffer_GetChar
	.type	CharBuffer_GetChar, %function
CharBuffer_GetChar:
.LFB7:
	.loc 1 49 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
	stmfd	sp!, {r4, sl, lr}
.LCFI3:
	ldr	sl, .L31
	mov	r4, r0
.L30:
	add	sl, pc, sl
	.loc 1 50 0
	add	r0, r0, #100
.LVL15:
	bl	RingBufferIndex_Get(PLT)
	.loc 1 50 0
	mov	r3, r0
.LVL16:
	.loc 1 53 0
	ldr	r1, .L31+4
	.loc 1 52 0
	cmn	r3, #2
	.loc 1 53 0
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 52 0
	bne	.L26
	.loc 1 53 0
	bl	assert(PLT)
.LVL17:
	mov	r0, #254
	ldmfd	sp!, {r4, sl, pc}
.LVL18:
.L26:
	.loc 1 57 0
	ldrb	r0, [r4, r3]	@ zero_extendqisi2
	.loc 1 58 0
	ldmfd	sp!, {r4, sl, pc}
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	.LC1(GOTOFF)
.LFE7:
	.size	CharBuffer_GetChar, .-CharBuffer_GetChar
	.align	2
	.global	CharBuffer_IsEmpty
	.type	CharBuffer_IsEmpty, %function
CharBuffer_IsEmpty:
.LFB8:
	.loc 1 60 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL19:
	ldr	r3, [r0, #104]
	ldr	r0, [r0, #100]
.LVL20:
	@ lr needed for prologue
	.loc 1 62 0
	cmp	r0, r3
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.LFE8:
	.size	CharBuffer_IsEmpty, .-CharBuffer_IsEmpty
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
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	2
.LEFDE12:
	.file 2 "buffer.h"
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
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x275
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF22
	.byte	0x1
	.4byte	.LASF23
	.4byte	.LASF24
	.uleb128 0x2
	.4byte	0x5c
	.4byte	.LASF2
	.byte	0xc
	.byte	0x2
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x9
	.4byte	0x5c
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.ascii	"end\000"
	.byte	0x2
	.byte	0xa
	.4byte	0x5c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0xb
	.4byte	0x5c
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0xc
	.4byte	0x25
	.uleb128 0x2
	.4byte	0x97
	.4byte	.LASF3
	.byte	0x70
	.byte	0x2
	.byte	0xe
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0xf
	.4byte	0x97
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x10
	.4byte	0x63
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.byte	0x0
	.uleb128 0x7
	.4byte	0xa7
	.4byte	0xae
	.uleb128 0x8
	.4byte	0xa7
	.byte	0x63
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x2
	.byte	0x11
	.4byte	0x6e
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.4byte	0xfa
	.byte	0x1
	.4byte	.LASF10
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.ascii	"rbi\000"
	.byte	0x1
	.byte	0x4
	.4byte	0xfa
	.byte	0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x1
	.byte	0x4
	.4byte	0x5c
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x63
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1
	.4byte	.LASF11
	.byte	0x1
	.byte	0xa
	.byte	0x1
	.4byte	0x139
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.ascii	"rbi\000"
	.byte	0x1
	.byte	0xa
	.4byte	0xfa
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0xe
	.4byte	0x139
	.byte	0x1
	.byte	0x52
	.byte	0x0
	.uleb128 0x10
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0xd
	.4byte	0x179
	.byte	0x1
	.4byte	.LASF12
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.4byte	0x139
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.ascii	"rbi\000"
	.byte	0x1
	.byte	0x16
	.4byte	0xfa
	.4byte	.LLST1
	.uleb128 0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1b
	.4byte	0x139
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x9
	.4byte	0x1a1
	.byte	0x1
	.4byte	.LASF14
	.byte	0x1
	.byte	0x20
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x20
	.4byte	0x1a1
	.4byte	.LLST2
	.byte	0x0
	.uleb128 0xc
	.byte	0x4
	.4byte	0xb5
	.uleb128 0xd
	.4byte	0x1ed
	.byte	0x1
	.4byte	.LASF16
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.4byte	0x139
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x24
	.4byte	0x1a1
	.4byte	.LLST3
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0x24
	.4byte	0xc0
	.4byte	.LLST4
	.uleb128 0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x25
	.4byte	0x139
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0xd
	.4byte	0x228
	.byte	0x1
	.4byte	.LASF17
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.4byte	0xae
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x31
	.4byte	0x1a1
	.4byte	.LLST5
	.uleb128 0x12
	.4byte	.LASF13
	.byte	0x1
	.byte	0x32
	.4byte	0x139
	.4byte	.LLST6
	.byte	0x0
	.uleb128 0xd
	.4byte	0x254
	.byte	0x1
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3c
	.byte	0x1
	.4byte	0x254
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3c
	.4byte	0x1a1
	.4byte	.LLST7
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x2
	.byte	0x5
	.uleb128 0x13
	.4byte	.LASF20
	.byte	0x2
	.byte	0x5
	.4byte	0x267
	.sleb128 -1
	.uleb128 0x14
	.4byte	0x139
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x2
	.byte	0x6
	.4byte	0x267
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
	.uleb128 0xa
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xbc
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x279
	.4byte	0xc7
	.ascii	"RingBufferIndex_Initialize\000"
	.4byte	0x100
	.ascii	"RingBufferIndex_Put\000"
	.4byte	0x140
	.ascii	"RingBufferIndex_Get\000"
	.4byte	0x179
	.ascii	"CharBuffer_Initialize\000"
	.4byte	0x1a7
	.ascii	"CharBuffer_PutChar\000"
	.4byte	0x1ed
	.ascii	"CharBuffer_GetChar\000"
	.4byte	0x228
	.ascii	"CharBuffer_IsEmpty\000"
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
.LASF16:
	.ascii	"CharBuffer_PutChar\000"
.LASF1:
	.ascii	"size\000"
.LASF22:
	.ascii	"GNU C 4.0.2\000"
.LASF15:
	.ascii	"buffer\000"
.LASF14:
	.ascii	"CharBuffer_Initialize\000"
.LASF10:
	.ascii	"RingBufferIndex_Initialize\000"
.LASF17:
	.ascii	"CharBuffer_GetChar\000"
.LASF13:
	.ascii	"index\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF18:
	.ascii	"CharBuffer_IsEmpty\000"
.LASF5:
	.ascii	"buffer_index\000"
.LASF21:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF3:
	.ascii	"CharBuffer\000"
.LASF11:
	.ascii	"RingBufferIndex_Put\000"
.LASF8:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"char\000"
.LASF23:
	.ascii	"buffer.c\000"
.LASF19:
	.ascii	"short int\000"
.LASF4:
	.ascii	"array\000"
.LASF0:
	.ascii	"start\000"
.LASF24:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF20:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF2:
	.ascii	"RingBufferIndex\000"
.LASF12:
	.ascii	"RingBufferIndex_Get\000"
	.ident	"GCC: (GNU) 4.0.2"
