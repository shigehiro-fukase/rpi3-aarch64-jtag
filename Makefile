CROSS	= aarch64-linux-gnu-
AS = ${CROSS}as
CC = ${CROSS}gcc
LD = ${CROSS}ld
ELF2BIN = ${CROSS}objcopy --gap-fill=0xff -j .text -j .rodata -j .data -O binary

NAME	= rpi3-jtag.elf
KERNEL	= kernel8.img
CFLAGS	= -ggdb3 -std=gnu99 -Wall
LDFLAGS = -Bstatic --gc-sections -nostartfiles -nostdlib

CFLAGS	+= -DJTAG_RTCK_ALT4=0

DEFS0 = -DWAIT_JTAG=1
DEFS1 = -DWAIT_JTAG=1 -DSTAGE1=1 -DWAIT_PRINT=1
DEFS2 = -DWAIT_JTAG=0 -DSTAGE2=1 -DWAIT_PRINT=1

all: $(KERNEL) test1.img test2.img

%.o: %.asm
	$(AS) -o $@ $<

%.o: %.c
	$(CC) ${CFLAGS} ${DEFS0} -c -o $@ $<

$(NAME): main.o startup.o
	$(LD) $(LDFLAGS) -o $@ -T linkerscript.ld $<

$(KERNEL): $(NAME)
	$(ELF2BIN) $< $@

test1.img: startup.o
	$(CC) ${CFLAGS} ${DEFS1} -c -o $(@:.img=.o) main.c
	$(LD) $(LDFLAGS) -o $(@:.img=.elf) -T linkerscript.ld $(@:.img=.o) $<
	$(ELF2BIN) $(@:.img=.elf) $@
test2.img: startup.o
	$(CC) ${CFLAGS} ${DEFS2} -c -o $(@:.img=.o) main.c
	$(LD) $(LDFLAGS) -o $(@:.img=.elf) -T linkerscript.ld $(@:.img=.o) $<
	$(ELF2BIN) $(@:.img=.elf) $@

clean:
	rm -f $(KERNEL) $(NAME) main.o startup.o
	rm -f *.o *.elf *.img
