# SoC Debugger

SoC Debugger is a script and configuration for debugging Efinix RISCV Sapphire SoC using OpenOCD over JTAG.



## Requirements

- OpenOCD v0.11 ([official](https://github.com/openocd-org/openocd.git)) - for standard RISCV debug interface

- OpenOCD v0.11 ([SpinalHDL](https://github.com/SpinalHDL/openocd_riscv.git)) - for vexriscv debug interface

- telnet

#### Optional

- C232HM-DDHSL-0 FTDI cable - for soft tap



## Usage

```bash
Usage

-b, board         Board can be t120, ti60 or ti180
-c, cpu count     Number of CPU. Default is 1
-i, interface     Debug interface. Default is 1
                  1 - RISCV Standard Debug Interface
                  0 - Vexriscv Debug Interface
-s, soft tap      Using soft tap instead of hard JTAG. Default is using
                  hard JTAG.
-d, debug         Show debug message
-z, Zephyr Debug  Enable debug for Zephyr 
-l  Linux Debug   Enable debug for Linux 
-t, Tap port      FPGA tap port number. Default is 1. Range is 1 to 4. 
Example (Linux),
./soc_debug.sh -b ti180 -c 4 

Example (Zephyr),
./soc_debug.sh -b ti180 -c 4 -z

```

> **Note:** Zephyr debug, -z and Linux debug, -l are mutually exclusive. Select either one based on your application. 

Example

1. launch OpenOCD for Titanium Ti180M484 development board with 4 cores of CPU.
   
   ```bash
   ./soc_debug.sh -b ti180 -c 4
   ```
   
   

2. Open another terminal to connec to telnet
   
   ```bash
   telnet localhost 4444
   ```

3. Run any OpenOCD command for debugging on telnet session. For example,
   
   ```bash
   halt
   targets
   reg pc
   resume
   ```
   
   
