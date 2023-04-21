
## Connect to OpenOCD
```
nc localhost 4444
reset init
targets rpi3.cpu; halt
targets ; poll

targets rpi3.cpu; halt; load_image kernel8.img 0 bin; reg pc 0; resume
targets rpi3.cpu; halt; load_image test1.img 0 bin; reg pc 0; resume
targets rpi3.cpu; halt; load_image test2.img 0 bin; reg pc 0; resume

load_image /home/user/workspace/RPi3/RPI.out 0 elf
load_image /home/user/workspace/RPi3/kernel8.img 0

load_image /home/user/rpi3-aarch64-jtag/rpi3-jtag.elf 0 elf
load_image /home/user/rpi3-aarch64-jtag/kernel8.img 0

halt
```

## GDB
```
gdb-multiarch -q ./rpi3-jtag.elf 
gdb-multiarch --tui
target remote localhost:3333

```
