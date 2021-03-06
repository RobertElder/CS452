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
			server.shutdown = 1;
			
			Send(server.train_command_server_tid, server.receive_buffer, MESSAGE_SIZE, server.reply_buffer, MESSAGE_SIZE);
			
			assert(server.reply_message->message_type == MESSAGE_TYPE_ACK, "TrainServer did not get ACK reply from train command server shutdown");

			server.num_child_task_running--;
			break;
		case MESSAGE_TYPE_DATA:
			// from TrainSensorReader
			TrainServer_HandleSensorReaderData(&server);
			break;
		case MESSAGE_TYPE_QUERY:
			// from the ui server
			TrainServer_HandleSensorQuery(&server);
			break;
		default:
			assert(0, "TrainServer: unknown message type");
			break;
		}
	}
	
	assert(admin_tid, "TrainServer: did not get admin tid");
	Reply(admin_tid, server.reply_buffer, MESSAGE_SIZE);
	
	robprintfbusy((const unsigned char *)"TrainServer_Start exit.\n");

	Exit();
}

void TrainServer_Initialize(TrainServer * server) {
	int return_code = RegisterAs((char*) TRAIN_SERVER_NAME);
	assert(return_code == 0, "TrainServer_Start failed to register name");
	
	server->shutdown = 0;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (GenericMessage *) server->reply_buffer;

	server->train_sensor_reader_tid = Create(HIGH, TrainSensorReader_Start);
	assert(server->train_sensor_reader_tid, "TrainServer failed to create TrainSensorReader");
	
	server->train_command_server_tid = Create(HIGH, TrainCommandServer_Start);
	assert(server->train_command_server_tid, "TrainServer failed to create TrainCommandServer");
	
	server->num_child_task_running = 2;
	
	int module_num;
	
	for (module_num = SENSOR_MODULE_A; module_num <= SENSOR_MODULE_E; module_num++) {
		server->sensor_bit_flags[module_num] = 0;
		
		int sensor_num;
		for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
			server->sensor_time_log[module_num][sensor_num] = 0;
		}
	}
}

void TrainServer_HandleSensorReaderData(TrainServer * server) {
	TrainSensorMessage * recv_sensor_message = (TrainSensorMessage *) server->receive_buffer;

	if (server->shutdown) {
		server->reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
	}
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	if (server->shutdown) {
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
			break;
		case TRAIN_READ_SENSOR:
			module_num = command_receive_message->c1;
			Putc(COM1, 0xc0 | module_num);
			
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
			/*Putc(COM1, 0xc0 | module_num);
			
			// The course website train manual is wrong, the website is right
			lower = Getc(COM1);
			upper = Getc(COM1);
			*/
			SendTrainCommand(TRAIN_READ_SENSOR, module_num, 0, &lower, &upper);
			
			// Reverse it so it is easier to mask. see train.h
			// http://graphics.stanford.edu/~seander/bithacks.html#ReverseByteWith32Bits
			unsigned int upper_word = upper;
			unsigned int lower_word = lower;
			upper_word = ((upper_word * 0x0802LU & 0x22110LU) | (upper_word * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			upper = (unsigned char) upper_word;
			lower_word = ((lower_word * 0x0802LU & 0x22110LU) | (lower_word * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			lower = (unsigned char) lower_word;

			send_message->message_type = MESSAGE_TYPE_DATA;
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

		// TODO: what's a good value?
		DelaySeconds(0.2);
	}
	
	robprintfbusy((const unsigned char *)"TrainSensorReader exit. tid=%d\n", MyTid());
	
	Exit();
}

