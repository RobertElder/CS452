#include "train.h"
#include "public_kernel_interface.h"
#include "robio.h"

void TrainServer_Start() {
	TrainServer server;
	TrainServer_Initialize(&server);

	while(server.num_child_task_running) {
		Receive(&server.source_tid, server.receive_buffer, MESSAGE_SIZE);
		server.reply_message->message_type = MESSAGE_TYPE_ACK;
		
		switch(server.receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			// from admin tid
			Reply(server.source_tid, server.reply_buffer, MESSAGE_SIZE);
			robprintfbusy((const unsigned char *)"TrainServer_Start Exiting because of shutdown.\n");
			server.shutdown = 1;
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
	
	robprintfbusy((const unsigned char *)"TrainServer_Start exit.\n");

	Exit();
}

void TrainServer_Initialize(TrainServer * server) {
	int return_code = RegisterAs((char*) TRAIN_SERVER_NAME);
	assert(return_code == 0, "TrainServer_Start failed to register name");
	
	server->shutdown = 0;
	server->receive_message = (GenericMessage *) server->receive_buffer;
	server->reply_message = (GenericMessage *) server->reply_buffer;

	int tid = Create(HIGH, TrainSensorReader_Start);
	assert(tid, "TrainServer failed to create TrainSensorReader");
	
	server->num_child_task_running = 1;
	
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
		server->num_child_task_running--;
	}
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);

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

void TrainSensorReader_Start() {
	robprintfbusy((const unsigned char *)"TrainSensorReader_Start. tid=%d\n", MyTid());

	char send_buffer[MESSAGE_SIZE];
	char reply_buffer[MESSAGE_SIZE];
	TrainSensorMessage * send_message = (TrainSensorMessage *) send_buffer;
	GenericMessage * reply_message = (GenericMessage *) reply_buffer;
	int module_num;
	int lower;
	int upper;
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
			Putc(COM1, 0xc0 | module_num);
			
			// The course website train manual is wrong, the website is right
			lower = Getc(COM1);
			upper = Getc(COM1);
			
			// Reverse it so it is easier to mask. see train.h
			// http://graphics.stanford.edu/~seander/bithacks.html#ReverseByteWith32Bits
			upper = ((upper * 0x0802LU & 0x22110LU) | (upper * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			upper = (unsigned char) upper;
			lower = ((lower * 0x0802LU & 0x22110LU) | (lower * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
			lower = (unsigned char) lower;

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
		
		DelaySeconds(0.2);
	}
	
	robprintfbusy((const unsigned char *)"TrainSensorReader exit. tid=%d\n", MyTid());
	
	Exit();
}

