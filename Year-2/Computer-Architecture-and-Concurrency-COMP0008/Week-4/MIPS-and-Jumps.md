# High Level to MIPS and Jumps

## Registers and uses

* `$zero` - constant 0
* `$at` - assembler temporary
* `$v0-$v1` - Result value
* `$a0-$a3` - Function arguments
* `$ra` Stores the return address 
* `$t0-$t7` Temporary registers - Are not preserved between function calls
* `$s0-$s7` Saved registers - Function needs to save and restore these if it wants to use them.
* `$t8-$t9` More temporary registers
* `$k0 and $k1` Reserved for operating system kernel
* `$gp` Pointer to the global static data segment.
* `$sp` Stack pointer (points to the top of the stack)
* `$fp` Frame pointer (Where the stack context for the current function is)

## Jump Instructions

Contains 6 bits for opcode and the remaining 26 for the jump argument. This limits the addresses we can jump to as addresses are 32 bits long.

* The first 4 MSB of the PC are copied, and the jump address argument is added to the end of these bits.
* 2 0 bits are added on to the end for alignment.

Jump register instructions are R type and will change the value of the PC to the number of the register specified.

## Functions

Function calls make use of `jal` and `jr` (jump and link ), and jump register. The jump and link function will change the PC to where the function code is but it also sets the `$ra` register to the next instruction of the program calling the function. If a function made use of any of the saved registers and another function is called, these saved registers need to be restored to ensure the data in these registers have not been corrupted (altered) by the called function. It is convention to assume that temporary values will have been altered when ever a new function is called.

If we dont want a register modified in a function call:

* Store the register value before the function is called 
* or store the value at the start of the function call and restore it before it ends.

Generally for temporary registers it is the responsibility of the program calling the function and for saved variables it is stored by the function being called.

## Stack

Calling `addiu $sp, $sp,-n` will grow the stack by `n` bytes. This is typically done when saving the values of registers. Upon calling a function the `$fp` register is the position of the old return address (it is above all other values that are saved by the function). For nested functions, `$sp` and `$fp` need to be stored and restored by the new function.

