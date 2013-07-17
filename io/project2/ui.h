#include "message.h"
#include "train.h"
#include "maps/map.h"
#include "maps/map_a.h"
#include "maps/map_b.h"
#include "ansi.h"

#ifndef UI_H_
#define UI_H_

#define UI_COMMAND_START_POS 31
#define UI_SERVER_COMMAND_BUFFER_SIZE 80

static const char const UI_SERVER_NAME[] = "UISvr";
static const char const UI_TIMER_NAME[] = "UITmr";
static const char const UI_PRINT_TASK_NAME[] = "UIPrt";
static const char const UI_SERVER_HEADER[] = "> THOMAS TANK ENGINE (TM) TRAIN MASTER CONTROL SYSTEM CS-452-2013 <";
static const int const SENSOR_TABLE_ROW_OFFSET = 5;
static const int const SENSOR_TABLE_COL_OFFSET = 1;
static const int const MAP_ROW_OFFSET = 5;
static const int const MAP_COL_OFFSET = 20;
static const int const ENGINE_STATUS_ROW_OFFSET = 23;
static const int const ENGINE_STATUS_COL_OFFSET = 1;
static const int const PRINT_MESSAGE_OFFSET = 30;
static const int const MAX_PRINT_MESSAGE = 25;

typedef struct UIMessage {
	MessageType message_type;
	int row;
} UIMessage;

typedef struct UIPrintMessage {
	MessageType message_type;
	const char * message;
	va_list va;
} UIPrintMessage;

typedef struct UIServer {
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
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
	int train_engine_status_hashes_1[NUM_ENGINES];
	int train_engine_status_hashes_2[NUM_ENGINES];
	int sensor_dirty[NUM_SENSOR_MODULES];
	int switch_dirty[NUM_SWITCHES];
	int sensor_background_color[NUM_SENSOR_MODULES * SENSORS_PER_MODULE];
	int switch_background_color[NUM_SWITCHES];
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

void UIServer_HandleSetTrainCommand(UIServer * server, short go_forever);

void UIServer_HandleSetDestinationCommand(UIServer * server);

void UIServer_PrintSensors(UIServer * server);

void UIServer_PrintMap(UIServer * server);

void UIServer_PrintSwitches(UIServer * server);

void UIServer_PrintTrainEngineStatus(UIServer * server);

void UIServer_PrintTrainMapPosition(UIServer * server);

void UIServer_PrintMessage(UIServer * server);

void UITimer_Start();

void UIKeyboardInput_Start();

void UIPrintTask_Start();

#endif
