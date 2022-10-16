# Comining Instructions
The process of `disassembly` is converting a binary string to it's assembly instruction.

## Bit Manipulation
Operations can be performed using bit shifts and bitwise operations which can be more efficient than regular computation.

#### Bit Masks

We may want to extract a certain value from an instruction (lets say the register location). A `bitmask` is a bit string that contains 1s in only places where we want to obtain the value. 

A bitmask can be obtained by using the `lui (load upper immediate)` instruction followed by the `and` instruction, finally followed by the `srl` instruction which will move the value to the very right of the bitstring.

A more efficient way of doing this is to perform a shift to the left, so that the desired value is to the very left of the bitstring, then a shift to the right, which will result in the value being to the very right of the bitstring with no 0s.
#### Computing The Average
While performing the traditional average calculation will work in most cases. When the sum of the numbers cannot be expressed in 32 bits, an overflow error will occur and the result will be incorrect. For two registers `$a` and `$b`,  performing `$a xor $b` and halfing the result (`srl`) then adding the result of `$a and $b`. 
