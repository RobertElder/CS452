XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I. -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map a0.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2

all: a0.s a0.elf

a0.s: a0.c
	$(XCC) -S $(CFLAGS) a0.c

a0.o: a0.s
	$(AS) $(ASFLAGS) -o a0.o a0.s

a0.elf: a0.o
	$(LD) $(LDFLAGS) -o $@ a0.o  -lgcc -lc

clean:
	-rm -f a0.elf *.s *.o a0.map
