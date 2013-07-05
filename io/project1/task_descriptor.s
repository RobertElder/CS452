	.file	"task_descriptor.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	TD_Initialize
	.type	TD_Initialize, %function
TD_Initialize:
.LFB2:
	.file 1 "task_descriptor.c"
	.loc 1 7 0
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, lr}
.LCFI0:
	.loc 1 11 0
	str	r3, [r0, #68]
	.loc 1 12 0
	ldr	r3, [sp, #12]
.LVL1:
	.loc 1 7 0
	ldr	ip, [sp, #16]
	.loc 1 9 0
	mov	r5, #0
	.loc 1 12 0
	str	r3, [r0, #72]
	.loc 1 15 0
	mov	r3, #16
	.loc 1 7 0
	mov	r4, r0
	.loc 1 8 0
	str	r1, [r0, #0]
	.loc 1 10 0
	str	r2, [r0, #8]
	.loc 1 14 0
	str	ip, [r0, #80]
	.loc 1 15 0
	str	r3, [r0, #84]
	.loc 1 9 0
	str	r5, [r0, #4]
	.loc 1 13 0
	str	ip, [r0, #76]
	.loc 1 16 0
	str	r5, [r0, #88]
	.loc 1 17 0
	str	r5, [r0, #92]
	.loc 1 18 0
	str	r5, [r0, #108]
	.loc 1 19 0
	str	r5, [r0, #96]
	.loc 1 20 0
	str	r5, [r0, #104]
	.loc 1 21 0
	mov	r1, #10
.LVL2:
	add	r0, r0, #12
.LVL3:
	bl	Queue_Initialize(PLT)
.LVL4:
	.loc 1 26 0
	str	r5, [r4, #124]
	.loc 1 22 0
	str	r5, [r4, #116]
	.loc 1 23 0
	str	r5, [r4, #100]
	.loc 1 24 0
	str	r5, [r4, #112]
	.loc 1 25 0
	str	r5, [r4, #120]
	.loc 1 27 0
	ldmfd	sp!, {r4, r5, pc}
.LFE2:
	.size	TD_Initialize, .-TD_Initialize
	.align	2
	.global	is_tid_in_range
	.type	is_tid_in_range, %function
is_tid_in_range:
.LFB3:
	.loc 1 29 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL5:
	.loc 1 34 0
	ldr	r3, .L5
	.loc 1 29 0
	@ lr needed for prologue
	.loc 1 34 0
	cmp	r0, r3
	movhi	r0, #0
	movls	r0, #1
.LVL6:
	bx	lr
.L6:
	.align	2
.L5:
	.word	1571
.LFE3:
	.size	is_tid_in_range, .-is_tid_in_range
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
	.byte	0x85
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
	.align	2
.LEFDE2:
	.file 2 "task_descriptor.h"
	.file 3 "queue.h"
	.file 4 "public_kernel_interface.h"
	.file 5 "train.h"
	.file 6 "buffer.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x5bc
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF109
	.byte	0x1
	.4byte	.LASF110
	.4byte	.LASF111
	.uleb128 0x2
	.4byte	0xf2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x3
	.byte	0xc
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
	.byte	0x3
	.byte	0x2d
	.4byte	0x25
	.uleb128 0x5
	.4byte	0x118
	.4byte	.LASF33
	.byte	0x4
	.byte	0x3
	.byte	0x2f
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x3
	.byte	0x30
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x3
	.byte	0x31
	.4byte	0xfd
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x4
	.byte	0x7
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.4byte	0x186
	.4byte	.LASF36
	.byte	0x38
	.byte	0x3
	.byte	0x44
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x3
	.byte	0x45
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.ascii	"end\000"
	.byte	0x3
	.byte	0x46
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x3
	.byte	0x47
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x3
	.byte	0x48
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x3
	.byte	0x49
	.4byte	0x186
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xa
	.4byte	0x196
	.4byte	0x11a
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x9
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x3
	.byte	0x4a
	.4byte	0x133
	.uleb128 0xc
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x8
	.4byte	.LASF42
	.byte	0x1
	.byte	0x8
	.uleb128 0xd
	.byte	0x4
	.4byte	0x1a8
	.uleb128 0x8
	.4byte	.LASF43
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.4byte	0x1f3
	.4byte	.LASF44
	.byte	0x4
	.byte	0x4
	.byte	0x13
	.uleb128 0x3
	.4byte	.LASF45
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF46
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF47
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF48
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF49
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF50
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF51
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF44
	.byte	0x4
	.byte	0x1b
	.4byte	0x1bc
	.uleb128 0x2
	.4byte	0x235
	.4byte	.LASF52
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.uleb128 0x3
	.4byte	.LASF53
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF54
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF55
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF56
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF57
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF58
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF59
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF52
	.byte	0x2
	.byte	0xf
	.4byte	0x1fe
	.uleb128 0x5
	.4byte	0x356
	.4byte	.LASF60
	.byte	0x80
	.byte	0x2
	.byte	0x11
	.uleb128 0x9
	.ascii	"id\000"
	.byte	0x2
	.byte	0x12
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF61
	.byte	0x2
	.byte	0x13
	.4byte	0x235
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0x2
	.byte	0x14
	.4byte	0xf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0x2
	.byte	0x15
	.4byte	0x196
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0x2
	.byte	0x16
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x2
	.byte	0x17
	.4byte	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x2
	.byte	0x18
	.4byte	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x2
	.byte	0x19
	.4byte	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x2
	.byte	0x1a
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x2
	.byte	0x1b
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x2
	.byte	0x1c
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x2
	.byte	0x1d
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x2
	.byte	0x1e
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x2
	.byte	0x1f
	.4byte	0x1af
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x2
	.byte	0x20
	.4byte	0x356
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x2
	.byte	0x21
	.4byte	0x1a1
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x2
	.byte	0x22
	.4byte	0x1f3
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x2
	.byte	0x23
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x2
	.byte	0x24
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x1a1
	.uleb128 0xe
	.ascii	"TD\000"
	.byte	0x2
	.byte	0x25
	.4byte	0x240
	.uleb128 0x8
	.4byte	.LASF79
	.byte	0x1
	.byte	0x8
	.uleb128 0xd
	.byte	0x4
	.4byte	0x35c
	.uleb128 0x8
	.4byte	.LASF80
	.byte	0x2
	.byte	0x5
	.uleb128 0xf
	.4byte	0x3e5
	.byte	0x1
	.4byte	.LASF81
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x10
	.ascii	"td\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x36d
	.4byte	.LLST0
	.uleb128 0x10
	.ascii	"id\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x1a1
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x1
	.byte	0x7
	.4byte	0xf2
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.byte	0x7
	.4byte	0x1a1
	.4byte	.LLST3
	.uleb128 0x12
	.ascii	"sp\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x118
	.byte	0x1
	.byte	0x53
	.uleb128 0x12
	.ascii	"lr\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x118
	.byte	0x1
	.byte	0x5c
	.byte	0x0
	.uleb128 0x13
	.4byte	0x411
	.byte	0x1
	.4byte	.LASF82
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.4byte	0x1a1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x10
	.ascii	"tid\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x1a1
	.4byte	.LLST4
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0x3
	.byte	0x9
	.4byte	0x41d
	.sleb128 -1
	.uleb128 0x15
	.4byte	0x1a1
	.uleb128 0x14
	.4byte	.LASF84
	.byte	0x3
	.byte	0xa
	.4byte	0x41d
	.sleb128 -2
	.uleb128 0xa
	.4byte	0x43e
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x16
	.4byte	.LASF85
	.byte	0x5
	.byte	0xb
	.4byte	0x44d
	.4byte	.LASF86
	.uleb128 0x15
	.4byte	0x42e
	.uleb128 0xa
	.4byte	0x462
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x16
	.4byte	.LASF87
	.byte	0x5
	.byte	0xc
	.4byte	0x471
	.4byte	.LASF88
	.uleb128 0x15
	.4byte	0x452
	.uleb128 0xa
	.4byte	0x486
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x16
	.4byte	.LASF89
	.byte	0x5
	.byte	0xd
	.4byte	0x495
	.4byte	.LASF90
	.uleb128 0x15
	.4byte	0x476
	.uleb128 0xa
	.4byte	0x4aa
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x16
	.4byte	.LASF91
	.byte	0x5
	.byte	0xe
	.4byte	0x4b9
	.4byte	.LASF92
	.uleb128 0x15
	.4byte	0x49a
	.uleb128 0x17
	.4byte	.LASF93
	.byte	0x5
	.byte	0x10
	.4byte	0x41d
	.byte	0x10
	.uleb128 0xa
	.4byte	0x4e0
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x5
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF94
	.byte	0x5
	.byte	0x6d
	.4byte	0x4eb
	.uleb128 0x15
	.4byte	0x4ca
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0x4
	.byte	0x7
	.4byte	0x41d
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x4
	.byte	0x8
	.4byte	0x41d
	.sleb128 -2
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x4
	.byte	0x9
	.4byte	0x41d
	.sleb128 -3
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0x4
	.byte	0xa
	.4byte	0x41d
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x4
	.byte	0xb
	.4byte	0x41d
	.sleb128 -2
	.uleb128 0x17
	.4byte	.LASF100
	.byte	0x4
	.byte	0xc
	.4byte	0x41d
	.byte	0x3
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x4
	.byte	0xd
	.4byte	0x41d
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0x4
	.byte	0xe
	.4byte	0x41d
	.sleb128 -2
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0x4
	.byte	0xf
	.4byte	0x41d
	.sleb128 -3
	.uleb128 0x14
	.4byte	.LASF104
	.byte	0x4
	.byte	0x10
	.4byte	0x41d
	.sleb128 -4
	.uleb128 0x19
	.4byte	.LASF105
	.byte	0x4
	.byte	0x11
	.4byte	0x57c
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x15
	.4byte	0x1b5
	.uleb128 0xa
	.4byte	0x597
	.4byte	0x1a8
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x6
	.uleb128 0xb
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x18
	.4byte	.LASF106
	.byte	0x2
	.byte	0x27
	.4byte	0x5a2
	.uleb128 0x15
	.4byte	0x581
	.uleb128 0x14
	.4byte	.LASF107
	.byte	0x6
	.byte	0x5
	.4byte	0x41d
	.sleb128 -1
	.uleb128 0x14
	.4byte	.LASF108
	.byte	0x6
	.byte	0x6
	.4byte	0x41d
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
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
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
	.uleb128 0x26
	.byte	0x0
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
	.uleb128 0x1c
	.uleb128 0xe
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
	.uleb128 0xb
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x5c0
	.4byte	0x37a
	.ascii	"TD_Initialize\000"
	.4byte	0x3e5
	.ascii	"is_tid_in_range\000"
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
.LASF80:
	.ascii	"short int\000"
.LASF79:
	.ascii	"unsigned char\000"
.LASF47:
	.ascii	"UART1_RX_EVENT\000"
.LASF49:
	.ascii	"UART2_RX_EVENT\000"
.LASF33:
	.ascii	"QueueItem\000"
.LASF70:
	.ascii	"entry_mode\000"
.LASF107:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF50:
	.ascii	"UART2_TX_EVENT\000"
.LASF96:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF46:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF83:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF55:
	.ascii	"ZOMBIE\000"
.LASF78:
	.ascii	"scheduled_counter\000"
.LASF54:
	.ascii	"ACTIVE\000"
.LASF76:
	.ascii	"event_id\000"
.LASF61:
	.ascii	"state\000"
.LASF98:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF66:
	.ascii	"link_register\000"
.LASF45:
	.ascii	"NULL_EVENT\000"
.LASF87:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF75:
	.ascii	"send_to_tid\000"
.LASF43:
	.ascii	"double\000"
.LASF44:
	.ascii	"EventID\000"
.LASF104:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF58:
	.ascii	"REPLY_BLOCKED\000"
.LASF90:
	.ascii	"TrSTmr\000"
.LASF101:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF52:
	.ascii	"TaskState\000"
.LASF34:
	.ascii	"unsigned int\000"
.LASF81:
	.ascii	"TD_Initialize\000"
.LASF6:
	.ascii	"PRIORITY_6\000"
.LASF60:
	.ascii	"TaskDescriptor\000"
.LASF7:
	.ascii	"PRIORITY_7\000"
.LASF35:
	.ascii	"long unsigned int\000"
.LASF77:
	.ascii	"schedule_timestamp\000"
.LASF56:
	.ascii	"SEND_BLOCKED\000"
.LASF72:
	.ascii	"reply_len\000"
.LASF40:
	.ascii	"size\000"
.LASF73:
	.ascii	"reply_msg\000"
.LASF48:
	.ascii	"UART1_TX_EVENT\000"
.LASF62:
	.ascii	"priority\000"
.LASF93:
	.ascii	"LIGHTS_MASK\000"
.LASF32:
	.ascii	"QueuePriority\000"
.LASF37:
	.ascii	"item\000"
.LASF84:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF94:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF63:
	.ascii	"messages\000"
.LASF91:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF105:
	.ascii	"TICK_SIZE\000"
.LASF11:
	.ascii	"PRIORITY_11\000"
.LASF12:
	.ascii	"PRIORITY_12\000"
.LASF13:
	.ascii	"PRIORITY_13\000"
.LASF15:
	.ascii	"PRIORITY_15\000"
.LASF16:
	.ascii	"PRIORITY_16\000"
.LASF18:
	.ascii	"PRIORITY_18\000"
.LASF19:
	.ascii	"PRIORITY_19\000"
.LASF85:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF92:
	.ascii	"TrSwMr\000"
.LASF82:
	.ascii	"is_tid_in_range\000"
.LASF95:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF106:
	.ascii	"TASK_STATE_NAMES\000"
.LASF99:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF39:
	.ascii	"current_count\000"
.LASF97:
	.ascii	"ERR_K_DEFAULT\000"
.LASF67:
	.ascii	"entry_point\000"
.LASF88:
	.ascii	"TCmSvr\000"
.LASF103:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF86:
	.ascii	"TrnSvr\000"
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
.LASF25:
	.ascii	"PRIORITY_25\000"
.LASF26:
	.ascii	"PRIORITY_26\000"
.LASF27:
	.ascii	"PRIORITY_27\000"
.LASF28:
	.ascii	"PRIORITY_28\000"
.LASF29:
	.ascii	"PRIORITY_29\000"
.LASF64:
	.ascii	"parent_id\000"
.LASF108:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF74:
	.ascii	"origin_tid\000"
.LASF65:
	.ascii	"stack_pointer\000"
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
.LASF8:
	.ascii	"PRIORITY_8\000"
.LASF9:
	.ascii	"PRIORITY_9\000"
.LASF42:
	.ascii	"char\000"
.LASF111:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF30:
	.ascii	"PRIORITY_30\000"
.LASF31:
	.ascii	"PRIORITY_31\000"
.LASF10:
	.ascii	"PRIORITY_10\000"
.LASF14:
	.ascii	"PRIORITY_14\000"
.LASF102:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF17:
	.ascii	"PRIORITY_17\000"
.LASF53:
	.ascii	"READY\000"
.LASF109:
	.ascii	"GNU C 4.0.2\000"
.LASF71:
	.ascii	"receive_msg\000"
.LASF69:
	.ascii	"return_value\000"
.LASF57:
	.ascii	"RECEIVE_BLOCKED\000"
.LASF36:
	.ascii	"MessageQueue\000"
.LASF51:
	.ascii	"NUM_EVENTS\000"
.LASF110:
	.ascii	"task_descriptor.c\000"
.LASF89:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF100:
	.ascii	"NAMESERVER_TID\000"
.LASF38:
	.ascii	"start\000"
.LASF41:
	.ascii	"items\000"
.LASF59:
	.ascii	"EVENT_BLOCKED\000"
.LASF68:
	.ascii	"spsr_register\000"
	.ident	"GCC: (GNU) 4.0.2"
