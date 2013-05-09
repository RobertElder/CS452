	.file	"iotest.c"
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Hello world.\012\015\000"
	.align	2
.LC2:
	.ascii	"%s world%u.\012\015\000"
	.align	2
.LC3:
	.ascii	"Well, hello\000"
	.align	2
.LC4:
	.ascii	"%d worlds for %u person.\012\015\000"
	.align	2
.LC5:
	.ascii	"%x worlds for %d people.\012\015\000"
	.align	2
.LC6:
	.ascii	"%s\000"
	.align	2
.LC0:
	.ascii	"Hello\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, .L4+4
	add	r3, sl, r3
	sub	r2, fp, #24
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	sub	r3, fp, #24
	mov	r0, #1
	mov	r1, r3
	bl	bwputstr(PLT)
	sub	r3, fp, #24
	mov	r0, #1
	mov	r1, #10
	mov	r2, #42
	bl	bwputw(PLT)
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L4+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #23
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+20
	add	r3, sl, r3
	mov	r1, r3
	mvn	r2, #22
	mov	r3, #1
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+24
	add	r3, sl, r3
	mov	r1, r3
	mvn	r2, #22
	ldr	r3, .L4+28
	bl	bwprintf(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r3, r0
	and	r3, r3, #255
	strb	r3, [fp, #-24]
	sub	r2, fp, #24
	mov	r0, #1
	ldr	r3, .L4+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	723
	.word	.LC6(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
