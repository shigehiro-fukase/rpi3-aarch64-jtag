#!/bin/sh

#
# start-up script for olimex ARM-USB-TINY-H.
#
# TERM1 $ ./olimex.sh
#
# TERM2 $ nc localhost 4444
# TERM2 $ > reset init
# TERM2 $ reset init
# TERM2 $ targets rpi3.cpu; halt; load_image kernel8.img 0 bin; reg pc 0; resume
# TERM2 $ targets rpi3.cpu; halt; load_image test1.img 0 bin; reg pc 0; resume
# TERM2 $ targets rpi3.cpu; halt; load_image test2.img 0 bin; reg pc 0; resume
#
# TERM3 $ gdb-multiarch -q ./rpi3-jtag.elf --tui
# TERM3 $ target remote localhost:3333
#
OPENOCD=~/openocd-armv8
${OPENOCD}/src/openocd -f ${OPENOCD}/tcl/interface/ftdi/olimex-arm-usb-tiny-h.cfg -f ${OPENOCD}/tcl/target/rpi3.cfg
