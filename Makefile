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

all: $(KERNEL)

%.o: %.asm
	$(AS) -o $@ $<

%.o: %.c
	$(CC) ${CFLAGS} ${DEFS0} -c -o $@ $<

$(NAME): main.o startup.o
	$(LD) $(LDFLAGS) -o $@ -T linkerscript.ld $<

$(KERNEL): $(NAME)
	$(ELF2BIN) $< $@

clean:
	rm -f $(KERNEL) $(NAME) main.o startup.o
