#ifndef ANSI_H_
#define ANSI_H_

typedef enum ANSIColor {
	BLACK = 0,
	RED = 1,
	GREEN = 2,
	YELLOW = 3,
	BLUE = 4,
	MAGENTA = 5,
	CYAN = 6,
	WHITE = 7,
} ANSIColor;

typedef enum ANSIStyle {
	NORMAL_STYLE = 0,
	BOLD_STYLE = 1,
	REVERSE_STYLE = 7,
	FAINT_STYLE = 2,
	UNDERLINE_STYLE = 4,
	BLINK_STYLE = 5,
} ANSIStyle;

typedef enum ClearType {
	CLEAR_TO_END=0,
	CLEAR_TO_START=1,
	CLEAR_ALL=2,
} ClearType;

void ANSI_ResetColor();
void ANSI_Color(ANSIColor text, ANSIColor background);
void ANSI_Style(ANSIStyle style);
void ANSI_ClearScreen(ClearType how);
void ANSI_ClearLine(ClearType how);
void ANSI_Cursor(int row, int col);
void ANSI_CursorUp(int cells);
void ANSI_CursorDown(int cells);
void ANSI_CursorForward(int cells);
void ANSI_CursorBackward(int cells);
void ANSI_CursorNextLine(int lines);
void ANSI_CursorPreviousLine(int lines);
void ANSI_CursorCol(int col);
void ANSI_SaveCursor();
void ANSI_RestoreCursor();
void ANSI_GetCursor();

#endif /* ANSI_H_ */
