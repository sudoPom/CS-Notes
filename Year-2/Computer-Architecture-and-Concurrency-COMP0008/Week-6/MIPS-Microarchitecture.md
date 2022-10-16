# MIPS Microarchitecture

### Processor Clock
The processor clock is a regular wave of low (0V) and high (1.2V) signals over time at a certain frequency known as the `clock speed`. This signal is carried over a clock wire which is input to most comnponents to coordinate them.

![[Screenshot_20220502_134356.png]]
All actions occur on the rising edge of the clock signal.

### Data Memory
The data memory has a few busses entering into it. A bus is a collection of wires:

![[Screenshot_20220502_134618.png]]

The $32$ means that the bus is made up of 32 wires. The $WE$ signal determines whether data (stored in the write data or $WD$ bus) is to be written to the address specified by the $A$ bus. If $WE$ signal is set to low then the data stored at the address stored in the $A$ bus is sent across the $RD$ or read data bus. The changing of the values stored on the bus/signals will be done on the rising edge of the clock, simultaneously.

### Program Counter
Stores the address of the current instruction being executed.
![[Screenshot_20220502_135331.png]]
The input bus holds the current instruction being ran on the CPU and stores it in the PC. And the output bus sends out this instruction being sent.

### Instruction Memory
Takes in an address and outputs the 32 bit word stored at that address.
![[Screenshot_20220502_135605.png]]

### Register File
Stores all 32 general purpose registers. It allows simultaneous access of two registers as well as writing to a third.
![[Screenshot_20220502_135807.png]]

The 5 bit input wires specify the register you want to read from, for buses $A1$ and $A2$, or write to for the $A3$ bus. 
The $RD1,RD2$ output buses hold the data stored at the registers specified by $A1,A2$ respectively. 
The $WE3$ signal is set to high when writing data specified in $WD3$ to the register specified in $A3$. 

### Control Unit
The control unit takes in the function code and the opcode of the instruction. Using this information, it can determine what instruction is being executed and what signals need to be sent across the control lines to execute the instruction. This is known as `decoding`.
![[Screenshot_20220502_144211.png]]

## Instruction Execution
Instruction execution for `lw` insturction works like so:

With an instruction looking like this:

![[Screenshot_20220502_140622.png]]

* The instruction memory output bus may hold this address. Which encodes the assembly instruction `lw $20, 0x1234($5)`.
* The register to be read from is sent into the $A1$ bus of the register file and the value stored in the register is output on the $RD1$ bus.
![[Screenshot_20220502_141031.png]]
(25:21 means bits 25 to 21)
* The offset is sign extended so it fits into 32 bits.
![[Screenshot_20220502_141209.png]]
And outputs the same value (just onto a bus of 32 wires rather than 16).
* The base offset address is calculated in the Arithmetic Logic Unit ![[Screenshot_20220502_141654.png]]
* The output is then sent to the data memory so that the value stored at the base address offset can be retrieved from memory.
* This value is then fed back to the Register $WD3$ bus alongside with the register we want to load this value into (`$20`). A High signal is also sent into the $WE3$ bus.![[Screenshot_20220502_142005.png]]
* The PC then needs to be incremented by 4 bytes so the address of the next location can be determined.
![[Screenshot_20220502_142156.png]]
This is done in the same clock cycle in parallel.

### R-Type Instructions
An extension of the above architecture allows for R-Type instructions. All that is required is a series of multiplexors, which take in two buses and outputs a single bus depending on whether it has a high signal or a low signal. ^3be584

![[Screenshot_20220502_143152.png]]


This is an example of a single cycle processor as instructions are executed at a rate of 1 per clock cycle, because of this the processor can only operate at a clock speed of the slowest instruction, which severely slows down operation. 