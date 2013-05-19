#
# Makefile for busy-wait IO tests
#
XCC     = /u/wbcowan/gnuarm-4.0.2/arm-elf/bin/gcc
CC = $(XCC)
AS	= /u/wbcowan/gnuarm-4.0.2/arm-elf/bin/as
LD      = /u/wbcowan/gnuarm-4.0.2/arm-elf/bin/ld
CFLAGS  = -g -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map kern.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

OBJECTS = buffer.o

all:  kern.s kern.elf

kern.s: kern.c kern.h
	$(XCC) -S $(CFLAGS) kern.c

kern.o: kern.s kern.c kern.h
	$(AS) $(ASFLAGS) -o kern.o kern.s

public_kernel_interface.s: public_kernel_interface.c public_kernel_interface.h
	$(XCC) -S $(CFLAGS) public_kernel_interface.c

public_kernel_interface.o: public_kernel_interface.s
	$(AS) $(ASFLAGS) -o public_kernel_interface.o public_kernel_interface.s

private_kernel_interface.s: private_kernel_interface.c private_kernel_interface.h
	$(XCC) -S $(CFLAGS) private_kernel_interface.c

private_kernel_interface.o: private_kernel_interface.s
	$(AS) $(ASFLAGS) -o private_kernel_interface.o private_kernel_interface.s

swi_kernel_interface.o: swi_kernel_interface.s
	$(AS) $(ASFLAGS) -o swi_kernel_interface.o swi_kernel_interface.s

kernel_entry.o: kernel_entry.s
	$(AS) $(ASFLAGS) -o kernel_entry.o kernel_entry.s

kern.elf: kern.o public_kernel_interface.o private_kernel_interface.o swi_kernel_interface.o kernel_entry.o $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ kern.o public_kernel_interface.o private_kernel_interface.o swi_kernel_interface.o kernel_entry.o $(OBJECTS) -lgcc
	cp kern.elf /u/cs452/tftp/ARM/`whoami`/kern.elf
	chmod ugo+r /u/cs452/tftp/ARM/`whoami`/kern.elf

clean:
	-rm -f kern.elf kern.s public_kernel_interface.s private_kernel_interface.s *.o kern.map
