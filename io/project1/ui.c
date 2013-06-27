#include "ui.h"
#include "public_kernel_interface.h"
#include "ansi.h"
#include "queue.h"
#include "robio.h"
#include "random.h"
#include "tasks.h"
#include "train.h"

void UIServer_Start() {
	int return_code = RegisterAs((char*) UI_SERVER_NAME);
	int source_tid;
	int num_child_task_running = 2;
	short shutdown = 0;
	assert(return_code == 0, "UIServer_Start failed to register name");
	
	int tid = Create(HIGH, &UITimer_Start);
	assert(tid, "UITimer tid 0");
	
	UIServer server;
	UIServer_Initialize(&server);
	
	int keyboard_input_tid = Create(NORMAL, UIKeyboardInput_Start);
	assert(keyboard_input_tid, "UIServer failed to create UIKeyboardInput");

	GenericMessage * receive_message = (GenericMessage *) server.receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server.reply_buffer;
	CharMessage * char_message = (CharMessage *) server.receive_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;

	while(num_child_task_running) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);
			robprintfbusy((const unsigned char *)"UIServer_Start Exiting because of shutdown.\n");

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
	
	Exit();
}

void UIServer_Initialize(UIServer * server) {
	server->print_message_count = 0;
	server->dirty = 1;
	server->command_buffer_index = 0;
	
	int i;
	
	for (i = SENSOR_MODULE_A; i <= SENSOR_MODULE_E; i++) {
		server->sensor_bit_flags_cache[i] = 0;
	}
	
	TrainMap_Initialize_A(&server->train_map_a);
	TrainMap_Initialize_B(&server->train_map_b);
	server->current_train_map = &server->train_map_a;
	
	server->train_server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
	
	assert(server->train_server_tid, "UIServer: failed whois");
	
	for (i = 0; i < NUM_SWITCHES; i++) {
		server->switch_states_cache[i] = SWITCH_UNKNOWN;
	}
	
	server->background_color = BLUE;
	server->foreground_color = WHITE;
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
	UIServer_PrintSensors(server);
	UIServer_PrintSwitches(server);
	UIServer_PrintCommandLine(server);
	
	server->dirty = 0;
}

void UIServer_PrintTime(UIServer * server) {
	unsigned int time = (unsigned int) (TimeSeconds() * 1000);
	unsigned int ms = time % 1000;
	time /= 1000;
	unsigned int sec = time % 60;
	time /= 60;
	unsigned int min = time % 60;
	
	ANSI_Cursor(1, sizeof(UI_SERVER_HEADER) + 1);
	PutString(COM2, "{ SYSTIME = %d:%d,%d }", min, sec, ms);
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_PrintCommandLine(UIServer * server) {
	if (server->dirty) {
		ANSI_Cursor(2, 1);
		ANSI_Style(BOLD_STYLE);
		PutString(COM2, "C:\\> ");
		ANSI_Style(NORMAL_STYLE);
	}
	
	ANSI_Cursor(2, 6 + server->command_buffer_index);
}

void UIServer_ProcessKeystroke(UIServer * server, char c) {
	ANSI_Cursor(2, 6 + server->command_buffer_index);
	
	if (c == '\r') {
		UIServer_RunCommand(server);
		UIServer_ResetCommandBuffer(server);
	} else if (c == '\b' && server->command_buffer_index > 0) {
		server->command_buffer_index--;

		server->command_buffer[server->command_buffer_index] = 0;
		
		ANSI_CursorBackward(1);
		PutString(COM2, " ");
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
	} else if (server->command_buffer[0] == 't' && server->command_buffer[1] == 's') {
		UIServer_HandleTimeStopCommand(server);
	} else {
		UIServer_PrintCommandHelp(server);
	}
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_ResetCommandBuffer(UIServer * server) {
	server->command_buffer_index = 0;
	server->command_buffer[0] = 0;
	ANSI_Cursor(2, 6);
	ANSI_ClearLine(CLEAR_TO_END);
}

void UIServer_PrintCommandHelp(UIServer * server) {
	PutString(COM2, "Unknown command. Use: tr, rv, sw, q, map, ts");
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
	SendTrainCommand(TRAIN_SWITCH, direction_code, switch_num, 0, 0);
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
			short differs = (sensor_bit_flag & 1 << sensor_num)
				^ (sensor_bit_flag_cache & 1 << sensor_num);
			
			if (server->dirty || differs) {
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
				int sensor_i = module_num * SENSORS_PER_MODULE + sensor_num;
				TrainMapLabelPosition * pos = &server->current_train_map->sensors[sensor_i];
				
				if (pos->ascii_offset == 0) {
					continue;
				}
				
				ANSI_Cursor(MAP_ROW_OFFSET + pos->row, MAP_COL_OFFSET + pos->col + 1);
			
				if (sensor_bit_flag & 1 << sensor_num) {
					ANSI_Style(BOLD_STYLE);
					PutString(COM2, "%c", server->current_train_map->ascii[pos->ascii_offset]);
					ANSI_Style(NORMAL_STYLE);
				} else {
					ANSI_Style(NORMAL_STYLE);
					PutString(COM2, "%c", server->current_train_map->ascii[pos->ascii_offset]);
				}
			}
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
			int differs = server->switch_states_cache[switch_num] != switch_state;
			
			if (switch_state && differs) {
				ANSI_Cursor(MAP_ROW_OFFSET + label_pos->row, MAP_COL_OFFSET + 1 + label_pos->col);
				if (switch_state == SWITCH_CURVED) {
					ANSI_Color(RED, server->background_color);
					PutString(COM2, "C");
				} else {
					ANSI_Color(GREEN, server->background_color);
					PutString(COM2, "S");
				}
				ANSI_Color(server->foreground_color, server->background_color);
			}
			
			server->switch_states_cache[switch_num] = switch_state;
		}
	}
}

void UITimer_Start() {
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
			robprintfbusy((const unsigned char *)"UITimer_Start shutting down by request.\n");
			break;
		}
	}
	
	Exit();
}

void UIKeyboardInput_Start() {
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	CharMessage * char_message = (CharMessage *) send_buffer;
	char data;
	int ui_server_tid;
	int i = 0;
	
	robprintfbusy((const unsigned char *)"UIKeyboardInput_Start tid=%d\n", MyTid());
	
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
	
	robprintfbusy((const unsigned char *)"UIKeyboardInput_Start exit\n");
	Exit();
}
