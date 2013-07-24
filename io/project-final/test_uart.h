#ifndef TEST_UART_H
#define TEST_UART_H
#include "ts7200.h"
#include "robio.h"

volatile static int * const UART1DATA = (int*) (UART1_BASE + UART_DATA_OFFSET);
volatile static int * const UART2DATA = (int*) (UART2_BASE + UART_DATA_OFFSET);
volatile static int * const UART1Flag = (int*) (UART1_BASE + UART_FLAG_OFFSET);
volatile static int * const UART2Flag = (int*) (UART2_BASE + UART_FLAG_OFFSET);

void TEST_UART();

typedef struct io_status{
	int CTS;	
	int DCD;	
	int DSR;	
	int TXBUSY;	
	int RXFE;	
	int TXFF;	
	int RXFF;	
	int TXFE;	
}io_status;

#endif
