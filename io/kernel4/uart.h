#include "buffer.h"
#include "ts7200.h"

#ifndef UART_H_
#define UART_H_

static const char const KEYBOARD_INPUT_SERVER_NAME[] = "KbISvr";
static const char const KEYBOARD_OUTPUT_SERVER_NAME[] = "KbOSvr";
static const char const TRAIN_INPUT_SERVER_NAME[] = "TrISvr";
static const char const TRAIN_OUTPUT_SERVER_NAME[] = "TrOSvr";

typedef struct Channel {
	unsigned int channel;
	unsigned int speed;
	CharBuffer char_buffer;
	
} Channel;

typedef struct UARTBootstrapTask {
	Channel terminal_channel;
	Channel train_channel;
} UARTBootstrapTask;

void UARTBootstrapTask_Start();

void UARTBootstrapTask_Initialize(UARTBootstrapTask * uart);

void Channel_SetFifo( Channel * channel, int state );

void Channel_SetSpeed( Channel * channel);

void KeyboardInputServer_Start();

void ScreenOutputServer_Start();

void TrainInputServer_Start();

void TrainOutputServer_Start();

#endif
