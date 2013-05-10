#
# Makefile for busy-wait IO tests
#
XCC     = /u/wbcowan/gnuarm-4.0.2/arm-elf/bin/gcc
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

LDFLAGS = -init main -Map iotest.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all:  iotest.s iotest.elf

bwio.s: ../src/bwio.c ../include/bwio.h
		$(XCC) -S $(CFLAGS) ../src/bwio.c

bwio.o: bwio.s
	$(AS) $(ASFLAGS) -o bwio.o bwio.s

iotest.s: iotest.c iotest.h
	$(XCC) -S $(CFLAGS) iotest.c

iotest.o: iotest.s
	$(AS) $(ASFLAGS) -o iotest.o iotest.s

iotest.elf: iotest.o bwio.o
	$(LD) $(LDFLAGS) -o $@ iotest.o bwio.o -lbwio -lgcc
	cp iotest.elf /u/cs452/tftp/ARM/relder/exec.elf
	chmod ugo+r /u/cs452/tftp/ARM/relder/exec.elf

clean:
	-rm -f iotest.elf *.s *.o iotest.map
