# Single Cycle RISC-V Processor

This project implements a single-cycle RISC-V processor using Verilog. It supports a range of RISC-V base integer instructions and includes a modular architecture with all core components of a CPU, from the Program Counter to ALU and Memory.

## Features

- Full single-cycle datapath
- Supports:
  - **R-type**: `add`, `sub`, `and`, `or`, `xor`, `sll`, `slt`, `sltu`, `srl`, `sra`
  - **I-type**: `addi`, `andi`, `ori`, `xori`, `slti`, `sltui`, `slli`, `srli`, `srai`
  - **S-type**: `sw`
  - **L-type**: `lw`
  - **B-type**: `beq`
- Modular subcomponents:
  - ALU, Control Unit, Immediate Generator, Register File
  - Instruction and Data Memory
  - Branching logic with PC update
- Written in synthesizable Verilog
- Includes simulation testbench

## Modules

- `SingleCycleCPU`: Top-level module integrating all components
- `ALU`, `ALUCtrl`: Handles arithmetic/logic operations
- `Control`: Generates control signals based on instruction opcode
- `Register`: 32 general-purpose registers
- `ImmGen`: Extracts immediate values
- `DataMemory`, `InstructionMemory`: Memory blocks for testing
- `PC`, `Adder`, `ShiftLeftOne`, `Mux2to1`: Utility modules
- `tb_riscv_sc`: Testbench for verifying CPU behavior

## Test Cases

Two test programs are included:

1. **Basic Arithmetic and Branching**
   - Demonstrates register operations, memory access, and conditional branching.
2. **Max/Min in Array**
   - Finds maximum and minimum from 10 integers stored in memory using assembly and displays them in registers/memory.

## Tools Used

- Verilog HDL
- Simulated using any standard Verilog simulator (e.g., ModelSim, Icarus Verilog, Vivado)

## Results

- Successfully executed test programs with correct outputs:
  - **Test 1**: Loop executed correctly, t0 = 7, t1 = 10
  - **Test 2**: Max = 15, Min = 2 stored in memory as expected

## How to Run

1. Clone the repository
2. Compile and run `tb_riscv_sc.v` in your simulator
3. View waveforms or use `$display` to check register/memory values
