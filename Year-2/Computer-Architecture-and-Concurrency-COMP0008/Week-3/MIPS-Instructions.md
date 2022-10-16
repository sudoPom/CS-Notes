# MIPS Instructions

Immediate instructions have:

* 6 bits for opcode
* 5 bits each for two registers
* 16 bits for the immediate value

`R[rt] = func(Imm, R[Rs])`

All memory addresses are 32 bits long just like the register.

Computing a memory address takes the base (initial memory address) and adds a displacement to get a new memory address.

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