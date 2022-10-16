# Abstracting the Machine
The `Von Neuman Architecture` specifies the structure of a computer system.

##### The CPU
The `Central processing unit` has the task of executing machine code which is stored in the main memory. A series of wires known as busses connect the CPU to the main memory as well as input and output. The CPU consists of registers which temporarily stores data. The `control unit` sends control signals across contrrol buses so an instruction can be executed correctly. The `arithmetic-logic unit` carries out arithmetic and logic operations. 

###### Registers
* PC- Address of the next instruction to be executed
* Instruction Register - Holds the current instruction being read
* MDR - Holds the data read from memory or to be written to memory
* MAR - Holds the address of the data to be read from memory or the address of where to write data.
* General purpose registers

##### Busses 
`Busses` are a series of parallel wires used communicate data between. A single wire carrying a high voltage (1.2V) represents a binary 1, while a binary 0 is represented by a wire carrying a low voltage (0V).

###### Types of busses
* Data bus- Sends data to and from main memory, CPU and some I/O devices.
* Address bus - sends addresses. 
* Control bus - sends control signals.

##### RAM (Main Memory)
`Random access memory` is used to store data, as well as machine code instructions for the programs being ran by the CPU. Data/Instructions can be referenced through the use of memory addresses, which are a series of bits that specifies the location of a piece of data in memory.