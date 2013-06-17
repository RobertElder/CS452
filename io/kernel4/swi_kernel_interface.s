.global robputrbusy
.global irq_handler

/* Common entry/exit for all kernel functions */
.global asm_KernelExit
.global asm_KernelExitAPIMethod
.global asm_SwiCallEntry
.global asm_TimerIRQEntry


.global asm_SetUpIRQStack

/* Kernel functions entry points */
.global asm_KernelInitEntry
.global asm_CreateEntry
.global asm_MyTidEntry
.global asm_MyParentTidEntry
.global asm_PassEntry
.global asm_ExitEntry
.global asm_SendEntry
.global asm_ReceiveEntry
.global asm_ReplyEntry
.global asm_AwaitEventEntry

/* Functions to get/set user process state */
.global asm_GetStoredUserSp
.global asm_GetStoredUserLr
.global asm_GetStoredUserRtn
.global asm_GetStoredUserSpsr
.global asm_GetStoredUserEntryMethod

.global _KernelStackBase
.global _TimerIRQStackBase

asm_KernelInitEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 0;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_CreateEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 1;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_MyTidEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 2;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_MyParentTidEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 3;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_PassEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 4;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_ExitEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 5;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_SendEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 6;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_ReceiveEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 7;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_ReplyEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 8;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_AwaitEventEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 9;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_TimerIRQEntry:
	stmfd	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, lr} /* Remember the state on the irq stack */
	MRS r0, CPSR  /* Save current mode */
	ORR r0, r0, #31 /* Set it to supervisor mode */
	MOV r1, SP /* Remember the irq stack value so we can access it in system mode */
	MSR CPSR, r0 /* Go into system mode */
	ldmfd	r1!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, r12}  /* pop r0-9 into r3-r12*/
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, r12} /* save them on user stack */
	ldmfd	r1!, {r3, r4, r5, r6}  /* pop r10-12, lr into r3-r6 */
	stmfd	sp!, {r3, r4, r5, r6}  
	LDR r1, [PC, #44]; /*  Load the value of the base of the kernel stack into r1 */
	STR SP, [r1, #0] /*  Save the stack pointer directly into the kernel state struct */
	MRS r0, CPSR  /* Save current mode again */
	BIC r0, r0, #31 /* Clear the mode bits */
	ORR r0, r0, #18 /* Set it to irq mode */
	MSR CPSR, r0 /* Restore irq mode */
	MRS r0, SPSR  /* Remember to save the user's cpsr */
	STR r0, [r1, #12] /* Save the user's cpsr, which is now in spsr into the kernel struct */
	STR LR, [r1, #4] /*  Save the user link register directly into the kernel state struct  */
	MOV r0, #1 /* put 1 to indicate entry by interrupt. */
	STR r0, [r1, #20] /* Remember how we entered the kernel so we can exit the same way. */
	BL irq_handler
	B asm_KernelExit
	.4byte 0x1f882f8


asm_KernelExit:
        BL asm_GetStoredUserEntryMethod /* Remember where they came from */
	CMP r8, #0 /* did they enter the kernel via an api call? */
	BEQ asm_KernelExitAPIMethod /* If so use the kernel api exit routine. */
        BL asm_GetStoredUserSpsr
	MSR SPSR, R8
asm_KernelExitInterruptMethod:
	MRS r0, CPSR  /* Save current mode */
	ORR r0, r0, #31 /* Set it to supervisor mode */
	MSR CPSR, r0 /* Go into system mode */
	MOV R2, LR /* The next call will overwrite the lr */
        BL asm_GetStoredUserSp
	MOV LR, R2 /* put user lr back since it is a bank register, and not in saved state */ 
	MOV SP, R8 /* Put back user's stack value */
	MOV r1, SP /* Save user sp and pop it last */
	ADD SP, SP, #56 /* Simulate poping user state off which we do later. */
	MRS r0, CPSR  /* Save current mode again */
	BIC r0, r0, #31 /* Clear the mode bits */
	ORR r0, r0, #18 /* Set it to irq mode */
	MSR CPSR, r0 /* Restore irq mode */
	ADD SP, SP, #56 /* Simulate poping the irq stack of the user proc state it stored. */
	ldmfd   r1!, {r10, r11, r12, lr} /* Get the state from the user stack */
	ldmfd   r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9} /* Get the state from the user stack */
	SUB LR, LR, #4
	MOVS pc, LR
	
asm_KernelExitAPIMethod:
	/* Put the spsr, return value, LR and SP back for the user process. */
        BL asm_GetStoredUserSpsr
	MSR SPSR, R8
        MOV r0, R8;
        BL asm_GetStoredUserRtn 
	MOV R0, R8
	/* --enter system */
	MRS r7, CPSR  /* Save current mode */
	MRS r6, SPSR /* determine what was last mode */
	AND r5, r6, #31  /* only want the mode bits */
	MOV r6, r7 /* Assume we want supervisor  */
	CMP r5, #19  /* did they come from supervisor mode? */
	BEQ DONOTSWITCHTOSYSTEM1
	ORR r6, r7, #31 /* Go into sytem mode to get user sp */
	DONOTSWITCHTOSYSTEM1:
	MSR CPSR, r6
        BL asm_GetStoredUserSp
	MOV SP, R8 /* Update their stack value, so when we return the SP is correct */
	MSR CPSR, r7
	/* --leave system */
        BL asm_GetStoredUserLr /* Do this one last so we don't overwrite LR with BL asm_...*/
	MOV LR, R8
	
	/* I think this next instruction does a jump to the return address, AND updates the CPSR register
	with the value from the SPSR register all at once.*/
	MOVS PC,LR;  /* MOV{S} documentation:
	S Sets the S bit (bit[20]) in the instructio to 1 and specifies that the instruction updates the
	CPSR. If S is omitted, the S bit is set to 0 and the CPSR is not changed by the instruction.
	Two types of CPSR update can occur when S is specified:
		- If <Rd> is not R15, the N and Z flags are set according to the value moved (post-shift
	if a shift is specified), and the C flag is set to the carry output bit generated by the
	shifter (see Addressing Mode 1 - Data-processing operands on page A5-2). The V
	flag and the rest of the CPSR are unaffected.
		- If <Rd> is R15 (R15 is PC), the SPSR of the current mode is copied to the CPSR. This form of the
	instruction is UNPREDICTABLE if executed in User mode or System mode, because
	these modes do not have an SPSR.  */

	/* Interrups are now enabled!!! */

asm_SetUpIRQStack:
MRS r7, CPSR  /* Save current mode */
AND r6, r6, #0 /*  clear the register */
ORR r6, r6, #18 /*  Set mode bit to 18 for irq mode */
MSR CPSR, r6
LDR SP, [PC, #4] /* Load the value that we want for the IRQ stack */
MSR CPSR, r7 /* Restore current mode */
BX LR
_TimerIRQStackBase:
.4byte	0x00000000  /*  In kern.c we will set this to the value it needs to be */

asm_GetStoredUserEntryMethod:
LDR r8, [PC, #172] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #20]  /* get return value */
BX LR

asm_GetStoredUserSpsr:
LDR r8, [PC, #156] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #12]  /* get return value */
BX LR

asm_GetStoredUserRtn:
LDR r8, [PC, #140] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #8]  /* get return value */
BX LR

asm_GetStoredUserSp:
LDR r8, [PC, #124] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #0]  /* get sp*/
BX LR

asm_GetStoredUserLr:
LDR r8, [PC, #108] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #4]  /* get lr */
BX LR

asm_SwiCallEntry:
/* We don't need to do any poping or pushing of kernel state because all kernel state is stored in a struct at the base of the kernel stack, and we always know this location */

LDR r8, [PC, #92]; /*  Load the value of the base of the kernel stack into r8 */
LDR r8, [r8, #0]; /*  The value at the base of the SP is where we want the SP to start, after the kernel state struct */
	/* --enter system */
MRS r7, CPSR  /* Save current mode */
MRS r6, SPSR /* determine what was last mode */
AND r5, r6, #31  /* only want the mode bits */
MOV r6, r7 /* Assume we want supervisor  */
CMP r5, #19  /* did they come from supervisor mode? */
BEQ DONOTSWITCHTOSYSTEM2
ORR r6, r7, #31 /* Go into sytem mode to get user sp */
DONOTSWITCHTOSYSTEM2:
MSR CPSR, r6
STR SP, [r8, #0] /*  Save the stack pointer directly into the kernel state struct */
MSR CPSR, r7
	/* --leave system */
STR LR, [r8, #4] /*  Save the user link register directly into the kernel state struct  */
MRS SP, SPSR /*  The stack pointer has been saved already, use sp as a temp register to get the spsr */
STR SP, [r8, #12] /* Save the user's cpsr, which is now in spsr into the kernel struct */
MOV SP, r8 /*  Load the new kernel stack pointer */
STR SP, [r8, #16] /* remember what the kernel stack pointer is so we can check it */
MOV r7, #0 /* put 0 r7 for entry mode. */
STR r7, [r8, #20] /* Remember how we entered the kernel so we can exit the same way. */
LDR r7, [fp, #4] /* Put the 5th argument of the calling function into r7 */
stmfd sp!, {r7}  /* Push the 5th argument on the stack, so the compiler can find it. */

LDR r9, [lr,#-4]; /*  Put the SWI instruction call in R9.  This contains the kernel function id.  */
MOV r9, r9, LSL #8; /*  Get rid of the high 8 bits by doing a left logical shift of 16 to discard the high bits  */
MOV r9, r9, LSR #6; /*  Only shift back 6 to get the function id times four, so we can jump to the correct branch location */
ADD PC, PC, r9; /*  Use the function id times four to jump to the correct branch for our kernel function */
_KernelStackBase:
.4byte	0x00000000 /*  Dummy instruction that does not execute because we jump over it so the jump table works correctly.  Might as well use it to store the address of the base of the kernel stack.  We will set this in our main program  */
/*  Do branches without link because the link register (R14_svc) currently stores the return address immediately after the SWI instruction */
B k_InitKernel
B k_Create
B k_MyTid
B k_MyParentTid
B k_Pass
B k_Exit
B k_Send
B k_Receive
B k_Reply
B k_AwaitEvent

