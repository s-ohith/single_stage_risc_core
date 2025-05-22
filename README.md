# single_stage_risc_core
Design of a single stage core based on RISC V ISA


This project implements a single-cycle RISC-V processor based on the RV32I instruction set architecture. The processor is designed in Verilog and is capable of executing instructions in a single clock cycle, combining fetch, decode, execute, memory, and write-back stages into one unified datapath.

🛠️ Features
Supports a subset of the RV32I base integer instruction set

Single-stage datapath: all operations are performed in one clock cycle

32 general-purpose registers (x0 - x31)

ALU supporting arithmetic, logical, and comparison operations

Load and store instructions with memory interface

Branch and jump instruction support

Parameterized memory and instruction width

Easy integration into SoC designs or educational simulators
