	.file	"message.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	KernelMessage_Initialize
	.type	KernelMessage_Initialize, %function
KernelMessage_Initialize:
.LFB2:
	.file 1 "message.c"
	.loc 1 7 0
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, lr}
.LCFI0:
	.loc 1 7 0
	mov	r4, r0
	.loc 1 8 0
	stmia	r0, {r1, r2}	@ phole stm
	.loc 1 10 0
	mov	r1, r3
.LVL1:
	mov	r2, #16
.LVL2:
	add	r0, r0, #8
.LVL3:
	bl	m_strcpy(PLT)
.LVL4:
	.loc 1 13 0
	ldr	r3, [sp, #16]
	.loc 1 11 0
	ldr	r2, [sp, #8]
	.loc 1 13 0
	str	r3, [r4, #32]
	.loc 1 12 0
	ldr	r3, [sp, #12]
	.loc 1 11 0
	str	r2, [r4, #24]
	.loc 1 12 0
	str	r3, [r4, #28]
	.loc 1 14 0
	ldmfd	sp!, {r4, pc}
.LFE2:
	.size	KernelMessage_Initialize, .-KernelMessage_Initialize
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
	.uleb128 0x8
	.byte	0x8e
	.uleb128 0x1
	.byte	0x84
	.uleb128 0x2
	.align	2
.LEFDE0:
	.file 2 "message.h"
	.file 3 "queue.h"
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
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x15e
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF10
	.byte	0x1
	.4byte	.LASF11
	.4byte	.LASF12
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	0x94
	.4byte	.LASF13
	.byte	0x24
	.byte	0x2
	.byte	0x34
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x2
	.byte	0x35
	.4byte	0x94
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x36
	.4byte	0x94
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.ascii	"msg\000"
	.byte	0x2
	.byte	0x37
	.4byte	0x9b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x38
	.4byte	0xb2
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x39
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3a
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x6
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x7
	.4byte	0xab
	.4byte	0xab
	.uleb128 0x8
	.4byte	0x2c
	.byte	0xf
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x8
	.uleb128 0x9
	.byte	0x4
	.4byte	0xab
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x2
	.byte	0x3c
	.4byte	0x33
	.uleb128 0xb
	.4byte	0x13e
	.byte	0x1
	.4byte	.LASF14
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xc
	.ascii	"km\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x13e
	.4byte	.LLST0
	.uleb128 0xd
	.4byte	.LASF2
	.byte	0x1
	.byte	0x5
	.4byte	0x94
	.4byte	.LLST1
	.uleb128 0xd
	.4byte	.LASF3
	.byte	0x1
	.byte	0x5
	.4byte	0x94
	.4byte	.LLST2
	.uleb128 0xc
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x5
	.4byte	0xb2
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF4
	.byte	0x1
	.byte	0x5
	.4byte	0xb2
	.byte	0x1
	.byte	0x52
	.uleb128 0xe
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6
	.4byte	0x25
	.byte	0x1
	.byte	0x53
	.uleb128 0xe
	.4byte	.LASF6
	.byte	0x1
	.byte	0x7
	.4byte	0x25
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xb8
	.uleb128 0xf
	.4byte	.LASF8
	.byte	0x3
	.byte	0xb
	.4byte	0x150
	.sleb128 -1
	.uleb128 0x10
	.4byte	0x94
	.uleb128 0xf
	.4byte	.LASF9
	.byte	0x3
	.byte	0xc
	.4byte	0x150
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xa
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
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x162
	.4byte	0xc3
	.ascii	"KernelMessage_Initialize\000"
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
.LASF10:
	.ascii	"GNU C 4.0.2\000"
.LASF9:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF5:
	.ascii	"origin_size\000"
.LASF14:
	.ascii	"KernelMessage_Initialize\000"
.LASF4:
	.ascii	"dest_buffer\000"
.LASF7:
	.ascii	"char\000"
.LASF11:
	.ascii	"message.c\000"
.LASF6:
	.ascii	"destination_size\000"
.LASF8:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF2:
	.ascii	"origin\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"destination\000"
.LASF12:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF13:
	.ascii	"KernelMessage\000"
.LASF0:
	.ascii	"unsigned int\000"
	.ident	"GCC: (GNU) 4.0.2"
