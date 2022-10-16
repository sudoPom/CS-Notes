# MIPS ISA
![[Abstracting-the-Machine#The CPU]]

In context of a MIPS32 CPU:
* General Purpose registers are MIPS registers `$0 to $31`
* Memory has many addresses, address zero being at the bottom and 0xFFFFFFFF being at the top of memory. There is also a byte of memory used to store a value at that memory address. 
* The [[Abstracting-the-Machine#Types of busses|busses]] have 32 bits, even the data bus, which means that a MIPS32 processor can read 4 values at once for  efficiency's sake.


#### Fetch Execute Cycle

* PC Value put on address bus
* Processor Triggers read signal
* Memory returns 4 byte instruction
* Processor executes this instruction
* PC's value is incremented to PC + 4

##### Adding two Numbers Together

RISC based CPU's have a load and store architecture, only load and store instructions access memory, all other instructions are used on registers.

```assembly
lw $2, 0x12345678
lw $3, 0x87654321
add $1, $2, $3
sw $3, 0x24681357
```

* Load first value from memory and store in register `$2` 
* Load second value from memory and store in register `$3` 
* Add the two previous register values together and store in register `$1`.
* Store the result back in memory.