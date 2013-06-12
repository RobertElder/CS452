#include "message.h"
#include "memory.h"

void KernelMessage_Initialize(KernelMessage * km,
		int origin, int destination, char * msg, char * dest_buffer,
		unsigned int origin_size, unsigned int destination_size
		) {
	km->origin = origin;
	km->destination = destination;
	m_strcpy(km->msg, msg, MESSAGE_SIZE );
	km->dest_buffer = dest_buffer;
	km->origin_size = origin_size;
	km->destination_size = destination_size;
}
