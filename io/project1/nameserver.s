	.file	"nameserver.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	NameServer_PrintTable
	.type	NameServer_PrintTable, %function
NameServer_PrintTable:
.LFB6:
	.file 1 "nameserver.c"
	.loc 1 89 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	ldr	r2, .L8
	@ lr needed for prologue
	.loc 1 89 0
	mov	r3, #0
.LVL1:
.L2:
	.loc 1 92 0
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L2
	.loc 1 97 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	1571
.LFE6:
	.size	NameServer_PrintTable, .-NameServer_PrintTable
	.align	2
	.global	NameServer_Initialize
	.type	NameServer_Initialize, %function
NameServer_Initialize:
.LFB3:
	.loc 1 52 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL2:
	.loc 1 53 0
	ldr	r3, .L16
	.loc 1 52 0
	stmfd	sp!, {r4, r5, lr}
.LCFI0:
	.loc 1 53 0
	mov	r5, #0
	str	r5, [r0, r3]
	.loc 1 52 0
	mov	r4, r0
	.loc 1 54 0
	bl	MyTid(PLT)
.LVL3:
	add	r3, r4, #12544
	ldr	r2, .L16+4
	str	r0, [r4, #0]
	add	r3, r3, #60
.L11:
.LVL4:
	.loc 1 57 0
	add	r5, r5, #1
	.loc 1 58 0
	mov	r1, #0	@ movhi
	.loc 1 57 0
	cmp	r5, r2
	.loc 1 58 0
	strh	r1, [r3], #2	@ movhi
	.loc 1 57 0
	bne	.L11
	.loc 1 60 0
	ldmfd	sp!, {r4, r5, pc}
.L17:
	.align	2
.L16:
	.word	15748
	.word	1571
.LFE3:
	.size	NameServer_Initialize, .-NameServer_Initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"NameServer: name '%s' too long\000"
	.align	2
.LC1:
	.ascii	"Out of space for registered names in name server.\000"
	.text
	.align	2
	.global	NameServer_SetName
	.type	NameServer_SetName, %function
NameServer_SetName:
.LFB4:
	.loc 1 62 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI1:
	ldr	sl, .L24
	mov	r6, r0
.L23:
	add	sl, pc, sl
	.loc 1 63 0
	mov	r0, r2
.LVL6:
	.loc 1 62 0
	mov	r5, r1
	mov	r4, r2
	.loc 1 63 0
	bl	m_strlen(PLT)
.LVL7:
	.loc 1 63 0
	ldr	r1, .L24+4
	cmp	r0, #7
	movgt	r0, #0
	movle	r0, #1
	add	r1, sl, r1
	mov	r2, r4
	bl	assertf(PLT)
	.loc 1 65 0
	ldr	r3, .L24+8
	.loc 1 69 0
	ldr	r1, .L24+12
	.loc 1 65 0
	cmp	r5, r3
	.loc 1 69 0
	mov	r0, #0
	add	r1, sl, r1
	.loc 1 66 0
	add	ip, r6, #36
	mov	r2, #8
	.loc 1 65 0
	bhi	.L19
	.loc 1 66 0
	mla	r0, r5, r2, ip
	mov	r1, r4
	bl	m_strcpy(PLT)
	.loc 1 67 0
	ldr	r3, .L24+16
	add	r2, r6, r5, asl #1
	mov	r1, #1	@ movhi
	strh	r1, [r2, r3]	@ movhi
	.loc 1 71 0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L19:
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	.loc 1 69 0
	b	assert(PLT)
.L25:
	.align	2
.L24:
	.word	_GLOBAL_OFFSET_TABLE_-(.L23+8)
	.word	.LC0(GOTOFF)
	.word	1570
	.word	.LC1(GOTOFF)
	.word	12604
.LFE4:
	.size	NameServer_SetName, .-NameServer_SetName
	.align	2
	.global	NameServer_GetName
	.type	NameServer_GetName, %function
NameServer_GetName:
.LFB5:
	.loc 1 73 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL8:
	stmfd	sp!, {r4, r5, r6, r7, lr}
.LCFI2:
	.loc 1 73 0
	add	r4, r0, #12544
	mov	r7, r1
	add	r4, r4, #60
	add	r6, r0, #36
	mov	r5, #0
.LVL9:
	b	.L27
.LVL10:
.L28:
	.loc 1 76 0
	ldr	r3, .L36
	add	r5, r5, #1
	cmp	r5, r3
	beq	.L35
.LVL11:
.L27:
	.loc 1 77 0
	ldrsh	r3, [r4, #0]
	.loc 1 81 0
	add	r0, r6, r5, asl #3
.LVL12:
	.loc 1 77 0
	cmp	r3, #0
	.loc 1 81 0
	mov	r1, r7
	.loc 1 76 0
	add	r4, r4, #2
	.loc 1 77 0
	beq	.L28
.LVL13:
	.loc 1 81 0
	bl	m_strcmp(PLT)
.LVL14:
	cmp	r0, #0
	bne	.L28
.LVL15:
.L30:
	.loc 1 87 0
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L35:
	.loc 1 76 0
	mov	r5, #0
	b	.L30
.L37:
	.align	2
.L36:
	.word	1571
.LFE5:
	.size	NameServer_GetName, .-NameServer_GetName
	.section	.rodata
	.align	2
	.type	__func__.1899, %object
	.size	__func__.1899, 17
__func__.1899:
	.ascii	"NameServer_Start\000"
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"NameServerMessage size too big\000"
	.align	2
.LC3:
	.ascii	"Name server message type not found: %d\000"
	.text
	.align	2
	.global	NameServer_Start
	.type	NameServer_Start, %function
NameServer_Start:
.LFB2:
	.loc 1 7 0
	@ args = 0, pretend = 0, frame = 15756
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL16:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI3:
	ldr	sl, .L47
	.loc 1 8 0
	ldr	r3, .L47+4
	.loc 1 7 0
.L46:
	add	sl, pc, sl
	.loc 1 8 0
	ldr	r1, [sl, r3]
	ldr	r3, .L47+8
	.loc 1 7 0
	sub	sp, sp, #15744
.LCFI4:
.LVL17:
	sub	sp, sp, #12
.LCFI5:
.LVL18:
	.loc 1 8 0
	ldr	r0, [sl, r3]
	bl	DebugRegisterFunction(PLT)
	.loc 1 10 0
	mov	r0, sp
	bl	NameServer_Initialize(PLT)
	.loc 1 15 0
	ldr	r1, .L47+12
	mov	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 10 0
	add	r4, sp, #12
	sub	r4, r4, #12
	add	r7, sp, #15744
	ldr	r8, .L47+16
	add	r7, r7, #8
	add	r5, r4, #4
	add	r6, r4, #20
.LVL19:
.LVL20:
.L39:
	.loc 1 18 0
	mov	r1, r5
	mov	r2, #16
	mov	r0, r7
	bl	Receive(PLT)
	.loc 1 21 0
	ldr	r3, [r4, #4]
	.loc 1 31 0
	add	r1, r5, #4
	.loc 1 21 0
	cmp	r3, #2
	.loc 1 31 0
	mov	r0, r4
	.loc 1 21 0
	beq	.L42
	cmp	r3, #14
	beq	.L43
	cmp	r3, #0
	.loc 1 23 0
	add	r2, r5, #4
	.loc 1 42 0
	add	r1, sl, r8
	.loc 1 21 0
	bne	.L40
	.loc 1 23 0
	add	r3, sp, #12288
	ldr	r1, [r3, #3464]
	bl	NameServer_SetName(PLT)
	.loc 1 26 0
	add	r3, sp, #12288
	add	r1, r4, #20
.LVL21:
	mov	r2, #16
	ldr	r0, [r3, #3464]
	.loc 1 25 0
	mov	r3, #1
	str	r3, [r4, #20]
	.loc 1 26 0
	bl	Reply(PLT)
.LVL22:
	.loc 1 46 0
	bl	Pass(PLT)
	b	.L39
.L42:
	.loc 1 30 0
	mov	r3, #3
	str	r3, [r4, #20]
	.loc 1 31 0
	bl	NameServer_GetName(PLT)
	.loc 1 32 0
	add	r3, sp, #12288
	.loc 1 31 0
	str	r0, [r6, #12]
	.loc 1 32 0
	mov	r1, r6
	ldr	r0, [r3, #3464]
	mov	r2, #16
	bl	Reply(PLT)
	.loc 1 46 0
	bl	Pass(PLT)
	b	.L39
.L40:
	.loc 1 42 0
	mov	r2, r3
	mov	r0, #0
	bl	assertf(PLT)
	.loc 1 46 0
	bl	Pass(PLT)
	b	.L39
.L43:
	.loc 1 36 0
	mov	r3, #10
	str	r3, [r4, #20]
	.loc 1 37 0
	bl	NameServer_PrintTable(PLT)
	.loc 1 38 0
	add	r3, sp, #12288
	add	r1, r4, #20
.LVL23:
	mov	r2, #16
	ldr	r0, [r3, #3464]
	bl	Reply(PLT)
.LVL24:
	.loc 1 39 0
	bl	Exit(PLT)
	.loc 1 46 0
	bl	Pass(PLT)
	b	.L39
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
	.word	__func__.1899(GOT)
	.word	NameServer_Start(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
.LFE2:
	.size	NameServer_Start, .-NameServer_Start
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI2-.LFB5
	.byte	0xe
	.uleb128 0x14
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI3-.LFB2
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
	.uleb128 0x3d9c
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x3da8
	.align	2
.LEFDE8:
	.file 2 "nameserver.h"
	.file 3 "message.h"
	.file 4 "queue.h"
	.file 5 "train.h"
	.file 6 "public_kernel_interface.h"
	.file 7 "task_descriptor.h"
	.file 8 "buffer.h"
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
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0x7d
	.sleb128 -15756
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x573
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF90
	.byte	0x1
	.4byte	.LASF91
	.4byte	.LASF92
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
	.4byte	.LASF46
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
	.4byte	.LASF46
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
	.uleb128 0x7
	.4byte	0x169
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x1
	.byte	0x8
	.uleb128 0x7
	.4byte	0x188
	.4byte	0x188
	.uleb128 0xa
	.4byte	0x2c
	.2byte	0x622
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x2
	.byte	0x5
	.uleb128 0xb
	.4byte	0x1c6
	.4byte	.LASF47
	.byte	0x10
	.byte	0x2
	.byte	0xb
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x2
	.byte	0xc
	.4byte	0x12a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.ascii	"str\000"
	.byte	0x2
	.byte	0xd
	.4byte	0x159
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.ascii	"num\000"
	.byte	0x2
	.byte	0xe
	.4byte	0x135
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF47
	.byte	0x2
	.byte	0xf
	.4byte	0x18f
	.uleb128 0xe
	.4byte	0x235
	.4byte	.LASF48
	.2byte	0x3d88
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
	.uleb128 0xc
	.4byte	.LASF49
	.byte	0x2
	.byte	0x13
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.4byte	.LASF50
	.byte	0x2
	.byte	0x14
	.4byte	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x2
	.byte	0x15
	.4byte	0x235
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xc
	.4byte	.LASF52
	.byte	0x2
	.byte	0x16
	.4byte	0x177
	.byte	0x3
	.byte	0x23
	.uleb128 0x313c
	.uleb128 0xc
	.4byte	.LASF53
	.byte	0x2
	.byte	0x17
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x3d84
	.byte	0x0
	.uleb128 0x7
	.4byte	0x24c
	.4byte	0x14c
	.uleb128 0xa
	.4byte	0x2c
	.2byte	0x622
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x7
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x2
	.byte	0x18
	.4byte	0x1d1
	.uleb128 0xf
	.4byte	0x289
	.byte	0x1
	.4byte	.LASF54
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x10
	.ascii	"ns\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x289
	.byte	0x1
	.byte	0x50
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x135
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x24c
	.uleb128 0xf
	.4byte	0x2c1
	.byte	0x1
	.4byte	.LASF55
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.ascii	"ns\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x289
	.4byte	.LLST0
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0xf
	.4byte	0x306
	.byte	0x1
	.4byte	.LASF56
	.byte	0x1
	.byte	0x3e
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.ascii	"ns\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x289
	.4byte	.LLST1
	.uleb128 0x12
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x135
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x1
	.byte	0x3e
	.4byte	0x153
	.4byte	.LLST3
	.byte	0x0
	.uleb128 0x14
	.4byte	0x34d
	.byte	0x1
	.4byte	.LASF58
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x12
	.ascii	"ns\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x289
	.4byte	.LLST4
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x1
	.byte	0x49
	.4byte	0x153
	.4byte	.LLST5
	.uleb128 0x11
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x4a
	.4byte	0x135
	.byte	0x1
	.byte	0x55
	.byte	0x0
	.uleb128 0x15
	.4byte	0x3ad
	.byte	0x1
	.4byte	.LASF59
	.byte	0x1
	.byte	0x7
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST6
	.uleb128 0x16
	.4byte	.LASF60
	.4byte	0x3bd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	__func__.1899
	.uleb128 0x11
	.ascii	"ns\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x24c
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LASF61
	.byte	0x1
	.byte	0xb
	.4byte	0x135
	.byte	0x4
	.byte	0x7d
	.sleb128 15752
	.uleb128 0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0xc
	.4byte	0x3c2
	.uleb128 0x19
	.4byte	.LASF63
	.byte	0x1
	.byte	0xd
	.4byte	0x3c2
	.4byte	.LLST7
	.byte	0x0
	.uleb128 0x7
	.4byte	0x3bd
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x10
	.byte	0x0
	.uleb128 0x1a
	.4byte	0x3ad
	.uleb128 0x9
	.byte	0x4
	.4byte	0x1c6
	.uleb128 0x1b
	.4byte	.LASF64
	.byte	0x4
	.byte	0x9
	.4byte	0x3d4
	.sleb128 -1
	.uleb128 0x1a
	.4byte	0x135
	.uleb128 0x1b
	.4byte	.LASF65
	.byte	0x4
	.byte	0xa
	.4byte	0x3d4
	.sleb128 -2
	.uleb128 0x7
	.4byte	0x3f5
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF66
	.byte	0x5
	.byte	0xb
	.4byte	0x404
	.4byte	.LASF67
	.uleb128 0x1a
	.4byte	0x3e5
	.uleb128 0x7
	.4byte	0x419
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF68
	.byte	0x5
	.byte	0xc
	.4byte	0x428
	.4byte	.LASF69
	.uleb128 0x1a
	.4byte	0x409
	.uleb128 0x7
	.4byte	0x43d
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF70
	.byte	0x5
	.byte	0xd
	.4byte	0x44c
	.4byte	.LASF71
	.uleb128 0x1a
	.4byte	0x42d
	.uleb128 0x7
	.4byte	0x461
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x1c
	.4byte	.LASF72
	.byte	0x5
	.byte	0xe
	.4byte	0x470
	.4byte	.LASF73
	.uleb128 0x1a
	.4byte	0x451
	.uleb128 0x1d
	.4byte	.LASF74
	.byte	0x5
	.byte	0x10
	.4byte	0x3d4
	.byte	0x10
	.uleb128 0x7
	.4byte	0x497
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x5
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF75
	.byte	0x5
	.byte	0x6d
	.4byte	0x4a2
	.uleb128 0x1a
	.4byte	0x481
	.uleb128 0x1b
	.4byte	.LASF76
	.byte	0x6
	.byte	0x7
	.4byte	0x3d4
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF77
	.byte	0x6
	.byte	0x8
	.4byte	0x3d4
	.sleb128 -2
	.uleb128 0x1b
	.4byte	.LASF78
	.byte	0x6
	.byte	0x9
	.4byte	0x3d4
	.sleb128 -3
	.uleb128 0x1b
	.4byte	.LASF79
	.byte	0x6
	.byte	0xa
	.4byte	0x3d4
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF80
	.byte	0x6
	.byte	0xb
	.4byte	0x3d4
	.sleb128 -2
	.uleb128 0x1d
	.4byte	.LASF81
	.byte	0x6
	.byte	0xc
	.4byte	0x3d4
	.byte	0x3
	.uleb128 0x1b
	.4byte	.LASF82
	.byte	0x6
	.byte	0xd
	.4byte	0x3d4
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF83
	.byte	0x6
	.byte	0xe
	.4byte	0x3d4
	.sleb128 -2
	.uleb128 0x1b
	.4byte	.LASF84
	.byte	0x6
	.byte	0xf
	.4byte	0x3d4
	.sleb128 -3
	.uleb128 0x1b
	.4byte	.LASF85
	.byte	0x6
	.byte	0x10
	.4byte	0x3d4
	.sleb128 -4
	.uleb128 0x1e
	.4byte	.LASF86
	.byte	0x6
	.byte	0x11
	.4byte	0x533
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x1a
	.4byte	0x169
	.uleb128 0x7
	.4byte	0x54e
	.4byte	0x14c
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x8
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF87
	.byte	0x7
	.byte	0x27
	.4byte	0x559
	.uleb128 0x1a
	.4byte	0x538
	.uleb128 0x1b
	.4byte	.LASF88
	.byte	0x8
	.byte	0x5
	.4byte	0x3d4
	.sleb128 -1
	.uleb128 0x1b
	.4byte	.LASF89
	.byte	0x8
	.byte	0x6
	.4byte	0x3d4
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
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x10
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0x0
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
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x85
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x577
	.4byte	0x257
	.ascii	"NameServer_PrintTable\000"
	.4byte	0x28f
	.ascii	"NameServer_Initialize\000"
	.4byte	0x2c1
	.ascii	"NameServer_SetName\000"
	.4byte	0x306
	.ascii	"NameServer_GetName\000"
	.4byte	0x34d
	.ascii	"NameServer_Start\000"
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
.LASF44:
	.ascii	"short int\000"
.LASF43:
	.ascii	"unsigned char\000"
.LASF59:
	.ascii	"NameServer_Start\000"
.LASF56:
	.ascii	"NameServer_SetName\000"
.LASF79:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF88:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF61:
	.ascii	"sender_id\000"
.LASF27:
	.ascii	"MESSAGE_TYPE_SENSOR_DATA\000"
.LASF84:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF62:
	.ascii	"received_message\000"
.LASF77:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF19:
	.ascii	"MESSAGE_TYPE_TIME_REPLY\000"
.LASF13:
	.ascii	"MESSAGE_TYPE_NEG_ACK\000"
.LASF6:
	.ascii	"MESSAGE_TYPE_SIGN_UP\000"
.LASF63:
	.ascii	"outgoing_message\000"
.LASF64:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF50:
	.ascii	"reply_buffer\000"
.LASF49:
	.ascii	"receive_buffer\000"
.LASF25:
	.ascii	"MESSAGE_TYPE_PRINT\000"
.LASF30:
	.ascii	"MESSAGE_TYPE_QUERY_SENSOR\000"
.LASF8:
	.ascii	"MESSAGE_TYPE_PLAY\000"
.LASF23:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REPLY\000"
.LASF39:
	.ascii	"MESSAGE_TYPE_GET_SWITCH_REQUEST\000"
.LASF52:
	.ascii	"filled\000"
.LASF68:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF3:
	.ascii	"MESSAGE_TYPE_REGISTER_AS_OK\000"
.LASF42:
	.ascii	"double\000"
.LASF31:
	.ascii	"MESSAGE_TYPE_QUERY_SWITCH\000"
.LASF51:
	.ascii	"names\000"
.LASF85:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF38:
	.ascii	"MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST\000"
.LASF91:
	.ascii	"nameserver.c\000"
.LASF20:
	.ascii	"MESSAGE_TYPE_DELAY_REQUEST\000"
.LASF81:
	.ascii	"NAMESERVER_TID\000"
.LASF16:
	.ascii	"MESSAGE_TYPE_NAME_SERVER_SHUTDOWN\000"
.LASF71:
	.ascii	"TrSTmr\000"
.LASF48:
	.ascii	"NameServer\000"
.LASF35:
	.ascii	"MESSAGE_TYPE_SET_DESTINATION\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF36:
	.ascii	"MESSAGE_TYPE_QUERY_TRAIN_ENGINE\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF34:
	.ascii	"MESSAGE_TYPE_SET_TRAIN\000"
.LASF57:
	.ascii	"name\000"
.LASF33:
	.ascii	"MESSAGE_TYPE_SELECT_TRACK\000"
.LASF22:
	.ascii	"MESSAGE_TYPE_DELAY_UNTIL_REQUEST\000"
.LASF45:
	.ascii	"message_type\000"
.LASF74:
	.ascii	"LIGHTS_MASK\000"
.LASF15:
	.ascii	"MESSAGE_TYPE_WAIT\000"
.LASF65:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF75:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF54:
	.ascii	"NameServer_PrintTable\000"
.LASF10:
	.ascii	"MESSAGE_TYPE_QUIT\000"
.LASF24:
	.ascii	"MESSAGE_TYPE_HELLO\000"
.LASF86:
	.ascii	"TICK_SIZE\000"
.LASF66:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF28:
	.ascii	"MESSAGE_TYPE_SWITCH_DATA\000"
.LASF73:
	.ascii	"TrSwMr\000"
.LASF76:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF46:
	.ascii	"MessageType\000"
.LASF87:
	.ascii	"TASK_STATE_NAMES\000"
.LASF80:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF29:
	.ascii	"MESSAGE_TYPE_TRAIN_COMMAND\000"
.LASF47:
	.ascii	"NameServerMessage\000"
.LASF78:
	.ascii	"ERR_K_DEFAULT\000"
.LASF69:
	.ascii	"TCmSvr\000"
.LASF53:
	.ascii	"num_clients\000"
.LASF67:
	.ascii	"TrnSvr\000"
.LASF21:
	.ascii	"MESSAGE_TYPE_DELAY_REPLY\000"
.LASF89:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF60:
	.ascii	"__func__\000"
.LASF14:
	.ascii	"MESSAGE_TYPE_SHUTDOWN\000"
.LASF12:
	.ascii	"MESSAGE_TYPE_ACK\000"
.LASF37:
	.ascii	"MESSAGE_TYPE_UI_PRINT_MESSAGE\000"
.LASF41:
	.ascii	"char\000"
.LASF4:
	.ascii	"MESSAGE_TYPE_WHOIS\000"
.LASF92:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF40:
	.ascii	"MESSAGE_TYPE_SET_SWITCH\000"
.LASF83:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF55:
	.ascii	"NameServer_Initialize\000"
.LASF90:
	.ascii	"GNU C 4.0.2\000"
.LASF11:
	.ascii	"MESSAGE_TYPE_GOODBYE\000"
.LASF18:
	.ascii	"MESSAGE_TYPE_TIME_REQUEST\000"
.LASF7:
	.ascii	"MESSAGE_TYPE_SIGN_UP_OK\000"
.LASF32:
	.ascii	"MESSAGE_TYPE_BLOCK_UNTIL_SENSOR\000"
.LASF5:
	.ascii	"MESSAGE_TYPE_WHOIS_REPLY\000"
.LASF58:
	.ascii	"NameServer_GetName\000"
.LASF2:
	.ascii	"MESSAGE_TYPE_REGISTER_AS\000"
.LASF82:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF70:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF26:
	.ascii	"MESSAGE_TYPE_DATA\000"
.LASF9:
	.ascii	"MESSAGE_TYPE_RESULT\000"
.LASF72:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF17:
	.ascii	"MESSAGE_TYPE_NOTIFIER\000"
	.ident	"GCC: (GNU) 4.0.2"
