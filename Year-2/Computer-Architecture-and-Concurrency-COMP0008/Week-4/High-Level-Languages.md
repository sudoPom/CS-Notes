# High Level Languages
## Registers and uses
Each register has it's own intended use. They functionally do the same thing but for conventional use they are each used for a specific purpose.

* `$zero` - constant 0
* `$at` - assembler temporary
* `$v0-$v1` - Function return values.
* `$a0-$a3` - Function arguments
* `$ra` Stores the return address 
* `$t0-$t7` Temporary registers - Are not preserved between function calls
* `$s0-$s7` Saved registers - Function needs to save and restore these if it wants to use them.
* `$t8-$t9` More temporary registers
* `$k0 and $k1` Reserved for operating system kernel, used in system calls
* `$gp` Pointer to the global static data segment.
* `$sp` Stack pointer (points to the top of the stack)
* `$fp` Frame pointer (Where the stack context for the current function is)
* `$ra` Function return address

Each register has a number, from 0-31, which is how they are referred to in instructions.

### C Programming
When writing high level code some care needs to be taken when dealing with signed numbers. If signed integers are used in a C program then there may be undefined behaviour due to overflow issues. 

### Loops 
Typically, loops in mips require two registers, one to hold some form of counter, and a second to store the breaking condition. Upon the counter reaching the breaking condition the code creaks out of the loop. This can be done using a label and any one of the `branch` instructions.

### Functions
Functions allow reusability of blocks of code and allow the construction o

MIPS programmers needs to determine which registers are still valid (have the same/expected values) after a function call is made. Functions are called using the `jal (jump and link)`, `jr (jump register)` instructions.

##### Jump and Link
The `jal` instruction sets the `PC` value to the address specified in the `jump address` field while also setting the `$ra (return address)` register to the line after the `jal` instruction is. Once the function terminates the `PC` changes updates to the value stored in the `$ra` register. There is also a `jalr (jump and link register instruction)`. This is similar to the `jr` instruction defined in the [[J-Type-Instructions#Jump Register]] section.

###### Input Arguments
Input arguments are stored in the `$a` registers.
###### Output values
Output values are stored in the `$v` registers.
###### Temporary vs Saved Registers
Temporary registers `($t)` can be used freely and do not need to be restored by the function once it terminates. This means that if you call a function, you should assume they are corrupted between function calls.

Saved registers `($s)` must be preserved between function calls, this means that if any changes are made to them during a function call, the original values stored in these registers must be restored.

These are just conventions and MIPS doesn't enforce this.

#### Nested functions
For functions that contains other functions we need to save the initial return address before calling another function. This raises another issue - storing and restoring registers. Since we cannot store them in registers since then we would need to store and restore those register values. We also cannot store these values in fixed points in memory as other functions may use this point in memory. 

To solve this problem we use the stack.

## The Stack
The stack is a portion of memory (located at the top) that dynamically grows downwards as demands change. The `$sp (stack pointer)` register points to the top of the stack. While the `$fp (frame pointer)` points to the bottom of the section of the stack the function has access to. 

When a function is called typically:
* The `$sp` register is moved down to make space for:
	* The old `$ra` value
	* The old `$fp`
	* The old `$a` input values If we intend to call other functions.
	* Any `$s` old saved registersbottom of the callee stack.
* The new `$fp` is updated to point to the top 

Since the stack grows downwards the way to allocate more space in a stack frame is by doing something along the lines of:

```assembly
addi $sp, $sp -8
```

This will grow the stack frame by 8 bytes or two words. 

Referencing the second word in the stack frame can be done like so:

```assembly
lw $t0, 4($sp)
```

The `$fp` is used to reference previously stored values so they can be restored at the end of a function call. This is preferred over using the `$sp` register since values stored relative to the `$fp` memory location does not change as the stack grows.