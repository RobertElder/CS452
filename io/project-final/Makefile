#
# Makefile for busy-wait IO tests
#
XCC     = @/u/wbcowan/gnuarm-4.0.2/arm-elf/bin/gcc
CC = $(XCC)
AS	= @/u/wbcowan/gnuarm-4.0.2/arm-elf/bin/as
LD      = @/u/wbcowan/gnuarm-4.0.2/arm-elf/bin/ld
CFLAGS  = -g -c -fPIC -Wall -I. -I./include -mcpu=arm920t -msoft-float -Werror -DASSERTS -DPREEMPT -DSLOWWARN -DANSI -DUI -DTRAINS
C_OPTIMIZATION_FLAGS = -O3
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map kern.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

#  TODO: make things generic using the following method:
SOURCES = test_uart.c kern.c public_kernel_interface.c private_kernel_interface.c swi_kernel_interface.c robio.c buffer.c queue.c task_descriptor.c tasks.c memory.c random.c nameserver.c rps.c message.c clock.c scheduler.c notifier.c kernel_irq.c ansi.c uart.c ui.c train.c train_logic.c maps/map_a.c route.c maps/map_b.c tracks/track_data.c tracks/undirected_nodes.c
HEADERS = ${SOURCES:.c=.h}
OBJECTS = ${SOURCES:.c=.o}

all:  kern.s kern.elf

test: clean testing_compile

testing_compile: CFLAGS += -DTEST
testing_compile:  kern.s kern.elf

kern.s: kern.c kern.h
	$(XCC) -S $(CFLAGS) kern.c

kern.o: kern.s
	$(AS) $(ASFLAGS) -o kern.o kern.s

public_kernel_interface.s: public_kernel_interface.c public_kernel_interface.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) public_kernel_interface.c

public_kernel_interface.o: public_kernel_interface.s
	$(AS) $(ASFLAGS) -o public_kernel_interface.o public_kernel_interface.s

private_kernel_interface.s: private_kernel_interface.c private_kernel_interface.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) private_kernel_interface.c

private_kernel_interface.o: private_kernel_interface.s
	$(AS) $(ASFLAGS) -o private_kernel_interface.o private_kernel_interface.s

robio.s: robio.c robio.h
	$(XCC) -S $(CFLAGS) robio.c

robio.o: robio.s
	$(AS) $(ASFLAGS) -o robio.o robio.s

buffer.s: buffer.c buffer.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) buffer.c

buffer.o: buffer.s
	$(AS) $(ASFLAGS) -o buffer.o buffer.s

queue.s: queue.c queue.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) queue.c

queue.o: queue.s
	$(AS) $(ASFLAGS) -o queue.o queue.s

task_descriptor.s: task_descriptor.c task_descriptor.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) task_descriptor.c

task_descriptor.o: task_descriptor.s
	$(AS) $(ASFLAGS) -o task_descriptor.o task_descriptor.s

tasks.s: tasks.c tasks.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) tasks.c

tasks.o: tasks.s
	$(AS) $(ASFLAGS) -o tasks.o tasks.s

memory.s: memory.c memory.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) memory.c

memory.o: memory.s
	$(AS) $(ASFLAGS) -o memory.o memory.s

random.s: random.c random.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) random.c

random.o: random.s
	$(AS) $(ASFLAGS) -o random.o random.s

nameserver.s: nameserver.c nameserver.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) nameserver.c

nameserver.o: nameserver.s
	$(AS) $(ASFLAGS) -o nameserver.o nameserver.s

rps.s: rps.c rps.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) rps.c

rps.o: rps.s
	$(AS) $(ASFLAGS) -o rps.o rps.s

message.s: message.c message.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) message.c

message.o: message.s
	$(AS) $(ASFLAGS) -o message.o message.s
	
clock.s: clock.c clock.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) clock.c

clock.o: clock.s
	$(AS) $(ASFLAGS) -o clock.o clock.s
	
scheduler.s: scheduler.c scheduler.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) scheduler.c

scheduler.o: scheduler.s
	$(AS) $(ASFLAGS) -o scheduler.o scheduler.s
	
notifier.s: notifier.c notifier.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) notifier.c

notifier.o: notifier.s
	$(AS) $(ASFLAGS) -o notifier.o notifier.s

kernel_irq.s: kernel_irq.c kernel_irq.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) kernel_irq.c

kernel_irq.o: kernel_irq.s
	$(AS) $(ASFLAGS) -o kernel_irq.o kernel_irq.s
	
ansi.s: ansi.c ansi.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) ansi.c

ansi.o: ansi.s
	$(AS) $(ASFLAGS) -o ansi.o ansi.s
	
uart.s: uart.c uart.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) uart.c

uart.o: uart.s
	$(AS) $(ASFLAGS) -o uart.o uart.s

ui.s: ui.c ui.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) ui.c

ui.o: ui.s
	$(AS) $(ASFLAGS) -o ui.o ui.s

train.s: train.c train.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) train.c

train.o: train.s
	$(AS) $(ASFLAGS) -o train.o train.s

train_logic.s: train.c train_logic.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) train_logic.c

train_logic.o: train_logic.s
	$(AS) $(ASFLAGS) -o train_logic.o train_logic.s

test_uart.s: test_uart.c test_uart.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) test_uart.c

test_uart.o: test_uart.s
	$(AS) $(ASFLAGS) -o test_uart.o test_uart.s

route.s: route.c route.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) route.c

route.o: route.s
	$(AS) $(ASFLAGS) -o route.o route.s

maps/map_a.s: maps/map_a.c maps/map_a.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) maps/map_a.c -o maps/map_a.s

maps/map_a.o: maps/map_a.s
	$(AS) $(ASFLAGS) -o maps/map_a.o maps/map_a.s

maps/map_b.s: maps/map_b.c maps/map_b.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) maps/map_b.c -o maps/map_b.s

maps/map_b.o: maps/map_b.s
	$(AS) $(ASFLAGS) -o maps/map_b.o maps/map_b.s

tracks/track_data.s: tracks/track_data.c tracks/track_data.h tracks/track_node.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) tracks/track_data.c -o tracks/track_data.s

tracks/track_data.o: tracks/track_data.s
	$(AS) $(ASFLAGS) -o tracks/track_data.o tracks/track_data.s
	
tracks/undirected_nodes.s: tracks/undirected_nodes.c tracks/undirected_nodes.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) tracks/undirected_nodes.c -o tracks/undirected_nodes.s

tracks/undirected_nodes.o: tracks/undirected_nodes.s
	$(AS) $(ASFLAGS) -o tracks/undirected_nodes.o tracks/undirected_nodes.s
	
train_abstraction_layer.s: train_abstraction_layer.c train_abstraction_layer.h
	$(XCC) -S $(CFLAGS) $(C_OPTIMIZATION_FLAGS) train_abstraction_layer.c

train_abstraction_layer.o: train_abstraction_layer.s
	$(AS) $(ASFLAGS) -o train_abstraction_layer.o train_abstraction_layer.s

kern.elf: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $(OBJECTS) -lgcc
	@cp kern.elf /u/cs452/tftp/ARM/`whoami`/kern.elf
	@chmod ugo+r /u/cs452/tftp/ARM/`whoami`/kern.elf

clean:
	-@rm -f kern.elf test_uart.s kern.s public_kernel_interface.s private_kernel_interface.s robio.s buffer.s queue.s task_descriptor.s tasks.s memory.s random.s nameserver.s rps.s message.s clock.s scheduler.s notifier.s kernel_irq.s ansi.s uart.s ui.s train.s train_logic.s route.s maps/*.s tracks/*.s *.o maps/*.o  tracks/*.o kern.map
