#include "buffer.h"
#include "ts7200.h"
#include "message.h"

#ifndef UART_H_
#define UART_H_

static const char const KEYBOARD_INPUT_SERVER_NAME[] = "KbISvr";
static const char const SCREEN_OUTPUT_SERVER_NAME[] = "KbOSvr";
static const char const TRAIN_INPUT_SERVER_NAME[] = "TrISvr";
static const char const TRAIN_OUTPUT_SERVER_NAME[] = "TrOSvr";

static int * const UART1DATA = (int*) (UART1_BASE + UART_DATA_OFFSET);
static int * const UART2DATA = (int*) (UART2_BASE + UART_DATA_OFFSET);

typedef struct Channel {
	unsigned int channel;
	unsigned int speed;
} Channel;

typedef struct UARTBootstrapTask {
	Channel terminal_channel;
	Channel train_channel;
} UARTBootstrapTask;

typedef enum UARTServerState {
	UARTSS_SHUTDOWN,
	UARTSS_WAITING,
	UARTSS_READY,
} UARTServerState;

typedef struct ScreenOutputServer {
	CharBuffer char_buffer;
	int data;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	UARTServerState state;
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	CharMessage * char_message;
	int notifier_tid;
} ScreenOutputServer;

typedef struct TrainOutputServer {
	CharBuffer char_buffer;
	int data;
	char receive_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	int source_tid;
	UARTServerState state;
	GenericMessage * receive_message;
	GenericMessage * reply_message;
	CharMessage * char_message;
	int notifier_tid;
} TrainOutputServer;

void UARTBootstrapTask_Start();

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart);

void Channel_SetFifo( Channel * channel, int state );

void Channel_SetSpeed( Channel * channel);

void KeyboardInputServer_Start();

void ScreenOutputServer_Start();

void ScreenOutputServer_Initialize(ScreenOutputServer * server);

void ScreenOutputServer_SendData(ScreenOutputServer * server);

void TrainInputServer_Start();

void TrainOutputServer_Start();

void TrainOutputServer_Initialize(TrainOutputServer * server);

void TrainOutputServer_SendData(TrainOutputServer * server);

#endif
