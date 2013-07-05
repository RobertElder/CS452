	.file	"random.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	RNG_Initialize
	.type	RNG_Initialize, %function
RNG_Initialize:
.LFB2:
	.file 1 "random.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 8 0
	add	r3, r1, r1, asl #4
	rsb	r3, r1, r3, asl #4
	rsb	r3, r1, r3, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #5
	rsb	r3, r1, r3, asl #4
	rsb	r3, r3, r3, asl #7
	add	r3, r3, r1
	bic	r3, r3, #-2147483648
	.loc 1 5 0
	ldr	r2, .L3
	.loc 1 8 0
	str	r3, [r0, #8]
	.loc 1 6 0
	ldr	r3, .L3+4
	.loc 1 5 0
	str	r2, [r0, #0]
	.loc 1 7 0
	mov	r2, #-2147483648
	.loc 1 4 0
	@ lr needed for prologue
	.loc 1 6 0
	str	r3, [r0, #4]
	.loc 1 7 0
	str	r2, [r0, #12]
	.loc 1 9 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1103515245
	.word	12345
.LFE2:
	.size	RNG_Initialize, .-RNG_Initialize
	.global	__umodsi3
	.align	2
	.global	RNG_Get
	.type	RNG_Get, %function
RNG_Get:
.LFB3:
	.loc 1 11 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	stmfd	sp!, {r4, lr}
.LCFI0:
	.loc 1 12 0
	ldmia	r0, {r2, r3, ip}	@ phole ldm
	.loc 1 11 0
	mov	r4, r0
	.loc 1 12 0
	ldr	r1, [r0, #12]
	mla	r0, ip, r2, r3
.LVL2:
	bl	__umodsi3(PLT)
	bic	r0, r0, #-1073741824
.LVL3:
	.loc 1 13 0
	str	r0, [r4, #8]
.LVL4:
	.loc 1 15 0
	ldmfd	sp!, {r4, pc}
.LFE3:
	.size	RNG_Get, .-RNG_Get
	.global	__floatsisf
	.global	__addsf3
	.global	__mulsf3
	.align	2
	.global	RNG_GetFloat
	.type	RNG_GetFloat, %function
RNG_GetFloat:
.LFB4:
	.loc 1 17 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	str	lr, [sp, #-4]!
.LCFI1:
	.loc 1 18 0
	bl	RNG_Get(PLT)
.LVL6:
	subs	r3, r0, #0
	and	r2, r3, #1
	blt	.L9
	bl	__floatsisf(PLT)
	mov	r1, #813694976
	bl	__mulsf3(PLT)
	.loc 1 19 0
	ldr	pc, [sp], #4
.L9:
	.loc 1 18 0
	orr	r0, r2, r3, lsr #1
	bl	__floatsisf(PLT)
	mov	r1, r0
	bl	__addsf3(PLT)
	mov	r1, #813694976
	bl	__mulsf3(PLT)
	.loc 1 19 0
	ldr	pc, [sp], #4
.LFE4:
	.size	RNG_GetFloat, .-RNG_GetFloat
	.global	__fixunssfsi
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"RNG_GetRange: returned an integer not in range (too"
	.ascii	" big)\000"
	.align	2
.LC1:
	.ascii	"RNG_GetRange: returned an integer not in range (too"
	.ascii	" small)\000"
	.text
	.align	2
	.global	RNG_GetRange
	.type	RNG_GetRange, %function
RNG_GetRange:
.LFB5:
	.loc 1 21 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL7:
	stmfd	sp!, {r4, r5, r6, sl, lr}
.LCFI2:
	ldr	sl, .L20
	mov	r6, r2
.L18:
	add	sl, pc, sl
	mov	r5, r1
	.loc 1 22 0
	bl	RNG_GetFloat(PLT)
.LVL8:
	.loc 1 22 0
	rsb	r3, r5, r6
	adds	r3, r3, #1
	mov	r4, r0
	and	r2, r3, #1
	mov	r0, r3
	bmi	.L14
	bl	__floatsisf(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	__mulsf3(PLT)
	cmp	r5, #0
	mov	r4, r0
	and	r3, r5, #1
	mov	r0, r5
	blt	.L16
.LVL9:
.L19:
	bl	__floatsisf(PLT)
.LVL10:
.L15:
	mov	r1, r0
	mov	r0, r4
	bl	__addsf3(PLT)
	bl	__fixunssfsi(PLT)
	.loc 1 24 0
	ldr	r1, .L20+4
	.loc 1 22 0
	mov	r4, r0
	.loc 1 24 0
	add	r1, sl, r1
	cmp	r6, r0
	movcc	r0, #0
	movcs	r0, #1
	bl	assert(PLT)
	.loc 1 25 0
	ldr	r1, .L20+8
	cmp	r5, r4
	movhi	r0, #0
	movls	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 28 0
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L14:
	.loc 1 22 0
	orr	r0, r2, r3, lsr #1
	bl	__floatsisf(PLT)
	mov	r1, r0
	bl	__addsf3(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	__mulsf3(PLT)
	cmp	r5, #0
	mov	r4, r0
	and	r3, r5, #1
	mov	r0, r5
	bge	.L19
.LVL11:
.L16:
	orr	r0, r3, r5, lsr #1
.LVL12:
	bl	__floatsisf(PLT)
	mov	r1, r0
	bl	__addsf3(PLT)
	b	.L15
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
.LFE5:
	.size	RNG_GetRange, .-RNG_GetRange
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
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
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
	.4byte	.LCFI1-.LFB4
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
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
	.byte	0x8a
	.uleb128 0x2
	.byte	0x86
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x5
	.align	2
.LEFDE6:
	.file 2 "random.h"
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
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x177
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.uleb128 0x2
	.4byte	0x62
	.ascii	"RNG\000"
	.byte	0x10
	.byte	0x2
	.byte	0x4
	.uleb128 0x3
	.ascii	"a\000"
	.byte	0x2
	.byte	0x5
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x3
	.ascii	"c\000"
	.byte	0x2
	.byte	0x6
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.ascii	"m\000"
	.byte	0x2
	.byte	0x8
	.4byte	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.ascii	"RNG\000"
	.byte	0x2
	.byte	0x9
	.4byte	0x25
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	0xb5
	.byte	0x1
	.4byte	.LASF4
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x7
	.ascii	"gen\000"
	.byte	0x1
	.byte	0x4
	.4byte	0xb5
	.byte	0x1
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.4byte	0x62
	.byte	0x1
	.byte	0x51
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x69
	.uleb128 0xa
	.4byte	0xf6
	.byte	0x1
	.4byte	.LASF5
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.4byte	0x62
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xb
	.ascii	"gen\000"
	.byte	0x1
	.byte	0xb
	.4byte	0xb5
	.4byte	.LLST0
	.uleb128 0xc
	.4byte	.LASF10
	.byte	0x1
	.byte	0xc
	.4byte	0x62
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0xa
	.4byte	0x122
	.byte	0x1
	.4byte	.LASF6
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.4byte	0x122
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xb
	.ascii	"gen\000"
	.byte	0x1
	.byte	0x11
	.4byte	0xb5
	.4byte	.LLST2
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x4
	.byte	0x4
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF15
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.4byte	0x62
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xb
	.ascii	"gen\000"
	.byte	0x1
	.byte	0x15
	.4byte	0xb5
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF8
	.byte	0x1
	.byte	0x15
	.4byte	0x62
	.4byte	.LLST4
	.uleb128 0xe
	.4byte	.LASF9
	.byte	0x1
	.byte	0x15
	.4byte	0x62
	.4byte	.LLST5
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x1
	.byte	0x16
	.4byte	0x62
	.byte	0x0
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
	.uleb128 0x8
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
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
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x4f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x17b
	.4byte	0x82
	.ascii	"RNG_Initialize\000"
	.4byte	0xbb
	.ascii	"RNG_Get\000"
	.4byte	0xf6
	.ascii	"RNG_GetFloat\000"
	.4byte	0x129
	.ascii	"RNG_GetRange\000"
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
.LASF8:
	.ascii	"lower\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"GNU C 4.0.2\000"
.LASF3:
	.ascii	"seed\000"
.LASF11:
	.ascii	"value\000"
.LASF15:
	.ascii	"RNG_GetRange\000"
.LASF13:
	.ascii	"random.c\000"
.LASF9:
	.ascii	"upper\000"
.LASF5:
	.ascii	"RNG_Get\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF1:
	.ascii	"char\000"
.LASF10:
	.ascii	"next_x\000"
.LASF4:
	.ascii	"RNG_Initialize\000"
.LASF7:
	.ascii	"float\000"
.LASF14:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF6:
	.ascii	"RNG_GetFloat\000"
	.ident	"GCC: (GNU) 4.0.2"
