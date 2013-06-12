	.file	"uart.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.align	2
	.global	UART_Initialize
	.type	UART_Initialize, %function
UART_Initialize:
.LFB2:
	.file 1 "uart.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
.LCFI0:
	stmfd	sp!, {fp, ip, lr, pc}
.LCFI1:
	sub	fp, ip, #4
.LCFI2:
	sub	sp, sp, #4
.LCFI3:
	str	r0, [fp, #-16]
	.loc 1 5 0
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #0]
	.loc 1 6 0
	ldr	r2, [fp, #-16]
	ldr	r3, .L3
	str	r3, [r2, #4]
	.loc 1 7 0
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	robsetspeed(PLT)
	.loc 1 8 0
	ldmfd	sp, {r3, fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	115200
.LFE2:
	.size	UART_Initialize, .-UART_Initialize
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
	.byte	0xd
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x8e
	.uleb128 0x2
	.byte	0x8d
	.uleb128 0x3
	.byte	0x8b
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xc
	.uleb128 0xb
	.uleb128 0x4
	.align	2
.LEFDE0:
	.file 2 "uart.h"
	.file 3 "robio.h"
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x212
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.ascii	"GNU C 4.0.2\000"
	.byte	0x1
	.ascii	"uart.c\000"
	.ascii	"/u4/chfoo/cs452_work/CS452.git-2/io/kernel4\000"
	.uleb128 0x2
	.ascii	"char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.4byte	0x15d
	.4byte	.LASF0
	.byte	0x28
	.byte	0x3
	.byte	0x15
	.uleb128 0x4
	.ascii	"channel\000"
	.byte	0x3
	.byte	0x16
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.ascii	"speed\000"
	.byte	0x3
	.byte	0x17
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.ascii	"out_buffer_start\000"
	.byte	0x3
	.byte	0x19
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.ascii	"out_buffer_end\000"
	.byte	0x3
	.byte	0x1b
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x4
	.ascii	"in_buffer_start\000"
	.byte	0x3
	.byte	0x1c
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x4
	.ascii	"in_buffer_end\000"
	.byte	0x3
	.byte	0x1d
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x4
	.ascii	"output_buffer_size\000"
	.byte	0x3
	.byte	0x1e
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x4
	.ascii	"input_buffer_size\000"
	.byte	0x3
	.byte	0x1f
	.4byte	0x15d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x4
	.ascii	"output_buffer\000"
	.byte	0x3
	.byte	0x20
	.4byte	0x16d
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x4
	.ascii	"input_buffer\000"
	.byte	0x3
	.byte	0x21
	.4byte	0x16d
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x2
	.ascii	"unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.byte	0x4
	.4byte	0x173
	.uleb128 0x2
	.ascii	"unsigned char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF0
	.byte	0x3
	.byte	0x22
	.4byte	0x60
	.uleb128 0x7
	.4byte	0x1d0
	.ascii	"UART\000"
	.byte	0x50
	.byte	0x2
	.byte	0x6
	.uleb128 0x4
	.ascii	"terminal_channel\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x184
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x4
	.ascii	"train_channel\000"
	.byte	0x2
	.byte	0x8
	.4byte	0x184
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x8
	.ascii	"UART\000"
	.byte	0x2
	.byte	0x9
	.4byte	0x18f
	.uleb128 0x9
	.4byte	0x20f
	.byte	0x1
	.ascii	"UART_Initialize\000"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x5b
	.uleb128 0xa
	.ascii	"uart\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x20f
	.byte	0x2
	.byte	0x7b
	.sleb128 -16
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x1d0
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
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
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
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x22
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x216
	.4byte	0x1dc
	.ascii	"UART_Initialize\000"
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
	.section	.debug_str,"",%progbits
.LASF0:
	.ascii	"ChannelDescription\000"
	.ident	"GCC: (GNU) 4.0.2"
