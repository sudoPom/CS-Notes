# MIPS Instructions
The MIPS32 CPU has 32 registers, each has a specific purpose and has a size of 32 bits. MIPS only operates on these registers. This simplifies the instruction set architecture but increases the number of instructions required to perform a task.

Every MIPS instruction follows the structure:
* 6 bits for opcode
* 26 bits for arguments

![[Pasted image 20220430165508.png]]

The opcode determines what type of instruction the binary value represents while the arguments are the arguments of the operation.

There are three types of MIPS instructions:
* `R-type operations` (between registers)
* `I-type operations` (Including fixed numbers)
* `J-type operations` Jump to different potions of the source code


### R-type Instructions
An R-type instruction consists of:
* 6 bit opcode
* Registers Rs, Rt and Rd
* Shift amount
* Function code - the type of function to call on the registers.
![[Pasted image 20220430170656.png]]
R-type instructions always has an opcode of 0. And generally perform the following:
`R[rd] = func(R[rt],R[rs])`

##### Simple Arithmetic Instructions
Performs basic arithmetic on two registers and stores the result in the third. The `shamt` field is not used in these instructions.

##### Shift instructions
A shift instruction will cause a shift on one register and store it in another. This instruction type uses the `shamt` field and `rs` field is always 0 in shift instructions. Generally a shift to the left $n$ spaces is equivalent to multiplying by $2^n$ and to the right divides the number by $2^n$.

`Logical shifts`  will perform a shift without regards to the signed bit. `Arithmetic shifts` will perform the shift with regards to the signed bit.

##### Bitwise Instructions
A bitwise instruction take in two registers, performs an operations like `AND` and `OR` on each bit in said registers, and stores the result in `rd`.


### Pseudo Instructions
A Pseudo instruction is not a real MIPS instruction. They are instructions defined in MARS which can be made up of multiple mars instructions. Essentially simplified versions of a sequence of mars instructions.



Immediate instructions have:

* 6 bits for opcode
* 5 bits each for two registers
* 16 bits for the immediate value

`R[rt] = func(Imm, R[Rs])`

All memory addresses are 32 bits long just like the register.

Computing a memory address takes the base (initial memory address) and adds a displacement to get a new memory address. This is known as relative addressing.

## Instructions:

* `lb/sb` loads/stores a byte (signed)
* `lw/sw/lhw/lhw` loads/stores a word/halfword (signed)

You can append `u` to these to represent the byte as unsigned.

When loading an immediate that is greater than 16 bits, mars loads the 16 most significant bits into memory

* `addiu` is used to add constants to signed integers when we don't care about overflow - it will not throw an overflow error.

* `bne $9, $0, -3` If `$9` is not 0 move the PC back by three

* `beq` branch if equal

* `bgez, bgtz, blez, bltz` branch greater equal/greater/less equal/less than zero.

* `bgt/bge` Branch greater than 

  MIPS does not have these instructions so it takes this pseudo instruction and uses `slt` and `bne` with 0 to represent this instruction is machine code.

* `slti` set less than immediate 

* `mult` multiplies two registers, only takes in two registers, stores the result into `hi` and `lo`, 32 most significant bits into `hi`, 32 lowest in `lo`
* `mflo` moves the value stored in `lo` to the given register.
* `li $v0, 1` sets syscall to 1
* `move` sets register 1 equal to the value of register 2