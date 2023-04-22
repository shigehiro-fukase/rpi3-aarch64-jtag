
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




```
user@arm:~/rpi3-aarch64-jtag$ ./olimex.sh 
Open On-Chip Debugger 0.9.0-dev-gb796a58 (2023-04-15-21:27)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.sourceforge.net/doc/doxygen/bugs.html
trst_and_srst separate srst_gates_jtag trst_push_pull srst_open_drain connect_deassert_srst
adapter speed: 1000 kHz
jtag_ntrst_delay: 500
Info : clock speed 1000 kHz
Info : JTAG tap: rpi3.dap tap/device found: 0x4ba00477 (mfg: 0x23b, part: 0xba00, ver: 0x4)
Info : rpi3.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : rpi3.cpu1: hardware has 6 breakpoints, 4 watchpoints
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012400
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012410
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012420
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012430
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012440
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012450
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012800
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012810
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012820
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80012830
Info : rpi3.cpu2: hardware has 6 breakpoints, 4 watchpoints
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014400
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014410
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014420
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014430
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014440
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014450
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014800
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014810
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014820
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80014830
Info : rpi3.cpu3: hardware has 6 breakpoints, 4 watchpoints
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016400
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016410
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016420
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016430
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016440
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016450
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016800
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016810
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016820
Error: JTAG-DP STICKY ERROR
Error: MEM_AP_CSW 0x80000042, MEM_AP_TAR 0x80016830
```
