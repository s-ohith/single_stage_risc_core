# Single Stage RISC-V Core
--------------------------
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



🔧 Core Modules Description
---------------------------------------------------------------------------------------------------------------------------------------------------------------

![image](https://github.com/user-attachments/assets/7023c9ab-38ca-4273-8b02-721c16c21a16)

PC (pc.v)
The Program Counter module holds the address of the current instruction and updates it every clock cycle. It supports sequential execution and can be redirected for branching or jumping.

IMEM (instr_mem.v)
The Instruction Memory module fetches the 32-bit instruction corresponding to the current program counter address. It is typically initialized with a memory image or machine code file.

IMM (imm_gen.v)
The Immediate Generator extracts and sign-extends immediate values from different RISC-V instruction formats (I, S, B, U, J).

CU (control_unit.v)
The Control Unit decodes the instruction opcode and generates the appropriate control signals for the datapath components, such as register write, memory read/write, and ALU operations.

RF (reg_file.v)
The Register File contains 32 general-purpose 32-bit registers. It supports simultaneous reading of two registers and writing to one, following the RISC-V register access protocol.

ALU_CU (alu_cu.v)
The ALU Control Unit determines the exact ALU operation to perform based on the function codes (funct3, funct7) and the high-level ALU operation signal from the Control Unit.

ALU (alu.v)
The Arithmetic Logic Unit performs all arithmetic, logic, and comparison operations required by the instruction set, including addition, subtraction, AND, OR, shifts, and set-less-than.

DMEM (data_mem.v)
The Data Memory module is used for load and store instructions. It handles reading from and writing to memory using the address calculated by the ALU.

M1 : Mux (mux.v)
The Multiplexer selects between multiple inputs (e.g., choosing between ALU result or memory data for write-back) based on control signals.


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

🧪 Output Waveform Analysis
The simulation waveform above showcases the functionality of the RISC-V core implemented in this project. Each instruction is fetched, decoded, and executed correctly as observed through the changes in the program counter (pc), instruction register (instr), register values (rd1, rd2, wd), and the ALU output (alu_out).


![image](https://github.com/user-attachments/assets/867b62fc-a265-4f95-a406-ca3567da4f1b)


🔍 Sample Operation Breakdown
At 100.260 ns, the core is executing the instruction located at pc = 0x00000020, which is decoded as instr = 0x00510293. This is interpreted as:


addi x5, x2, 5   // x5 = x2 + 5

Source Register (rs1): x2 = 0x00000002

Immediate (imm_out): 0x00000005

ALU Operation (alu_op): 3 (indicating an ADDI operation in this design)

ALU Output (alu_out): 0x00000007

Write-back Register (wd): x5 = 0x00000007

This confirms the correct execution of the ADDI instruction, as x2 (value = 2) plus immediate (5) results in x5 being written with 7.

🧠 Observations
The ALU is computing results accurately based on inputs from the register file and immediate decoder.

The pipeline correctly latches register reads and writes.

Instruction execution is properly aligned with clock cycles, and no hazard or stall is observed in this simple test.

This successful test validates the core datapath and control logic for immediate-type instructions like ADDI. More instructions (R-type, load/store, branching) are being tested and will be demonstrated in future waveform updates.

