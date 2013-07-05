	.file	"ansi.c"
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
	.ascii	"\033[0m\000"
	.text
	.align	2
	.global	ANSI_ResetColor
	.type	ANSI_ResetColor, %function
ANSI_ResetColor:
.LFB2:
	.file 1 "ansi.c"
	.loc 1 6 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	str	sl, [sp, #-4]!
.LCFI0:
	ldr	sl, .L4
	.loc 1 7 0
	ldr	r1, .L4+4
	.loc 1 6 0
.L3:
	add	sl, pc, sl
	.loc 1 7 0
	mov	r0, #1
	add	r1, sl, r1
	.loc 1 6 0
	@ lr needed for prologue
	.loc 1 8 0
	ldmfd	sp!, {sl}
	.loc 1 7 0
	b	PutString(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
.LFE2:
	.size	ANSI_ResetColor, .-ANSI_ResetColor
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"\033[3%d;4%dm\000"
	.text
	.align	2
	.global	ANSI_Color
	.type	ANSI_Color, %function
ANSI_Color:
.LFB3:
	.loc 1 10 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	str	sl, [sp, #-4]!
.LCFI1:
	ldr	sl, .L9
	mov	r3, r1
	.loc 1 11 0
	ldr	r1, .L9+4
.LVL2:
	.loc 1 10 0
.L8:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 11 0
	add	r1, sl, r1
	mov	r0, #1
.LVL3:
	.loc 1 10 0
	@ lr needed for prologue
	.loc 1 12 0
	ldmfd	sp!, {sl}
	.loc 1 11 0
	b	PutString(PLT)
.LVL4:
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	.LC1(GOTOFF)
.LFE3:
	.size	ANSI_Color, .-ANSI_Color
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"\033[\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"ANSI_Style unknown style\000"
	.align	2
.LC5:
	.ascii	";\000"
	.align	2
.LC6:
	.ascii	"m\000"
	.align	2
.LC7:
	.ascii	"22;24;25;27m\000"
	.text
	.align	2
	.global	ANSI_Style
	.type	ANSI_Style, %function
ANSI_Style:
.LFB4:
	.loc 1 14 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI2:
	ldr	sl, .L36
	.loc 1 15 0
	ldr	r1, .L36+4
	.loc 1 14 0
.L30:
	add	sl, pc, sl
	mov	r4, r0
	.loc 1 15 0
	add	r1, sl, r1
	mov	r0, #1
.LVL6:
	bl	PutString(PLT)
	.loc 1 17 0
	cmp	r4, #0
	beq	.L12
	ldr	r5, .L36+8
	b	.L14
.LVL7:
.L15:
.LBB2:
	.loc 1 24 0
	tst	r4, #2
	bne	.L32
	.loc 1 27 0
	tst	r4, #4
	bne	.L33
	.loc 1 30 0
	tst	r4, #8
	bne	.L34
	.loc 1 33 0
	ands	r0, r4, #16
	beq	.L24
	.loc 1 34 0
	mov	r0, #1
	add	r1, sl, r5
	mov	r2, #5
	bl	PutString(PLT)
	.loc 1 35 0
	bic	r4, r4, #16
.L17:
	.loc 1 40 0
	cmp	r4, #0
	beq	.L26
.L35:
	.loc 1 41 0
	ldr	r1, .L36+12
	mov	r0, #1
	add	r1, sl, r1
	bl	PutString(PLT)
.LVL8:
.L14:
.LVL9:
	.loc 1 21 0
	tst	r4, #1
	beq	.L15
	.loc 1 22 0
	mov	r0, #1
	add	r1, sl, r5
	mov	r2, r0
	.loc 1 23 0
	bic	r4, r4, #1
	.loc 1 22 0
	bl	PutString(PLT)
	.loc 1 40 0
	cmp	r4, #0
	bne	.L35
.L26:
	.loc 1 43 0
	ldr	r1, .L36+16
	mov	r0, #1
	add	r1, sl, r1
.LBE2:
	.loc 1 50 0
	ldmfd	sp!, {r4, r5, sl, lr}
.LBB3:
	.loc 1 43 0
	b	PutString(PLT)
.L32:
	.loc 1 25 0
	mov	r0, #1
	add	r1, sl, r5
	mov	r2, #7
	bl	PutString(PLT)
	.loc 1 26 0
	bic	r4, r4, #2
	b	.L17
.L33:
	.loc 1 28 0
	mov	r0, #1
	add	r1, sl, r5
	mov	r2, #2
	bl	PutString(PLT)
	.loc 1 29 0
	bic	r4, r4, #4
	b	.L17
.L24:
	.loc 1 37 0
	ldr	r1, .L36+20
	add	r1, sl, r1
	bl	assert(PLT)
	b	.L17
.L34:
	.loc 1 31 0
	mov	r0, #1
	add	r1, sl, r5
	mov	r2, #4
	bl	PutString(PLT)
	.loc 1 32 0
	bic	r4, r4, #8
	b	.L17
.LVL10:
.L12:
.LBE3:
	.loc 1 48 0
	ldr	r1, .L36+24
	mov	r0, #1
	add	r1, sl, r1
	.loc 1 50 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 48 0
	b	PutString(PLT)
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC7(GOTOFF)
.LFE4:
	.size	ANSI_Style, .-ANSI_Style
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"\033[%dJ\000"
	.text
	.align	2
	.global	ANSI_ClearScreen
	.type	ANSI_ClearScreen, %function
ANSI_ClearScreen:
.LFB5:
	.loc 1 52 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL11:
	str	sl, [sp, #-4]!
.LCFI3:
	ldr	sl, .L41
	.loc 1 53 0
	ldr	r1, .L41+4
	.loc 1 52 0
.L40:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 53 0
	add	r1, sl, r1
	mov	r0, #1
.LVL12:
	.loc 1 52 0
	@ lr needed for prologue
	.loc 1 54 0
	ldmfd	sp!, {sl}
	.loc 1 53 0
	b	PutString(PLT)
.LVL13:
.L42:
	.align	2
.L41:
	.word	_GLOBAL_OFFSET_TABLE_-(.L40+8)
	.word	.LC8(GOTOFF)
.LFE5:
	.size	ANSI_ClearScreen, .-ANSI_ClearScreen
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"\033[%dK\000"
	.text
	.align	2
	.global	ANSI_ClearLine
	.type	ANSI_ClearLine, %function
ANSI_ClearLine:
.LFB6:
	.loc 1 56 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL14:
	str	sl, [sp, #-4]!
.LCFI4:
	ldr	sl, .L46
	.loc 1 57 0
	ldr	r1, .L46+4
	.loc 1 56 0
.L45:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 57 0
	add	r1, sl, r1
	mov	r0, #1
.LVL15:
	.loc 1 56 0
	@ lr needed for prologue
	.loc 1 58 0
	ldmfd	sp!, {sl}
	.loc 1 57 0
	b	PutString(PLT)
.LVL16:
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L45+8)
	.word	.LC9(GOTOFF)
.LFE6:
	.size	ANSI_ClearLine, .-ANSI_ClearLine
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"\033[%d;%dH\000"
	.text
	.align	2
	.global	ANSI_Cursor
	.type	ANSI_Cursor, %function
ANSI_Cursor:
.LFB7:
	.loc 1 60 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL17:
	str	sl, [sp, #-4]!
.LCFI5:
	ldr	sl, .L51
	mov	r3, r1
	.loc 1 61 0
	ldr	r1, .L51+4
.LVL18:
	.loc 1 60 0
.L50:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 61 0
	add	r1, sl, r1
	mov	r0, #1
.LVL19:
	.loc 1 60 0
	@ lr needed for prologue
	.loc 1 62 0
	ldmfd	sp!, {sl}
	.loc 1 61 0
	b	PutString(PLT)
.LVL20:
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
	.word	.LC10(GOTOFF)
.LFE7:
	.size	ANSI_Cursor, .-ANSI_Cursor
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"\033[%dA\000"
	.text
	.align	2
	.global	ANSI_CursorUp
	.type	ANSI_CursorUp, %function
ANSI_CursorUp:
.LFB8:
	.loc 1 64 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL21:
	str	sl, [sp, #-4]!
.LCFI6:
	ldr	sl, .L56
	.loc 1 65 0
	ldr	r1, .L56+4
	.loc 1 64 0
.L55:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 65 0
	add	r1, sl, r1
	mov	r0, #1
.LVL22:
	.loc 1 64 0
	@ lr needed for prologue
	.loc 1 66 0
	ldmfd	sp!, {sl}
	.loc 1 65 0
	b	PutString(PLT)
.LVL23:
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	.LC11(GOTOFF)
.LFE8:
	.size	ANSI_CursorUp, .-ANSI_CursorUp
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"\033[%dB\000"
	.text
	.align	2
	.global	ANSI_CursorDown
	.type	ANSI_CursorDown, %function
ANSI_CursorDown:
.LFB9:
	.loc 1 68 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL24:
	str	sl, [sp, #-4]!
.LCFI7:
	ldr	sl, .L61
	.loc 1 69 0
	ldr	r1, .L61+4
	.loc 1 68 0
.L60:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 69 0
	add	r1, sl, r1
	mov	r0, #1
.LVL25:
	.loc 1 68 0
	@ lr needed for prologue
	.loc 1 70 0
	ldmfd	sp!, {sl}
	.loc 1 69 0
	b	PutString(PLT)
.LVL26:
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.L60+8)
	.word	.LC12(GOTOFF)
.LFE9:
	.size	ANSI_CursorDown, .-ANSI_CursorDown
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"\033[%dC\000"
	.text
	.align	2
	.global	ANSI_CursorForward
	.type	ANSI_CursorForward, %function
ANSI_CursorForward:
.LFB10:
	.loc 1 72 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL27:
	str	sl, [sp, #-4]!
.LCFI8:
	ldr	sl, .L66
	.loc 1 73 0
	ldr	r1, .L66+4
	.loc 1 72 0
.L65:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 73 0
	add	r1, sl, r1
	mov	r0, #1
.LVL28:
	.loc 1 72 0
	@ lr needed for prologue
	.loc 1 74 0
	ldmfd	sp!, {sl}
	.loc 1 73 0
	b	PutString(PLT)
.LVL29:
.L67:
	.align	2
.L66:
	.word	_GLOBAL_OFFSET_TABLE_-(.L65+8)
	.word	.LC13(GOTOFF)
.LFE10:
	.size	ANSI_CursorForward, .-ANSI_CursorForward
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"\033[%dD\000"
	.text
	.align	2
	.global	ANSI_CursorBackward
	.type	ANSI_CursorBackward, %function
ANSI_CursorBackward:
.LFB11:
	.loc 1 76 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL30:
	str	sl, [sp, #-4]!
.LCFI9:
	ldr	sl, .L71
	.loc 1 77 0
	ldr	r1, .L71+4
	.loc 1 76 0
.L70:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 77 0
	add	r1, sl, r1
	mov	r0, #1
.LVL31:
	.loc 1 76 0
	@ lr needed for prologue
	.loc 1 78 0
	ldmfd	sp!, {sl}
	.loc 1 77 0
	b	PutString(PLT)
.LVL32:
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L70+8)
	.word	.LC14(GOTOFF)
.LFE11:
	.size	ANSI_CursorBackward, .-ANSI_CursorBackward
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"\033[%dE\000"
	.text
	.align	2
	.global	ANSI_CursorNextLine
	.type	ANSI_CursorNextLine, %function
ANSI_CursorNextLine:
.LFB12:
	.loc 1 80 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL33:
	str	sl, [sp, #-4]!
.LCFI10:
	ldr	sl, .L76
	.loc 1 81 0
	ldr	r1, .L76+4
	.loc 1 80 0
.L75:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 81 0
	add	r1, sl, r1
	mov	r0, #1
.LVL34:
	.loc 1 80 0
	@ lr needed for prologue
	.loc 1 82 0
	ldmfd	sp!, {sl}
	.loc 1 81 0
	b	PutString(PLT)
.LVL35:
.L77:
	.align	2
.L76:
	.word	_GLOBAL_OFFSET_TABLE_-(.L75+8)
	.word	.LC15(GOTOFF)
.LFE12:
	.size	ANSI_CursorNextLine, .-ANSI_CursorNextLine
	.section	.rodata.str1.4
	.align	2
.LC16:
	.ascii	"\033[%dF\000"
	.text
	.align	2
	.global	ANSI_CursorPreviousLine
	.type	ANSI_CursorPreviousLine, %function
ANSI_CursorPreviousLine:
.LFB13:
	.loc 1 84 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL36:
	str	sl, [sp, #-4]!
.LCFI11:
	ldr	sl, .L81
	.loc 1 85 0
	ldr	r1, .L81+4
	.loc 1 84 0
.L80:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 85 0
	add	r1, sl, r1
	mov	r0, #1
.LVL37:
	.loc 1 84 0
	@ lr needed for prologue
	.loc 1 86 0
	ldmfd	sp!, {sl}
	.loc 1 85 0
	b	PutString(PLT)
.LVL38:
.L82:
	.align	2
.L81:
	.word	_GLOBAL_OFFSET_TABLE_-(.L80+8)
	.word	.LC16(GOTOFF)
.LFE13:
	.size	ANSI_CursorPreviousLine, .-ANSI_CursorPreviousLine
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"\033[%dG\000"
	.text
	.align	2
	.global	ANSI_CursorCol
	.type	ANSI_CursorCol, %function
ANSI_CursorCol:
.LFB14:
	.loc 1 88 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL39:
	str	sl, [sp, #-4]!
.LCFI12:
	ldr	sl, .L86
	.loc 1 89 0
	ldr	r1, .L86+4
	.loc 1 88 0
.L85:
	add	sl, pc, sl
	mov	r2, r0
	.loc 1 89 0
	add	r1, sl, r1
	mov	r0, #1
.LVL40:
	.loc 1 88 0
	@ lr needed for prologue
	.loc 1 90 0
	ldmfd	sp!, {sl}
	.loc 1 89 0
	b	PutString(PLT)
.LVL41:
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L85+8)
	.word	.LC17(GOTOFF)
.LFE14:
	.size	ANSI_CursorCol, .-ANSI_CursorCol
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"\033[s\000"
	.text
	.align	2
	.global	ANSI_SaveCursor
	.type	ANSI_SaveCursor, %function
ANSI_SaveCursor:
.LFB15:
	.loc 1 92 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL42:
	str	sl, [sp, #-4]!
.LCFI13:
	ldr	sl, .L91
	.loc 1 93 0
	ldr	r1, .L91+4
	.loc 1 92 0
.L90:
	add	sl, pc, sl
	.loc 1 93 0
	mov	r0, #1
	add	r1, sl, r1
	.loc 1 92 0
	@ lr needed for prologue
	.loc 1 94 0
	ldmfd	sp!, {sl}
	.loc 1 93 0
	b	PutString(PLT)
.L92:
	.align	2
.L91:
	.word	_GLOBAL_OFFSET_TABLE_-(.L90+8)
	.word	.LC18(GOTOFF)
.LFE15:
	.size	ANSI_SaveCursor, .-ANSI_SaveCursor
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"\033[u\000"
	.text
	.align	2
	.global	ANSI_RestoreCursor
	.type	ANSI_RestoreCursor, %function
ANSI_RestoreCursor:
.LFB16:
	.loc 1 96 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL43:
	str	sl, [sp, #-4]!
.LCFI14:
	ldr	sl, .L96
	.loc 1 97 0
	ldr	r1, .L96+4
	.loc 1 96 0
.L95:
	add	sl, pc, sl
	.loc 1 97 0
	mov	r0, #1
	add	r1, sl, r1
	.loc 1 96 0
	@ lr needed for prologue
	.loc 1 98 0
	ldmfd	sp!, {sl}
	.loc 1 97 0
	b	PutString(PLT)
.L97:
	.align	2
.L96:
	.word	_GLOBAL_OFFSET_TABLE_-(.L95+8)
	.word	.LC19(GOTOFF)
.LFE16:
	.size	ANSI_RestoreCursor, .-ANSI_RestoreCursor
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"\033[6n\000"
	.text
	.align	2
	.global	ANSI_GetCursor
	.type	ANSI_GetCursor, %function
ANSI_GetCursor:
.LFB17:
	.loc 1 100 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL44:
	str	sl, [sp, #-4]!
.LCFI15:
	ldr	sl, .L101
	.loc 1 101 0
	ldr	r1, .L101+4
	.loc 1 100 0
.L100:
	add	sl, pc, sl
	.loc 1 101 0
	mov	r0, #1
	add	r1, sl, r1
	.loc 1 100 0
	@ lr needed for prologue
	.loc 1 102 0
	ldmfd	sp!, {sl}
	.loc 1 101 0
	b	PutString(PLT)
.L102:
	.align	2
.L101:
	.word	_GLOBAL_OFFSET_TABLE_-(.L100+8)
	.word	.LC20(GOTOFF)
.LFE17:
	.size	ANSI_GetCursor, .-ANSI_GetCursor
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
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
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
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
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
	.byte	0x4
	.4byte	.LCFI3-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI4-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
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
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI6-.LFB8
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI7-.LFB9
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI8-.LFB10
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI9-.LFB11
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI10-.LFB12
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI11-.LFB13
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI12-.LFB14
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI13-.LFB15
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI14-.LFB16
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI15-.LFB17
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x1
	.align	2
.LEFDE30:
	.file 2 "ansi.h"
	.file 3 "queue.h"
	.file 4 "train.h"
	.file 5 "public_kernel_interface.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0x4c9
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
	.4byte	0x62
	.4byte	.LASF7
	.byte	0x4
	.byte	0x2
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF0
	.sleb128 0
	.uleb128 0x4
	.ascii	"RED\000"
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF1
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF2
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF3
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF4
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF5
	.sleb128 6
	.uleb128 0x3
	.4byte	.LASF6
	.sleb128 7
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0xd
	.4byte	0x25
	.uleb128 0x2
	.4byte	0x9e
	.4byte	.LASF8
	.byte	0x4
	.byte	0x2
	.byte	0xf
	.uleb128 0x3
	.4byte	.LASF9
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF10
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF11
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF12
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF13
	.sleb128 8
	.uleb128 0x3
	.4byte	.LASF14
	.sleb128 16
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0x16
	.4byte	0x6d
	.uleb128 0x2
	.4byte	0xc8
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2
	.byte	0x21
	.uleb128 0x3
	.4byte	.LASF16
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF17
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF18
	.sleb128 2
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x25
	.4byte	0xa9
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x4
	.byte	0x7
	.uleb128 0x7
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x8
	.byte	0x4
	.uleb128 0x8
	.byte	0x1
	.4byte	.LASF41
	.byte	0x1
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x9
	.4byte	0x147
	.byte	0x1
	.4byte	.LASF26
	.byte	0x1
	.byte	0xa
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.4byte	0x62
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0xa
	.4byte	0x62
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x9
	.4byte	0x184
	.byte	0x1
	.4byte	.LASF27
	.byte	0x1
	.byte	0xe
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1
	.byte	0xe
	.4byte	0x9e
	.4byte	.LLST2
	.uleb128 0xb
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x1
	.byte	0x12
	.4byte	0xef
	.4byte	.LLST3
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.4byte	0x1ac
	.byte	0x1
	.4byte	.LASF29
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xd
	.ascii	"how\000"
	.byte	0x1
	.byte	0x34
	.4byte	0xc8
	.4byte	.LLST4
	.byte	0x0
	.uleb128 0x9
	.4byte	0x1d4
	.byte	0x1
	.4byte	.LASF30
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xd
	.ascii	"how\000"
	.byte	0x1
	.byte	0x38
	.4byte	0xc8
	.4byte	.LLST5
	.byte	0x0
	.uleb128 0x9
	.4byte	0x20b
	.byte	0x1
	.4byte	.LASF31
	.byte	0x1
	.byte	0x3c
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xd
	.ascii	"row\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0xef
	.4byte	.LLST6
	.uleb128 0xd
	.ascii	"col\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0xef
	.4byte	.LLST7
	.byte	0x0
	.uleb128 0x9
	.4byte	0x233
	.byte	0x1
	.4byte	.LASF32
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x40
	.4byte	0xef
	.4byte	.LLST8
	.byte	0x0
	.uleb128 0x9
	.4byte	0x25b
	.byte	0x1
	.4byte	.LASF34
	.byte	0x1
	.byte	0x44
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x44
	.4byte	0xef
	.4byte	.LLST9
	.byte	0x0
	.uleb128 0x9
	.4byte	0x283
	.byte	0x1
	.4byte	.LASF35
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x48
	.4byte	0xef
	.4byte	.LLST10
	.byte	0x0
	.uleb128 0x9
	.4byte	0x2ab
	.byte	0x1
	.4byte	.LASF36
	.byte	0x1
	.byte	0x4c
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x1
	.byte	0x4c
	.4byte	0xef
	.4byte	.LLST11
	.byte	0x0
	.uleb128 0x9
	.4byte	0x2d3
	.byte	0x1
	.4byte	.LASF37
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x1
	.byte	0x50
	.4byte	0xef
	.4byte	.LLST12
	.byte	0x0
	.uleb128 0x9
	.4byte	0x2fb
	.byte	0x1
	.4byte	.LASF39
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x1
	.byte	0x54
	.4byte	0xef
	.4byte	.LLST13
	.byte	0x0
	.uleb128 0x9
	.4byte	0x323
	.byte	0x1
	.4byte	.LASF40
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xd
	.ascii	"col\000"
	.byte	0x1
	.byte	0x58
	.4byte	0xef
	.4byte	.LLST14
	.byte	0x0
	.uleb128 0x8
	.byte	0x1
	.4byte	.LASF42
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x8
	.byte	0x1
	.4byte	.LASF43
	.byte	0x1
	.byte	0x60
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x8
	.byte	0x1
	.4byte	.LASF44
	.byte	0x1
	.byte	0x64
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x3
	.byte	0x9
	.4byte	0x368
	.sleb128 -1
	.uleb128 0xf
	.4byte	0xef
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x3
	.byte	0xa
	.4byte	0x368
	.sleb128 -2
	.uleb128 0x10
	.4byte	0x389
	.4byte	0xd3
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x6
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x4
	.byte	0xb
	.4byte	0x398
	.4byte	.LASF49
	.uleb128 0xf
	.4byte	0x379
	.uleb128 0x10
	.4byte	0x3ad
	.4byte	0xd3
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x6
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x4
	.byte	0xc
	.4byte	0x3bc
	.4byte	.LASF51
	.uleb128 0xf
	.4byte	0x39d
	.uleb128 0x10
	.4byte	0x3d1
	.4byte	0xd3
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x6
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF52
	.byte	0x4
	.byte	0xd
	.4byte	0x3e0
	.4byte	.LASF53
	.uleb128 0xf
	.4byte	0x3c1
	.uleb128 0x10
	.4byte	0x3f5
	.4byte	0xd3
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x6
	.byte	0x0
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x4
	.byte	0xe
	.4byte	0x404
	.4byte	.LASF55
	.uleb128 0xf
	.4byte	0x3e5
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x4
	.byte	0x10
	.4byte	0x368
	.byte	0x10
	.uleb128 0x10
	.4byte	0x42b
	.4byte	0xd3
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x5
	.uleb128 0x11
	.4byte	0xe8
	.byte	0x13
	.byte	0x0
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x4
	.byte	0x6d
	.4byte	0x436
	.uleb128 0xf
	.4byte	0x415
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x5
	.byte	0x7
	.4byte	0x368
	.sleb128 -1
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x5
	.byte	0x8
	.4byte	0x368
	.sleb128 -2
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x5
	.byte	0x9
	.4byte	0x368
	.sleb128 -3
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x5
	.byte	0xa
	.4byte	0x368
	.sleb128 -1
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x5
	.byte	0xb
	.4byte	0x368
	.sleb128 -2
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x5
	.byte	0xc
	.4byte	0x368
	.byte	0x3
	.uleb128 0xe
	.4byte	.LASF64
	.byte	0x5
	.byte	0xd
	.4byte	0x368
	.sleb128 -1
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x5
	.byte	0xe
	.4byte	0x368
	.sleb128 -2
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x5
	.byte	0xf
	.4byte	0x368
	.sleb128 -3
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x5
	.byte	0x10
	.4byte	0x368
	.sleb128 -4
	.uleb128 0x15
	.4byte	.LASF68
	.byte	0x5
	.byte	0x11
	.4byte	0x4c7
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0xf
	.4byte	0xf6
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
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x0
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x1c
	.uleb128 0xe
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
	.uleb128 0xb
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.4byte	0x152
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4cd
	.4byte	0xfd
	.ascii	"ANSI_ResetColor\000"
	.4byte	0x110
	.ascii	"ANSI_Color\000"
	.4byte	0x147
	.ascii	"ANSI_Style\000"
	.4byte	0x184
	.ascii	"ANSI_ClearScreen\000"
	.4byte	0x1ac
	.ascii	"ANSI_ClearLine\000"
	.4byte	0x1d4
	.ascii	"ANSI_Cursor\000"
	.4byte	0x20b
	.ascii	"ANSI_CursorUp\000"
	.4byte	0x233
	.ascii	"ANSI_CursorDown\000"
	.4byte	0x25b
	.ascii	"ANSI_CursorForward\000"
	.4byte	0x283
	.ascii	"ANSI_CursorBackward\000"
	.4byte	0x2ab
	.ascii	"ANSI_CursorNextLine\000"
	.4byte	0x2d3
	.ascii	"ANSI_CursorPreviousLine\000"
	.4byte	0x2fb
	.ascii	"ANSI_CursorCol\000"
	.4byte	0x323
	.ascii	"ANSI_SaveCursor\000"
	.4byte	0x336
	.ascii	"ANSI_RestoreCursor\000"
	.4byte	0x349
	.ascii	"ANSI_GetCursor\000"
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
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF29:
	.ascii	"ANSI_ClearScreen\000"
.LASF8:
	.ascii	"ANSIStyle\000"
.LASF51:
	.ascii	"TCmSvr\000"
.LASF12:
	.ascii	"FAINT_STYLE\000"
.LASF55:
	.ascii	"TrSwMr\000"
.LASF53:
	.ascii	"TrSTmr\000"
.LASF18:
	.ascii	"CLEAR_ALL\000"
.LASF67:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF59:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF14:
	.ascii	"BLINK_STYLE\000"
.LASF2:
	.ascii	"YELLOW\000"
.LASF30:
	.ascii	"ANSI_ClearLine\000"
.LASF27:
	.ascii	"ANSI_Style\000"
.LASF60:
	.ascii	"ERR_K_DEFAULT\000"
.LASF39:
	.ascii	"ANSI_CursorPreviousLine\000"
.LASF6:
	.ascii	"WHITE\000"
.LASF61:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF40:
	.ascii	"ANSI_CursorCol\000"
.LASF42:
	.ascii	"ANSI_SaveCursor\000"
.LASF63:
	.ascii	"NAMESERVER_TID\000"
.LASF50:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF7:
	.ascii	"ANSIColor\000"
.LASF13:
	.ascii	"UNDERLINE_STYLE\000"
.LASF64:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
.LASF20:
	.ascii	"unsigned int\000"
.LASF62:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF4:
	.ascii	"MAGENTA\000"
.LASF22:
	.ascii	"long unsigned int\000"
.LASF38:
	.ascii	"lines\000"
.LASF70:
	.ascii	"ansi.c\000"
.LASF46:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF32:
	.ascii	"ANSI_CursorUp\000"
.LASF26:
	.ascii	"ANSI_Color\000"
.LASF56:
	.ascii	"LIGHTS_MASK\000"
.LASF45:
	.ascii	"style2\000"
.LASF24:
	.ascii	"text\000"
.LASF47:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF57:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF33:
	.ascii	"cells\000"
.LASF54:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF68:
	.ascii	"TICK_SIZE\000"
.LASF48:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF11:
	.ascii	"REVERSE_STYLE\000"
.LASF44:
	.ascii	"ANSI_GetCursor\000"
.LASF58:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF34:
	.ascii	"ANSI_CursorDown\000"
.LASF37:
	.ascii	"ANSI_CursorNextLine\000"
.LASF43:
	.ascii	"ANSI_RestoreCursor\000"
.LASF66:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF15:
	.ascii	"ClearType\000"
.LASF49:
	.ascii	"TrnSvr\000"
.LASF21:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"CLEAR_TO_START\000"
.LASF5:
	.ascii	"CYAN\000"
.LASF1:
	.ascii	"GREEN\000"
.LASF19:
	.ascii	"char\000"
.LASF41:
	.ascii	"ANSI_ResetColor\000"
.LASF0:
	.ascii	"BLACK\000"
.LASF71:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF52:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF3:
	.ascii	"BLUE\000"
.LASF35:
	.ascii	"ANSI_CursorForward\000"
.LASF28:
	.ascii	"style\000"
.LASF10:
	.ascii	"BOLD_STYLE\000"
.LASF65:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF69:
	.ascii	"GNU C 4.0.2\000"
.LASF31:
	.ascii	"ANSI_Cursor\000"
.LASF16:
	.ascii	"CLEAR_TO_END\000"
.LASF9:
	.ascii	"NORMAL_STYLE\000"
.LASF36:
	.ascii	"ANSI_CursorBackward\000"
.LASF25:
	.ascii	"background\000"
.LASF23:
	.ascii	"double\000"
	.ident	"GCC: (GNU) 4.0.2"
