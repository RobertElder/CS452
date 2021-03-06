.global robputrbusy

/* Common entry/exit for all kernel functions */
.global asm_KernelExit
.global asm_SwiCallEntry

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

/* Functions to get/set user process state */
.global asm_GetStoredUserSp
.global asm_GetStoredUserLr
.global asm_GetStoredUserRtn
.global asm_GetStoredUserSpsr


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

/*  This function executes when exiting from all kernel functions */
asm_KernelExit:
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
	MOV SP, R8
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

asm_GetStoredUserSpsr:
LDR r8, [PC, #144] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #12]  /* get return value */
BX LR

asm_GetStoredUserRtn:
LDR r8, [PC, #128] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #8]  /* get return value */
BX LR

asm_GetStoredUserSp:
LDR r8, [PC, #112] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #0]  /* get sp*/
BX LR

asm_GetStoredUserLr:
LDR r8, [PC, #96] /* load base stack pointer address */
LDR r8, [r8, #0] /* load the address of after the kernel state structure */
LDR r8, [r8, #4]  /* get lr */
BX LR

asm_SwiCallEntry:
/* We don't need to do any poping or pushing of kernel state because all kernel state is stored in a struct at the base of the kernel stack, and we always know this location */

LDR r8, [PC, #80]; /*  Load the value of the base of the kernel stack into r8 */
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
LDR r7, [fp, #4] /* Put the 5th argument of the calling function into r7 */
stmfd sp!, {r7}  /* Push the 5th argument on the stack, so the compiler can find it. */

LDR r9, [lr,#-4]; /*  Put the SWI instruction call in R9.  This contains the kernel function id.  */
MOV r9, r9, LSL #8; /*  Get rid of the high 8 bits by doing a left logical shift of 16 to discard the high bits  */
MOV r9, r9, LSR #6; /*  Only shift back 6 to get the function id times four, so we can jump to the correct branch location */
ADD PC, PC, r9; /*  Use the function id times four to jump to the correct branch for our kernel function */
.4byte	0x01500000 /*  Dummy instruction that does not execute because we jump over it so the jump table works correctly.  Might as well use it to store the address of the base of the kernel stack  */
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

