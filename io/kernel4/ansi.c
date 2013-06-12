#include "ansi.h"
#include "robio.h"

void ANSI_ResetColor() {
	//\x1b[0m
}

void ANSI_Color(ANSIColor text, ANSIColor background) {
	//\x1b[3%d;4%dm
}

void ANSI_Style(ANSIStyle style) {
	//\x1b[

	if (style) {
		int style2 = style;

		while (1) {
			if (style2 & BOLD_STYLE) {
				//%d
				style2 ^= BOLD_STYLE;
			} else if (style2 & REVERSE_STYLE) {
				//%d
				style2 ^= REVERSE_STYLE;
			} else if (style2 & FAINT_STYLE) {
				//%d
				style2 ^= FAINT_STYLE;
			} else if (style2 & UNDERLINE_STYLE) {
				//%d
				style2 ^= UNDERLINE_STYLE;
			} else if (style2 & BLINK_STYLE) {
				//%d
				style2 ^= BLINK_STYLE;
			} else {
				assert(0, "ANSI_Style unknown style");
			}

			if (style2) {
				//;
			} else {
				//m
			}
		}
	} else {
		//0m
	}
}

void ANSI_ClearScreen(ClearType how) {
	//\x1b[%dJ
}

void ANSI_ClearLine(ClearType how) {
	//\x1b[%dK
}

void ANSI_Cursor(int row, int col) {
	//\x1b[%d;%dH
}

void ANSI_CursorUp(int cells) {
	//\x1b[%dA
}

void ANSI_CursorDown(int cells) {
	//\x1b[%dB
}

void ANSI_CursorForward(int cells) {
	//\x1b[%dC
}

void ANSI_CursorBackward(int cells) {
	//\x1b[%dD
}

void ANSI_CursorNextLine(int lines) {
	//\x1b[%dE
}

void ANSI_CursorPreviousLine(int lines) {
	//\x1b[%dF
}

void ANSI_CursorCol(int col) {
	//\x1b[%dG
}

void ANSI_SaveCursor() {
	//\x1b[s
}

void ANSI_RestoreCursor() {
	//\x1b[u
}

void ANSI_GetCursor() {
	//\x1b[6n
}

