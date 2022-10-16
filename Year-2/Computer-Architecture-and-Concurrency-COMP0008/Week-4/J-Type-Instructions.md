# J-Type Instructions
A Jump type instruction consists of:
* Opcode
* Jump arguments
![[Screenshot_20220501_194226.png]]

### Jump

Again since Addresses are 32 bits they cannot fit into an instruction. To solve this, the new `PC` is calculated as:
$$
\begin{align}
	NewPC\ =\ (PC+4)[31:28]\cdot JA \cdot 00 =4 \cdot JA \ = 0x400010
\end{align}
$$

Or, the 4 most significant bits of the `PC` after it moves to the next instruction, appended with the `jump argument` followed by two additional zeros. The two additional zeros are required since addresses need to be of word length, or 32 bits. This means that the jump argument must be 4 times the desired memory address. However this only works for memory addresses that share the same most significant bits.

### Jump Register
If the address is in a different code region such that the 4 most significant bits are not the same. or the address is not known during runtime then the `jr (jump register)` instruction is used, which is actually an R-type instruction. This only requires one register, `rs` and therefore the `rt,rd` fields will be empty.