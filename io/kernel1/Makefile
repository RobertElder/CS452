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

LDFLAGS = -init main -Map kern.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all:  kern.s kern.elf

kern.s: kern.c kern.h
	$(XCC) -S $(CFLAGS) kern.c

kern.o: kern.s
	$(AS) $(ASFLAGS) -o kern.o kern.s

kern.elf: kern.o
	$(LD) $(LDFLAGS) -o $@ kern.o -lgcc
	cp kern.elf /u/cs452/tftp/ARM/relder/kern.elf
	chmod ugo+r /u/cs452/tftp/ARM/relder/kern.elf

clean:
	-rm -f kern.elf *.s *.o kern.map
