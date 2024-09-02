
# Single Cycle MIPS Processor

This project implements a single-cycle MIPS processor capable of executing a subset of MIPS instructions. The processor is designed and verified using Verilog, following a typical FPGA design flow, and successfully synthesized into a bitstream file.

## Features

### Supported Instructions
- **R-type Arithmetic/Logic Instructions**:
  - `add`: Add two registers.
  - `sub`: Subtract one register from another.
  - `and`: Bitwise AND between two registers.
  - `or`: Bitwise OR between two registers.
  - `slt`: Set on less than, used for comparisons.
  
- **Memory Instructions**:
  - `lw`: Load word from memory into a register.
  - `sw`: Store word from a register into memory.
  
- **Branch Instructions**:
  - `beq`: Branch if equal.
  - `j`: Jump to address.

## FPGA Design Flow

The design process includes the following stages:
1. **RTL Design**: The processor's architecture is implemented using Verilog.
2. **Simulation**: A testbench is written to simulate and verify the correct functionality of the processor.
3. **Synthesis**: The design is synthesized to map the Verilog code onto the FPGA's resources.
4. **Implementation**: The synthesized design is placed and routed to optimize performance on the target FPGA.
5. **Bitstream Generation**: Finally, the design is converted into a bitstream file, ready for programming onto an FPGA.

## Getting Started

### Prerequisites
- **Vivado**: Used for synthesis, implementation, and bitstream generation.
- **ModelSim**: Used for simulation and verification of the design.

### Running the Project
1. Clone the repository to your local machine.
2. Open the project in Vivado.
3. Run the synthesis, implementation, and bitstream generation steps.
4. Program the FPGA with the generated bitstream file.

### Simulation
1. Use the provided testbench files to simulate the processor's behavior in ModelSim.
2. Verify that all supported instructions execute correctly.

## Repository Structure

- `/src`: Contains the Verilog source files for the MIPS processor.
- `/tb`: Contains the testbench files used for simulation.
- `/constraints`: FPGA constraints files.
- `/bitstream`: Contains the generated bitstream file.

## Acknowledgments

This project is inspired by the classic MIPS architecture and serves as an educational tool for understanding processor design.


