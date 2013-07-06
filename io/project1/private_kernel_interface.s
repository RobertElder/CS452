	.file	"private_kernel_interface.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata
	.type	TASK_STATE_NAMES, %object
	.size	TASK_STATE_NAMES, 140
TASK_STATE_NAMES:
	.ascii	"\033[37mready\033[0m\000"
	.space	5
	.ascii	"\033[32mactive\033[0m\000"
	.space	4
	.ascii	"\033[34mzombie\033[0m\000"
	.space	4
	.ascii	"\033[35msend_b\033[0m\000"
	.space	4
	.ascii	"\033[31mrecv_b\033[0m\000"
	.space	4
	.ascii	"\033[36mreply_b\033[0m\000"
	.space	3
	.ascii	"\033[33mevent_b\033[0m\000"
	.space	3
	.text
	.align	2
	.global	print_kernel_state
	.type	print_kernel_state, %function
print_kernel_state:
.LFB2:
	.file 1 "private_kernel_interface.c"
	.loc 1 20 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	@ lr needed for prologue
	.loc 1 21 0
	bx	lr
.LFE2:
	.size	print_kernel_state, .-print_kernel_state
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Get stack base was passed the value %d, which shoul"
	.ascii	"d be less or equal to max tasks: %d.\000"
	.text
	.align	2
	.global	get_stack_base
	.type	get_stack_base, %function
get_stack_base:
.LFB3:
	.loc 1 25 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL1:
	stmfd	sp!, {r4, sl, lr}
.LCFI0:
	.loc 1 26 0
	ldr	r3, .L6
	.loc 1 27 0
	ldr	r2, .L6+4
	.loc 1 26 0
	ldr	r1, [r3, #0]
.LVL2:
	.loc 1 25 0
	ldr	sl, .L6+8
	.loc 1 27 0
	ldr	r3, [r1, r2]
	ldr	r1, .L6+12
.LVL3:
	.loc 1 25 0
.L5:
	add	sl, pc, sl
	mov	r4, r0
	.loc 1 27 0
	add	r1, sl, r1
	cmp	r3, r0
	movcc	r0, #0
	movcs	r0, #1
.LVL4:
	mov	r2, r4
	bl	assertf(PLT)
	.loc 1 29 0
	ldr	r0, .L6+16
	sub	r0, r0, r4, asl #16
	ldmfd	sp!, {r4, sl, pc}
.L7:
	.align	2
.L6:
	.word	33403036
	.word	426892
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.word	32349164
.LFE3:
	.size	get_stack_base, .-get_stack_base
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"\033[1m--  Printing map of how our 32MB of memory i"
	.ascii	"s currently allocated.  --\033[0m\012\000"
	.align	2
.LC2:
	.ascii	"Redboot Stuff:    0x00000000 - 0000x%x\012\000"
	.align	2
.LC3:
	.ascii	"The Kernel:       0x000%x - 0x000%x\012\000"
	.align	2
.LC4:
	.ascii	"Unallocated:      0x000%x - 0x0%x\012\000"
	.align	2
.LC5:
	.ascii	"Timer IRQ Stack:  0x0%x - 0x0%x\012\000"
	.align	2
.LC6:
	.ascii	"Kernel Stack:     0x0%x - 0x0%x\012\000"
	.align	2
.LC7:
	.ascii	"Unallocated:      0x0%x - 0x0%x\012\000"
	.align	2
.LC8:
	.ascii	"Redboot Stack:    0x0%x - 0x01FFFFFF\012\000"
	.align	2
.LC9:
	.ascii	"All memory        0x00000000 - 0x01FFFFFF\012\000"
	.align	2
.LC10:
	.ascii	"There are currently %d MB, %d KB and %d bytes of me"
	.ascii	"mory unallocated.\012\000"
	.text
	.align	2
	.global	print_memory_status
	.type	print_memory_status, %function
print_memory_status:
.LFB4:
	.loc 1 31 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL5:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI1:
	ldr	sl, .L11
	.loc 1 34 0
	ldr	r0, .L11+4
	.loc 1 31 0
.L10:
	add	sl, pc, sl
	.loc 1 32 0
	ldr	r8, .L11+8
	.loc 1 34 0
	add	r0, sl, r0
	.loc 1 32 0
	ldr	r7, [r8, #0]
.LVL6:
	.loc 1 34 0
	bl	robprintfbusy(PLT)
	.loc 1 35 0
	ldr	r3, .L11+12
	ldr	r0, .L11+16
	ldr	r4, [sl, r3]
	add	r0, sl, r0
	sub	r1, r4, #1
	bl	robprintfbusy(PLT)
	.loc 1 36 0
	ldr	r3, .L11+20
	ldr	r0, .L11+24
	ldr	r6, [sl, r3]
	add	r0, sl, r0
	mov	r1, r4
	sub	r2, r6, #1
	bl	robprintfbusy(PLT)
	.loc 1 37 0
	ldr	r3, .L11+28
	ldr	r4, .L11+32
	ldr	r2, [r7, r3]
	.loc 1 38 0
	ldr	r0, .L11+36
	.loc 1 37 0
	sub	r4, r4, r2, asl #16
.LVL7:
	.loc 1 38 0
	add	r0, sl, r0
	mov	r1, r6
	mov	r2, r4
	bl	robprintfbusy(PLT)
	.loc 1 54 0
	ldr	r0, .L11+40
	ldr	r1, .L11+44
	add	r0, sl, r0
	ldr	r2, .L11+48
	bl	robprintfbusy(PLT)
	.loc 1 57 0
	ldr	r0, .L11+52
	.loc 1 58 0
	ldr	r5, .L11+56
	.loc 1 57 0
	add	r0, sl, r0
	mov	r2, r8
	ldr	r1, .L11+60
	bl	robprintfbusy(PLT)
	.loc 1 58 0
	ldr	r2, [r7, r5]
	ldr	r0, .L11+64
	add	r8, r8, #4
	sub	r2, r2, #1
	add	r0, sl, r0
	mov	r1, r8
	bl	robprintfbusy(PLT)
	.loc 1 59 0
	ldr	r0, .L11+68
	ldr	r1, [r7, r5]
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 60 0
	ldr	r0, .L11+72
	.loc 1 64 0
	rsb	r6, r6, #1
	.loc 1 60 0
	add	r0, sl, r0
	bl	robprintfbusy(PLT)
	.loc 1 64 0
	ldr	r3, [r7, r5]
	add	r4, r4, r6
.LVL8:
	rsb	r3, r8, r3
	add	r4, r4, r3
.LVL9:
	.loc 1 86 0
	cmp	r4, #0
	sub	r1, r4, #-67108863
	sub	r1, r1, #66060288
	movge	r1, r4
	mov	r1, r1, asr #20
	.loc 1 87 0
	sub	r4, r4, r1, asl #20
.LVL10:
	add	r2, r4, #1020
	cmp	r4, #0
	add	r2, r2, #3
	.loc 1 91 0
	ldr	r0, .L11+76
	.loc 1 87 0
	movge	r2, r4
	mov	r2, r2, asr #10
	.loc 1 91 0
	add	r0, sl, r0
.LVL11:
	sub	r3, r4, r2, asl #10
	.loc 1 92 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	.loc 1 91 0
	b	robprintfbusy(PLT)
.LVL12:
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC1(GOTOFF)
	.word	33403036
	.word	_DataStart(GOT)
	.word	.LC2(GOTOFF)
	.word	_EndOfProgram(GOT)
	.word	.LC3(GOTOFF)
	.word	426892
	.word	32349164
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	32349168
	.word	32873452
	.word	.LC6(GOTOFF)
	.word	427172
	.word	32873456
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
.LFE4:
	.size	print_memory_status, .-print_memory_status
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"The kernel's stack started at %x but the next stack"
	.ascii	"s start at %x.  Won't start unless there is at leas"
	.ascii	"t 32k buffer room.  This means that the kernel stac"
	.ascii	"k overflowed.\000"
	.align	2
.LC12:
	.ascii	"The kernel stack starts at %x, but the redboot stac"
	.ascii	"k ends at %x.\000"
	.text
	.align	2
	.global	k_InitKernel
	.type	k_InitKernel, %function
k_InitKernel:
.LFB5:
	.loc 1 94 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL13:
	stmfd	sp!, {r4, r5, sl, lr}
.LCFI2:
	.loc 1 95 0
	ldr	r4, .L21
	.loc 1 94 0
	ldr	sl, .L21+4
	.loc 1 95 0
	ldr	r5, [r4, #0]
.LVL14:
	.loc 1 101 0
	ldr	r1, .L21+8
	.loc 1 99 0
	ldr	r3, [r5, #16]
.LVL15:
	.loc 1 101 0
	ldr	r0, .L21+12
	.loc 1 94 0
.L19:
	add	sl, pc, sl
	.loc 1 101 0
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	ldr	r2, .L21+16
	bl	assertf(PLT)
.LVL16:
	.loc 1 104 0
	ldr	r3, [r5, #0]
	ldr	r1, .L21+20
	cmp	r3, r4
	movle	r0, #0
	movgt	r0, #1
	add	r1, sl, r1
	mov	r2, r4
	bl	assertf(PLT)
	.loc 1 109 0
	ldr	r3, .L21+24
	ldr	r1, [r5, #0]
	.loc 1 110 0
	ldr	r2, .L21+28
	ldr	r0, [r5, #4]
	.loc 1 111 0
	ldr	ip, [r5, #12]
	.loc 1 109 0
	str	r1, [r5, r3]
	.loc 1 111 0
	add	r3, r3, #8
	.loc 1 110 0
	str	r0, [r5, r2]
	.loc 1 111 0
	str	ip, [r5, r3]
	mov	r2, #0
.LVL17:
	mov	r3, r5
.L14:
	.loc 1 116 0
	str	r2, [r3, #28]
	.loc 1 114 0
	add	r2, r2, #1
	cmp	r2, #480
	add	r3, r3, #4
	bne	.L14
	.loc 1 118 0
	ldr	r3, .L21+32
	.loc 1 121 0
	add	r4, r5, #20992
	add	r4, r4, #156
	.loc 1 118 0
	str	r3, [r5, #24]
	.loc 1 121 0
	mov	r0, r4
	bl	Scheduler_Initialize(PLT)
.LVL18:
	.loc 1 122 0
	mov	r0, r4
	mov	r1, r5
	bl	Scheduler_InitAndSetKernelTask(PLT)
	.loc 1 125 0
	bl	IRQ_EnableTimer(PLT)
	.loc 1 126 0
	bl	IRQ_EnableTimerVIC2(PLT)
	.loc 1 127 0
	bl	IRQ_SetupUARTInterrupts(PLT)
	.loc 1 131 0
	ldmfd	sp!, {r4, r5, sl, lr}
	.loc 1 130 0
	b	asm_KernelExit(PLT)
.L22:
	.align	2
.L21:
	.word	33403036
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC11(GOTOFF)
	.word	32906220
	.word	32873452
	.word	.LC12(GOTOFF)
	.word	427172
	.word	427176
	.word	479
.LFE5:
	.size	k_InitKernel, .-k_InitKernel
	.align	2
	.global	k_Create
	.type	k_Create, %function
k_Create:
.LFB6:
	.loc 1 133 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL19:
	str	lr, [sp, #-4]!
.LCFI3:
	.loc 1 134 0
	ldr	r3, .L25
	.loc 1 133 0
	mov	r2, r0
	.loc 1 134 0
	ldr	ip, [r3, #0]
.LVL20:
	.loc 1 133 0
	mov	r3, r1
	.loc 1 135 0
	add	r0, ip, #20992
.LVL21:
	add	r0, r0, #156
	mov	r1, ip
.LVL22:
	bl	Scheduler_CreateAndScheduleNewTask(PLT)
.LVL23:
	.loc 1 137 0
	bl	asm_KernelExit(PLT)
	.loc 1 139 0
	mov	r0, #0
	ldr	pc, [sp], #4
.L26:
	.align	2
.L25:
	.word	33403036
.LFE6:
	.size	k_Create, .-k_Create
	.align	2
	.global	k_MyTid
	.type	k_MyTid, %function
k_MyTid:
.LFB7:
	.loc 1 141 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL24:
	stmfd	sp!, {r4, r5, lr}
.LCFI4:
	.loc 1 142 0
	ldr	r3, .L29
	ldr	r5, [r3, #0]
.LVL25:
	.loc 1 143 0
	add	r4, r5, #20992
.LVL26:
	add	r4, r4, #156
	.loc 1 145 0
	mov	r0, r4
	mov	r1, r5
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 147 0
	ldr	r2, [r4, #4]
	.loc 1 149 0
	mov	r0, r4
	.loc 1 147 0
	ldr	r3, [r2, #0]
	.loc 1 149 0
	mov	r1, r5
	.loc 1 147 0
	str	r3, [r2, #88]
	.loc 1 149 0
	bl	Scheduler_SetNextTaskState(PLT)
	.loc 1 151 0
	bl	asm_KernelExit(PLT)
	.loc 1 153 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, pc}
.L30:
	.align	2
.L29:
	.word	33403036
.LFE7:
	.size	k_MyTid, .-k_MyTid
	.align	2
	.global	k_MyParentTid
	.type	k_MyParentTid, %function
k_MyParentTid:
.LFB8:
	.loc 1 155 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL27:
	stmfd	sp!, {r4, r5, lr}
.LCFI5:
	.loc 1 156 0
	ldr	r3, .L33
	ldr	r5, [r3, #0]
.LVL28:
	.loc 1 157 0
	add	r4, r5, #20992
.LVL29:
	add	r4, r4, #156
	.loc 1 159 0
	mov	r0, r4
	mov	r1, r5
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 161 0
	ldr	r2, [r4, #4]
	.loc 1 163 0
	mov	r0, r4
	.loc 1 161 0
	ldr	r3, [r2, #68]
	.loc 1 163 0
	mov	r1, r5
	.loc 1 161 0
	str	r3, [r2, #88]
	.loc 1 163 0
	bl	Scheduler_SetNextTaskState(PLT)
	.loc 1 165 0
	bl	asm_KernelExit(PLT)
	.loc 1 167 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, pc}
.L34:
	.align	2
.L33:
	.word	33403036
.LFE8:
	.size	k_MyParentTid, .-k_MyParentTid
	.align	2
	.global	k_Pass
	.type	k_Pass, %function
k_Pass:
.LFB9:
	.loc 1 169 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL30:
	stmfd	sp!, {r4, r5, lr}
.LCFI6:
	.loc 1 170 0
	ldr	r3, .L37
	ldr	r5, [r3, #0]
.LVL31:
	.loc 1 171 0
	add	r4, r5, #20992
.LVL32:
	add	r4, r4, #156
	.loc 1 173 0
	mov	r1, r5
	mov	r0, r4
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 175 0
	mov	r0, r4
	mov	r2, #0
	ldr	r1, [r4, #4]
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 177 0
	mov	r0, r4
	mov	r1, r5
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 180 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 179 0
	b	asm_KernelExit(PLT)
.L38:
	.align	2
.L37:
	.word	33403036
.LFE9:
	.size	k_Pass, .-k_Pass
	.align	2
	.global	k_Exit
	.type	k_Exit, %function
k_Exit:
.LFB10:
	.loc 1 182 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL33:
	stmfd	sp!, {r4, r5, lr}
.LCFI7:
	.loc 1 183 0
	ldr	r3, .L41
	ldr	r5, [r3, #0]
.LVL34:
	.loc 1 184 0
	add	r4, r5, #20992
.LVL35:
	add	r4, r4, #156
	.loc 1 186 0
	mov	r1, r5
	mov	r0, r4
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 188 0
	mov	r0, r4
	mov	r2, #2
	ldr	r1, [r4, #4]
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 190 0
	mov	r0, r4
	mov	r1, r5
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 193 0
	ldmfd	sp!, {r4, r5, lr}
	.loc 1 192 0
	b	asm_KernelExit(PLT)
.L42:
	.align	2
.L41:
	.word	33403036
.LFE10:
	.size	k_Exit, .-k_Exit
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"Sending a message to zombie task id %d (%x) from ta"
	.ascii	"sk id %d (%x).\012\000"
	.align	2
.LC14:
	.ascii	"k_Send replylen not match!\000"
	.align	2
.LC15:
	.ascii	"k_Send: receive_msg isn't set\000"
	.align	2
.LC16:
	.ascii	"msglen not 100\000"
	.align	2
.LC17:
	.ascii	"Pushed a null message\012\000"
	.align	2
.LC18:
	.ascii	"k_Send: SourceTID=%d, TID %d out of range\012\000"
	.align	2
.LC19:
	.ascii	"k_Send: SourceTID=%d, TID %d does not exist\012\000"
	.text
	.align	2
	.global	k_Send
	.type	k_Send, %function
k_Send:
.LFB11:
	.loc 1 195 0
	@ args = 4, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL36:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI8:
	mov	r8, r0
	.loc 1 196 0
	ldr	r0, .L55
.LVL37:
	.loc 1 201 0
	mov	fp, r8, asl #7
	.loc 1 196 0
	ldr	r9, [r0, #0]
.LVL38:
	.loc 1 195 0
	sub	sp, sp, #24
.LCFI9:
.LVL39:
	.loc 1 197 0
	add	r7, r9, #20992
.LVL40:
	add	r7, r7, #156
	.loc 1 199 0
	ldr	ip, [r7, #4]
	.loc 1 201 0
	add	lr, fp, r7
	ldr	r4, [ip, #0]
	.loc 1 195 0
	ldr	sl, .L55+4
	.loc 1 201 0
	ldr	r6, [lr, #88]
	ldr	r0, [lr, #12]
	.loc 1 199 0
	str	r8, [ip, #112]
	.loc 1 195 0
	str	r1, [sp, #20]
	.loc 1 201 0
	str	r4, [sp, #0]
	ldr	r1, .L55+8
.LVL41:
	.loc 1 195 0
.L52:
	add	sl, pc, sl
	.loc 1 201 0
	ldr	r5, [ip, #80]
	subs	r0, r0, #2
	movne	r0, #1
	.loc 1 195 0
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	.loc 1 201 0
	mov	r2, r8
.LVL42:
	mov	r3, r6
.LVL43:
	add	r1, sl, r1
	str	r5, [sp, #4]
	bl	assertf(PLT)
	.loc 1 203 0
	mov	r0, r7
	mov	r1, r9
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 206 0
	ldr	r2, [sp, #60]
	ldr	r1, .L55+12
	cmp	r2, #16
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 211 0
	mov	r0, r7
	mov	r1, r8
	.loc 1 209 0
	ldr	r6, [r7, #4]
.LVL44:
	.loc 1 211 0
	bl	Scheduler_IsInitedTid(PLT)
	subs	r4, r0, #0
	beq	.L44
.LBB2:
	.loc 1 215 0
	add	r3, r7, #8
	add	r5, r3, fp
.LVL45:
	.loc 1 217 0
	ldr	r2, [r5, #4]
	.loc 1 212 0
	ldr	r3, [r7, #4]
	.loc 1 213 0
	ldr	ip, [sp, #60]
	.loc 1 212 0
	ldr	lr, [sp, #12]
	.loc 1 217 0
	cmp	r2, #3
	.loc 1 213 0
	str	ip, [r3, #100]
	.loc 1 212 0
	str	lr, [r3, #104]
	.loc 1 217 0
	beq	.L53
.LBB3:
	.loc 1 231 0
	add	r1, r9, #1936
	add	r1, r1, #12
	add	r2, r9, #24
	add	r0, r9, #28
	bl	request_memory(PLT)
	.loc 1 233 0
	ldr	ip, [sp, #12]
	ldr	r1, [r6, #0]
	ldr	lr, [sp, #60]
	str	ip, [sp, #0]
	ldr	ip, [sp, #16]
	.loc 1 231 0
	mov	r4, r0
	.loc 1 233 0
	mov	r2, r8
	ldr	r3, [sp, #20]
	stmib	sp, {ip, lr}	@ phole stm
	bl	KernelMessage_Initialize(PLT)
	.loc 1 234 0
	mov	r1, r4
.LVL46:
	add	r0, r5, #12
	bl	Queue_PushEnd(PLT)
.LVL47:
	.loc 1 235 0
	ldr	r1, .L55+16
	mov	r0, r4
.LVL48:
	add	r1, sl, r1
	bl	assert(PLT)
.LVL49:
	.loc 1 237 0
	mov	r0, r7
	ldr	r1, [r7, #4]
	mov	r2, #4
	bl	Scheduler_ChangeTDState(PLT)
	ldr	ip, [r7, #4]
	ldr	r0, [sp, #16]
.LVL50:
.L48:
.LBE3:
.LBE2:
	.loc 1 251 0
	str	r0, [ip, #88]
	.loc 1 252 0
	mov	r1, r9
	mov	r0, r7
.LVL51:
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 254 0
	bl	asm_KernelExit(PLT)
	.loc 1 256 0
	mov	r0, #0
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L53:
.LBB4:
	.loc 1 219 0
	sub	r2, r2, #3
	mov	r0, r7
	mov	r1, r5
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 221 0
	ldr	r2, [sp, #16]
	.loc 1 223 0
	ldr	r1, .L55+20
	.loc 1 221 0
	str	r2, [r5, #88]
	.loc 1 223 0
	add	r1, sl, r1
	ldr	r0, [r5, #96]
	bl	assert(PLT)
	.loc 1 224 0
	ldr	r3, [sp, #16]
	ldr	r1, .L55+24
	cmp	r3, #16
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 225 0
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #16]
	ldr	r0, [r5, #96]
	bl	m_strcpy(PLT)
	.loc 1 228 0
	mov	r0, r7
	mov	r2, #5
	mov	r1, r6
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 229 0
	ldr	ip, [r7, #4]
	ldr	r2, [r5, #108]
	ldr	r3, [ip, #0]
	ldr	r0, [sp, #16]
.LVL52:
	str	r3, [r2, #0]
	b	.L48
.LVL53:
.L44:
.LBE4:
	.loc 1 240 0
	mov	r0, r8
	bl	is_tid_in_range(PLT)
	cmp	r0, #0
	beq	.L54
	.loc 1 245 0
	ldr	r3, [r7, #4]
	ldr	r1, .L55+28
	mov	r0, r4
	ldr	r2, [r3, #0]
	add	r1, sl, r1
	mov	r3, r8
	bl	assertf(PLT)
	ldr	ip, [r7, #4]
	mvn	r0, #1
.LVL54:
	b	.L48
.LVL55:
.L54:
	.loc 1 241 0
	ldr	r3, [r7, #4]
	ldr	r1, .L55+32
	ldr	r2, [r3, #0]
	add	r1, sl, r1
	mov	r3, r8
	bl	assertf(PLT)
	ldr	ip, [r7, #4]
	mvn	r0, #0
.LVL56:
	b	.L48
.L56:
	.align	2
.L55:
	.word	33403036
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC18(GOTOFF)
.LFE11:
	.size	k_Send, .-k_Send
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"k_Receive user space msg len is too small for our m"
	.ascii	"essage\000"
	.align	2
.LC21:
	.ascii	"k_Receive: no message origin\000"
	.align	2
.LC22:
	.ascii	"Task %d (%x) is attempting to receive a message fro"
	.ascii	"m task %d (%x), but task %d is not receive blocked "
	.ascii	"it is in state %d (%s).\000"
	.text
	.align	2
	.global	k_Receive
	.type	k_Receive, %function
k_Receive:
.LFB12:
	.loc 1 258 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL57:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
.LCFI10:
	ldr	sl, .L64
	mov	r5, r1
	.loc 1 259 0
	ldr	r1, .L64+4
.LVL58:
	.loc 1 258 0
.L62:
	add	sl, pc, sl
	sub	sp, sp, #20
.LCFI11:
.LVL59:
	mov	r6, r0
	.loc 1 259 0
	add	r1, sl, r1
	cmp	r2, #15
	movle	r0, #0
	movgt	r0, #1
.LVL60:
	.loc 1 258 0
	mov	r4, r2
	.loc 1 259 0
	bl	assert(PLT)
.LVL61:
	.loc 1 261 0
	ldr	r3, .L64+8
	ldr	r9, [r3, #0]
.LVL62:
	.loc 1 262 0
	add	r7, r9, #20992
.LVL63:
	add	r7, r7, #156
	.loc 1 264 0
	mov	r1, r9
	mov	r0, r7
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 266 0
	ldr	r0, [r7, #4]
	add	r0, r0, #12
	bl	Queue_PopStart(PLT)
	.loc 1 269 0
	ldr	r3, [r7, #4]
	.loc 1 281 0
	ldr	r1, .L64+12
	.loc 1 272 0
	subs	r8, r0, #0
.LVL64:
	.loc 1 274 0
	mov	r2, #3
	.loc 1 281 0
	add	r1, sl, r1
	.loc 1 274 0
	mov	r0, r7
	.loc 1 269 0
	str	r5, [r3, #96]
	.loc 1 270 0
	str	r6, [r3, #108]
	.loc 1 272 0
	beq	.L63
.LVL65:
	.loc 1 281 0
	cmp	r4, #16
	movne	r0, #0
	moveq	r0, #1
.LVL66:
	bl	assert(PLT)
	.loc 1 282 0
	mov	r2, r4
	mov	r0, r5
	add	r1, r8, #8
	bl	m_strcpy(PLT)
	.loc 1 284 0
	ldr	r3, [r8, #0]
	.loc 1 285 0
	ldr	r1, .L64+16
	.loc 1 284 0
	str	r3, [r6, #0]
	.loc 1 285 0
	add	r1, sl, r1
	ldr	r0, [r8, #0]
	bl	assert(PLT)
	.loc 1 287 0
	ldr	r1, [r7, #4]
	ldr	r3, [r8, #28]
	.loc 1 288 0
	ldr	r2, [r1, #0]
	.loc 1 287 0
	str	r3, [r1, #88]
	.loc 1 288 0
	ldr	r5, [r8, #0]
.LVL67:
	ldr	r3, [r1, #80]
	add	r0, r7, r5, asl #7
	ldr	r1, .L64+20
	ldr	r4, [r0, #12]
.LVL68:
	ldr	ip, [sl, r1]
	str	r5, [sp, #0]
	ldr	r1, .L64+24
	ldr	r6, [r0, #88]
.LVL69:
	add	lr, r4, r4, asl #2
	add	ip, ip, lr, asl #2
	cmp	r4, #4
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	str	ip, [sp, #16]
	str	r6, [sp, #4]
	str	r5, [sp, #8]
	str	r4, [sp, #12]
	bl	assertf(PLT)
	.loc 1 290 0
	ldr	r3, [r8, #0]
	add	r1, r7, #8
	add	r1, r1, r3, asl #7
	mov	r2, #5
	mov	r0, r7
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 291 0
	mov	r0, r7
	mov	r1, r9
	bl	Scheduler_SetNextTaskState(PLT)
	.loc 1 292 0
	add	r1, r9, #1936
	add	r1, r1, #12
	mov	r2, r8
	add	r3, r9, #24
	add	r0, r9, #28
	bl	release_memory(PLT)
.LVL70:
.L60:
	.loc 1 294 0
	bl	asm_KernelExit(PLT)
	.loc 1 296 0
	mov	r0, #0
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.LVL71:
.L63:
	.loc 1 274 0
	mov	r1, r3
	bl	Scheduler_ChangeTDState(PLT)
.LVL72:
	.loc 1 275 0
	ldr	r2, [r7, #4]
	mov	r3, #16
	str	r3, [r2, #88]
	.loc 1 278 0
	mov	r0, r7
	mov	r1, r9
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	b	.L60
.L65:
	.align	2
.L64:
	.word	_GLOBAL_OFFSET_TABLE_-(.L62+8)
	.word	.LC20(GOTOFF)
	.word	33403036
	.word	.LC16(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	TASK_STATE_NAMES(GOT)
	.word	.LC22(GOTOFF)
.LFE12:
	.size	k_Receive, .-k_Receive
	.section	.rodata.str1.4
	.align	2
.LC23:
	.ascii	"Impossible state, replying to non reply blocked tas"
	.ascii	"k %d (%x) from task %d (%x).\012\000"
	.align	2
.LC24:
	.ascii	"k_Reply: Insufficient space in destination. Target "
	.ascii	"len=%d, Len=%d\000"
	.align	2
.LC25:
	.ascii	"k_Reply: reply_msg isn't set\000"
	.text
	.align	2
	.global	k_Reply
	.type	k_Reply, %function
k_Reply:
.LFB13:
	.loc 1 298 0
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL73:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI12:
	.loc 1 299 0
	ldr	r3, .L80
	.loc 1 298 0
	ldr	sl, .L80+4
	.loc 1 299 0
	ldr	r8, [r3, #0]
.LVL74:
	.loc 1 298 0
	sub	sp, sp, #12
.LCFI13:
.LVL75:
	.loc 1 300 0
	add	r5, r8, #20992
.LVL76:
	add	r5, r5, #156
	.loc 1 298 0
	mov	r4, r0
.L77:
	add	sl, pc, sl
	str	r1, [sp, #8]
	.loc 1 302 0
	mov	r0, r5
.LVL77:
	mov	r1, r8
.LVL78:
	.loc 1 298 0
	mov	r9, r2
	.loc 1 302 0
	bl	Scheduler_SaveCurrentTaskState(PLT)
.LVL79:
	.loc 1 306 0
	ldr	r3, [r5, #4]
	ldr	r2, [sp, #8]
	.loc 1 307 0
	mov	r1, r4
	.loc 1 306 0
	str	r2, [r3, #104]
	.loc 1 307 0
	mov	r0, r5
	bl	Scheduler_IsInitedTid(PLT)
.LBB5:
	.loc 1 310 0
	ldr	r1, .L80+8
	.loc 1 308 0
	mov	r6, r4, asl #7
	add	fp, r5, #8
.LBE5:
	.loc 1 307 0
	cmp	r0, #0
.LBB6:
	.loc 1 308 0
	add	r7, fp, r6
.LVL80:
	.loc 1 310 0
	add	r3, r6, r5
	mov	r2, r4
	add	r1, sl, r1
.LBE6:
	.loc 1 326 0
	mov	r0, r4
	.loc 1 307 0
	beq	.L67
.LVL81:
.LBB7:
	.loc 1 310 0
	ldr	lr, [r5, #4]
	ldr	r3, [r3, #88]
	ldr	ip, [lr, #0]
	ldr	r0, [r7, #4]
.LVL82:
	str	ip, [sp, #0]
	ldr	r4, [lr, #80]
.LVL83:
	cmp	r0, #5
	movne	r0, #0
	moveq	r0, #1
	str	r4, [sp, #4]
	bl	assertf(PLT)
.LVL84:
	.loc 1 313 0
	ldr	r3, [r7, #4]
	mvn	ip, #2
.LVL85:
	cmp	r3, #5
	beq	.L78
.LVL86:
.L71:
.LBE7:
	.loc 1 333 0
	ldr	r3, [r5, #4]
	.loc 1 335 0
	mov	r0, r5
	mov	r1, r8
	.loc 1 333 0
	str	ip, [r3, #88]
	.loc 1 335 0
	bl	Scheduler_SetNextTaskState(PLT)
.LVL87:
	.loc 1 336 0
	bl	asm_KernelExit(PLT)
	.loc 1 338 0
	mov	r0, #0
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LVL88:
.L67:
	.loc 1 326 0
	bl	is_tid_in_range(PLT)
.LVL89:
	cmp	r0, #0
	mvnne	ip, #1
	mvneq	ip, #0
.LVL90:
	b	.L71
.LVL91:
.L78:
.LBB8:
	.loc 1 315 0
	ldr	ip, [r7, #100]
.LVL92:
	.loc 1 319 0
	ldr	r1, .L80+12
	.loc 1 315 0
	cmp	ip, r9
	.loc 1 319 0
	add	r1, sl, r1
	.loc 1 316 0
	mov	r3, r9
	mov	r0, #0
	mov	r2, ip
	.loc 1 315 0
	bhi	.L79
.LVL93:
	.loc 1 319 0
	ldr	r0, [r7, #104]
	bl	assert(PLT)
.LVL94:
	.loc 1 320 0
	ldr	r1, .L80+16
	cmp	r9, #16
	movne	r0, #0
	moveq	r0, #1
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 321 0
	mov	r2, r9
	ldr	r1, [sp, #8]
	ldr	r0, [r7, #104]
	bl	m_strcpy(PLT)
	.loc 1 322 0
	mov	r2, #0
	mov	r0, r5
	mov	r1, r7
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 323 0
	ldr	r3, [fp, r6]
	mov	r2, #0
	add	r3, r5, r3, asl #7
	mov	ip, r2
.LVL95:
	str	r2, [r3, #120]
	b	.L71
.LVL96:
.L79:
	.loc 1 316 0
	ldr	r1, .L80+20
	add	r1, sl, r1
	bl	assertf(PLT)
.LVL97:
	mvn	ip, #3
.LVL98:
	b	.L71
.L81:
	.align	2
.L80:
	.word	33403036
	.word	_GLOBAL_OFFSET_TABLE_-(.L77+8)
	.word	.LC23(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC24(GOTOFF)
.LBE8:
.LFE13:
	.size	k_Reply, .-k_Reply
	.section	.rodata.str1.4
	.align	2
.LC26:
	.ascii	"More than one task is attempting to block on an eve"
	.ascii	"nt at once.  We don't support this right now.\000"
	.text
	.align	2
	.global	k_AwaitEvent
	.type	k_AwaitEvent, %function
k_AwaitEvent:
.LFB14:
	.loc 1 340 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL99:
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
.LCFI14:
	.loc 1 341 0
	ldr	r3, .L91
	.loc 1 340 0
	ldr	sl, .L91+4
	.loc 1 341 0
	ldr	r8, [r3, #0]
.LVL100:
	.loc 1 340 0
.L90:
	add	sl, pc, sl
	.loc 1 342 0
	add	r7, r8, #20992
.LVL101:
	add	r7, r7, #156
	.loc 1 340 0
	mov	r4, r0
	.loc 1 348 0
	ldr	r6, .L91+8
	.loc 1 344 0
	mov	r1, r8
	mov	r0, r7
.LVL102:
	bl	Scheduler_SaveCurrentTaskState(PLT)
	.loc 1 346 0
	mov	r2, #6
	.loc 1 348 0
	add	r5, r7, r4, asl #2
	.loc 1 346 0
	mov	r0, r7
	ldr	r1, [r7, #4]
	bl	Scheduler_ChangeTDState(PLT)
	.loc 1 347 0
	ldr	r3, [r7, #4]
	.loc 1 348 0
	ldr	r0, [r5, r6]
	ldr	r1, .L91+12
	.loc 1 347 0
	str	r4, [r3, #116]
	.loc 1 348 0
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r1, sl, r1
	bl	assert(PLT)
	.loc 1 349 0
	ldr	r2, [r7, #4]
	.loc 1 352 0
	sub	r4, r4, #2
.LVL103:
	.loc 1 349 0
	ldr	r3, [r2, #0]
	str	r3, [r5, r6]
	.loc 1 352 0
	cmp	r4, #3
	addls	pc, pc, r4, asl #2
	b	.L83
	.p2align 2
.L88:
	b	.L84
	b	.L85
	b	.L86
	b	.L87
.L87:
	.loc 1 363 0
	mov	r0, #1
	bl	IRQ_SetUART2Transmit(PLT)
.L83:
	.loc 1 369 0
	mov	r0, r7
	mov	r1, r8
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 371 0
	bl	asm_KernelExit(PLT)
	.loc 1 373 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L84:
	.loc 1 354 0
	mov	r0, #1
	bl	IRQ_SetUART1Receive(PLT)
	.loc 1 369 0
	mov	r0, r7
	mov	r1, r8
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 371 0
	bl	asm_KernelExit(PLT)
	.loc 1 373 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L85:
	.loc 1 357 0
	mov	r0, #1
	bl	IRQ_SetUART1Transmit(PLT)
	.loc 1 369 0
	mov	r0, r7
	mov	r1, r8
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 371 0
	bl	asm_KernelExit(PLT)
	.loc 1 373 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L86:
	.loc 1 360 0
	mov	r0, #1
	bl	IRQ_SetUART2Receive(PLT)
	.loc 1 369 0
	mov	r0, r7
	mov	r1, r8
	bl	Scheduler_ScheduleAndSetNextTaskState(PLT)
	.loc 1 371 0
	bl	asm_KernelExit(PLT)
	.loc 1 373 0
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L92:
	.align	2
.L91:
	.word	33403036
	.word	_GLOBAL_OFFSET_TABLE_-(.L90+8)
	.word	405748
	.word	.LC26(GOTOFF)
.LFE14:
	.size	k_AwaitEvent, .-k_AwaitEvent
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
	.byte	0x8a
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI3-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
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
	.4byte	.LCFI4-.LFB7
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
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
	.byte	0x4
	.4byte	.LCFI5-.LFB8
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI6-.LFB9
	.byte	0xe
	.uleb128 0xc
	.byte	0x8e
	.uleb128 0x1
	.byte	0x85
	.uleb128 0x2
	.byte	0x84
	.uleb128 0x3
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI7-.LFB10
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
	.4byte	.LCFI8-.LFB11
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x3c
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
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x34
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI12-.LFB13
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x30
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI14-.LFB14
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
.LEFDE24:
	.file 2 "kernel_state.h"
	.file 3 "scheduler.h"
	.file 4 "task_descriptor.h"
	.file 5 "queue.h"
	.file 6 "public_kernel_interface.h"
	.file 7 "message.h"
	.file 8 "train.h"
	.file 9 "buffer.h"
	.file 10 "tasks.h"
	.file 11 "kernel_irq.h"
	.text
.Letext0:
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	0x0
	.4byte	0x0
.LLST2:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST3:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST4:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST5:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST6:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST7:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0x0
	.4byte	0x0
.LLST8:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0x0
	.4byte	0x0
.LLST9:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST10:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -24
	.4byte	.LVL39-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST11:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0x0
	.4byte	0x0
.LLST12:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 20
	.4byte	0x0
	.4byte	0x0
.LLST13:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 16
	.4byte	0x0
	.4byte	0x0
.LLST14:
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL43-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 12
	.4byte	0x0
	.4byte	0x0
.LLST15:
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL52-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL54-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL56-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST16:
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL53-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST17:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL48-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0x0
	.4byte	0x0
.LLST18:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -20
	.4byte	.LVL59-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST19:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0x0
	.4byte	0x0
.LLST20:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0x0
	.4byte	0x0
.LLST21:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL61-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST22:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL65-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL72-.Ltext0
	.4byte	.LFE12-.Ltext0
	.2byte	0x1
	.byte	0x57
	.4byte	0x0
	.4byte	0x0
.LLST23:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL75-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 -12
	.4byte	.LVL75-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	0x0
	.4byte	0x0
.LLST24:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL77-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL81-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL81-.Ltext0
	.4byte	.LVL82-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL83-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL84-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL88-.Ltext0
	.4byte	.LVL89-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL89-.Ltext0
	.4byte	.LVL91-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
.LLST25:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL78-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL78-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	0x0
	.4byte	0x0
.LLST26:
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL79-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL93-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL93-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL94-.Ltext0
	.4byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL97-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x59
	.4byte	0x0
	.4byte	0x0
.LLST27:
	.4byte	.LVL85-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL90-.Ltext0
	.4byte	.LVL92-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL95-.Ltext0
	.4byte	.LVL96-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL98-.Ltext0
	.4byte	.LFE13-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0x0
	.4byte	0x0
.LLST28:
	.4byte	.LVL99-.Ltext0
	.4byte	.LVL102-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL102-.Ltext0
	.4byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0x0
	.4byte	0x0
	.section	.debug_info
	.4byte	0xfcc
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF218
	.byte	0x1
	.4byte	.LASF219
	.4byte	.LASF220
	.uleb128 0x2
	.4byte	0xf2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x5
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
	.byte	0x5
	.byte	0x2f
	.4byte	0x25
	.uleb128 0x5
	.4byte	0x118
	.4byte	.LASF33
	.byte	0x4
	.byte	0x5
	.byte	0x31
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x5
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
	.byte	0x5
	.byte	0x33
	.4byte	0xfd
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x4
	.byte	0x7
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x4
	.byte	0x7
	.uleb128 0x9
	.4byte	0x187
	.4byte	.LASF36
	.2byte	0x1898
	.byte	0x5
	.byte	0x3e
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x5
	.byte	0x3f
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x5
	.byte	0x40
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x5
	.byte	0x41
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x5
	.byte	0x42
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.byte	0x43
	.4byte	0x187
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.4byte	0x198
	.4byte	0x11a
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x621
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x5
	.byte	0x44
	.4byte	0x133
	.uleb128 0x5
	.4byte	0x1f6
	.4byte	.LASF42
	.byte	0x38
	.byte	0x5
	.byte	0x46
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x5
	.byte	0x47
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xa
	.ascii	"end\000"
	.byte	0x5
	.byte	0x48
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x5
	.byte	0x49
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4a
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.byte	0x4b
	.4byte	0x1f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.4byte	0x206
	.4byte	0x11a
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x9
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x5
	.byte	0x4c
	.4byte	0x1a3
	.uleb128 0xe
	.4byte	0x23f
	.4byte	.LASF43
	.4byte	0x31304
	.byte	0x5
	.byte	0x5e
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x5
	.byte	0x5f
	.4byte	0x23f
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x5
	.byte	0x62
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x31300
	.byte	0x0
	.uleb128 0xb
	.4byte	0x24f
	.4byte	0x198
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x1f
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x5
	.byte	0x63
	.4byte	0x211
	.uleb128 0x5
	.4byte	0x2bb
	.4byte	.LASF46
	.byte	0x24
	.byte	0x7
	.byte	0x34
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x7
	.byte	0x35
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF48
	.byte	0x7
	.byte	0x36
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.ascii	"msg\000"
	.byte	0x7
	.byte	0x37
	.4byte	0x2c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x7
	.byte	0x38
	.4byte	0x2d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x7
	.byte	0x39
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x7
	.byte	0x3a
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.byte	0x0
	.uleb128 0xf
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0xb
	.4byte	0x2d2
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0xf
	.byte	0x0
	.uleb128 0x8
	.4byte	.LASF52
	.byte	0x1
	.byte	0x8
	.uleb128 0x10
	.byte	0x4
	.4byte	0x2d2
	.uleb128 0x4
	.4byte	.LASF46
	.byte	0x7
	.byte	0x3c
	.4byte	0x25a
	.uleb128 0x10
	.byte	0x4
	.4byte	0x2f0
	.uleb128 0x11
	.4byte	0x2d2
	.uleb128 0x8
	.4byte	.LASF53
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.4byte	0x333
	.4byte	.LASF54
	.byte	0x4
	.byte	0x6
	.byte	0x13
	.uleb128 0x3
	.4byte	.LASF55
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF56
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF57
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF58
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF59
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF60
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF61
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF54
	.byte	0x6
	.byte	0x1b
	.4byte	0x2fc
	.uleb128 0x8
	.4byte	.LASF62
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	0x37c
	.4byte	.LASF63
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.4byte	.LASF64
	.sleb128 0
	.uleb128 0x3
	.4byte	.LASF65
	.sleb128 1
	.uleb128 0x3
	.4byte	.LASF66
	.sleb128 2
	.uleb128 0x3
	.4byte	.LASF67
	.sleb128 3
	.uleb128 0x3
	.4byte	.LASF68
	.sleb128 4
	.uleb128 0x3
	.4byte	.LASF69
	.sleb128 5
	.uleb128 0x3
	.4byte	.LASF70
	.sleb128 6
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF63
	.byte	0x4
	.byte	0xf
	.4byte	0x345
	.uleb128 0x5
	.4byte	0x49d
	.4byte	.LASF71
	.byte	0x80
	.byte	0x4
	.byte	0x11
	.uleb128 0xa
	.ascii	"id\000"
	.byte	0x4
	.byte	0x12
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x4
	.byte	0x13
	.4byte	0x37c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x4
	.byte	0x14
	.4byte	0xf2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x4
	.byte	0x15
	.4byte	0x206
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x4
	.byte	0x16
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x4
	.byte	0x17
	.4byte	0x49d
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x4
	.byte	0x18
	.4byte	0x49d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x4
	.byte	0x19
	.4byte	0x49d
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.4byte	.LASF79
	.byte	0x4
	.byte	0x1a
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.4byte	.LASF80
	.byte	0x4
	.byte	0x1b
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.4byte	.LASF81
	.byte	0x4
	.byte	0x1c
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x4
	.byte	0x1d
	.4byte	0x2d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.4byte	.LASF83
	.byte	0x4
	.byte	0x1e
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.4byte	.LASF84
	.byte	0x4
	.byte	0x1f
	.4byte	0x2d9
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.4byte	.LASF85
	.byte	0x4
	.byte	0x20
	.4byte	0x49d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x6
	.4byte	.LASF86
	.byte	0x4
	.byte	0x21
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x4
	.byte	0x22
	.4byte	0x333
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x4
	.byte	0x23
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x4
	.byte	0x24
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x2bb
	.uleb128 0x12
	.ascii	"TD\000"
	.byte	0x4
	.byte	0x25
	.4byte	0x387
	.uleb128 0x4
	.4byte	.LASF90
	.byte	0x2
	.byte	0xc
	.4byte	0x4b8
	.uleb128 0xe
	.4byte	0x587
	.4byte	.LASF90
	.4byte	0x684b0
	.byte	0x2
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF91
	.byte	0x2
	.byte	0x13
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF92
	.byte	0x2
	.byte	0x14
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF93
	.byte	0x2
	.byte	0x15
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF94
	.byte	0x2
	.byte	0x16
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.4byte	.LASF95
	.byte	0x2
	.byte	0x17
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.4byte	.LASF96
	.byte	0x2
	.byte	0x18
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.4byte	.LASF97
	.byte	0x2
	.byte	0x19
	.4byte	0x2bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.4byte	.LASF98
	.byte	0x2
	.byte	0x1a
	.4byte	0x73f
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.4byte	.LASF99
	.byte	0x2
	.byte	0x1b
	.4byte	0x750
	.byte	0x3
	.byte	0x23
	.uleb128 0x79c
	.uleb128 0x6
	.4byte	.LASF100
	.byte	0x2
	.byte	0x1c
	.4byte	0x734
	.byte	0x4
	.byte	0x23
	.uleb128 0x529c
	.uleb128 0x6
	.4byte	.LASF101
	.byte	0x2
	.byte	0x1d
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a4
	.uleb128 0x6
	.4byte	.LASF102
	.byte	0x2
	.byte	0x1e
	.4byte	0x118
	.byte	0x4
	.byte	0x23
	.uleb128 0x684a8
	.uleb128 0x6
	.4byte	.LASF103
	.byte	0x2
	.byte	0x1f
	.4byte	0x2bb
	.byte	0x4
	.byte	0x23
	.uleb128 0x684ac
	.byte	0x0
	.uleb128 0x5
	.4byte	0x5b0
	.4byte	.LASF104
	.byte	0x8
	.byte	0x3
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF78
	.byte	0x3
	.byte	0x11
	.4byte	0x118
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF105
	.byte	0x3
	.byte	0x12
	.4byte	0x2ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF104
	.byte	0x3
	.byte	0x13
	.4byte	0x587
	.uleb128 0xe
	.4byte	0x6e5
	.4byte	.LASF106
	.4byte	0x63208
	.byte	0x3
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF107
	.byte	0x3
	.byte	0x16
	.4byte	0x125
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.4byte	.LASF108
	.byte	0x3
	.byte	0x18
	.4byte	0x6e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.4byte	.LASF109
	.byte	0x3
	.byte	0x19
	.4byte	0x6eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.4byte	.LASF110
	.byte	0x3
	.byte	0x1a
	.4byte	0x6fc
	.byte	0x4
	.byte	0x23
	.uleb128 0x31188
	.uleb128 0x6
	.4byte	.LASF111
	.byte	0x3
	.byte	0x1b
	.4byte	0x24f
	.byte	0x4
	.byte	0x23
	.uleb128 0x31dd0
	.uleb128 0x6
	.4byte	.LASF112
	.byte	0x3
	.byte	0x1d
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d4
	.uleb128 0x6
	.4byte	.LASF113
	.byte	0x3
	.byte	0x1e
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630d8
	.uleb128 0x6
	.4byte	.LASF114
	.byte	0x3
	.byte	0x1f
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630dc
	.uleb128 0x6
	.4byte	.LASF115
	.byte	0x3
	.byte	0x20
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e0
	.uleb128 0x6
	.4byte	.LASF116
	.byte	0x3
	.byte	0x21
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e4
	.uleb128 0x6
	.4byte	.LASF117
	.byte	0x3
	.byte	0x22
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630e8
	.uleb128 0x6
	.4byte	.LASF118
	.byte	0x3
	.byte	0x23
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630ec
	.uleb128 0x6
	.4byte	.LASF119
	.byte	0x3
	.byte	0x24
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f0
	.uleb128 0x6
	.4byte	.LASF120
	.byte	0x3
	.byte	0x25
	.4byte	0x714
	.byte	0x4
	.byte	0x23
	.uleb128 0x630f4
	.uleb128 0x6
	.4byte	.LASF121
	.byte	0x3
	.byte	0x26
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x6310c
	.uleb128 0x6
	.4byte	.LASF122
	.byte	0x3
	.byte	0x27
	.4byte	0x724
	.byte	0x4
	.byte	0x23
	.uleb128 0x63110
	.uleb128 0x6
	.4byte	.LASF89
	.byte	0x3
	.byte	0x28
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x63200
	.uleb128 0x6
	.4byte	.LASF123
	.byte	0x3
	.byte	0x29
	.4byte	0x125
	.byte	0x4
	.byte	0x23
	.uleb128 0x63204
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x4a3
	.uleb128 0xb
	.4byte	0x6fc
	.4byte	0x4a3
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x622
	.byte	0x0
	.uleb128 0xb
	.4byte	0x70d
	.4byte	0x70d
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x622
	.byte	0x0
	.uleb128 0x8
	.4byte	.LASF124
	.byte	0x2
	.byte	0x5
	.uleb128 0xb
	.4byte	0x724
	.4byte	0x125
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.byte	0x0
	.uleb128 0xb
	.4byte	0x734
	.4byte	0x5b0
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x1d
	.byte	0x0
	.uleb128 0x4
	.4byte	.LASF106
	.byte	0x3
	.byte	0x2a
	.4byte	0x5bb
	.uleb128 0xb
	.4byte	0x750
	.4byte	0x125
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x1df
	.byte	0x0
	.uleb128 0xb
	.4byte	0x761
	.4byte	0x33e
	.uleb128 0xc
	.4byte	0x12c
	.2byte	0x4aff
	.byte	0x0
	.uleb128 0x13
	.4byte	0x787
	.byte	0x1
	.4byte	.LASF125
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF127
	.byte	0x1
	.byte	0x14
	.4byte	0x787
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x4ad
	.uleb128 0x15
	.4byte	0x7c8
	.byte	0x1
	.4byte	.LASF126
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.4byte	0x118
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x16
	.4byte	.LASF128
	.byte	0x1
	.byte	0x19
	.4byte	0x125
	.4byte	.LLST0
	.uleb128 0x17
	.4byte	.LASF127
	.byte	0x1
	.byte	0x1a
	.4byte	0x787
	.4byte	.LLST1
	.byte	0x0
	.uleb128 0x18
	.4byte	0x872
	.byte	0x1
	.4byte	.LASF129
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0x20
	.4byte	0x787
	.byte	0x1
	.byte	0x57
	.uleb128 0x17
	.4byte	.LASF130
	.byte	0x1
	.byte	0x25
	.4byte	0x2bb
	.4byte	.LLST2
	.uleb128 0x1a
	.4byte	.LASF131
	.byte	0x1
	.byte	0x34
	.4byte	0x2bb
	.uleb128 0x1a
	.4byte	.LASF132
	.byte	0x1
	.byte	0x35
	.4byte	0x2bb
	.uleb128 0x1a
	.4byte	.LASF133
	.byte	0x1
	.byte	0x37
	.4byte	0x2bb
	.uleb128 0x1a
	.4byte	.LASF134
	.byte	0x1
	.byte	0x38
	.4byte	0x2bb
	.uleb128 0x1a
	.4byte	.LASF135
	.byte	0x1
	.byte	0x3e
	.4byte	0x2bb
	.uleb128 0x1a
	.4byte	.LASF136
	.byte	0x1
	.byte	0x3f
	.4byte	0x2bb
	.uleb128 0x17
	.4byte	.LASF137
	.byte	0x1
	.byte	0x40
	.4byte	0x2bb
	.4byte	.LLST3
	.uleb128 0x1a
	.4byte	.LASF138
	.byte	0x1
	.byte	0x56
	.4byte	0x2bb
	.uleb128 0x17
	.4byte	.LASF139
	.byte	0x1
	.byte	0x57
	.4byte	0x2bb
	.4byte	.LLST4
	.uleb128 0x1a
	.4byte	.LASF140
	.byte	0x1
	.byte	0x58
	.4byte	0x2bb
	.byte	0x0
	.uleb128 0x18
	.4byte	0x8be
	.byte	0x1
	.4byte	.LASF141
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0x5f
	.4byte	0x787
	.byte	0x1
	.byte	0x55
	.uleb128 0x1a
	.4byte	.LASF134
	.byte	0x1
	.byte	0x62
	.4byte	0x2bb
	.uleb128 0x17
	.4byte	.LASF142
	.byte	0x1
	.byte	0x63
	.4byte	0x2bb
	.4byte	.LLST5
	.uleb128 0x1b
	.ascii	"i\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x2bb
	.4byte	.LLST6
	.byte	0x0
	.uleb128 0x15
	.4byte	0x908
	.byte	0x1
	.4byte	.LASF143
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.4byte	0x2bb
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x16
	.4byte	.LASF73
	.byte	0x1
	.byte	0x85
	.4byte	0x2bb
	.4byte	.LLST7
	.uleb128 0x16
	.4byte	.LASF144
	.byte	0x1
	.byte	0x85
	.4byte	0x90f
	.4byte	.LLST8
	.uleb128 0x17
	.4byte	.LASF127
	.byte	0x1
	.byte	0x86
	.4byte	0x787
	.4byte	.LLST9
	.byte	0x0
	.uleb128 0x1c
	.4byte	0x90f
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x908
	.uleb128 0x1e
	.4byte	0x94b
	.byte	0x1
	.4byte	.LASF145
	.byte	0x1
	.byte	0x8d
	.4byte	0x2bb
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0x8e
	.4byte	0x787
	.byte	0x1
	.byte	0x55
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x1
	.byte	0x8f
	.4byte	0x94b
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x734
	.uleb128 0x1e
	.4byte	0x987
	.byte	0x1
	.4byte	.LASF146
	.byte	0x1
	.byte	0x9b
	.4byte	0x2bb
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0x9c
	.4byte	0x787
	.byte	0x1
	.byte	0x55
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x1
	.byte	0x9d
	.4byte	0x94b
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x18
	.4byte	0x9b9
	.byte	0x1
	.4byte	.LASF147
	.byte	0x1
	.byte	0xa9
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0xaa
	.4byte	0x787
	.byte	0x1
	.byte	0x55
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x1
	.byte	0xab
	.4byte	0x94b
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x18
	.4byte	0x9eb
	.byte	0x1
	.4byte	.LASF148
	.byte	0x1
	.byte	0xb6
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0xb7
	.4byte	0x787
	.byte	0x1
	.byte	0x55
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x1
	.byte	0xb8
	.4byte	0x94b
	.byte	0x1
	.byte	0x54
	.byte	0x0
	.uleb128 0x1f
	.4byte	0xab6
	.byte	0x1
	.4byte	.LASF149
	.byte	0x1
	.byte	0xc3
	.byte	0x1
	.4byte	0x2bb
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LLST10
	.uleb128 0x20
	.ascii	"tid\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0x2bb
	.4byte	.LLST11
	.uleb128 0x20
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0x2d9
	.4byte	.LLST12
	.uleb128 0x16
	.4byte	.LASF150
	.byte	0x1
	.byte	0xc3
	.4byte	0x2bb
	.4byte	.LLST13
	.uleb128 0x16
	.4byte	.LASF151
	.byte	0x1
	.byte	0xc3
	.4byte	0x2d9
	.4byte	.LLST14
	.uleb128 0x14
	.4byte	.LASF152
	.byte	0x1
	.byte	0xc3
	.4byte	0x2bb
	.byte	0x2
	.byte	0x7d
	.sleb128 60
	.uleb128 0x19
	.4byte	.LASF127
	.byte	0x1
	.byte	0xc4
	.4byte	0x787
	.byte	0x1
	.byte	0x59
	.uleb128 0x19
	.4byte	.LASF100
	.byte	0x1
	.byte	0xc5
	.4byte	0x94b
	.byte	0x1
	.byte	0x57
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x1
	.byte	0xd0
	.4byte	0x2bb
	.4byte	.LLST15
	.uleb128 0x19
	.4byte	.LASF153
	.byte	0x1
	.byte	0xd1
	.4byte	0x6e5
	.byte	0x1
	.byte	0x56
	.uleb128 0x21
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0x17
	.4byte	.LASF154
	.byte	0x1
	.byte	0xd7
	.4byte	0x6e5
	.4byte	.LLST16
	.uleb128 0x22
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x1b
	.ascii	"km\000"
	.byte	0x1
	.byte	0xe7
	.4byte	0xab6
	.4byte	.LLST17
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x2df
	.uleb128 0x23
	.4byte	0xb37
	.byte	0x1
	.4byte	.LASF155
	.byte	0x1
	.2byte	0x102
	.byte	0x1
	.4byte	0x2bb
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LLST18
	.uleb128 0x24
	.ascii	"tid\000"
	.byte	0x1
	.2byte	0x102
	.4byte	0x49d
	.4byte	.LLST19
	.uleb128 0x24
	.ascii	"msg\000"
	.byte	0x1
	.2byte	0x102
	.4byte	0x2d9
	.4byte	.LLST20
	.uleb128 0x25
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x102
	.4byte	0x2bb
	.4byte	.LLST21
	.uleb128 0x26
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x105
	.4byte	0x787
	.byte	0x1
	.byte	0x59
	.uleb128 0x27
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x106
	.4byte	0x94b
	.4byte	.LLST22
	.uleb128 0x26
	.4byte	.LASF156
	.byte	0x1
	.2byte	0x10a
	.4byte	0xab6
	.byte	0x1
	.byte	0x58
	.byte	0x0
	.uleb128 0x23
	.4byte	0xbc6
	.byte	0x1
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x12a
	.byte	0x1
	.4byte	0x2bb
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LLST23
	.uleb128 0x24
	.ascii	"tid\000"
	.byte	0x1
	.2byte	0x12a
	.4byte	0x2bb
	.4byte	.LLST24
	.uleb128 0x25
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x12a
	.4byte	0x2d9
	.4byte	.LLST25
	.uleb128 0x25
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x12a
	.4byte	0x2bb
	.4byte	.LLST26
	.uleb128 0x26
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x12b
	.4byte	0x787
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x12c
	.4byte	0x94b
	.byte	0x1
	.byte	0x55
	.uleb128 0x27
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x130
	.4byte	0x2bb
	.4byte	.LLST27
	.uleb128 0x21
	.4byte	.Ldebug_ranges0+0x18
	.uleb128 0x26
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x134
	.4byte	0x6e5
	.byte	0x1
	.byte	0x57
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.4byte	0xc10
	.byte	0x1
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x154
	.byte	0x1
	.4byte	0x2bb
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x25
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x154
	.4byte	0x333
	.4byte	.LLST28
	.uleb128 0x26
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x155
	.4byte	0x787
	.byte	0x1
	.byte	0x58
	.uleb128 0x26
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x156
	.4byte	0x94b
	.byte	0x1
	.byte	0x57
	.byte	0x0
	.uleb128 0x29
	.4byte	.LASF159
	.byte	0x5
	.byte	0xb
	.4byte	0xc1c
	.sleb128 -1
	.uleb128 0x11
	.4byte	0x2bb
	.uleb128 0x29
	.4byte	.LASF160
	.byte	0x5
	.byte	0xc
	.4byte	0xc1c
	.sleb128 -2
	.uleb128 0xb
	.4byte	0xc3d
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF161
	.byte	0x8
	.byte	0xb
	.4byte	0xc4c
	.4byte	.LASF162
	.uleb128 0x11
	.4byte	0xc2d
	.uleb128 0xb
	.4byte	0xc61
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF163
	.byte	0x8
	.byte	0xc
	.4byte	0xc70
	.4byte	.LASF164
	.uleb128 0x11
	.4byte	0xc51
	.uleb128 0xb
	.4byte	0xc85
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF165
	.byte	0x8
	.byte	0xd
	.4byte	0xc94
	.4byte	.LASF166
	.uleb128 0x11
	.4byte	0xc75
	.uleb128 0xb
	.4byte	0xca9
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF167
	.byte	0x8
	.byte	0xe
	.4byte	0xcb8
	.4byte	.LASF168
	.uleb128 0x11
	.4byte	0xc99
	.uleb128 0x2b
	.4byte	.LASF169
	.byte	0x8
	.byte	0x10
	.4byte	0xc1c
	.byte	0x10
	.uleb128 0xb
	.4byte	0xcdf
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x1a
	.4byte	.LASF170
	.byte	0x8
	.byte	0x6d
	.4byte	0xcea
	.uleb128 0x11
	.4byte	0xcc9
	.uleb128 0x29
	.4byte	.LASF171
	.byte	0x6
	.byte	0x7
	.4byte	0xc1c
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF172
	.byte	0x6
	.byte	0x8
	.4byte	0xc1c
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF173
	.byte	0x6
	.byte	0x9
	.4byte	0xc1c
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF174
	.byte	0x6
	.byte	0xa
	.4byte	0xc1c
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF175
	.byte	0x6
	.byte	0xb
	.4byte	0xc1c
	.sleb128 -2
	.uleb128 0x2b
	.4byte	.LASF176
	.byte	0x6
	.byte	0xc
	.4byte	0xc1c
	.byte	0x2
	.uleb128 0x29
	.4byte	.LASF177
	.byte	0x6
	.byte	0xd
	.4byte	0xc1c
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF178
	.byte	0x6
	.byte	0xe
	.4byte	0xc1c
	.sleb128 -2
	.uleb128 0x29
	.4byte	.LASF179
	.byte	0x6
	.byte	0xf
	.4byte	0xc1c
	.sleb128 -3
	.uleb128 0x29
	.4byte	.LASF180
	.byte	0x6
	.byte	0x10
	.4byte	0xc1c
	.sleb128 -4
	.uleb128 0x2c
	.4byte	.LASF181
	.byte	0x6
	.byte	0x11
	.4byte	0xd7b
	.byte	0x8
	.4byte	0x3fe66666
	.4byte	0x66666666
	.uleb128 0x11
	.4byte	0x2f5
	.uleb128 0xb
	.4byte	0xd96
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x6
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x13
	.byte	0x0
	.uleb128 0x19
	.4byte	.LASF182
	.byte	0x4
	.byte	0x27
	.4byte	0xda7
	.byte	0x5
	.byte	0x3
	.4byte	TASK_STATE_NAMES
	.uleb128 0x11
	.4byte	0xd80
	.uleb128 0x29
	.4byte	.LASF183
	.byte	0x9
	.byte	0x5
	.4byte	0xc1c
	.sleb128 -1
	.uleb128 0x29
	.4byte	.LASF184
	.byte	0x9
	.byte	0x6
	.4byte	0xc1c
	.sleb128 -2
	.uleb128 0xb
	.4byte	0xdd4
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x5
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF185
	.byte	0xa
	.byte	0x6
	.4byte	0xde3
	.4byte	.LASF186
	.uleb128 0x11
	.4byte	0xdc4
	.uleb128 0xb
	.4byte	0xdf8
	.4byte	0x2d2
	.uleb128 0xd
	.4byte	0x12c
	.byte	0x4
	.byte	0x0
	.uleb128 0x2a
	.4byte	.LASF187
	.byte	0xa
	.byte	0x7
	.4byte	0xe07
	.4byte	.LASF188
	.uleb128 0x11
	.4byte	0xde8
	.uleb128 0x29
	.4byte	.LASF189
	.byte	0xb
	.byte	0xd
	.4byte	0xe1c
	.sleb128 -2139029376
	.uleb128 0x11
	.4byte	0xe21
	.uleb128 0x10
	.byte	0x4
	.4byte	0xe27
	.uleb128 0x2d
	.4byte	0x2bb
	.uleb128 0x29
	.4byte	.LASF190
	.byte	0xb
	.byte	0xe
	.4byte	0xe1c
	.sleb128 -2139029372
	.uleb128 0x29
	.4byte	.LASF191
	.byte	0xb
	.byte	0xf
	.4byte	0xe1c
	.sleb128 -2139029368
	.uleb128 0x29
	.4byte	.LASF192
	.byte	0xb
	.byte	0x10
	.4byte	0xe1c
	.sleb128 -2139029364
	.uleb128 0x2b
	.4byte	.LASF193
	.byte	0xb
	.byte	0x11
	.4byte	0xe68
	.byte	0x33
	.uleb128 0x11
	.4byte	0xe27
	.uleb128 0x2b
	.4byte	.LASF194
	.byte	0xb
	.byte	0x12
	.4byte	0xe68
	.byte	0x17
	.uleb128 0x2b
	.4byte	.LASF195
	.byte	0xb
	.byte	0x13
	.4byte	0xe68
	.byte	0x18
	.uleb128 0x2b
	.4byte	.LASF196
	.byte	0xb
	.byte	0x14
	.4byte	0xe68
	.byte	0x19
	.uleb128 0x2b
	.4byte	.LASF197
	.byte	0xb
	.byte	0x15
	.4byte	0xe68
	.byte	0x1a
	.uleb128 0x2b
	.4byte	.LASF198
	.byte	0xb
	.byte	0x16
	.4byte	0xe68
	.byte	0x34
	.uleb128 0x2b
	.4byte	.LASF199
	.byte	0xb
	.byte	0x17
	.4byte	0xe68
	.byte	0x36
	.uleb128 0x29
	.4byte	.LASF200
	.byte	0xb
	.byte	0x18
	.4byte	0xe1c
	.sleb128 -2138308580
	.uleb128 0x29
	.4byte	.LASF201
	.byte	0xb
	.byte	0x19
	.4byte	0xe1c
	.sleb128 -2138243044
	.uleb128 0x29
	.4byte	.LASF202
	.byte	0xb
	.byte	0x1a
	.4byte	0xe1c
	.sleb128 -2146762752
	.uleb128 0x29
	.4byte	.LASF203
	.byte	0xb
	.byte	0x1b
	.4byte	0xe1c
	.sleb128 -2146762740
	.uleb128 0x29
	.4byte	.LASF204
	.byte	0xb
	.byte	0x1c
	.4byte	0xe1c
	.sleb128 -2146762736
	.uleb128 0x29
	.4byte	.LASF205
	.byte	0xb
	.byte	0x1d
	.4byte	0xe1c
	.sleb128 -2146762704
	.uleb128 0x29
	.4byte	.LASF206
	.byte	0xb
	.byte	0x1e
	.4byte	0xe1c
	.sleb128 -2146762732
	.uleb128 0x29
	.4byte	.LASF207
	.byte	0xb
	.byte	0x1f
	.4byte	0xe1c
	.sleb128 -2146762728
	.uleb128 0x29
	.4byte	.LASF208
	.byte	0xb
	.byte	0x20
	.4byte	0xe1c
	.sleb128 -2146762724
	.uleb128 0x29
	.4byte	.LASF209
	.byte	0xb
	.byte	0x21
	.4byte	0xe1c
	.sleb128 -2146697216
	.uleb128 0x29
	.4byte	.LASF210
	.byte	0xb
	.byte	0x22
	.4byte	0xe1c
	.sleb128 -2146697204
	.uleb128 0x29
	.4byte	.LASF211
	.byte	0xb
	.byte	0x23
	.4byte	0xe1c
	.sleb128 -2146697200
	.uleb128 0x29
	.4byte	.LASF212
	.byte	0xb
	.byte	0x24
	.4byte	0xe1c
	.sleb128 -2146697168
	.uleb128 0x29
	.4byte	.LASF213
	.byte	0xb
	.byte	0x25
	.4byte	0xe1c
	.sleb128 -2146697196
	.uleb128 0x29
	.4byte	.LASF214
	.byte	0xb
	.byte	0x26
	.4byte	0xe1c
	.sleb128 -2146697192
	.uleb128 0x29
	.4byte	.LASF215
	.byte	0xb
	.byte	0x27
	.4byte	0xe1c
	.sleb128 -2146697188
	.uleb128 0x2e
	.4byte	.LASF216
	.byte	0x1
	.byte	0xe
	.4byte	0x2bb
	.byte	0x1
	.byte	0x1
	.uleb128 0x2e
	.4byte	.LASF217
	.byte	0x1
	.byte	0x12
	.4byte	0x2bb
	.byte	0x1
	.byte	0x1
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x10
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
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
	.uleb128 0x16
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
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
	.uleb128 0xa
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
	.uleb128 0xa
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x5
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xd8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xfd0
	.4byte	0x761
	.ascii	"print_kernel_state\000"
	.4byte	0x78d
	.ascii	"get_stack_base\000"
	.4byte	0x7c8
	.ascii	"print_memory_status\000"
	.4byte	0x872
	.ascii	"k_InitKernel\000"
	.4byte	0x8be
	.ascii	"k_Create\000"
	.4byte	0x915
	.ascii	"k_MyTid\000"
	.4byte	0x951
	.ascii	"k_MyParentTid\000"
	.4byte	0x987
	.ascii	"k_Pass\000"
	.4byte	0x9b9
	.ascii	"k_Exit\000"
	.4byte	0x9eb
	.ascii	"k_Send\000"
	.4byte	0xabc
	.ascii	"k_Receive\000"
	.4byte	0xb37
	.ascii	"k_Reply\000"
	.4byte	0xbc6
	.ascii	"k_AwaitEvent\000"
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
	.4byte	.LBB4-.Ltext0
	.4byte	.LBE4-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB5-.Ltext0
	.4byte	.LBE5-.Ltext0
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	.LBB7-.Ltext0
	.4byte	.LBE7-.Ltext0
	.4byte	.LBB6-.Ltext0
	.4byte	.LBE6-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF126:
	.ascii	"get_stack_base\000"
.LASF192:
	.ascii	"timer_clear\000"
.LASF117:
	.ascii	"num_receive_blocked\000"
.LASF76:
	.ascii	"stack_pointer\000"
.LASF151:
	.ascii	"reply\000"
.LASF216:
	.ascii	"_DataStart\000"
.LASF98:
	.ascii	"memory_blocks_status\000"
.LASF218:
	.ascii	"GNU C 4.0.2\000"
.LASF94:
	.ascii	"user_proc_spsr\000"
.LASF39:
	.ascii	"current_count\000"
.LASF157:
	.ascii	"k_Reply\000"
.LASF78:
	.ascii	"entry_point\000"
.LASF156:
	.ascii	"message\000"
.LASF97:
	.ascii	"memory_stack_top\000"
.LASF112:
	.ascii	"num_ready\000"
.LASF10:
	.ascii	"PRIORITY_10\000"
.LASF11:
	.ascii	"PRIORITY_11\000"
.LASF12:
	.ascii	"PRIORITY_12\000"
.LASF13:
	.ascii	"PRIORITY_13\000"
.LASF14:
	.ascii	"PRIORITY_14\000"
.LASF15:
	.ascii	"PRIORITY_15\000"
.LASF16:
	.ascii	"PRIORITY_16\000"
.LASF18:
	.ascii	"PRIORITY_18\000"
.LASF19:
	.ascii	"PRIORITY_19\000"
.LASF34:
	.ascii	"unsigned int\000"
.LASF86:
	.ascii	"send_to_tid\000"
.LASF102:
	.ascii	"redboot_lr_value\000"
.LASF113:
	.ascii	"num_active\000"
.LASF71:
	.ascii	"TaskDescriptor\000"
.LASF100:
	.ascii	"scheduler\000"
.LASF17:
	.ascii	"PRIORITY_17\000"
.LASF141:
	.ascii	"k_InitKernel\000"
.LASF166:
	.ascii	"TrSTmr\000"
.LASF181:
	.ascii	"TICK_SIZE\000"
.LASF177:
	.ascii	"ERR_K_TID_OUT_OF_RANGE\000"
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
.LASF49:
	.ascii	"dest_buffer\000"
.LASF26:
	.ascii	"PRIORITY_26\000"
.LASF28:
	.ascii	"PRIORITY_28\000"
.LASF29:
	.ascii	"PRIORITY_29\000"
.LASF115:
	.ascii	"num_send_blocked\000"
.LASF182:
	.ascii	"TASK_STATE_NAMES\000"
.LASF46:
	.ascii	"KernelMessage\000"
.LASF128:
	.ascii	"task_id\000"
.LASF70:
	.ascii	"EVENT_BLOCKED\000"
.LASF193:
	.ascii	"TC3OI\000"
.LASF134:
	.ascii	"kernel_stack_end\000"
.LASF187:
	.ascii	"IDLE_TASK_NAME\000"
.LASF31:
	.ascii	"PRIORITY_31\000"
.LASF81:
	.ascii	"entry_mode\000"
.LASF106:
	.ascii	"Scheduler\000"
.LASF105:
	.ascii	"function_name\000"
.LASF67:
	.ascii	"SEND_BLOCKED\000"
.LASF27:
	.ascii	"PRIORITY_27\000"
.LASF215:
	.ascii	"VIC2SoftIntClear\000"
.LASF186:
	.ascii	"Admin\000"
.LASF202:
	.ascii	"VIC1BaseAddress\000"
.LASF180:
	.ascii	"ERR_K_INSUFFICIENT_SPACE\000"
.LASF183:
	.ascii	"ERR_BUFFER_FULL\000"
.LASF158:
	.ascii	"k_AwaitEvent\000"
.LASF200:
	.ascii	"UART1IntIDIntClr\000"
.LASF132:
	.ascii	"timerirq_stack_end\000"
.LASF61:
	.ascii	"NUM_EVENTS\000"
.LASF107:
	.ascii	"max_tasks\000"
.LASF173:
	.ascii	"ERR_K_DEFAULT\000"
.LASF87:
	.ascii	"event_id\000"
.LASF169:
	.ascii	"LIGHTS_MASK\000"
.LASF50:
	.ascii	"origin_size\000"
.LASF155:
	.ascii	"k_Receive\000"
.LASF41:
	.ascii	"items\000"
.LASF30:
	.ascii	"PRIORITY_30\000"
.LASF93:
	.ascii	"user_proc_return_value\000"
.LASF90:
	.ascii	"KernelState\000"
.LASF203:
	.ascii	"VIC1IntSelect\000"
.LASF75:
	.ascii	"parent_id\000"
.LASF45:
	.ascii	"queues_with_items\000"
.LASF36:
	.ascii	"TaskQueue\000"
.LASF114:
	.ascii	"num_zombie\000"
.LASF25:
	.ascii	"PRIORITY_25\000"
.LASF47:
	.ascii	"origin\000"
.LASF144:
	.ascii	"code\000"
.LASF210:
	.ascii	"VIC2IntSelect\000"
.LASF91:
	.ascii	"user_proc_sp_value\000"
.LASF153:
	.ascii	"current_td\000"
.LASF80:
	.ascii	"return_value\000"
.LASF140:
	.ascii	"unallocated_bytes\000"
.LASF79:
	.ascii	"spsr_register\000"
.LASF118:
	.ascii	"num_event_blocked\000"
.LASF130:
	.ascii	"user_stacks_end\000"
.LASF82:
	.ascii	"receive_msg\000"
.LASF147:
	.ascii	"k_Pass\000"
.LASF109:
	.ascii	"task_descriptors\000"
.LASF52:
	.ascii	"char\000"
.LASF58:
	.ascii	"UART1_TX_EVENT\000"
.LASF191:
	.ascii	"timer_ctrl\000"
.LASF150:
	.ascii	"msglen\000"
.LASF149:
	.ascii	"k_Send\000"
.LASF212:
	.ascii	"VIC2VectAddr\000"
.LASF63:
	.ascii	"TaskState\000"
.LASF74:
	.ascii	"messages\000"
.LASF213:
	.ascii	"VIC2IntEnClear\000"
.LASF131:
	.ascii	"timerirq_stack_base\000"
.LASF44:
	.ascii	"queues\000"
.LASF198:
	.ascii	"INT_UART1\000"
.LASF83:
	.ascii	"reply_len\000"
.LASF207:
	.ascii	"VIC1SoftInt\000"
.LASF64:
	.ascii	"READY\000"
.LASF148:
	.ascii	"k_Exit\000"
.LASF201:
	.ascii	"UART2IntIDIntClr\000"
.LASF188:
	.ascii	"Idle\000"
.LASF195:
	.ascii	"UART1TXINTR1\000"
.LASF133:
	.ascii	"kernel_stack_base\000"
.LASF175:
	.ascii	"ERR_NOT_A_NAME_SERVER\000"
.LASF54:
	.ascii	"EventID\000"
.LASF1:
	.ascii	"PRIORITY_1\000"
.LASF40:
	.ascii	"size\000"
.LASF4:
	.ascii	"PRIORITY_4\000"
.LASF5:
	.ascii	"PRIORITY_5\000"
.LASF6:
	.ascii	"PRIORITY_6\000"
.LASF56:
	.ascii	"CLOCK_TICK_EVENT\000"
.LASF170:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF37:
	.ascii	"item\000"
.LASF35:
	.ascii	"long unsigned int\000"
.LASF143:
	.ascii	"k_Create\000"
.LASF101:
	.ascii	"redboot_sp_value\000"
.LASF163:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF206:
	.ascii	"VIC1IntEnClear\000"
.LASF120:
	.ascii	"has_tasks_event_blocked\000"
.LASF32:
	.ascii	"QueuePriority\000"
.LASF33:
	.ascii	"QueueItem\000"
.LASF199:
	.ascii	"INT_UART2\000"
.LASF69:
	.ascii	"REPLY_BLOCKED\000"
.LASF205:
	.ascii	"VIC1VectAddr\000"
.LASF154:
	.ascii	"target_td\000"
.LASF219:
	.ascii	"private_kernel_interface.c\000"
.LASF204:
	.ascii	"VIC1IntEnable\000"
.LASF60:
	.ascii	"UART2_TX_EVENT\000"
.LASF142:
	.ascii	"current_stack\000"
.LASF0:
	.ascii	"PRIORITY_0\000"
.LASF119:
	.ascii	"num_tasks\000"
.LASF108:
	.ascii	"current_task_descriptor\000"
.LASF2:
	.ascii	"PRIORITY_2\000"
.LASF62:
	.ascii	"unsigned char\000"
.LASF161:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF152:
	.ascii	"replylen\000"
.LASF7:
	.ascii	"PRIORITY_7\000"
.LASF8:
	.ascii	"PRIORITY_8\000"
.LASF57:
	.ascii	"UART1_RX_EVENT\000"
.LASF190:
	.ascii	"timer_val\000"
.LASF220:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF65:
	.ascii	"ACTIVE\000"
.LASF124:
	.ascii	"short int\000"
.LASF176:
	.ascii	"NAMESERVER_TID\000"
.LASF122:
	.ascii	"function_mappings\000"
.LASF103:
	.ascii	"redboot_spsr_value\000"
.LASF164:
	.ascii	"TCmSvr\000"
.LASF73:
	.ascii	"priority\000"
.LASF77:
	.ascii	"link_register\000"
.LASF160:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF138:
	.ascii	"unallocated_megs\000"
.LASF127:
	.ascii	"k_state\000"
.LASF178:
	.ascii	"ERR_K_TID_DOES_NOT_EXIST\000"
.LASF3:
	.ascii	"PRIORITY_3\000"
.LASF110:
	.ascii	"inited_td\000"
.LASF38:
	.ascii	"start\000"
.LASF88:
	.ascii	"schedule_timestamp\000"
.LASF9:
	.ascii	"PRIORITY_9\000"
.LASF99:
	.ascii	"memory_blocks\000"
.LASF214:
	.ascii	"VIC2SoftInt\000"
.LASF68:
	.ascii	"RECEIVE_BLOCKED\000"
.LASF146:
	.ascii	"k_MyParentTid\000"
.LASF167:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF185:
	.ascii	"ADMINISTRATOR_TASK_NAME\000"
.LASF184:
	.ascii	"ERR_BUFFER_EMPTY\000"
.LASF55:
	.ascii	"NULL_EVENT\000"
.LASF217:
	.ascii	"_EndOfProgram\000"
.LASF208:
	.ascii	"VIC1SoftIntClear\000"
.LASF84:
	.ascii	"reply_msg\000"
.LASF172:
	.ascii	"ERR_K_OUT_OF_TD\000"
.LASF85:
	.ascii	"origin_tid\000"
.LASF139:
	.ascii	"unallocated_kibs\000"
.LASF89:
	.ascii	"scheduled_counter\000"
.LASF137:
	.ascii	"total_unallocated\000"
.LASF171:
	.ascii	"ERR_K_INVALID_PRIORITY\000"
.LASF116:
	.ascii	"num_reply_blocked\000"
.LASF96:
	.ascii	"user_proc_entry_mode\000"
.LASF51:
	.ascii	"destination_size\000"
.LASF159:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF174:
	.ascii	"ERR_INVALID_NAME_SERVER\000"
.LASF211:
	.ascii	"VIC2IntEnable\000"
.LASF104:
	.ascii	"FunctionMapping\000"
.LASF72:
	.ascii	"state\000"
.LASF194:
	.ascii	"UART1RXINTR1\000"
.LASF162:
	.ascii	"TrnSvr\000"
.LASF95:
	.ascii	"last_kernel_sp_value\000"
.LASF59:
	.ascii	"UART2_RX_EVENT\000"
.LASF189:
	.ascii	"timer_ldr\000"
.LASF168:
	.ascii	"TrSwMr\000"
.LASF196:
	.ascii	"UART2RXINTR2\000"
.LASF48:
	.ascii	"destination\000"
.LASF165:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF111:
	.ascii	"task_queue\000"
.LASF197:
	.ascii	"UART2TXINTR2\000"
.LASF66:
	.ascii	"ZOMBIE\000"
.LASF43:
	.ascii	"PriorityQueue\000"
.LASF53:
	.ascii	"double\000"
.LASF42:
	.ascii	"MessageQueue\000"
.LASF121:
	.ascii	"functions_registered\000"
.LASF125:
	.ascii	"print_kernel_state\000"
.LASF179:
	.ascii	"ERR_K_TASK_NOT_REPLY_BLOCKED\000"
.LASF209:
	.ascii	"VIC2BaseAddress\000"
.LASF129:
	.ascii	"print_memory_status\000"
.LASF123:
	.ascii	"watchdog_feed_counter\000"
.LASF92:
	.ascii	"user_proc_lr_value\000"
.LASF145:
	.ascii	"k_MyTid\000"
.LASF135:
	.ascii	"unallocated1\000"
.LASF136:
	.ascii	"unallocated2\000"
	.ident	"GCC: (GNU) 4.0.2"
