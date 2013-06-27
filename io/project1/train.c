#include "train.h"
#include "public_kernel_interface.h"
#include "robio.h"

void TrainServer_Start() {
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
		default:
			assert(0, "TrainServer: unknown message type");
			break;
		}
		
		TrainServer_ProcessEngine(&server, &server.train_engine);
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

	server->train_sensor_reader_tid = Create(HIGH, TrainSensorReader_Start);
	assert(server->train_sensor_reader_tid, "TrainServer failed to create TrainSensorReader");
	
	server->train_command_server_tid = Create(HIGH, TrainCommandServer_Start);
	assert(server->train_command_server_tid, "TrainServer failed to create TrainCommandServer");
	
	server->train_server_timer_tid = Create(HIGH, TrainServerTimer_Start);
	assert(server->train_server_timer_tid, "TrainServer failed to create TrainServerTimer");
	
	server->num_child_task_running = 3;
	
	int module_num;
	
	for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
		server->sensor_bit_flags[module_num] = 0;
		
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
	
	TrainEngine_Initialize(&server->train_engine, 0);
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

	reply_sensor_message->sensor_bit_flag = server->sensor_bit_flags[module_num];
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
	
	TrainEngine_Initialize(&server->train_engine, receive_message->int1);
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSetDestination(TrainServer * server) {
	GenericMessage * receive_message = (GenericMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	// TODO set the destination on the train engine
	(void) receive_message;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleQueryTrainEngine(TrainServer * server) {
	TrainEngineStatusMessage * reply_message = (TrainEngineStatusMessage *) server->reply_buffer;
	
	assert(sizeof(TrainEngineStatusMessage) <= MESSAGE_SIZE, "TrainEngineStatusMessage too big");
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	reply_message->train_num = server->train_engine.train_num;
	reply_message->speed_setting = server->train_engine.speed_setting;

	if (server->train_engine.current_node) {
		reply_message->current_node_name = server->train_engine.current_node->name;
	} else {
		reply_message->current_node_name = "?";
	}

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
		// TODO make it go somewhere
		break;
	default:
		assert(0, "Unknown Train Engine State");
		break;
	}
}

void TrainServer_ProcessEngineIdle(TrainServer * server, TrainEngine * engine) {
	SendTrainCommand(TRAIN_SPEED, 5, engine->train_num, 0, 0);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
	int sensor_module;
	int sensor_num;
	
	for (sensor_module = 0; sensor_module < NUM_SENSOR_MODULES; sensor_module++) {
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			if ((server->sensor_bit_flags[sensor_module] >> sensor_num) & 0x01) {
				SendTrainCommand(TRAIN_SPEED, 0, engine->train_num, 0, 0);
				engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
				engine->current_node = SensorToTrackNode(server->current_track_nodes, sensor_module, sensor_num);
				return;
			}
		}
	}
}

void TrainServerTimer_Start() {
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
		for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
			SendTrainCommand(TRAIN_READ_SENSOR, module_num, 0, &lower, &upper);
			
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

