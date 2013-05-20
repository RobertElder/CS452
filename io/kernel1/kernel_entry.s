.extern k_Create
.extern k_MyTid
.extern k_MyParentTid
.extern k_Pass
.extern k_Exit
.global asm_SwiCallEntry

asm_SwiCallEntry:
/* TODO: Need instructions to pop kernel state off of the stack here. Make sure we don't overwrite r9 */

LDR r9, [lr,#-4]; /*  Put the SWI instruction call in R9.  This contains the kernel function id.  */
MOV r9, r9, LSL #8; /*  Get rid of the high 8 bits by doing a left logical shift of 16 to discard the high bits  */
MOV r9, r9, LSR #6; /*  Only shift back 6 to get the function id times four, so we can jump to the correct branch location */
ADD PC, PC, r9; /*  Use the function id times four to jump to the correct branch for our kernel function */
.4byte	0x000000 /*  Dummy instruction that does not execute because we jump over it so the jump table works correctly */
/*  Do branches without link because the link register (R14_svc) currently stores the return address immediately after the SWI instruction */
B k_Create
B k_MyTid
B k_MyParentTid
B k_Pass
B k_Exit

