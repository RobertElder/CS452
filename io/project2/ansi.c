#include "ansi.h"
#include "robio.h"
#include "public_kernel_interface.h"

#ifdef ANSI
void ANSI_ResetColor() {
	PutString(COM2, "\x1b[0m");
}

void ANSI_Color(ANSIColor text, ANSIColor background) {
	PutString(COM2, "\x1b[3%d;4%dm", text, background);
}

void ANSI_Style(ANSIStyle style) {
	PutString(COM2, "\x1b[");

	if (style) {
		int style2 = style;

		while (1) {
			if (style2 & BOLD_STYLE) {
				PutString(COM2, "%d", BOLD_STYLE_CODE);
				style2 &= ~BOLD_STYLE;
			} else if (style2 & REVERSE_STYLE) {
				PutString(COM2, "%d", REVERSE_STYLE_CODE);
				style2 &= ~REVERSE_STYLE;
			} else if (style2 & FAINT_STYLE) {
				PutString(COM2, "%d", FAINT_STYLE_CODE);
				style2 &= ~FAINT_STYLE;
			} else if (style2 & UNDERLINE_STYLE) {
				PutString(COM2, "%d", UNDERLINE_STYLE_CODE);
				style2 &= ~UNDERLINE_STYLE;
			} else if (style2 & BLINK_STYLE) {
				PutString(COM2, "%d", BLINK_STYLE_CODE);
				style2 &= ~BLINK_STYLE;
			} else {
				assert(0, "ANSI_Style unknown style");
			}

			if (style2) {
				PutString(COM2, ";");
			} else {
				PutString(COM2, "m");
				break;
			}
		}
	} else {
		PutString(COM2, "22;24;25;27m");
	}
}

void ANSI_ClearScreen(ClearType how) {
	PutString(COM2, "\x1b[%dJ", how);
}

void ANSI_ClearLine(ClearType how) {
	PutString(COM2, "\x1b[%dK", how);
}

void ANSI_Cursor(int row, int col) {
	PutString(COM2, "\x1b[%d;%dH", row, col);
}

void ANSI_CursorUp(int cells) {
	PutString(COM2, "\x1b[%dA", cells);
}

void ANSI_CursorDown(int cells) {
	PutString(COM2, "\x1b[%dB", cells);
}

void ANSI_CursorForward(int cells) {
	PutString(COM2, "\x1b[%dC", cells);
}

void ANSI_CursorBackward(int cells) {
	PutString(COM2, "\x1b[%dD", cells);
}

void ANSI_CursorNextLine(int lines) {
	PutString(COM2, "\x1b[%dE", lines);
}

void ANSI_CursorPreviousLine(int lines) {
	PutString(COM2, "\x1b[%dF", lines);
}

void ANSI_CursorCol(int col) {
	PutString(COM2, "\x1b[%dG", col);
}

void ANSI_SaveCursor() {
	PutString(COM2, "\x1b[s");
}

void ANSI_RestoreCursor() {
	PutString(COM2, "\x1b[u");
}

void ANSI_GetCursor() {
	PutString(COM2, "\x1b[6n");
}

void ANSI_ClearCell(int cells) {
	int i;
	for (i = 0; i < cells; i++) {
		Putc(COM2, ' ');
	}
	ANSI_CursorBackward(cells);
}

void ANSI_SetScrollRegion(int first_row, int last_row) {
	PutString(COM2, "\x1b[%d;%dr", first_row, last_row);
}

void ANSI_SetScrollRegionAll() {
	PutString(COM2, "\x1b[r");
}

#else
void ANSI_ResetColor(){}
void ANSI_Color(ANSIColor text, ANSIColor background){}
void ANSI_Style(ANSIStyle style){}
void ANSI_ClearScreen(ClearType how){}
void ANSI_ClearLine(ClearType how){}
void ANSI_Cursor(int row, int col){}
void ANSI_CursorUp(int cells){}
void ANSI_CursorDown(int cells){}
void ANSI_CursorForward(int cells){}
void ANSI_CursorBackward(int cells){}
void ANSI_CursorNextLine(int lines){}
void ANSI_CursorPreviousLine(int lines){}
void ANSI_CursorCol(int col){}
void ANSI_SaveCursor(){}
void ANSI_RestoreCursor(){}
void ANSI_GetCursor(){}
void ANSI_ClearCell(int cells){}
void ANSI_SetScrollRegion(int first_row, int last_row){}
void ANSI_SetScrollRegionAll(){}
#endif

