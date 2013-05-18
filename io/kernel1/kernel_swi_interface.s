.global asm_CreateEntry
.global asm_MyTidEntry
.global asm_MyParentTidEntry
.global asm_PassEntry
.global asm_ExitEntry

asm_CreateEntry:
	SWI 1;
	BX lr;
asm_MyTidEntry:
	SWI 2;
	BX lr;
asm_MyParentTidEntry:
	SWI 3;
	BX lr;
asm_PassEntry:
	SWI 4;
	BX lr;
asm_ExitEntry:
	SWI 5;
	BX lr;
