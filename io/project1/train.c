#include "train.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "memory.h"
#include "priorities.h"
#include "scheduler.h"

void TrainServer_Start() {
	DebugRegisterFunction(&TrainServer_Start,__func__);
	TrainServer server;
	TrainServer_Initialize(&server);
	int admin_tid = 0;

	while(server.num_child_task_running) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin tid
			admin_tid = server.source_tid;
			robprintfbusy((const unsigned char *)"TrainServer_Start Exiting because of shutdown.\n");
			server.state = TRAIN_SERVER_SHUTDOWN;
			
			Send(server.train_command_server_tid, server.receive_buffer, MESSAGE_SIZE, server.reply_buffer, MESSAGE_SIZE);
			
			assert(server.reply_message->message_type == MESSAGE_TYPE_ACK, "TrainServer did not get ACK reply from train command server shutdown");

			server.num_child_task_running--;
			break;
		case MESSAGE_TYPE_HELLO:
			// from TrainServerTimer
			if (server.state == TRAIN_SERVER_SHUTDOWN) {
				server.reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			}
			
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			
			if (server.state == TRAIN_SERVER_SHUTDOWN) {
				server.num_child_task_running--;
			}
			break;
		case MESSAGE_TYPE_SENSOR_DATA:
			// from TrainSensorReader
			TrainServer_HandleSensorReaderData(&server);
			break;
		case MESSAGE_TYPE_SWITCH_DATA:
			// from TrainCommandServer
			TrainServer_HandleSwitchData(&server);
			break;
		case MESSAGE_TYPE_QUERY_SENSOR:
			// from the ui server
			TrainServer_HandleSensorQuery(&server);
			break;
		case MESSAGE_TYPE_QUERY_SWITCH:
			// from ui server
			TrainServer_HandleSwitchQuery(&server);
			break;
		case MESSAGE_TYPE_BLOCK_UNTIL_SENSOR:
			server.state = TRAIN_SERVER_BLOCK_UNTIL_SENSOR;
			server.blocked_tid = server.source_tid;
			// See inside TrainServer_HandleSensorReaderData for unblocking logic
			break;
		case MESSAGE_TYPE_SELECT_TRACK:
			// from ui server
			TrainServer_HandleSelectTrack(&server);
			break;
		case MESSAGE_TYPE_SET_TRAIN:
			// from ui server
			TrainServer_HandleSetTrain(&server);
			break;
		case MESSAGE_TYPE_SET_DESTINATION:
			// from ui server
			TrainServer_HandleSetDestination(&server);
			break;
		case MESSAGE_TYPE_QUERY_TRAIN_ENGINE:
			// from ui server
			TrainServer_HandleQueryTrainEngine(&server);
			break;
		case MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST:
			// from TrainEngineClient
			TrainServer_HandleTrainEngineClientCommandRequest(&server);
			break;
		default:
			assert(0, "TrainServer: unknown message type");
			break;
		}
		int i;
		for(i = 0; i < NUM_ENGINES; i++)
			TrainServer_ProcessEngine(&server, &(server.train_engines[i]));
	}
	
	assert(admin_tid, "TrainServer: did not get admin tid");
	server.reply_message->message_type = MESSAGE_TYPE_ACK;
	assert(server.reply_message->message_type == MESSAGE_TYPE_ACK, "TrainServer: failed to set ack message");
	Reply(admin_tid, server.reply_buffer, MESSAGE_SIZE);
	
	robprintfbusy((const unsigned char *)"TrainServer_Start exit.\n");

	Exit();
}

void TrainServer_Initialize(TrainServer * server) {
	int return_code = RegisterAs((char*) TRAIN_SERVER_NAME);
	assert(return_code == 0, "TrainServer_Start failed to register name");
	
	server->state = TRAIN_SERVER_IDLE;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (GenericMessage *) server->reply_buffer;

	server->train_sensor_reader_tid = Create(TRAINSENSORREADER_START_PRIORITY, TrainSensorReader_Start);
	assert(server->train_sensor_reader_tid, "TrainServer failed to create TrainSensorReader");
	
	server->train_command_server_tid = Create(TRAINCOMMANDSERVER_START_PRIORITY, TrainCommandServer_Start);
	assert(server->train_command_server_tid, "TrainServer failed to create TrainCommandServer");
	
	server->train_server_timer_tid = Create(TRAINSERVERTIMER_START_PRIORITY, TrainServerTimer_Start);
	assert(server->train_server_timer_tid, "TrainServer failed to create TrainServerTimer");

	server->train_engines[0].tid = Create(TRAINENGINE_START_PRIORITY, TrainEngineClient_Start);
	assert(server->train_engines[0].tid, "TrainServer failed to create TrainEngineClient_Start");
	
	server->num_child_task_running = 3;
	
	int module_num;
	
	for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
		server->sensor_bit_flags[module_num] = 0;
		server->new_sensor_bit_flags_for_ui[module_num] = 0;
		
		int sensor_num;
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			server->sensor_time_log[module_num][sensor_num] = 0;
		}
	}
	
	init_tracka(server->track_a_nodes);
	init_trackb(server->track_b_nodes);
	server->current_track_nodes = server->track_a_nodes;
	
	int switch_num;
	for (switch_num = 0; switch_num < NUM_SWITCHES; switch_num++) {
		server->switch_states[switch_num] = SWITCH_UNKNOWN;
	}
	int i;
	for(i = 0; i < NUM_ENGINES; i++)
		TrainEngine_Initialize(&(server->train_engines[i]), i);
}

void TrainServer_HandleSensorReaderData(TrainServer * server) {
	TrainSensorMessage * recv_sensor_message = (TrainSensorMessage *) server->receive_buffer;

	if (server->state == TRAIN_SERVER_SHUTDOWN) {
		server->reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	}
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	if (server->state == TRAIN_SERVER_SHUTDOWN) {
		server->num_child_task_running--;
	}

	int module_num = recv_sensor_message->module_num;
	int sensor_bit_flag = recv_sensor_message->sensor_bit_flag;

	server->sensor_bit_flags[module_num] = sensor_bit_flag;
	//  Add the new sensors to the set the UI will see
	server->new_sensor_bit_flags_for_ui[module_num] =  server->new_sensor_bit_flags_for_ui[module_num] | sensor_bit_flag;
	
	int sensor_num;
	int current_time = Time();
	for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
		if (sensor_bit_flag & 1 << sensor_num) {
			server->sensor_time_log[module_num][sensor_num] = current_time;
			
			if (server->state == TRAIN_SERVER_BLOCK_UNTIL_SENSOR && sensor_bit_flag) {
				server->state = TRAIN_SERVER_IDLE;
				PutString(COM2, "%c%d.", 'A' + module_num, sensor_num + 1);
				Reply(server->blocked_tid, server->reply_buffer, MESSAGE_SIZE);
			}
		}
	}
}

void TrainServer_HandleSensorQuery(TrainServer * server) {
	TrainSensorMessage * recv_sensor_message = (TrainSensorMessage *) server->receive_buffer;
	TrainSensorMessage * reply_sensor_message = (TrainSensorMessage *) server->reply_buffer;
	
	int module_num = recv_sensor_message->module_num;

	reply_sensor_message->sensor_bit_flag = server->new_sensor_bit_flags_for_ui[module_num];
	server->new_sensor_bit_flags_for_ui[module_num] = 0;

	reply_sensor_message->message_type = MESSAGE_TYPE_ACK;

	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSwitchData(TrainServer * server) {
	TrainCommandMessage * receive_message = (TrainCommandMessage *) server->receive_buffer;
	TrainCommandMessage * reply_message = (TrainCommandMessage *) server->reply_buffer;
	
	if (receive_message->c1 == SWITCH_CURVED_CODE) {
		server->switch_states[(SwitchState) receive_message->c2] = SWITCH_CURVED;
	} else {
		server->switch_states[(SwitchState) receive_message->c2] = SWITCH_STRAIGHT;
	}
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSwitchQuery(TrainServer * server) {
	GenericTrainMessage  * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericTrainMessage * reply_message = (GenericTrainMessage *) server->reply_buffer;
	
	reply_message->int1 = server->switch_states[receive_message->int1];
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSelectTrack(TrainServer * server) {
	GenericTrainMessage  * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	if (receive_message->int1 == 'A') {
		server->current_track_nodes = server->track_a_nodes;
	} else {
		server->current_track_nodes = server->track_b_nodes;
	}
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSetTrain(TrainServer * server) {
	GenericTrainMessage  * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	TrainEngine_Initialize(&(server->train_engines[0]), receive_message->int1);
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	server->train_engines[0].state = TRAIN_ENGINE_IDLE;
}

void TrainServer_HandleSetDestination(TrainServer * server) {
	GenericTrainMessage * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	server->train_engines[0].destination_node = NodeNameToTrackNode(server->current_track_nodes, receive_message->char1);
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	server->train_engines[0].state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_HandleQueryTrainEngine(TrainServer * server) {
	TrainEngineStatusMessage * reply_message = (TrainEngineStatusMessage *) server->reply_buffer;
	
	assert(sizeof(TrainEngineStatusMessage) <= MESSAGE_SIZE, "TrainEngineStatusMessage too big");
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
/*	reply_message->train_num = server->train_engine.train_num;
	reply_message->speed_setting = server->train_engine.speed_setting;
	reply_message->state = server->train_engine.state;

	if (server->train_engine.current_node) {
		reply_message->current_node_name = server->train_engine.current_node->name;
	} else {
		reply_message->current_node_name = "?";
	}
*/
	reply_message->train_engine = &server->train_engines[0];

	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleTrainEngineClientCommandRequest(TrainServer * server) {
	TrainEngineClientMessage * reply_message = (TrainEngineClientMessage *) server->reply_buffer;
	
	// TODO tell train engine client to do things
	reply_message->message_type = MESSAGE_TYPE_ACK;
	reply_message->command = TRAIN_ENGINE_CLIENT_DO_NOTHING;
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_ProcessEngine(TrainServer * server, TrainEngine * engine) {
	if (!engine->train_num) {
		return;
	}
	
	switch(engine->state) {
	case TRAIN_ENGINE_IDLE:
		TrainServer_ProcessEngineIdle(server, engine);
		break;
	case TRAIN_ENGINE_FINDING_POSITION:
		TrainServer_ProcessEngineFindingPosition(server, engine);
		break;
	case TRAIN_ENGINE_FOUND_STARTING_POSITION:
		TrainServer_ProcessEngineFoundStartingPosition(server, engine);
		break;
	case TRAIN_ENGINE_RUNNING:
		TrainServer_ProcessEngineRunning(server, engine);
		break;
	case TRAIN_ENGINE_AT_DESTINATION:
		TrainServer_ProcessEngineAtDestination(server, engine);
		break;
	case TRAIN_ENGINE_CALIBRATING_SPEED:
		TrainServer_ProcessEngineCalibratingSpeed(server, engine);
		break;
	default:
		assert(0, "Unknown Train Engine State");
		break;
	}
}

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine) {
	SendTrainCommand(TRAIN_SPEED, 10, engine->train_num, 0, 0);
	engine->state = TRAIN_ENGINE_CALIBRATING_SPEED;
	
	// TODO: make this not deadlock
	// TrainServer_SetInitialSwitches(server);
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		engine->current_node = node;
		SendTrainCommand(TRAIN_SPEED, 0, engine->train_num, 0, 0);
	}
}


void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	// Wait for destination to be input
	if (engine->destination_node) {
		engine->state = TRAIN_ENGINE_RUNNING;
		SendTrainCommand(TRAIN_SPEED, 10 | LIGHTS_MASK, engine->train_num, 0, 0);
	}
}

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine) {
	// TODO: make the train go to its destination
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node) {
		engine->current_node = node;
		
		if (engine->current_node == engine->destination_node) {
			engine->state = TRAIN_ENGINE_AT_DESTINATION;
			SendTrainCommand(TRAIN_SPEED, 0, engine->train_num, 0, 0);
		}
	}
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	// Blink the lights
	if (Time() % 50 == 0) {
		SendTrainCommand(TRAIN_SPEED, LIGHTS_MASK, engine->train_num, 0, 0);
		Delay(1);
		SendTrainCommand(TRAIN_SPEED, 0, engine->train_num, 0, 0);
	}
}

track_node * TrainServer_GetEnginePosition(TrainServer * server) {
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				return SensorToTrackNode(server->current_track_nodes, sensor_module, sensor_num);
			}
		}
	}
	
	return 0;
}

void TrainServer_ProcessEngineCalibratingSpeed(TrainServer * server, TrainEngine * engine) {
	// TODO this calibration is too hard coded
	double difference;

	// ticks in both directions
	int t_11 = server->sensor_time_log[SENSOR_MODULE_C][16 - 1];
	int t_12 = server->sensor_time_log[SENSOR_MODULE_D][11 - 1];
	int t_21 = server->sensor_time_log[SENSOR_MODULE_C][15 - 1];
	int t_22 = server->sensor_time_log[SENSOR_MODULE_D][12 - 1];
	
	if (t_11 && t_12) {
		difference = (t_11 - t_12) * TICK_SIZE / 1000.0;
	} else if (t_21 && t_22) {
		difference = (t_21 - t_22) * TICK_SIZE / 1000.0;
	} else {
		return;
	}
	
	if (difference < 0) {
		difference = -difference;
	}
	
	engine->calculated_speed = 45.0 / difference; // 45mm over time
	SendTrainCommand(TRAIN_SPEED, 0, engine->train_num, 0, 0);
	SendTrainCommand(TRAIN_SPEED, 5, engine->train_num, 0, 0);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_SetInitialSwitches(TrainServer * server) {
	SendTrainCommand(TRAIN_SWITCH, SWITCH_CURVED_CODE, 11, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 14, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 15, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 6, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 7, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 8, 0, 0);
	SendTrainCommand(TRAIN_SWITCH, SWITCH_STRAIGHT_CODE, 9, 0, 0);
}

void TrainServerTimer_Start() {
	DebugRegisterFunction(&TrainServerTimer_Start,__func__);
	int return_code = RegisterAs((char*) TRAIN_SERVER_TIMER_NAME);
	assert(return_code == 0, "TrainServerTimer failed to register name");
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	int server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
	assert(server_tid, "TrainServerTimer: server tid not found");
	
	send_message->message_type = MESSAGE_TYPE_HELLO;
	
	while (1) {
		DelaySeconds(0.5);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, 
			"TrainServerTimer: didn't get ACK message");

		if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			robprintfbusy((const unsigned char *)"TrainServerTimer shutting down by request.\n");
			break;
		}
	}
	
	Exit();
}

void TrainCommandServer_Start() {
	DebugRegisterFunction(&TrainCommandServer_Start,__func__);
	robprintfbusy((const unsigned char *)"TrainCommandServer_Start. tid=%d\n", MyTid());
	
	int return_code = RegisterAs((char*) TRAIN_COMMAND_SERVER_NAME);
	assertf(return_code == 0, "TrainCommandServer failed to register");
	
	char receive_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	TrainCommandMessage * command_receive_message = (TrainCommandMessage*) receive_buffer;
	TrainCommandMessage * command_reply_message = (TrainCommandMessage*) reply_buffer;
	int source_tid;
	char speed, train_num, direction_code, switch_num, module_num, lower, upper;
	int train_server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
	
	assert(train_server_tid, "TrainCommandServer_Start: failed to get train server tid");

	int lower_buffer[5];
	int upper_buffer[5];
	
	while (1) {
		Receive(&source_tid, receive_buffer, MESSAGE_SIZE);
		
		if (command_receive_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
			robprintfbusy((const unsigned char *)"TrainCommandServer got shutdown\n");
			command_reply_message->message_type = MESSAGE_TYPE_ACK;
			Reply(source_tid, reply_buffer, MESSAGE_SIZE);
			break;
		}
		assert(command_receive_message->message_type == MESSAGE_TYPE_TRAIN_COMMAND,
		"TrainCommandServer did not get train command");
	
		switch(command_receive_message->command) {
		case TRAIN_SPEED:
			speed = command_receive_message->c1;
			train_num = command_receive_message->c2;
			PutcAtomic(COM1, 2, speed, train_num);
			break;
		case TRAIN_REVERSE:
			train_num = command_receive_message->c1;
			PutcAtomic(COM1, 2, 0, train_num);
			DelaySeconds(0.5);
			PutcAtomic(COM1, 2, 15, train_num);
			DelaySeconds(0.5);
			PutcAtomic(COM1, 2, 5, train_num);
			break;
		case TRAIN_SWITCH:
			direction_code = command_receive_message->c1;
			switch_num = command_receive_message->c2;
			PutcAtomic(COM1, 2, direction_code, switch_num);
			DelaySeconds(0.15);
			Putc(COM1, 32);

			// Make sure the solenoid is really off
			DelaySeconds(0.2);
			Putc(COM1, 32);
			
			// Need to tell the train server the new switch state
			command_receive_message->message_type = MESSAGE_TYPE_SWITCH_DATA;
			Send(train_server_tid, receive_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
			assert(command_reply_message->message_type == MESSAGE_TYPE_ACK, "TrainCommandServer: failed to get ack from train server");
			break;
		case TRAIN_READ_SENSOR:
			module_num = command_receive_message->c1;
			assert(module_num <= SENSOR_MODULE_E, "module_num out of range (not using 0-indexed?)");
			Putc(COM1, 0xc0 | (module_num + 1));
			
			// The course website train manual is wrong, the website is right
			lower = Getc(COM1);
			upper = Getc(COM1);
			
			command_reply_message->c1 = lower;
			command_reply_message->c2 = upper;
			break;
		case TRAIN_CACHE_ALL_SENSORS:
			module_num = command_receive_message->c1;
			assert(module_num <= SENSOR_MODULE_E, "module_num out of range (not using 0-indexed?)");
			Putc(COM1, 128 + NUM_SENSOR_MODULES);
			
			// The course website train manual is wrong, the website is right
			lower_buffer[0] = Getc(COM1);
			upper_buffer[0] = Getc(COM1);
			lower_buffer[1] = Getc(COM1);
			upper_buffer[1] = Getc(COM1);
			lower_buffer[2] = Getc(COM1);
			upper_buffer[2] = Getc(COM1);
			lower_buffer[3] = Getc(COM1);
			upper_buffer[3] = Getc(COM1);
			lower_buffer[4] = Getc(COM1);
			upper_buffer[4] = Getc(COM1);
			break;
		case TRAIN_GET_CACHED_SENSOR_DATA:
			module_num = command_receive_message->c1;
			command_reply_message->c1 = lower_buffer[(int)module_num];
			command_reply_message->c2 = upper_buffer[(int)module_num];
			break;
		default:
			assert(0, "Unknown train command");
			break;
		}
		
		command_reply_message->message_type = MESSAGE_TYPE_ACK;
		Reply(source_tid, reply_buffer, MESSAGE_SIZE);
	}
	
	Exit();
}

void TrainSensorReader_Start() {
	DebugRegisterFunction(&TrainSensorReader_Start,__func__);
	robprintfbusy((const unsigned char *)"TrainSensorReader_Start. tid=%d\n", MyTid());

	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	TrainSensorMessage * send_message = (TrainSensorMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	char module_num;
	char lower;
	char upper;
	int server_tid;
	short shutdown = 0;
	
	assert(sizeof(TrainSensorMessage) <= MESSAGE_SIZE, "TrainSensorMessage size too big");
	
	int i = 0;
	while (1) {
		server_tid = WhoIs((char *) TRAIN_SERVER_NAME);
		
		if (server_tid) {
			break;
		}
		
		i++;
		assert(i < 100, "TrainSensorReader failed to get server tid");
	}
	
	DelaySeconds(1); // TODO Wait for IO to start up
	
	while (1) {
		SendTrainCommand(TRAIN_CACHE_ALL_SENSORS, 0, 0, &lower, &upper);
		for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
			SendTrainCommand(TRAIN_GET_CACHED_SENSOR_DATA, module_num, 0, &lower, &upper);
			
			// Reverse it so it is easier to mask. see train.h
			// http://graphics.stanford.edu/~seander/bithacks.html#ReverseByteWith32Bits
			unsigned int upper_word = upper;
			unsigned int lower_word = lower;
			upper_word = ((upper_word * 0x0802LU & 0x22110LU) | (upper_word * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			upper = (unsigned char) upper_word;
			lower_word = ((lower_word * 0x0802LU & 0x22110LU) | (lower_word * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			lower = (unsigned char) lower_word;

			send_message->message_type = MESSAGE_TYPE_SENSOR_DATA;
			send_message->sensor_bit_flag = upper << 8 | lower;
			send_message->module_num = module_num;

			Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);

			if (reply_message->message_type == MESSAGE_TYPE_SHUTDOWN) {
				shutdown = 1;
				break;
			}

			assert(reply_message->message_type == MESSAGE_TYPE_ACK, "TrainSensorReader failed to get ACK message");
		}
		
		if (shutdown) {
			break;
		}
	}
	
	robprintfbusy((const unsigned char *)"TrainSensorReader exit. tid=%d\n", MyTid());
	
	Exit();
}

void TrainEngine_Initialize(TrainEngine * engine, int train_num) {
	engine->train_num = train_num;
	engine->state = TRAIN_ENGINE_IDLE;
	engine->current_node = 0;
	engine->next_node = 0;
	engine->speed_setting = 0;
	engine->calculated_speed = 0;
	engine->expected_time_at_next_sensor = 0;
	engine->expected_time_at_last_sensor = 0;
	engine->actual_time_at_last_sensor = 0;
	engine->destination_node = 0;
}

track_node * SensorToTrackNode(track_node * track_nodes, int module_num, int sensor_num) {
	int indexed_sensor_num = module_num * SENSORS_PER_MODULE + sensor_num;
	int i;
	for (i = 0; i < TRACK_MAX; i++) {
		track_node * node = &track_nodes[i];
		
		if (node->type == NODE_SENSOR && node->num == indexed_sensor_num) {
			return node;
		}
	}
	
	assertf(0, "SensorToTrackNode: Unknown node for Module=%d, Sensor=%d", module_num, sensor_num);
	return 0;
}

track_node * NodeNameToTrackNode(track_node * track_nodes, char * name) {
	int i;
	for (i = 0; i < TRACK_MAX; i++) {
		track_node * node = &track_nodes[i];
		
		if (m_strcmp(name, node->name) == 0) {
			return node;
		}
	}
	
	return 0;
}

void TrainEngineClient_Start(){
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	TrainEngineClientMessage * reply_message = (TrainEngineClientMessage *) reply_buffer;
	int server_tid = MyParentTid();
	assert(server_tid, "TrainEngineClient failed to get server tid");
	
	send_message->message_type = MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST;
	
	while (1) {
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		switch(reply_message->command) {
		case TRAIN_ENGINE_CLIENT_DO_NOTHING:
			// do nothing
			break;
		default:
			assertf(0, "TrainEngineClient: unknown message type %d", reply_message->command);
			break;
		}
		
		DelaySeconds(0.01);
	}
	
	Exit();
}

