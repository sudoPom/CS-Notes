# I-type Instructions
Immediate Instructions consist of:
* Opcode
* 2 Registers `rs` and `rt` 
* Immediate value
![[Pasted image 20220430214036.png]]

Generallly an I-type instruction is of the form:
`R[rt] = func(Imm, R[Rs])`

The immediate value needs to be sign extended to 32 bits since it is initially 16 bits.

### Memory addressing
Since memory addresses are 32 bits long, they cannot be stored in a 32 bit instruction. Therefore in MIPS we use `base displacement`. Base displacement takes in a `base` which is a value stored in a register, and a `displacement` which will be an immediate value. A register is then referred to by taking the value stored in some register, `$n` and some immediate value, `0xm` and the resulting address would be `0xm($n)`. Or the value in `$n` + `0xm`

### Working with arrays
The `sw (store word)` instruction takes in a value to store, a memory address and an immediate value. The value is then stored in the memory address specified by the second register, with an offset of the immediate value. 
![[Pasted image 20220430215227.png]]

The `lw (load word)` instruction works in a similar way but reads a value from the memory address and stores the value in the specified registrers.

There are also corresponding instructions for loading and storing half words `lhw` bytes `sb`. These are sign extended as defined in [[Number Systems#Sign Extension]]. There are also unsigned variants.

### Large value assignments
Since the `immediate` field is only 16 bits in size, values larger than 16 bits needs to be stored in a special way:
* The upper 16 bits of the value is stored in a register.
* A bitwise or `ori (or immediate)` instruction is used between the previously stored upper 16 bits of  the value and the lower 16 bits of the value. Which is then stored in the target register.

###### Add Immediate weirdness
The `addiu (add immediate unisgned)` instruction takes in a signed immediate value. However it does not care about overflows. The reason it is done like this is because there is no subtract immediate. MARS however will assume you are trying to add an unsigned value and treat it as such while converting assembly to machine code.

### Branching
Branches allow loops and conditionals. For example, the `bne (branch not equals)` instruction takes in two registers for comparison and a signed immediate which indicates how many instructions we should move (forward or backward) AFTER the PC moves forward once. 
![[Pasted image 20220430221601.png]]

There are other variants such as `beq (branch equal)`, `bgez (branch greater than zero)`. The `bgez and blez` have the same opcode since the `rt` is not used since we use the `$zero` register for comparison, so additional information can be stored in the `$rt`. 