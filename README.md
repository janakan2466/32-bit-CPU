# 32-bit Central Processing Unit

This repository consists of the entire engineering  of a 32-bit RISC Computer Programming Unit (CPU) using an FPGA through VHDL. The components are incrementally developed as follows: program counter, register set, ALU, data memory design and implementation, CPU datapath and simulation, CPU control unit, and the overall CPU schematic. The CPU consists of the Harvard architecture and the operations that can be performed are displayed on the CPU specification sheet. To test the CPU, the CPU_TEST_SIM must be set to the high-level entity (ctrl + shift + e) and the mifs file must be edited so the program counter can be instructed per execution.

The implemented CPU is based on the Harvard architecture. All individual components from the 1-bit registers to the final ALU were unit tested through functional and timing diagrams.

The device that was used to develop the schematics is Cyclone IV E: EP4CE115F29C7. 

![FPGA](https://github.com/janakan2466/32-bit-CPU/assets/72175053/f0ca0116-be1a-4cb4-8d5b-af798ddc5686)
