.global asm_CreateEntry
.global asm_MyTidEntry
.global asm_MyParentTidEntry
.global asm_PassEntry
.global asm_ExitEntry
.global robputrbusy

.global asm_KernelExit

asm_CreateEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 0;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_MyTidEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 1;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_MyParentTidEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 2;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_PassEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 3;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}
asm_ExitEntry:
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, ip, lr}
	SWI 4;
	ldmfd	sp, {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, fp, sp, pc}

/*  This function executes when exiting from all kernel functions */
asm_KernelExit:
	/* TODO: Need instructions to pop kernel state off of the stack here. */

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

