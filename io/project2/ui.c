#include "priorities.h"
#include "scheduler.h"
#include "ui.h"
#include "public_kernel_interface.h"
#include "ansi.h"
#include "queue.h"
#include "robio.h"
#include "random.h"
#include "tasks.h"
#include "train.h"

void UIServer_Start() {
	DebugRegisterFunction(&UIServer_Start,__func__);
	int return_code = RegisterAs((char*) UI_SERVER_NAME);
	int source_tid;
	int num_child_task_running = 2;
	short shutdown = 0;
	assert(return_code == 0, "UIServer_Start failed to register name");
	
	int tid = Create(UITIMER_START_PRIORITY, &UITimer_Start);
	assert(tid, "UITimer tid 0");
	
	UIServer server;
	UIServer_Initialize(&server);
	
	int keyboard_input_tid = Create(UIKEYBOARDINPUT_START_PRIORITY, UIKeyboardInput_Start);
	assert(keyboard_input_tid, "UIServer failed to create UIKeyboardInput");
	
	int print_tid = Create(UIPRINTTASK_START_PRIORITY, UIPrintTask_Start);
	assert(print_tid, "UIserver failed to create print task");

	GenericMessage * receive_message = (GenericMessage *) server.receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server.reply_buffer;
	CharMessage * char_message = (CharMessage *) server.receive_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;

	while(num_child_task_running) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);

			shutdown = 1;
			break;
		case MESSAGE_TYPE_HELLO:
			// from UITimer
			if (shutdown){
				reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
				num_child_task_running--;
			}

			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);

			if (!shutdown) {
#ifdef UI
				UIServer_Render(&server);
#endif
			}

			break;
		case MESSAGE_TYPE_DATA:
			// from UIKeyboardInput
			if (shutdown){
				reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
				num_child_task_running--;
			}

			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);

			if (!shutdown) {
				UIServer_ProcessKeystroke(&server, char_message->chars[0]);
			}
			break;
		default:
			assert(0, "UIServer_Start: unknown message type");
			break;
		}
	}
	
	receive_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	Send(print_tid, server.receive_buffer, MESSAGE_SIZE, server.reply_buffer, MESSAGE_SIZE);
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer: Failed to get Ack from print task");
	
	Exit();
}

void UIServer_Initialize(UIServer * server) {
	server->dirty = 1;
	server->command_buffer_index = 0;
	server->background_color = BLUE;
	server->foreground_color = WHITE;
	server->num_engines = 1;
	
	int i;
	
	for (i = SENSOR_MODULE_A; i <= SENSOR_MODULE_E; i++) {
		server->sensor_bit_flags_cache[i] = 0;
	}
	
	for (i = 0; i < NUM_SENSOR_MODULES * SENSORS_PER_MODULE; i++) {
		server->sensor_dirty[i] = 1;
		server->sensor_background_color[i] = server->background_color;
	}
	
	TrainMap_Initialize_A(&server->train_map_a);
	TrainMap_Initialize_B(&server->train_map_b);
	server->current_train_map = &server->train_map_a;

	while(1){	
		server->train_server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
		if(server->train_server_tid){
			break;
		}
		DelaySeconds(0.21);
		i++;
		assert(i < 10, "UIServer: failed whois");
	}
	
	
	for (i = 0; i < NUM_SWITCHES; i++) {
		server->switch_states_cache[i] = SWITCH_UNKNOWN;
		server->switch_dirty[i] = 1;
		server->switch_background_color[i] = server->background_color;
	}
}

void UIServer_Render(UIServer * server) {
	if (server->dirty) {
		ANSI_Cursor(1, 1);
		ANSI_Color(server->foreground_color, server->background_color);
		ANSI_ClearScreen(CLEAR_ALL);
		ANSI_Cursor(1, 1);
		PutString(COM2, UI_SERVER_HEADER);
	}

	UIServer_PrintTime(server);
	UIServer_PrintMap(server);
	UIServer_PrintTrainMapPosition(server);
	UIServer_PrintSensors(server);
	UIServer_PrintSwitches(server);
	UIServer_PrintTrainEngineStatus(server);
	UIServer_PrintCommandLine(server);
	
	server->dirty = 0;
}

void UIServer_PrintTime(UIServer * server) {
	unsigned long long time = TimeSeconds() * 1000;
	unsigned int ms = time % 1000;
	time /= 1000;
	unsigned int sec = time % 60;
	time /= 60;
	unsigned int min = time % 60;
	time /= 60;
	unsigned int hours = time % 60;
	time /= 24;
	unsigned int days = time % 24;
	
	char ms_str[5];
	char sec_str[5];
	char min_str[5];
	char hours_str[5];
	char days_str[5];
	rob_zero_pad(ms, ms_str);
	rob_zero_pad(sec, sec_str);
	rob_zero_pad(min, min_str);
	rob_zero_pad(hours, hours_str);
	rob_zero_pad(days, days_str);
	
	ANSI_Cursor(1, sizeof(UI_SERVER_HEADER) + 1);
	PutString(COM2, "{ SYSTIME = %s:%s:%s:%s,%s }", days_str, hours_str, min_str, sec_str, ms_str);
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_PrintCommandLine(UIServer * server) {
	if (server->dirty) {
		ANSI_Cursor(2, 1);
		ANSI_Style(BOLD_STYLE);
		PutString(COM2, "tomas@shining-time-station:~$ ");
		ANSI_Style(NORMAL_STYLE);
	}
	
	ANSI_Cursor(2, UI_COMMAND_START_POS + server->command_buffer_index);
}

void UIServer_ProcessKeystroke(UIServer * server, char c) {
	ANSI_Cursor(2, UI_COMMAND_START_POS + server->command_buffer_index);
	
	if (c == '\r') {
		UIServer_RunCommand(server);
		UIServer_ResetCommandBuffer(server);
	} else if (c == '\b') {
		if (server->command_buffer_index > 0) {
			server->command_buffer_index--;

			server->command_buffer[server->command_buffer_index] = 0;
		
			ANSI_CursorBackward(1);
			PutString(COM2, " ");
		}
	} else if (server->command_buffer_index < UI_SERVER_COMMAND_BUFFER_SIZE - 1) {
		server->command_buffer[server->command_buffer_index] = c;
		
		PutString(COM2, "%c", server->command_buffer[server->command_buffer_index]);
		
		server->command_buffer_index++;
		server->command_buffer[server->command_buffer_index] = 0;
	}
}

void UIServer_RunCommand(UIServer * server) {
	ANSI_Cursor(3, 1);
	
	if (server->command_buffer_index == 0) {
		UIServer_PrintCommandHelp(server);
	} else if (server->command_buffer[0] == 'q') {
		PutString(COM2, "Quiting. Goodbye.");
		ANSI_SetScrollRegionAll();
		DelaySeconds(1);
		int admin_tid = WhoIs((char*) ADMINISTRATOR_TASK_NAME);
		GenericMessage * send_message = (GenericMessage *) server->send_buffer;
		GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
		send_message->message_type = MESSAGE_TYPE_SHUTDOWN;
		Send(admin_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
		
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_RunCommand failed to get ack message");
	} else if (server->command_buffer[0] == 't' && server->command_buffer[1] == 'r') {
		UIServer_HandleTrainCommand(server);
	} else if (server->command_buffer[0] == 'r' && server->command_buffer[1] == 'v') {
		UIServer_HandleReverseCommand(server);
	} else if (server->command_buffer[0] == 's' && server->command_buffer[1] == 'w') {
		UIServer_HandleSwitchCommand(server);
	} else if (server->command_buffer[0] == 'm' && server->command_buffer[1] == 'a') {
		UIServer_HandleMapCommand(server);
//	} else if (server->command_buffer[0] == 't' && server->command_buffer[1] == 's') {
//		UIServer_HandleTimeStopCommand(server);
	} else if (server->command_buffer[0] == 'g' && server->command_buffer[1] == 'o') {
		UIServer_HandleSetTrainCommand(server, 0);
	} else if (server->command_buffer[0] == 'g' && server->command_buffer[1] == 'f') {
		UIServer_HandleSetTrainCommand(server, 1);
	} else if (server->command_buffer[0] == 'd' && server->command_buffer[1] == 'e') {
		UIServer_HandleSetDestinationCommand(server);
	} else if (server->command_buffer[0] == 'n' && server->command_buffer[1] == 'u') {
		UIServer_HandleSetNumEngines(server);
	} else {
		UIServer_PrintCommandHelp(server);
	}
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_ResetCommandBuffer(UIServer * server) {
	server->command_buffer_index = 0;
	server->command_buffer[0] = 0;
	ANSI_Cursor(2, UI_COMMAND_START_POS);
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_PrintCommandHelp(UIServer * server) {
	ANSI_Color(YELLOW, server->background_color);
	ANSI_Style(BOLD_STYLE);
	PutString(COM2, "Unknown command. Use: tr, rv, sw, q, map, go, dest, num");
	ANSI_Style(NORMAL_STYLE);
	ANSI_Color(server->foreground_color, server->background_color);
}

void UIServer_HandleTrainCommand(UIServer * server) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	char train_num = robatoi(&server->command_buffer[next_whitespace]);

	next_whitespace += rob_next_whitespace(&(server->command_buffer[next_whitespace]));
	
	char speed = robatoi(&server->command_buffer[next_whitespace]);
	
	PutString(COM2, "Train=%d Speed=%d. train on fire.", train_num, speed);
	SendTrainCommand(TRAIN_SPEED, speed, train_num, 0, 0);
}

void UIServer_HandleReverseCommand(UIServer * server) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	char train_num = robatoi(&server->command_buffer[next_whitespace]);

	PutString(COM2, "Train=%d. train on reversed fire.", train_num);
	SendTrainCommand(TRAIN_REVERSE, train_num, 0, 0, 0);
}

void UIServer_HandleSwitchCommand(UIServer * server) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	char switch_num = robatoi(&server->command_buffer[next_whitespace]);

	next_whitespace += rob_next_whitespace(&(server->command_buffer[next_whitespace]));
	
	char direction = server->command_buffer[next_whitespace];
	char direction_code;
	
	if (direction == 'C') {
		direction_code = SWITCH_CURVED_CODE;
	} else if (direction == 'S') {
		direction_code = SWITCH_STRAIGHT_CODE;
	} else {
		PutString(COM2, "Unknown direction. Use C or S");
		return;
	}
	
	PutString(COM2, "Switch=%d Direction=%c. switch on fire.", switch_num, direction);
	SetTrainSwitch(direction_code, switch_num);
}

void UIServer_HandleMapCommand(UIServer * server) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	
	char map = server->command_buffer[next_whitespace];
	
	if (map == 'A') {
		server->current_train_map = &server->train_map_a;
		server->dirty = 1;
	} else if (map == 'B') {
		server->current_train_map = &server->train_map_b;
		server->dirty = 1;
	} else {
		PutString(COM2, "Unknown map. Use A or B");
		return;
	}
	
	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	send_message->message_type = MESSAGE_TYPE_SELECT_TRACK;
	send_message->int1 = map;
	
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_HandleMapCommand failed to get ack message");
}

void UIServer_HandleTimeStopCommand(UIServer * server) {
	GenericMessage * send_message = (GenericMessage *) server->send_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	char train_num = robatoi(&server->command_buffer[next_whitespace]);

	next_whitespace += rob_next_whitespace(&(server->command_buffer[next_whitespace]));
	
	char speed = robatoi(&server->command_buffer[next_whitespace]);
	
	ANSI_ClearLine(CLEAR_TO_END);
	PutString(COM2, "Train=%d, Speed=%d. Ramping up train", train_num, speed);

	SendTrainCommand(TRAIN_SPEED, speed, train_num, 0, 0);
	
	int i;
	for (i = 0; i < 5; i++) {
		PutString(COM2, ".");
		DelaySeconds(1);
	}
	
	PutString(COM2, "Waiting for sensor=");

	send_message->message_type = MESSAGE_TYPE_BLOCK_UNTIL_SENSOR;
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_HandleTimeStopCommand: did not get ACK");
	
	double time_before_command = TimeSeconds();
	SendTrainCommand(TRAIN_SPEED, 0, train_num, 0, 0);
	double time_after_command = TimeSeconds();
	
	int time_diff_ms = (time_after_command - time_before_command) * 1000;
	
	PutString(COM2, "Stop command latency=%d ms.", time_diff_ms);
}

void UIServer_HandleSetTrainCommand(UIServer * server, short go_forever) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	char train_num = robatoi(&server->command_buffer[next_whitespace]);
	next_whitespace += rob_next_whitespace(&(server->command_buffer[next_whitespace]));
	char slot_num = robatoi(&server->command_buffer[next_whitespace]);
	
	if (slot_num >= server->num_engines) {
		PutString(COM2, "Please enter a slot for the train within [0, %d]", (server->num_engines - 1));
		return;
	}

	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	if (go_forever) {
		send_message->message_type = MESSAGE_TYPE_GO_FOREVER;
	} else {
		send_message->message_type = MESSAGE_TYPE_SET_TRAIN;
	}
	
	send_message->int1 = train_num;
	send_message->int2 = slot_num;
	
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_HandleMapCommand failed to get ack message");
	
	PutString(COM2, "Train set to %d at slot %d.", train_num, slot_num);
}

void UIServer_HandleSetDestinationCommand(UIServer * server) {
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	char train_num = robatoi(&server->command_buffer[next_whitespace]);
	next_whitespace += rob_next_whitespace(&(server->command_buffer[next_whitespace]));
	
	send_message->message_type = MESSAGE_TYPE_SET_DESTINATION;
	send_message->int1 = train_num;
	send_message->char1 = &server->command_buffer[next_whitespace];
	
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_HandleSetDestinationCommand failed to get ack message");
	
	PutString(COM2, "Destination set to %s.", &server->command_buffer[next_whitespace]);
}

void UIServer_HandleSetNumEngines(UIServer * server) {
	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	int next_whitespace = rob_next_whitespace(server->command_buffer);
	int num_engines = robatoi(&server->command_buffer[next_whitespace]);
	
	if (num_engines > MAX_NUM_ENGINES || num_engines < 1) {
		PutString(COM2, "Number of engines should be within [1, %d]", MAX_NUM_ENGINES);
		return;
	} 
	
	send_message->message_type = MESSAGE_TYPE_SET_NUM_ENGINES;
	send_message->int1 = num_engines;
	
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_HandleSetNumEngines failed to get ack message");
	
	server->num_engines = num_engines;
	
	PutString(COM2, "Number of engines set to %d", server->num_engines);
}

void UIServer_PrintSensors(UIServer * server) {
	TrainSensorMessage * send_message = (TrainSensorMessage *) server->send_buffer;
	TrainSensorMessage * receive_message = (TrainSensorMessage *) server->receive_buffer;
	int module_num;
	
	for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
		send_message->message_type = MESSAGE_TYPE_QUERY_SENSOR;
		send_message->module_num = module_num;
		
		Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->receive_buffer, MESSAGE_SIZE);
		
		assert(receive_message->message_type == MESSAGE_TYPE_ACK, "UIServer_PrintSensors: failed to get ACK from train server");
		
		int sensor_bit_flag = receive_message->sensor_bit_flag;
		int sensor_bit_flag_cache = server->sensor_bit_flags_cache[module_num];

		if (server->dirty) {
			// Print headers
			ANSI_Cursor(SENSOR_TABLE_ROW_OFFSET, SENSOR_TABLE_COL_OFFSET + module_num * 3);
			PutString(COM2, "M%c", 'A' + module_num);
		}
		
		// Print sensor values
		int sensor_num;
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			int sensor_i = module_num * SENSORS_PER_MODULE + sensor_num;
			
			server->sensor_dirty[sensor_i] |= (sensor_bit_flag & 1 << sensor_num) ^ (sensor_bit_flag_cache & 1 << sensor_num);
			
			if (server->dirty || server->sensor_dirty[sensor_i]) {
				// Print onto table
				ANSI_Cursor(SENSOR_TABLE_ROW_OFFSET + 1 + sensor_num, SENSOR_TABLE_COL_OFFSET + module_num * 3);

				if (sensor_bit_flag & 1 << sensor_num) {
					ANSI_Style(BOLD_STYLE);
					PutString(COM2, "%d", sensor_num + 1);
					ANSI_Style(NORMAL_STYLE);
				} else {
					ANSI_Style(NORMAL_STYLE);
					PutString(COM2, "%d", sensor_num + 1);
				}
				
				// Print onto map
				TrainMapLabelPosition * pos = &server->current_train_map->sensors[sensor_i];
				
				if (pos->ascii_offset == 0) {
					continue;
				}
				
				ANSI_Cursor(MAP_ROW_OFFSET + pos->row, MAP_COL_OFFSET + pos->col + 1);
			
				ANSI_Color(server->foreground_color, server->sensor_background_color[sensor_i]);
				
				if (sensor_bit_flag & 1 << sensor_num) {
					ANSI_Style(BOLD_STYLE);
					PutString(COM2, "%c", server->current_train_map->ascii[pos->ascii_offset]);
					ANSI_Style(NORMAL_STYLE);
				} else {
					ANSI_Style(NORMAL_STYLE);
					PutString(COM2, "%c", server->current_train_map->ascii[pos->ascii_offset]);
				}
				
				ANSI_Color(server->foreground_color, server->background_color);
			}
			
			server->sensor_dirty[sensor_i] = 0;
		}
		
		server->sensor_bit_flags_cache[module_num] = sensor_bit_flag;
	}
}

void UIServer_PrintMap(UIServer * server) {
	if (server->dirty) {
		ANSI_Cursor(MAP_ROW_OFFSET, MAP_COL_OFFSET + 1);
		int i = 0;
		while (1) {
			if (server->current_train_map->ascii[i] == 0) {
				if (server->current_train_map == &server->train_map_a) {
					ANSI_Color(BLACK, MAGENTA);
					PutString(COM2, " Track A ");
				} else {
					ANSI_Color(BLACK, CYAN);
					PutString(COM2, " Track B ");
				}
				
				ANSI_Color(server->foreground_color, server->background_color);
				
				break;
			} else if (server->current_train_map->ascii[i] == '\n') {
				ANSI_CursorNextLine(1);
				ANSI_CursorForward(MAP_COL_OFFSET);
			} else {
				Putc(COM2, server->current_train_map->ascii[i]);
			}
			i++;
		}
	}
}

void UIServer_PrintSwitches(UIServer * server) {
	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	GenericTrainMessage * reply_message = (GenericTrainMessage *) server->reply_buffer;
	
	int switch_num;
	
	send_message->message_type = MESSAGE_TYPE_QUERY_SWITCH;
	
	for (switch_num = 0; switch_num < NUM_SWITCHES; switch_num++) {
		TrainMapLabelPosition * label_pos = &server->current_train_map->switches[switch_num];
	
		if (label_pos->ascii_offset) {
			send_message->int1 = switch_num;
			Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
			
			int switch_state = reply_message->int1;
			server->switch_dirty[switch_num] |= server->switch_states_cache[switch_num] != switch_state;
			
			if (server->switch_dirty[switch_num] || server->dirty) {
				ANSI_Cursor(MAP_ROW_OFFSET + label_pos->row, MAP_COL_OFFSET + 1 + label_pos->col);
				if (switch_state == SWITCH_CURVED) {
					ANSI_Color(RED, server->switch_background_color[switch_num]);
					PutString(COM2, "C");
				} else if (switch_state == SWITCH_STRAIGHT){
					ANSI_Color(GREEN, server->switch_background_color[switch_num]);
					PutString(COM2, "S");
				} else if (switch_state == SWITCH_UNKNOWN){
					ANSI_Color(server->foreground_color, server->switch_background_color[switch_num]);
					PutString(COM2, "U");
				} else {
					assert(0,"UI got unknown switch state.");
				}
				ANSI_Color(server->foreground_color, server->background_color);
			}
			
			server->switch_states_cache[switch_num] = switch_state;
			server->switch_dirty[switch_num] = 0;
		}
	}
}

void UIServer_PrintTrainEngineStatus(UIServer * server) {
	if (server->dirty) {
		ANSI_Cursor(ENGINE_STATUS_ROW_OFFSET, ENGINE_STATUS_COL_OFFSET);
		ANSI_Style(BOLD_STYLE);
		PutString(COM2, 
"                                         Speed       Sensor Times (s)       Distance (mm)\n"
"Train State               From Now To    mm/s      Expect Last   Actual   After Next  Dest");
		ANSI_Style(NORMAL_STYLE);
	}
	
	int slot_num;
	for (slot_num = 0; slot_num < server->num_engines; slot_num++) {
		GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
		TrainEngineStatusMessage * reply_message = (TrainEngineStatusMessage *) server->reply_buffer;
	
		send_message->int1 = slot_num;
		send_message->message_type = MESSAGE_TYPE_QUERY_TRAIN_ENGINE;
	
		Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_PrintTrainEngineStatus: did not get ack message");
	
		// TODO: don't use pointers in messages
		TrainEngine * engine = reply_message->train_engine;
		int train_num = engine->train_num; 
		int speed_setting = engine->speed_setting;
		int calculated_speed = engine->calculated_speed;
		const char * source_node_name;
		const char * current_node_name;
		const char * next_node_name;
		const char * dest_node_name;
		int expected_time_at_next_sensor = engine->expected_time_at_next_sensor;
		int expected_time_at_last_sensor = engine->expected_time_at_last_sensor;
		int actual_time_at_last_sensor = engine->actual_time_at_last_sensor;
		int estimated_distance_after_node = engine->estimated_distance_after_node;
		int distance_to_next_sensor = engine->distance_to_next_sensor;
		int distance_to_destination = engine->distance_to_destination;
	
		if (engine->source_node) {
			source_node_name = engine->source_node->name;
		} else {
			source_node_name = "-";
		}
	
		if (engine->current_node) {
			current_node_name = engine->current_node->name;
		} else {
			current_node_name = "???";
		}
	
		if (engine->next_node) {
			next_node_name = engine->next_node->name;
		} else {
			next_node_name = "-";
		}
	
		if (engine->destination_node) {
			dest_node_name = engine->destination_node->name;
		} else {
			dest_node_name = "-";
		}
	
		int time_difference = expected_time_at_last_sensor - actual_time_at_last_sensor;
		if (time_difference < 0) {
			time_difference = -time_difference;
		}
	
		int state = engine->state;
	
		int new_hash_1 = train_num ^ speed_setting ^ calculated_speed ^ (int) current_node_name ^ state ^ (int) next_node_name ^ (int) dest_node_name ^ (int) source_node_name;
		int new_hash_2 = expected_time_at_next_sensor ^ expected_time_at_last_sensor ^ actual_time_at_last_sensor ^ estimated_distance_after_node ^ distance_to_next_sensor ^ distance_to_destination;
		int differs_1 = new_hash_1 != server->train_engine_status_hashes_1[slot_num];
		int differs_2 = new_hash_2 != server->train_engine_status_hashes_2[slot_num];
	
		server->train_engine_status_hashes_1[slot_num] = new_hash_1;
		server->train_engine_status_hashes_2[slot_num] = new_hash_2;
	
		if (differs_1 || server->dirty) {
			ANSI_Cursor(ENGINE_STATUS_ROW_OFFSET + 2 + slot_num, ENGINE_STATUS_COL_OFFSET);
			ANSI_CursorCol(51);
			ANSI_ClearLine(CLEAR_TO_START);
		
			ANSI_CursorCol(1);
			PutString(COM2, "%d", train_num);
		
			ANSI_CursorCol(7);
			PutString(COM2, "%s", TRAIN_ENGINE_STATE_NAMES[state]);
		
			ANSI_CursorCol(27);
			PutString(COM2, "%s", source_node_name);
		
			ANSI_CursorCol(32);
			PutString(COM2, "%s", current_node_name);
		
			ANSI_CursorCol(36);
			PutString(COM2, "%s", dest_node_name);
		
			ANSI_CursorCol(42);
			PutString(COM2, "%d (%d)", calculated_speed, speed_setting);
		}
		
		if (differs_2 || server->dirty) {
			ANSI_Cursor(ENGINE_STATUS_ROW_OFFSET + 2 + slot_num, ENGINE_STATUS_COL_OFFSET);
			ANSI_CursorCol(52);
			ANSI_ClearLine(CLEAR_TO_END);
			PutString(COM2, "%d", expected_time_at_next_sensor);
		
			ANSI_CursorCol(59);
			PutString(COM2, "%d", expected_time_at_last_sensor);
		
			ANSI_CursorCol(66);
			PutString(COM2, "%d", actual_time_at_last_sensor);
		
			ANSI_CursorCol(75);
			PutString(COM2, "%d", estimated_distance_after_node);
		
			ANSI_CursorCol(81);
			PutString(COM2, "%d", distance_to_next_sensor);
		
			ANSI_CursorCol(87);
			PutString(COM2, "%d", distance_to_destination);
		}
	}
}

void UIServer_PrintTrainMapPosition(UIServer * server) {
	GenericTrainMessage  * send_message = (GenericTrainMessage *) server->send_buffer;
	TrainEngineStatusMessage * reply_message = (TrainEngineStatusMessage *) server->reply_buffer;
	
	send_message->int1 = 0;
	send_message->message_type = MESSAGE_TYPE_QUERY_TRAIN_ENGINE;
	
	Send(server->train_server_tid, server->send_buffer, MESSAGE_SIZE, server->reply_buffer, MESSAGE_SIZE);
	assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIServer_PrintTrainMapPosition: did not get ack message");
	
	track_node * track_nodes = reply_message->track_nodes;
	TrainEngine * engine = reply_message->train_engine;
	
	int i;
	
	for (i = 0; i < TRACK_MAX; i++) {
		track_node * node = &track_nodes[i];
		int new_color;
		
		if (node->type == NODE_SENSOR) {
			new_color = server->sensor_background_color[node->num];
		} else if (node->type == NODE_BRANCH || node->type == NODE_MERGE) {
			new_color = server->switch_background_color[node->num];
		}
		
		if (node == engine->destination_node || node->reverse == engine->destination_node) {
			// Highlight destination
			new_color = GREEN;
		} else if (node->reserved || node->reverse->reserved) {
			// Highlight reservation
			new_color = BLACK;
		} else {
			new_color = server->background_color;
		}
		
		if (node->type == NODE_SENSOR) {
			if (new_color != server->sensor_background_color[node->num]) {
				server->sensor_dirty[node->num] = 1;
				server->sensor_background_color[node->num] = new_color;
			}
		} else if (node->type == NODE_BRANCH || node->type == NODE_MERGE) {
			if (new_color != server->switch_background_color[node->num]) {
				server->switch_dirty[node->num] = 1;
				server->switch_background_color[node->num] = new_color;
			}
		}
	}
}

void UITimer_Start() {
	DebugRegisterFunction(&UITimer_Start,__func__);
	int return_code = RegisterAs((char*) UI_TIMER_NAME);
	assert(return_code == 0, "UITimer_Start failed to register name");
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	int server_tid = WhoIs((char*) UI_SERVER_NAME);
	assert(server_tid, "UITimer_Start: server tid not found");
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	while (1) {
		DelaySeconds(0.5);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, 
			"UITimer_Start: didn't get ACK message");

		if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			break;
		}
	}
	
	Exit();
}

void UIKeyboardInput_Start() {
	DebugRegisterFunction(&UIKeyboardInput_Start,__func__);
	
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	CharMessage * char_message = (CharMessage *) send_buffer;
	char data;
	int ui_server_tid;
	int i = 0;
	
	while (1) {
		ui_server_tid = WhoIs((char*) UI_SERVER_NAME);
		
		if (ui_server_tid) {
			break;
		}
		
		i++;
		assert(i < 1000, "UIKeyboardInput: failed to get tid for ui server");
	}
	
	while (1) {
		data = Getc(COM2);

		assert(data != 0, "UIKeyboardInput: got 0x00 from keyboard?");

		char_message->message_type = MESSAGE_TYPE_DATA;
		char_message->chars[0] = data;

		Send(ui_server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);

		if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			break;
		}

		assert(reply_message->message_type == MESSAGE_TYPE_ACK, "UIKeyboardInput: failed to send char to ui server");
	}
	
	Exit();
}

void UIPrintTask_Start() {
	DebugRegisterFunction(&UIPrintTask_Start,__func__);
	RegisterAs((char*) UI_PRINT_TASK_NAME);

	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	
	UIPrintMessage * receive_message = (UIPrintMessage *) receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;

	int source_tid;
	short running = 1;
	
	ANSI_SetScrollRegion(PRINT_MESSAGE_OFFSET, PRINT_MESSAGE_OFFSET + MAX_PRINT_MESSAGE);
	
	while (running) {
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(receive_message->message_type) {
		case MESSAGE_TYPE_UI_PRINT_MESSAGE:
			ANSI_SaveCursor();
			ANSI_Cursor(PRINT_MESSAGE_OFFSET + MAX_PRINT_MESSAGE, 1);
			ANSI_ClearLine(CLEAR_TO_END);
			PutString(COM2, "%d: ", Time());
			PutStringFormat(COM2, receive_message->message, receive_message->va);
			Reply(source_tid, reply_buffer, MESSAGE_SIZE);
			PutString(COM2, "\n");
			ANSI_RestoreCursor();
			break;
		case MESSAGE_TYPE_SHUTDOWN:
			Reply(source_tid, reply_buffer, MESSAGE_SIZE);
			running = 0;
			break;
		default:
			assert(0, "UIPrintTask: unknown message type");
			break;
		}
	}
	
	Exit();
	
}

