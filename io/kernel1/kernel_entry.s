.extern k_Create
.extern k_MyTid
.extern k_MyParentTid
.extern k_Pass
.extern k_Exit

/* TODO: Need instructions to pop kernel state off of the stack here. Make sure we don't overwrite r10 */



LDR r10, [lr,#(-4)]; /*  Put the SWI instruction call in R10 */
MOV r10, r10, LSL #16; /*  Get rid of the high 16 bits by doing a left logical shift of 16 to discard the high bits  */
MOV r10, r10, LSR #14; /*  Only shift back 14 to get the function id times four, so we can jump to the correct branch location */
ADD PC, PC, r10; /*  Use the function id times four to jump to the correct branch for our kernel function */
B k_Create
B k_MyTid
B k_MyParentTid
B k_Pass
B k_Exit

