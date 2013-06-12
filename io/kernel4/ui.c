#include "ui.h"
#include "public_kernel_interface.h"
#include "ansi.h"
#include "queue.h"
#include "robio.h"
#include "random.h"

void UIServer_Start() {
	int tid = Create(NORMAL, &UIRender_Start);
	assert(tid, "UIRender_Start tid 0");
	
	Exit();
}

void UIRender_Start() {
	RNG rng;
	RNG_Initialize(&rng, MyTid());

	while(1) {
		ANSI_Cursor(1, 1);
		ANSI_Color(WHITE, BLUE);
		ANSI_ClearScreen(CLEAR_ALL);
		PutString(COM2, "> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <");
		ANSI_CursorNextLine(1);
		PutString(COM2, "The time now is %d", (int)TimeSeconds());
		ANSI_CursorNextLine(1);
		PutString(COM2, "Random number = %d", RNG_GetRange(&rng, 0, 1000000));
		
		DelaySeconds(1);
	}
	
	Exit();
}

