.extern k_Create
.extern k_MyTid
.extern k_MyParentTid
.extern k_Pass
.extern k_Exit
.global asm_SwiCallEntry

asm_SwiCallEntry:
/* We don't need to do any poping or pushing of kernel state because all kernel state is stored in a struct at the base of the kernel stack, and we always know this location */

LDR r8, [PC, #28]; /*  Load the base of the kernel stack into SP */
LDR r8, [r8, #0]; /*  The value at the base of the SP is where we want the SP to start */
STR lr, [r8, #4] /*  Save the link register after our kernel state structure */
STR SP, [r8, #8] /*  Save the user stack pointer */
MOV SP, r8 /*  Load the new kernel stack pointer */
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

