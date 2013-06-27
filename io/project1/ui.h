#include "message.h"
#include "train.h"
#include "maps/map.h"
#include "maps/map_a.h"
#include "maps/map_b.h"
#include "ansi.h"

#ifndef UI_H_
#define UI_H_

#define UI_SERVER_COMMAND_BUFFER_SIZE 80

static const char const UI_SERVER_NAME[] = "UISvr";
static const char const UI_TIMER_NAME[] = "UITmr";
static const char const UI_SERVER_HEADER[] = "> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <";
static const int const SENSOR_TABLE_ROW_OFFSET = 5;
static const int const SENSOR_TABLE_COL_OFFSET = 1;
static const int const MAP_ROW_OFFSET = 5;
static const int const MAP_COL_OFFSET = 20;
static const int const ENGINE_STATUS_ROW_OFFSET = 23;
static const int const ENGINE_STATUS_COL_OFFSET = 1;

typedef struct UIMessage {
	MessageType message_type;
	int row;
} UIMessage;

typedef struct UIServer {
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	unsigned int print_message_count;
	short dirty;
	char command_buffer[UI_SERVER_COMMAND_BUFFER_SIZE];
	unsigned int command_buffer_index;
	int sensor_bit_flags_cache[NUM_SENSOR_MODULES];
	TrainMap train_map_a;
	TrainMap train_map_b;
	TrainMap * current_train_map;
	int train_server_tid;
	SwitchState switch_states_cache[NUM_SWITCHES];
	ANSIColor foreground_color;
	ANSIColor background_color;
} UIServer;

void UIServer_Start();

void UIServer_Initialize(UIServer * server);

void UIServer_Render(UIServer * server);

void UIServer_PrintTime(UIServer * server);

void UIServer_PrintCommandLine(UIServer * server);

void UIServer_ProcessKeystroke(UIServer * server, char c);

void UIServer_RunCommand(UIServer * server);

void UIServer_ResetCommandBuffer(UIServer * server);

void UIServer_PrintCommandHelp(UIServer * server);

void UIServer_HandleTrainCommand(UIServer * server);

void UIServer_HandleReverseCommand(UIServer * server);

void UIServer_HandleSwitchCommand(UIServer * server);

void UIServer_HandleMapCommand(UIServer * server);

void UIServer_HandleTimeStopCommand(UIServer * server);

void UIServer_HandleSetTrainCommand(UIServer * server);

void UIServer_PrintSensors(UIServer * server);

void UIServer_PrintMap(UIServer * server);

void UIServer_PrintSwitches(UIServer * server);

void UIServer_PrintTrainEngineStatus(UIServer * server);

void UITimer_Start();

void UIKeyboardInput_Start();

#endif
