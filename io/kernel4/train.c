#include "train.h"
#include "public_kernel_interface.h"
#include "robio.h"

void TrainServer_Start() {
	int return_code = RegisterAs((char*) TRAIN_SERVER_NAME);
	int source_tid;
	int shutdown = 0;
	assert(return_code == 0, "TrainServer_Start failed to register name");
	
	TrainServer server;
	TrainServer_Initialize(&server);
	
	GenericMessage * receive_message = (GenericMessage *) server.receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server.reply_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	while(1) {
		Receive(&source_tid, server.receive_buffer, MESSAGE_SIZE);
		
		switch(receive_message->message_type) {
		case MESSAGE_TYPE_SHUTDOWN:
			Reply(source_tid, server.reply_buffer, MESSAGE_SIZE);
			robprintfbusy((const unsigned char *)"TrainServer_Start Exiting because of shutdown.\n");
			shutdown = 1;
			break;
		default:
			assert(0, "TrainServer: unknown message type");
			break;
		}
		
		if (shutdown) {
			break;
		}
	}
	
	Exit();
	
}

void TrainServer_Initialize(TrainServer * server) {

}
