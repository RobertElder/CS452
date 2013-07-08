#include "train.h"
#include "public_kernel_interface.h"
#include "robio.h"
#include "memory.h"
#include "priorities.h"
#include "scheduler.h"
#include "random.h"
#include "route.h"

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
			// TODO:  I don't think this is used? ...delete later
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
			TrainServer_HandleSetTrain(&server, 0);
			break;
		case MESSAGE_TYPE_GO_FOREVER:
			// from ui server
			TrainServer_HandleSetTrain(&server, 1);
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
		case MESSAGE_TYPE_GET_SWITCH_REQUEST:
			// TrainSwitchMaster
			TrainServer_HandleGetSwitchRequest(&server);
			break;
		case MESSAGE_TYPE_SET_SWITCH:
			TrainServer_HandleSetSwitch(&server);
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

	
	server->switch_master_tid = Create(TRAINSWITCHMASTER_START_PRIORITY, TrainSwitchMaster_Start);
	assert(server->switch_master_tid, "TrainServer failed to create TrainSwitchMaster");
	
	server->num_child_task_running = 4;

	RNG_Initialize(&server->rng,101);
	
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
		server->switches_to_change[switch_num] = SWITCH_UNKNOWN;
	}


	Queue_Initialize((Queue*)&server->queued_switch_changes, SWITCH_QUEUE_SIZE);

	int i;
	for(i = 0; i < NUM_ENGINES; i++)
		TrainEngine_Initialize(&(server->train_engines[i]), i);
	
	Queue_Initialize((Queue*) &server->train_speed_queue, TRAIN_SPEED_QUEUE_SIZE);

	//  The train engine relies on the server model being set up correctly first.
	server->train_engines[0].tid = Create(TRAINENGINE_START_PRIORITY, TrainEngineClient_Start);
	assert(server->train_engines[0].tid, "TrainServer failed to create TrainEngineClient_Start");
}


track_node * GetRandomSensorReachableViaDirectedGraph(TrainServer * server, track_node * start_node) {
	int i = 0;
	while(1){
		track_node * random_sensor = GetRandomSensor(server);
		if(random_sensor != start_node && IsNodeReachableViaDirectedGraph(server->current_track_nodes, start_node, random_sensor, 0)){
			int module_num = random_sensor->name[0] - 65;
			assert(module_num >= 0 && module_num <= 4, "Module num is being calculated incorrectly.");
			int sensor_num = random_sensor->num;
			if(!(is_sensor_blacklisted(module_num, sensor_num, server))){
				return random_sensor;
			}
		}
		i++;
		//assert(i < 100, "Unable to find a sensor that was reachable via the directed graph in current direction.");
		
		if (i > 100) {
			return 0;
		}
	}
}

track_node * GetRandomSensor(TrainServer * server) {
	while(1){
		int index = RNG_Get(&server->rng) % TRACK_MAX;
		if(server->current_track_nodes[index].reverse && server->current_track_nodes[index].type == NODE_SENSOR){
			return &(server->current_track_nodes[index]);
		}
	}
}

int is_sensor_blacklisted(int module_num, int sensor_num, TrainServer * server){
	//  D9, D10
	if(server->current_track_nodes == server->track_a_nodes && module_num == 3 && (sensor_num == 8 || sensor_num == 9)){
		return 1;
	}else{
		return 0;
	}
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

	
	int sensor_num;
	int current_time = Time();

	server->sensor_bit_flags[module_num] = 0;
	for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
		if(!(is_sensor_blacklisted(module_num, sensor_num, server))){
			if (sensor_bit_flag & 1 << sensor_num) {
				server->sensor_time_log[module_num][sensor_num] = current_time;
				server->sensor_bit_flags[module_num] |= (sensor_bit_flag & 1 << sensor_num);
			}
		}
	}
	//  Add the new sensors to the set the UI will see
	server->new_sensor_bit_flags_for_ui[module_num] = server->new_sensor_bit_flags_for_ui[module_num] | server->sensor_bit_flags[module_num];
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
	} else if(receive_message->c1 == SWITCH_STRAIGHT_CODE) {
		server->switch_states[(SwitchState) receive_message->c2] = SWITCH_STRAIGHT;
	} else {
		assert(0,"Invalid switch data.");
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

void TrainServer_HandleSetTrain(TrainServer * server, short go_forever) {
	GenericTrainMessage  * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	
	TrainEngine_Initialize(&(server->train_engines[0]), receive_message->int1);
	server->train_engines[0].go_forever = go_forever;
	
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
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	int train_speed_settings = (int) Queue_PopStart((Queue*) &server->train_speed_queue);
	
	if (train_speed_settings) {
		reply_message->command = TRAIN_ENGINE_CLIENT_SET_SPEED;
		int train_speed = train_speed_settings >> 8 & 0xff;
		int train_num = train_speed_settings & 0xff;
		reply_message->c1 = train_speed;
		reply_message->c2 = train_num;
		if (train_speed != 0 && train_speed != 16) {
			PrintMessage("Setting train %d to speed %d", train_num, train_speed);
		}
	} else {
		reply_message->command = TRAIN_ENGINE_CLIENT_DO_NOTHING;
	}
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleGetSwitchRequest(TrainServer * server) {
	TrainCommandMessage * reply_message = (TrainCommandMessage *) server->reply_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_NEG_ACK;

	if(Queue_CurrentCount((Queue*)&server->queued_switch_changes)){
		reply_message->message_type = MESSAGE_TYPE_ACK;

		int switch_num = (int)Queue_PopStart((Queue *)&server->queued_switch_changes);
		int direction_code;
		
		if (GetQueuedSwitchState(server, switch_num) == SWITCH_CURVED) {
			direction_code = SWITCH_CURVED_CODE;
		} else if(GetQueuedSwitchState(server, switch_num) == SWITCH_STRAIGHT) {
			direction_code = SWITCH_STRAIGHT_CODE;
		} else if(GetQueuedSwitchState(server, switch_num) == SWITCH_UNKNOWN) {
			PrintMessage("\x1b[31;44mAttempting to tell switch master to set to switch %d unknown state.",switch_num);
			while(Queue_CurrentCount((Queue*)&server->queued_switch_changes)){
				int s = (int)Queue_PopStart((Queue *)&server->queued_switch_changes);
				PrintMessage("\x1b[31;44mQueue contains %d.",s);
			}
			direction_code = SWITCH_CURVED_CODE;
		} else {
			assert(0,"Invalid switch state.");
			direction_code = SWITCH_CURVED_CODE;
		}

		if(server->switch_states[switch_num] == GetQueuedSwitchState(server, switch_num)){
			//  Don't keep telling it to change if is already set.
			reply_message->message_type = MESSAGE_TYPE_NEG_ACK;
		}else{
			PrintMessage("Telling switchmaster to set %d to be %c", switch_num, GetQueuedSwitchState(server, switch_num));
			reply_message->c1 = direction_code;
			reply_message->c2 = switch_num;
			server->switch_states[switch_num] = GetQueuedSwitchState(server, switch_num);
		}
		//  We don't need to keep this information in the queue anymore, it has been dealth with.
		QueueSwitchState(server, switch_num, SWITCH_UNKNOWN);
	}
	
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSetSwitch(TrainServer * server) {
	TrainCommandMessage * receive_message = (TrainCommandMessage *) server->receive_buffer;
	TrainCommandMessage * reply_message = (TrainCommandMessage *) server->reply_buffer;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	
	int direction_code = receive_message->c1;
	int switch_num = receive_message->c2;
	
	if (direction_code == SWITCH_CURVED_CODE) {
		QueueSwitchState(server, switch_num, SWITCH_CURVED);
	} else if (direction_code == SWITCH_STRAIGHT_CODE){
		QueueSwitchState(server, switch_num, SWITCH_STRAIGHT);
	} else {
		assert(0,"Invalid code in TrainServer_HandleSetSwitch.");
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
	case TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN:
		TrainServer_ProcessEngineFindingPosition(server, engine);
		break;
	case TRAIN_ENGINE_FOUND_STARTING_POSITION:
		TrainServer_ProcessEngineFoundStartingPosition(server, engine);
		break;
	case TRAIN_ENGINE_RUNNING:
	case TRAIN_ENGINE_NEAR_DESTINATION:
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
	if (engine->wait_until < TimeSeconds()) {
		PrintMessage("Engine %d is starting.", engine->train_num);
		TrainServer_SetTrainSpeed(server, 4, engine->train_num);
		engine->state = TRAIN_ENGINE_FINDING_POSITION;
	}
}

void TrainServer_ProcessEngineFindingPosition(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node && engine->current_node != node) {
		engine->state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
		engine->current_node = node;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	}
}


void TrainServer_ProcessEngineFoundStartingPosition(TrainServer * server, TrainEngine * engine) {
	PrintMessage("Found starting position.");
	
	int i = 0;
	while (1) {
		engine->destination_node = GetRandomSensorReachableViaDirectedGraph(server, engine->current_node);
		
		if (!engine->destination_node) {
			// Reverse and try again
			PrintMessage("No destination in this direction! Reversing..");
			TrainServer_SetTrainSpeed(server, REVERSE_SPEED, engine->train_num);
			TrainServer_SetTrainSpeed(server, 4, engine->train_num);
			engine->state = TRAIN_ENGINE_REVERSE_AND_TRY_AGAIN;
			return;
		}
		
		int module_num = engine->destination_node->num / SENSORS_PER_MODULE;
		int sensor_num = engine->destination_node->num % SENSORS_PER_MODULE;
		
		if (!is_sensor_blacklisted(module_num, sensor_num, server)) {
			break;
		}
		
		i++;
		assert(i < 100, "Unable to find a random destination that is not blacklisted");
	}
	
	engine->source_node = engine->current_node;

	PrintMessage("Travelling from %s to %s.",engine->current_node->name ,engine->destination_node->name);

	engine->route_nodes_length = 0;
	PopulateRouteNodeInfo(engine->route_node_info, server->current_track_nodes, engine->current_node, engine->destination_node, 0, 0, &(engine->route_nodes_length));

	engine->state = TRAIN_ENGINE_RUNNING;
	TrainServer_QueueSwitchStates(server, engine);
	engine->granular_speed_setting = STARTUP_TRAIN_SPEED;
	TrainServer_SetTrainSpeed(server, STARTUP_TRAIN_SPEED | LIGHTS_MASK, engine->train_num);
}

void TrainServer_ProcessEngineRunning(TrainServer * server, TrainEngine * engine) {
	track_node * node = TrainServer_GetEnginePosition(server);
	
	if (node && node != engine->current_node) {
		engine->current_node = node;
		TrainServer_ProcessSensorData(server, engine);
	}
	
	double time = TimeSeconds() - engine->actual_time_at_last_sensor;
	engine->estimated_distance_after_node = engine->calculated_speed * time;
	engine->distance_to_destination = DistanceToDestination(engine->route_node_info, engine->route_node_index, engine->destination_node) - engine->estimated_distance_after_node;
	
	assert(engine->speed_setting < 16, "Train Speed Setting is set wrong");
	int stopping_distance = STOPPING_DISTANCE[engine->speed_setting];

	if (engine->distance_to_destination < stopping_distance) {
		TrainServer_SlowTrainDown(server, engine);
	}
}

SwitchState GetQueuedSwitchState(TrainServer * server, int switch_num){
	return server->switches_to_change[switch_num];
}

void QueueSwitchState(TrainServer * server, int switch_num, SwitchState new_state){
	//  We don't want to add the new state to the queue we are setting it to unknown or if it already queued
	if(new_state == SWITCH_UNKNOWN || server->switches_to_change[switch_num] == new_state){
		server->switches_to_change[switch_num] = new_state;
	} else{
		//  We should never be attempting to overwrite an already queued switch state, unless it is the same
		
		assertf((!((!(server->switches_to_change[switch_num] == SWITCH_UNKNOWN || new_state == SWITCH_UNKNOWN)) && server->switches_to_change[switch_num] != new_state)), "Attempting to queue switch state that overwrites previous queued switch state. Setting switch number %d to %c, but queued state is %c.",switch_num, new_state, server->switches_to_change[switch_num]);
		//  Add it to the queue so that the switch master will set it, but not if it is already queued.
		Queue_PushEnd((Queue*)&server->queued_switch_changes, (QUEUE_ITEM_TYPE)switch_num);
		server->switches_to_change[switch_num] = new_state;
	}
}

void TrainServer_QueueSwitchStates(TrainServer * server, TrainEngine * engine ){
	int current_route_node_index = engine->route_node_index;
	while(engine->route_node_info[current_route_node_index].node != engine->destination_node){
		if(engine->route_node_info[current_route_node_index].node->type == NODE_BRANCH){
			int switch_num = engine->route_node_info[current_route_node_index].node->num;
			int next_switch_state = engine->route_node_info[current_route_node_index].switch_state;
			int queued_switch_state = GetQueuedSwitchState(server, switch_num);
			if((queued_switch_state != SWITCH_UNKNOWN) && (queued_switch_state != next_switch_state)){
				//  We have switched all the switches we can so far.
				break;
			}else{
				QueueSwitchState(server, switch_num, next_switch_state);
			}
		}
		current_route_node_index++;
	}
}

void TrainServer_ProcessSensorData(TrainServer * server, TrainEngine * engine) {
	double time = TimeSeconds();
	double time_difference = time - engine->actual_time_at_last_sensor;
	double new_speed = (double) engine->distance_to_next_sensor / time_difference;
	engine->last_calculated_speed = engine->calculated_speed;
	engine->calculated_speed = SPEED_ALPHA * new_speed + (1 - SPEED_ALPHA) * engine->last_calculated_speed;
	
	if (engine->calculated_speed > MAX_PHYSICAL_SPEED) {
		PrintMessage("Train speed calculation too fast (%d mm/s). Capping.", (int) engine->calculated_speed);
		engine->calculated_speed = MAX_PHYSICAL_SPEED;
	}
	
	engine->actual_time_at_last_sensor = time;
	engine->expected_time_at_last_sensor = engine->expected_time_at_next_sensor;
	engine->next_node = 0;
	
	if (engine->current_node == engine->destination_node) {
		engine->state = TRAIN_ENGINE_AT_DESTINATION;
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
		PrintMessage("At destination %s.", engine->current_node->name);
		return;
	}
	
	// Feedback control system
	if (engine->state != TRAIN_ENGINE_NEAR_DESTINATION) {
		if (engine->calculated_speed < TARGET_SPEED && engine->granular_speed_setting < 12) {
			engine->granular_speed_setting += FEEDBACK_CONTROL_SPEED_INCREMENT;
		} else if (engine->calculated_speed > TARGET_SPEED && engine->granular_speed_setting > 8) {
			engine->granular_speed_setting -= FEEDBACK_CONTROL_SPEED_INCREMENT;
		}
		
		int new_speed_setting = (int) engine->granular_speed_setting;
		
		if (new_speed_setting != engine->speed_setting) {
			TrainServer_SetTrainSpeed(server, new_speed_setting | LIGHTS_MASK, engine->train_num);
		}
	}
	
	
	int i = 0;
	int found = 0;
	for (i = engine->route_node_index; i < engine->route_nodes_length; i++) {
		if (engine->route_node_info[i].node == engine->current_node) {
			found = 1;
			engine->route_node_index = i;
			break;
		}
	}

	if(!(found)){
		//PrintMessage("\x1b[31;44mUnable to find current sensor (%s) in route list from %s to %s.", engine->current_node->name, engine->source_node->name, engine->destination_node->name);
	}

	engine->distance_to_next_sensor = DistanceToNextSensor(engine->route_node_info, engine->route_node_index);
	engine->expected_time_at_next_sensor = (double) engine->distance_to_next_sensor / engine->calculated_speed + time;

	TrainServer_QueueSwitchStates(server, engine);
	
	track_node * next_node = GetNextSensor(engine->route_node_info, engine->route_node_index);
		
	if (next_node && next_node == engine->destination_node) {
		TrainServer_SlowTrainDown(server, engine);
	}
}

void TrainServer_ProcessEngineAtDestination(TrainServer * server, TrainEngine * engine) {
	// Blink the lights
	if (Time() % 50 == 0) {
		TrainServer_SetTrainSpeed(server, LIGHTS_MASK, engine->train_num);
		Delay(1);
		TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	}
	
	if (engine->go_forever) {
		TrainEngine_Initialize(engine, engine->train_num);
		engine->go_forever = 1;
		engine->state = TRAIN_ENGINE_IDLE;
		
		// Pause a bit so we can see it found destination
		engine->wait_until = TimeSeconds() + 4;
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
	TrainServer_SetTrainSpeed(server, 0, engine->train_num);
	TrainServer_SetTrainSpeed(server, 5, engine->train_num);
	engine->state = TRAIN_ENGINE_FINDING_POSITION;
}

void TrainServer_SetTrainSpeed(TrainServer * server, int speed, int train_num) {
	int train_speed_settings = speed << 8 | train_num;
	Queue_PushEnd((Queue*) &server->train_speed_queue, (QUEUE_ITEM_TYPE) train_speed_settings);
	
	int i;
	for (i = 0; i < NUM_ENGINES; i++) {
		if (server->train_engines[i].train_num == train_num) {
			server->train_engines[i].speed_setting = speed & ~LIGHTS_MASK;
			break;
		}
	}
}

void TrainServer_SlowTrainDown(TrainServer * server, TrainEngine * engine) {
	if (engine->state == TRAIN_ENGINE_RUNNING) {
		TrainServer_SetTrainSpeed(server, 3, engine->train_num);
		engine->state = TRAIN_ENGINE_NEAR_DESTINATION;
		PrintMessage("Slowing down");
	}
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
		DelaySeconds(0.1);
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		assert(reply_message->message_type == MESSAGE_TYPE_ACK || reply_message->message_type == MESSAGE_TYPE_SHUTDOWN, 
			"TrainServerTimer: didn't get ACK message");

		if(reply_message->message_type == MESSAGE_TYPE_SHUTDOWN){
			break;
		}
	}
	
	Exit();
}

void TrainCommandServer_Start() {
	DebugRegisterFunction(&TrainCommandServer_Start,__func__);
	
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
			PutcAtomic(COM1, 2, REVERSE_SPEED, train_num);
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
	
	
	Exit();
}

void TrainEngine_Initialize(TrainEngine * engine, int train_num) {
	engine->train_num = train_num;
	engine->state = TRAIN_ENGINE_IDLE;
	engine->current_node = 0;
	engine->next_node = 0;
	engine->speed_setting = 0;
	engine->calculated_speed = 0;
	engine->last_calculated_speed = 0;
	engine->expected_time_at_next_sensor = 0;
	engine->expected_time_at_last_sensor = 0;
	engine->actual_time_at_last_sensor = 0;
	engine->destination_node = 0;
	engine->route_node_index = 0;
	engine->route_nodes_length = 0;
	engine->distance_to_destination = 0;
	engine->distance_to_next_sensor = 0;
	engine->estimated_distance_after_node = 0;
	engine->go_forever = 0;
	engine->wait_until = 0;
}

void TrainEngineClient_Start(){
	DebugRegisterFunction(&TrainEngineClient_Start,__func__);
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	GenericMessage * send_message = (GenericMessage *) send_buffer;
	TrainEngineClientMessage * reply_message = (TrainEngineClientMessage *) reply_buffer;
	int server_tid = MyParentTid();
	assert(server_tid, "TrainEngineClient failed to get server tid");
	
	send_message->message_type = MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST;
	
	TrainEngine_SetInitialSwitches();
	
	while (1) {
		Send(server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		switch(reply_message->command) {
		case TRAIN_ENGINE_CLIENT_DO_NOTHING:
			// do nothing
			DelaySeconds(0.01);
			break;
		case TRAIN_ENGINE_CLIENT_SET_SPEED:
			SendTrainCommand(TRAIN_SPEED, reply_message->c1, reply_message->c2, 0, 0);
			break;
		default:
			assertf(0, "TrainEngineClient: unknown message type %d", reply_message->command);
			break;
		}
	}
	
	Exit();
}

void TrainEngine_SetInitialSwitches() {
	SetTrainSwitch(SWITCH_CURVED_CODE, 11);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 14);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 15);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 6);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 7);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 8);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 9);
}

void TrainSwitchMaster_Start() {
	DebugRegisterFunction(&TrainSwitchMaster_Start,__func__);
	
	int return_code = RegisterAs((char*) TRAIN_SWITCH_MASTER_NAME);
	assertf(return_code == 0, "TrainSwitchMaster failed to register");
	
	char send_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	char reply_buffer[MESSAGE_SIZE] __attribute__ ((aligned (4)));
	TrainCommandMessage * command_send_message = (TrainCommandMessage*) send_buffer;
	TrainCommandMessage * command_reply_message = (TrainCommandMessage*) reply_buffer;
	char direction_code, switch_num;
	int train_server_tid = WhoIs((char*) TRAIN_SERVER_NAME);
	
	assert(train_server_tid, "TrainSwitchMaster_Start: failed to get train server tid");
	
	command_send_message->message_type = MESSAGE_TYPE_GET_SWITCH_REQUEST;
	
	while (1) {
		Send(train_server_tid, send_buffer, MESSAGE_SIZE, reply_buffer, MESSAGE_SIZE);
		
		if (command_reply_message->message_type == MESSAGE_TYPE_ACK) {
			direction_code = command_reply_message->c1;
			switch_num = command_reply_message->c2;
			SendTrainCommand(TRAIN_SWITCH, direction_code, switch_num, 0, 0);
		} else {
			DelaySeconds(0.05);
		}
	}
	
	Exit();
}

