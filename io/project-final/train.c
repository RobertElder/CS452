#include "train.h"
#include "public_kernel_interface.h"
#include "private_kernel_interface.h"
#include "kernel_state.h"
#include "robio.h"
#include "memory.h"
#include "priorities.h"
#include "scheduler.h"
#include "random.h"
#include "route.h"
#include "train_logic.h"
#include "tracks/undirected_nodes.h"
#include "train_abstraction_layer.h"

static void *memset(void *s, int c, unsigned int n) {
  unsigned char *p = s;
  while(n --> 0) { *p++ = (unsigned char)c; }
  return s;
}

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
			TrainServer_ProcessEngines(&server);
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
			TrainServer_ProcessEngines(&server);
			// See inside TrainServer_HandleSensorReaderData for unblocking logic
			break;
		case MESSAGE_TYPE_SELECT_TRACK:
			// from ui server
			TrainServer_HandleSelectTrack(&server);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_SET_TRAIN:
			// from ui server
			TrainServer_HandleSetTrain(&server, 0);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_GO_FOREVER:
			// from ui server
			TrainServer_HandleSetTrain(&server, 1);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_SET_DESTINATION:
			// from ui server
			TrainServer_HandleSetDestination(&server);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_QUERY_TRAIN_ENGINE:
			// from ui server
			TrainServer_HandleQueryTrainEngine(&server);
			break;
		case MESSAGE_TYPE_TRAIN_ENGINE_COMMAND_REQUEST:
			// from TrainEngineClient
			TrainServer_HandleTrainEngineClientCommandRequest(&server);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_GET_SWITCH_REQUEST:
			// TrainSwitchMaster
			TrainServer_HandleGetSwitchRequest(&server);
			break;
		case MESSAGE_TYPE_SET_SWITCH:
			TrainServer_HandleSetSwitch(&server);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_SET_NUM_ENGINES:
			TrainServer_HandleSetNumEngines(&server);
			TrainServer_ProcessEngines(&server);
			break;
		case MESSAGE_TYPE_RESET_TRACK:
			TrainServer_HandleResetTrack(&server);
			TrainServer_ProcessEngines(&server);
			break;
		default:
			assert(0, "TrainServer: unknown message type");
			break;
		}
		TrainServer_ConsiderReplyToTrainSensorReader(&server);
	}

	assert(admin_tid, "TrainServer: did not get admin tid");
	server.reply_message->message_type = MESSAGE_TYPE_ACK;
	assert(server.reply_message->message_type == MESSAGE_TYPE_ACK, "TrainServer: failed to set ack message");
	Reply(admin_tid, server.reply_buffer, MESSAGE_SIZE);

	Exit();
}

void TrainServer_ConsiderReplyToTrainSensorReader(TrainServer * server){
	//  Only unblock the sensor reader if there are no switches queued (to give them priority.)
	if(!(Queue_CurrentCount((Queue*)&server->queued_switch_changes)) && !Queue_CurrentCount((Queue*) &server->train_speed_queue)){
		if(server->sensor_reader_blocked){
			if (server->state == TRAIN_SERVER_SHUTDOWN) {
				server->reply_message->message_type = MESSAGE_TYPE_SHUTDOWN;
			}else{
				server->reply_message->message_type = MESSAGE_TYPE_ACK;
			}
			
			if (server->state == TRAIN_SERVER_SHUTDOWN) {
				server->num_child_task_running--;
			}
			Reply(server->train_sensor_reader_tid, server->reply_buffer, MESSAGE_SIZE);
			server->sensor_reader_blocked = 0;
		}
	}
}

void TrainServer_ProcessEngines(TrainServer * server){
	int i;
	for(i = 0; i < server->num_engines; i++) {
		if (server->train_engines[i].train_num) {
			TrainServer_ProcessEngine(server, &(server->train_engines[i]));
		}
	}

}

void TrainServer_Initialize(TrainServer * server) {
	int return_code = RegisterAs((char*) TRAIN_SERVER_NAME);
	assert(return_code == 0, "TrainServer_Start failed to register name");
	
	TAL_Initialize(&server->tal, server);
	
	server->sensor_reader_blocked = 0;
	server->num_engines = 1;
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
	
	server->num_track_a_undirected_nodes = 0;
	server->num_track_b_undirected_nodes = 0;

	init_undirected_nodes(server->track_a_nodes, server->track_a_undirected_nodes, &server->num_track_a_undirected_nodes);
	init_undirected_nodes(server->track_b_nodes, server->track_b_undirected_nodes, &server->num_track_b_undirected_nodes);
	
	server->current_undirected_nodes = server->track_a_undirected_nodes;
	
	int switch_num;
	for (switch_num = 0; switch_num < NUM_SWITCHES; switch_num++) {
		server->switch_states[switch_num] = SWITCH_UNKNOWN;
		server->switches_to_change[switch_num] = SWITCH_UNKNOWN;
	}


	Queue_Initialize((Queue*)&server->queued_switch_changes, SWITCH_QUEUE_SIZE);

	int i;
	for(i = 0; i < MAX_NUM_ENGINES; i++) {
		TrainEngine_Initialize(&(server->train_engines[i]), 0);
	}
	
	Queue_Initialize((Queue*) &server->train_speed_queue, TRAIN_SPEED_QUEUE_SIZE);

	//  The train engine relies on the server model being set up correctly first.
	server->train_engine_client_tid = Create(TRAINENGINE_START_PRIORITY, TrainEngineClient_Start);
	assert(server->train_engine_client_tid, "TrainServer failed to create TrainEngineClient_Start");
}

int IsNodeReachableViaDirectedGraph(TrainServer * server, int train_num, track_node * start_node, track_node * dest_node, int levels) {
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if (start_node->reserved && start_node->reserved != train_num){
		return 0;
	}

	if(start_node == dest_node){
		return 1;
	}else if(start_node->type == NODE_MERGE){
		//  Don't go through a broken switch this way or we might get stuck.
		if(TAL_IsSwitchFaulty(&server->tal, start_node->num))
			return 0;
		return IsNodeReachableViaDirectedGraph(server, train_num, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
	}else if(start_node->type == NODE_SENSOR){
		return IsNodeReachableViaDirectedGraph(server, train_num, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1);
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		//  Don't try to go through broken switches.
		if(TAL_IsSwitchFaulty(&server->tal, start_node->num))
			return 0;
		int rtn1 = IsNodeReachableViaDirectedGraph(server, train_num, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1);
		int rtn2 = 0;
		if(!rtn1){
			rtn2 = IsNodeReachableViaDirectedGraph(server, train_num, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1);
		}
		/*
		if(rtn1 || rtn2){
			//  Don't try to go through a path that requires the next switch to be changed.
			int switch_state = rtn1 ? SWITCH_STRAIGHT : SWITCH_CURVED;
			if(levels == 1 && (!(server->switch_states[start_node->num] == switch_state)))
				return 0;
		}
		*/

		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}
}

int PopulateRouteNodeInfo(TrainServer * server, RouteNodeInfo * info_array, track_node * track_nodes, track_node * start_node, track_node * dest_node, int levels, int array_index, int * route_nodes_length, int train_num) {
	//  Don't go too deep
	if (levels > 20){
		return 0;
	}

	if (start_node->reserved && start_node->reserved != train_num){
		return 0;
	}

	if(start_node == dest_node){
		*route_nodes_length = (*route_nodes_length) + 1;
		assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
		info_array[array_index].node = start_node;
		info_array[array_index].switch_state = SWITCH_UNKNOWN;
		info_array[array_index].edge = 0;
		return 1;
	}else if(start_node->type == NODE_MERGE){
		if(TAL_IsSwitchFaulty(&server->tal, start_node->num))
			return 0;
		int r = PopulateRouteNodeInfo(server, info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		
		if (r) {
			*route_nodes_length = (*route_nodes_length) + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_UNKNOWN;
			info_array[array_index].edge = &start_node->edge[DIR_AHEAD];
		}
		
		return r;
	}else if(start_node->type == NODE_SENSOR){
		int r = PopulateRouteNodeInfo(server, info_array, track_nodes, start_node->edge[DIR_AHEAD].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		if(r){
			*route_nodes_length = (*route_nodes_length) + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_UNKNOWN;
			info_array[array_index].edge = &start_node->edge[DIR_AHEAD];
		}
		return r;
	}else if (start_node->type == NODE_EXIT){
		return 0;
	}else if (start_node->type == NODE_ENTER){
		return 0;
	}else if (start_node->type == NODE_BRANCH){
		if(TAL_IsSwitchFaulty(&server->tal, start_node->num))
			return 0;
		//  Save this for when we search the two possibilities
		int current_route_length = *route_nodes_length;
		int rtn1 = PopulateRouteNodeInfo(server, info_array, track_nodes, start_node->edge[DIR_STRAIGHT].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
		int route_length_1 = *route_nodes_length;
		*route_nodes_length = current_route_length;
		int rtn2 = 0;
		int route_length_2 = 0;
		//  Don't do crazy stuff and overwrite the path if we find 2 paths
		if(!rtn1){
			rtn2 = PopulateRouteNodeInfo(server, info_array, track_nodes, start_node->edge[DIR_CURVED].dest, dest_node, levels + 1, array_index + 1, route_nodes_length, train_num);
			route_length_2 = *route_nodes_length;
		}

		if(rtn1){
			*route_nodes_length = route_length_1 + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_STRAIGHT;
			info_array[array_index].edge = &start_node->edge[DIR_STRAIGHT];
		}else if (rtn2){
			*route_nodes_length = route_length_2 + 1;
			assert(*route_nodes_length <= MAX_ROUTE_NODE_INFO,"Too many route nodes.\n");
			info_array[array_index].node = start_node;
			info_array[array_index].switch_state = SWITCH_CURVED;
			info_array[array_index].edge = &start_node->edge[DIR_CURVED];
		}
		return rtn1 || rtn2;
	}else{
		assert(0,"Case should not happen");
		return 0;
	}
}


track_node * GetRandomSensorReachableViaDirectedGraph(TrainServer * server, track_node * start_node, int train_num) {
	int i = 0;
	while(1){
		track_node * random_sensor = GetRandomSensor(server);
		if(random_sensor != start_node && IsNodeReachableViaDirectedGraph(server, train_num, start_node, random_sensor, 0)){
			int module_num = random_sensor->name[0] - 65;
			assert(module_num >= 0 && module_num <= 4, "Module num is being calculated incorrectly.");
			//  Parse the number out of the second part of the string
			int sensor_num = robatoi(&(random_sensor->name[1])) -1;
			if(!(TAL_IsDestinationSensorBad(&server->tal, module_num, sensor_num))){
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

void TrainServer_HandleSensorReaderData(TrainServer * server) {
	TrainSensorMessage * recv_sensor_message = (TrainSensorMessage *) server->receive_buffer;

	server->sensor_reader_blocked = 1;

	int module_num = recv_sensor_message->module_num;
	int sensor_bit_flag = recv_sensor_message->sensor_bit_flag;

	
	int sensor_num;
	int current_time = Time();

	server->sensor_bit_flags[module_num] = 0;
	for (sensor_num = 0; sensor_num < SENSORS_PER_MODULE; sensor_num++) {
		if(!(TAL_IsSensorFaulty(&server->tal, module_num, sensor_num))){
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
	} else if (receive_message->int1 == 'B') {
		server->current_track_nodes = server->track_b_nodes;
	}else{
		assert(0,"Invalid map name.");
	}
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSetTrain(TrainServer * server, short go_forever) {
	GenericTrainMessage  * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	char train_num = receive_message->int1;
	int slot_num = receive_message->int2;
	
	assert(slot_num < server->num_engines, "Slot number exceeded");
	
	if (server->train_engines[slot_num].train_num != train_num) {
		TrainEngine_Initialize(&(server->train_engines[slot_num]), train_num);
		server->train_engines[slot_num].state = TRAIN_ENGINE_IDLE;
	} else {
		server->train_engines[slot_num].state = TRAIN_ENGINE_FOUND_STARTING_POSITION;
	}
	
	server->train_engines[slot_num].go_forever = go_forever;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleSetDestination(TrainServer * server) {
	GenericTrainMessage * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	int train_num = receive_message->int1;
	char * dest_name = receive_message->char1;
	int slot_num = TrainServer_EngineNumToArrayIndex(server, train_num);
	
	assert(slot_num < server->num_engines, "Slot number exceeded");
	
	server->train_engines[slot_num].destination_node = NodeNameToTrackNode(server->current_track_nodes, dest_name);
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
	
	server->train_engines[slot_num].state = TRAIN_ENGINE_GOT_DESTINATION;
}

void TrainServer_HandleQueryTrainEngine(TrainServer * server) {
	GenericTrainMessage * receive_message = (GenericTrainMessage *) server->receive_buffer;
	TrainEngineStatusMessage * reply_message = (TrainEngineStatusMessage *) server->reply_buffer;
	
	assert(sizeof(TrainEngineStatusMessage) <= MESSAGE_SIZE, "TrainEngineStatusMessage too big");
	
	reply_message->train_engine = &server->train_engines[receive_message->int1];
	reply_message->track_nodes = server->current_track_nodes;

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
			//PrintMessage("Setting train %d to speed %d", train_num, train_speed);
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
			//PrintMessage("\x1b[31;44mAttempting to tell switch master to set to switch %d unknown state.",switch_num);
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
			//PrintMessage("Telling switchmaster to set %d to be %c", switch_num, GetQueuedSwitchState(server, switch_num));
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

void TrainServer_HandleSetNumEngines(TrainServer * server) {
	GenericTrainMessage * receive_message = (GenericTrainMessage *) server->receive_buffer;
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	int num_engines = receive_message->int1;
	
	assert(num_engines <= MAX_NUM_ENGINES, "TrainServer_HandleSetNumEngines max engines exceeded");
	
	server->num_engines = num_engines;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
}

void TrainServer_HandleResetTrack(TrainServer * server) {
	GenericMessage * reply_message = (GenericMessage *) server->reply_buffer;
	int i;
	
	for (i = 0; i < MAX_NUM_ENGINES; i++) {
		// Stop the trains before reset
		if (server->train_engines[i].train_num) {
			TAL_SetTrainSpeed(&server->tal, 0, server->train_engines[i].train_num, 0);
		}
		
		TrainEngine_Initialize(&server->train_engines[i], 0);
	}
	
	// Release all reservations
	init_tracka(server->track_a_nodes);
	init_trackb(server->track_b_nodes);
	
	server->num_track_a_undirected_nodes = 0;
	server->num_track_b_undirected_nodes = 0;

	init_undirected_nodes(server->track_a_nodes, server->track_a_undirected_nodes, &server->num_track_a_undirected_nodes);
	init_undirected_nodes(server->track_b_nodes, server->track_b_undirected_nodes, &server->num_track_b_undirected_nodes);
	
	server->current_undirected_nodes = server->track_a_undirected_nodes;
	
	reply_message->message_type = MESSAGE_TYPE_ACK;
	Reply(server->source_tid, server->reply_buffer, MESSAGE_SIZE);
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
	(*((KernelState **) KERNEL_STACK_START))->last_switch_queuing = TimeSeconds();
	int current_route_node_index = engine->route_node_index;
	
	assert(engine->destination_node != 0, "TrainServer_QueueSwitchStates destination node not set");
	assert(engine->route_nodes_length, "TrainServer_QueueSwitchStates route_nodes_length not positive");
	
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

int TrainServer_EngineNumToArrayIndex(TrainServer * server, int train_num) {
	int i;
	for (i = 0; i < server->num_engines; i++) {
		if (server->train_engines[i].train_num == train_num) {
			return i;
			break;
		}
	}
	
	assertf(0, "TrainServer_EngineNumToArrayIndex: unknown train num %d", train_num);
	return -1;
}

int TrainServer_NumActivatedEngines(TrainServer * server) {
	int num = 0;
	int i;
	for (i = 0; i < server->num_engines; i++) {
		if (server->train_engines[i].train_num && server->train_engines[i].current_node) {
			num++;
		}
	}
	
	return num;
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
	
	Putc(COM1, TRAIN_SYSTEM_GO);
	
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
	engine->previous_node = 0;
	engine->raw_speed_setting = 0;
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
	engine->source_node = 0;
	engine->last_time_speed_update = 0;
	engine->use_sensor_for_speed_calculation = 0;
	engine->distance_to_next_node = 0;
	engine->time_at_last_node = 0;
	
	memset(&engine->train_node, 0, sizeof(undirected_node));
	engine->train_node.type = NODE_TRAIN;
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
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 18);
	SetTrainSwitch(SWITCH_CURVED_CODE, 5);
	SetTrainSwitch(SWITCH_CURVED_CODE, 155);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 156);
	SetTrainSwitch(SWITCH_CURVED_CODE, 153);
	SetTrainSwitch(SWITCH_STRAIGHT_CODE, 154);
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
			//float current_time = TimeSeconds();
			//float diff = current_time - (*((KernelState **) KERNEL_STACK_START))->last_switch_queuing;
			direction_code = command_reply_message->c1;
			switch_num = command_reply_message->c2;
			SendTrainCommand(TRAIN_SWITCH, direction_code, switch_num, 0, 0);
		} else {
			DelaySeconds(0.01);
		}
	}
	
	Exit();
}

