#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map iotest.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all:  iotest.s iotest.elf

iotest.s: iotest.c iotest.h
	$(XCC) -S $(CFLAGS) iotest.c

iotest.o: iotest.s
	$(AS) $(ASFLAGS) -o iotest.o iotest.s

iotest.elf: iotest.o
	$(LD) $(LDFLAGS) -o $@ iotest.o -lbwio -lgcc

clean:
	-rm -f iotest.elf *.s *.o iotest.map
