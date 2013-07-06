	.file	"test_uart.c"
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
	.ascii	"Finished sending byte.\012\000"
	.align	2
.LC1:
	.ascii	"Finished taking byte.\012\000"
	.align	2
.LC2:
	.ascii	"CTS: %d, DCD: %d, DSR: %d, TXBUSY: %d, RXFE: %d, TX"
	.ascii	"FF: %d, RXFF: %d, TXFE: %d.  T=%d\012\000"
	.text
	.align	2
	.global	print_flags
	.type	print_flags, %function
print_flags:
.LFB2:
	.file 1 "test_uart.c"
	.loc 1 9 0
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
.LCFI0:
	sub	sp, sp, #28
.LCFI1:
.LVL1:
	str	r0, [sp, #24]
	ldr	sl, .L11
	.loc 1 10 0
	ldr	r3, [sp, #24]
	.loc 1 11 0
	ldr	r0, .L11+4
.LVL2:
	.loc 1 9 0
.L8:
	add	sl, pc, sl
	.loc 1 10 0
	cmn	r3, #1
	.loc 1 11 0
	add	r0, sl, r0
	.loc 1 9 0
	mov	r7, r1
	.loc 1 10 0
	beq	.L9
.LVL3:
	.loc 1 15 0
	ldr	r3, [sp, #24]
	.loc 1 16 0
	ldr	r0, .L11+8
	.loc 1 15 0
	cmn	r3, #2
	.loc 1 16 0
	add	r0, sl, r0
	.loc 1 15 0
	beq	.L9
	.loc 1 20 0
	ldr	r1, [sp, #24]
	ldr	r0, .L11+12
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	ldr	ip, [sp, #24]
	ldr	lr, [sp, #24]
	ldr	r4, [sp, #24]
	ldr	r5, [sp, #24]
	ldr	r6, [sp, #24]
	and	ip, ip, #8
	and	lr, lr, #16
	and	r4, r4, #32
	and	r5, r5, #64
	and	r6, r6, #128
	add	r0, sl, r0
	and	r1, r1, #1
	and	r2, r2, #2
	and	r3, r3, #4
	stmia	sp, {ip, lr}	@ phole stm
	str	r4, [sp, #8]
	str	r5, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	bl	robprintfbusy(PLT)
	.loc 1 31 0
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.LVL4:
.L9:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, lr}
	.loc 1 16 0
	b	robprintfbusy(PLT)
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
.LFE2:
	.size	print_flags, .-print_flags
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"The FIFO1 is enabled, and that is bad.\012\000"
	.align	2
.LC4:
	.ascii	"The FIFO2 is enabled, and that is bad.\012\000"
	.text
	.align	2
	.global	TEST_UART
	.type	TEST_UART, %function
TEST_UART:
.LFB3:
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 820
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI2:
	.loc 1 46 0
	ldr	r3, .L98
	.loc 1 33 0
	sub	sp, sp, #820
.LCFI3:
.LVL6:
	.loc 1 37 0
	mov	r0, #0
	str	r0, [sp, #816]
.LVL7:
	.loc 1 47 0
	mov	r1, #191
	.loc 1 46 0
	str	r0, [r3, #0]
	.loc 1 49 0
	ldr	r2, .L98+4
	.loc 1 47 0
	add	r3, r3, #4
	str	r1, [r3, #0]
	.loc 1 55 0
	ldr	ip, .L98+8
	.loc 1 50 0
	sub	r1, r1, #188
	add	r3, r3, #65536
	.loc 1 49 0
	str	r0, [r2, #0]
	.loc 1 50 0
	str	r1, [r3, #0]
	.loc 1 55 0
	ldr	r2, [ip, #0]
	.loc 1 61 0
	ldr	r4, .L98+12
	.loc 1 55 0
	str	r2, [sp, #812]
.LVL8:
	.loc 1 56 0
	ldr	r3, [sp, #812]
	.loc 1 33 0
	ldr	sl, .L98+16
	.loc 1 56 0
	bic	r3, r3, #16
	str	r3, [sp, #812]
	.loc 1 58 0
	ldr	r2, [sp, #812]
	.loc 1 67 0
	ldr	r1, .L98+20
	.loc 1 58 0
	orr	r2, r2, #104
	bic	r2, r2, #3
	str	r2, [sp, #812]
	.loc 1 61 0
	ldr	r0, [r4, #0]
	.loc 1 33 0
.L95:
	add	sl, pc, sl
	.loc 1 61 0
	str	r0, [sp, #808]
.LVL9:
	.loc 1 62 0
	ldr	r3, [sp, #808]
	.loc 1 67 0
	add	r1, sl, r1
	.loc 1 62 0
	bic	r3, r3, #16
	str	r3, [sp, #808]
	.loc 1 64 0
	ldr	r2, [sp, #812]
	.loc 1 64 0
	str	r2, [ip, #0]
	.loc 1 65 0
	ldr	r3, [sp, #808]
	str	r3, [r4, #0]
	.loc 1 67 0
	ldr	r0, [ip, #0]
	mov	r0, r0, lsr #4
	eor	r0, r0, #1
	and	r0, r0, #1
	bl	assert(PLT)
	.loc 1 68 0
	ldr	r0, [r4, #0]
	ldr	r1, .L98+24
	mov	r0, r0, lsr #4
	eor	r0, r0, #1
	add	r1, sl, r1
	and	r0, r0, #1
	bl	assert(PLT)
	.loc 1 71 0
	ldr	r3, .L98+28
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
.LVL10:
	.loc 1 72 0
	ldr	r1, [sp, #804]
	.loc 1 83 0
	ldr	r2, .L98+32
	.loc 1 72 0
	str	r1, [sp, #400]
	.loc 1 73 0
	ldr	r3, [sp, #816]
	.loc 1 85 0
	mov	r1, #200
	.loc 1 73 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 83 0
	ldr	r3, .L98+36
	str	r2, [r3], #8
	.loc 1 85 0
	str	r1, [r3, #0]
.L96:
	.loc 1 93 0
	ldr	r3, [sp, #804]
	tst	r3, #1
	beq	.L15
	.loc 1 103 0
	ldr	r3, .L98+40
	mov	r2, #133
	str	r2, [r3, #0]
.L18:
	.loc 1 105 0
	ldr	r3, .L98+28
	.loc 1 106 0
	add	r0, sp, #820
	.loc 1 105 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 106 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L19
	.loc 1 107 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 108 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 109 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L19:
	.loc 1 112 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L18
	.loc 1 113 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #0
	str	r2, [r1, #-420]
	.loc 1 114 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 115 0
	ldr	r3, [sp, #816]
	.loc 1 120 0
	ldr	r2, .L98+40
	.loc 1 115 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 120 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.LVL11:
.L22:
	.loc 1 122 0
	ldr	r3, .L98+28
	.loc 1 123 0
	add	r0, sp, #820
	.loc 1 122 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 123 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L23
	.loc 1 124 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 125 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 126 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L23:
	.loc 1 129 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L22
	.loc 1 130 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 131 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 132 0
	ldr	r3, [sp, #816]
	.loc 1 137 0
	ldr	r2, .L98+40
	.loc 1 132 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 137 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L26:
	.loc 1 139 0
	ldr	r3, .L98+28
	.loc 1 140 0
	add	r0, sp, #820
	.loc 1 139 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 140 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L27
	.loc 1 141 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 142 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 143 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L27:
	.loc 1 146 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L26
	.loc 1 147 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 148 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 149 0
	ldr	r3, [sp, #816]
	.loc 1 154 0
	ldr	r2, .L98+40
	.loc 1 149 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 154 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L30:
	.loc 1 156 0
	ldr	r3, .L98+28
	.loc 1 157 0
	add	r0, sp, #820
	.loc 1 156 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 157 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L31
	.loc 1 158 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 159 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 160 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L31:
	.loc 1 163 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L30
	.loc 1 164 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 165 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 166 0
	ldr	r3, [sp, #816]
	.loc 1 171 0
	ldr	r2, .L98+40
	.loc 1 166 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 171 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L34:
	.loc 1 173 0
	ldr	r3, .L98+28
	.loc 1 174 0
	add	r0, sp, #820
	.loc 1 173 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 174 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L35
	.loc 1 175 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 176 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 177 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L35:
	.loc 1 180 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L34
	.loc 1 181 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 182 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 183 0
	ldr	r3, [sp, #816]
	.loc 1 188 0
	ldr	r2, .L98+40
	.loc 1 183 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 188 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L38:
	.loc 1 190 0
	ldr	r3, .L98+28
	.loc 1 191 0
	add	r0, sp, #820
	.loc 1 190 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 191 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L39
	.loc 1 192 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 193 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 194 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L39:
	.loc 1 197 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L38
	.loc 1 198 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 199 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 200 0
	ldr	r3, [sp, #816]
	.loc 1 205 0
	ldr	r2, .L98+40
	.loc 1 200 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 205 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L42:
	.loc 1 207 0
	ldr	r3, .L98+28
	.loc 1 208 0
	add	r0, sp, #820
	.loc 1 207 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 208 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L43
	.loc 1 209 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 210 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 211 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L43:
	.loc 1 214 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L42
	.loc 1 215 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 216 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 217 0
	ldr	r3, [sp, #816]
	.loc 1 222 0
	ldr	r2, .L98+40
	.loc 1 217 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 222 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L46:
	.loc 1 224 0
	ldr	r3, .L98+28
	.loc 1 225 0
	add	r0, sp, #820
	.loc 1 224 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 225 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L47
	.loc 1 226 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 227 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 228 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L47:
	.loc 1 231 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L46
	.loc 1 232 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 233 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 234 0
	ldr	r3, [sp, #816]
	.loc 1 239 0
	ldr	r2, .L98+40
	.loc 1 234 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 239 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L50:
	.loc 1 241 0
	ldr	r3, .L98+28
	.loc 1 242 0
	add	r0, sp, #820
	.loc 1 241 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 242 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L51
	.loc 1 243 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 244 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 245 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L51:
	.loc 1 248 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L50
	.loc 1 249 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 250 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 251 0
	ldr	r3, [sp, #816]
	.loc 1 256 0
	ldr	r2, .L98+40
	.loc 1 251 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 256 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L54:
	.loc 1 258 0
	ldr	r3, .L98+28
	.loc 1 259 0
	add	r0, sp, #820
	.loc 1 258 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 259 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L55
	.loc 1 260 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 261 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 262 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L55:
	.loc 1 265 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	bne	.L54
	.loc 1 266 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 267 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 268 0
	ldr	r3, [sp, #816]
	.loc 1 273 0
	ldr	r2, .L98+40
	.loc 1 268 0
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 273 0
	ldr	r3, [r2, #0]
	str	r3, [sp, #800]
.L58:
	.loc 1 275 0
	ldr	r3, .L98+28
	.loc 1 276 0
	add	r0, sp, #820
	.loc 1 275 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 276 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L59
	.loc 1 277 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 278 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 279 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
.L59:
	.loc 1 282 0
	ldr	r3, [sp, #804]
	tst	r3, #16
	beq	.L58
	.loc 1 283 0
	ldr	r3, [sp, #816]
	add	r0, sp, #820
	add	r1, r0, r3, asl #2
	mvn	r2, #1
	str	r2, [r1, #-420]
	.loc 1 284 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 285 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
	.loc 1 291 0
	ldr	r2, [sp, #816]
	cmp	r2, #0
	bgt	.L97
.LVL12:
.L62:
.L93:
	b	.L93
.LVL13:
.L15:
	.loc 1 94 0
	ldr	r3, .L98+28
	.loc 1 95 0
	add	r0, sp, #820
	.loc 1 94 0
	ldr	r2, [r3, #0]
	str	r2, [sp, #804]
	.loc 1 95 0
	ldr	r3, [sp, #816]
	sub	r3, r3, #1
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-420]
	ldr	r3, [sp, #804]
	cmp	r1, r3
	beq	.L96
	.loc 1 96 0
	ldr	r2, [sp, #816]
	ldr	r1, [sp, #804]
	add	r3, r0, r2, asl #2
	str	r1, [r3, #-420]
	.loc 1 97 0
	ldr	r3, .L98+44
	ldr	r0, [sp, #816]
	ldr	r1, [r3, #0]
	add	r3, sp, #820
	add	r2, r3, r0, asl #2
	str	r1, [r2, #-820]
	.loc 1 98 0
	ldr	r3, [sp, #816]
	add	r3, r3, #1
	str	r3, [sp, #816]
	b	.L96
.LVL14:
.L97:
	.loc 1 291 0
	mov	r5, #0
.LVL15:
	add	r4, sp, #820
.L64:
	.loc 1 292 0
	ldr	r0, [r4, #-420]
	ldr	r1, [r4, #-820]
	bl	print_flags(PLT)
	.loc 1 291 0
	ldr	r3, [sp, #816]
	add	r5, r5, #1
	cmp	r5, r3
	add	r4, r4, #4
	blt	.L64
	b	.L62
.L99:
	.align	2
.L98:
	.word	-2138308596
	.word	-2138243060
	.word	-2138308600
	.word	-2138243064
	.word	_GLOBAL_OFFSET_TABLE_-(.L95+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	-2138308584
	.word	508000
	.word	-2139029376
	.word	-2138308608
	.word	-2139029372
.LFE3:
	.size	TEST_UART, .-TEST_UART
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
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x34
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x344
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8a
	.uleb128 0x2
	.byte	0x85
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x4
	.align	2
.LEFDE2:
	.file 2 "test_uart.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -28
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 24
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL3-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 -820
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 800
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x3
	.byte	0x91
	.sleb128 800
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x1f2
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF28
	.byte	0x1
	.4byte	.LASF29
	.4byte	.LASF30
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x4
	.4byte	0x79
	.byte	0x1
	.4byte	.LASF5
	.byte	0x1
	.byte	0x9
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST0
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x9
	.4byte	0x79
	.4byte	.LLST1
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x9
	.4byte	0x3a
	.4byte	.LLST2
	.byte	0x0
	.uleb128 0x6
	.4byte	0x3a
	.uleb128 0x7
	.4byte	0x183
	.byte	0x1
	.4byte	.LASF6
	.byte	0x1
	.byte	0x21
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST3
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x22
	.4byte	0x19a
	.byte	0x3
	.byte	0x7d
	.sleb128 400
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x23
	.4byte	0x19f
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x25
	.4byte	0x79
	.byte	0x3
	.byte	0x7d
	.sleb128 816
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x1
	.byte	0x27
	.4byte	0x1a4
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x1
	.byte	0x27
	.4byte	0x1a4
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x27
	.4byte	0x1a4
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x27
	.4byte	0x1a4
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x34
	.4byte	0x1a4
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x34
	.4byte	0x1a4
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x1
	.byte	0x34
	.4byte	0x79
	.byte	0x3
	.byte	0x7d
	.sleb128 812
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0x34
	.4byte	0x79
	.byte	0x3
	.byte	0x7d
	.sleb128 808
	.uleb128 0x8
	.4byte	.LASF3
	.byte	0x1
	.byte	0x46
	.4byte	0x79
	.byte	0x3
	.byte	0x7d
	.sleb128 804
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x4d
	.4byte	0x2c
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4e
	.4byte	0x1aa
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4f
	.4byte	0x1aa
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x50
	.4byte	0x1aa
	.uleb128 0xa
	.ascii	"i\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x3a
	.4byte	.LLST4
	.uleb128 0xb
	.ascii	"j\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x3a
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x1
	.byte	0x5a
	.4byte	0x79
	.4byte	.LLST5
	.byte	0x0
	.uleb128 0xd
	.4byte	0x193
	.4byte	0x3a
	.uleb128 0xe
	.4byte	0x193
	.byte	0x63
	.byte	0x0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.4byte	0x183
	.uleb128 0x6
	.4byte	0x183
	.uleb128 0xf
	.byte	0x4
	.4byte	0x79
	.uleb128 0xf
	.byte	0x4
	.4byte	0x3a
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x2
	.byte	0x6
	.4byte	0x1c0
	.sleb128 -2138308608
	.uleb128 0x11
	.4byte	0x1a4
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x2
	.byte	0x7
	.4byte	0x1c0
	.sleb128 -2138243072
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x2
	.byte	0x8
	.4byte	0x1c0
	.sleb128 -2138308584
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x9
	.4byte	0x1c0
	.sleb128 -2138243048
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
	.uleb128 0x4
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1f6
	.4byte	0x41
	.ascii	"print_flags\000"
	.4byte	0x7e
	.ascii	"TEST_UART\000"
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
	.ascii	"buf1\000"
.LASF17:
	.ascii	"buf2\000"
.LASF12:
	.ascii	"low1\000"
.LASF24:
	.ascii	"UART1DATA\000"
.LASF10:
	.ascii	"mid1\000"
.LASF11:
	.ascii	"mid2\000"
.LASF22:
	.ascii	"in_data\000"
.LASF20:
	.ascii	"timer_val\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF25:
	.ascii	"UART2DATA\000"
.LASF14:
	.ascii	"line1\000"
.LASF28:
	.ascii	"GNU C 4.0.2\000"
.LASF8:
	.ascii	"times\000"
.LASF23:
	.ascii	"long unsigned int\000"
.LASF19:
	.ascii	"timer_ldr\000"
.LASF15:
	.ascii	"line2\000"
.LASF18:
	.ascii	"cycles_per_tick\000"
.LASF21:
	.ascii	"timer_ctrl\000"
.LASF26:
	.ascii	"UART1Flag\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF3:
	.ascii	"flags\000"
.LASF0:
	.ascii	"char\000"
.LASF4:
	.ascii	"time\000"
.LASF29:
	.ascii	"test_uart.c\000"
.LASF5:
	.ascii	"print_flags\000"
.LASF9:
	.ascii	"state_number\000"
.LASF7:
	.ascii	"states\000"
.LASF13:
	.ascii	"low2\000"
.LASF27:
	.ascii	"UART2Flag\000"
.LASF6:
	.ascii	"TEST_UART\000"
.LASF30:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
	.ident	"GCC: (GNU) 4.0.2"
