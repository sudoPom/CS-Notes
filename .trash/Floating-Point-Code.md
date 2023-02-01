
Some processors contain floating-point architecture, which affect how programs operation on floaring-point data are mapped onto the machine. This inludes:
* How floating-point values are stored and accessed.
* The instructions that operate on floating point data
* Passing floating-point data as arguments and return values
* Register conventions

The **AVX** floating point architecture contains 16 registers, `ymm0-ymm16` which can all hold 32 bytes (256 bits) of floating point data. Like with regular registers, these registers have conventional uses:

![[Pasted image 20230131104347.png]]

The lower 16 bytes can be accessed through the `$xmm` registers.

These registers have their own set of `mov` instructions which can be used to move values in memory of either single precision (16 bytes) or double precision (32 bytes):

![[Pasted image 20230131104623.png]]

Values moved from memo