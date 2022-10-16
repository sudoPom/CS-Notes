# Memory Units

A memory unit is a way of representing large number of bits.

* A bit is a single binary digit (1/0)
* A byte is 8 bits
* A Kilobyte is 1024 ($2^{10}$) bytes
* A Megabyte is 1024 Kilobytes
* Gigabytes
* Terrabytes
* Petabytes

A `word` is a natural unit of data used by a processor. They indicate the size of:
* Registers
* Memory Addresses
* Instruction sizes
* Floating point variable sizes.

MIPS32 uses the following unit sized:

* Byte = 8 bits
* Half word = 16 bits
* Word = 32 bits
* Double word = 64 bits

### Memory Organisation
`Memory` can be seen as an array of bytes/words.
![[Pasted image 20220430162217.png]]

The `byte order` determines the order bits are stored in memory addresses.
* `Big endian` stores the bits starting with the most significant bit first.
* `Little endian` stores the bits starting with the least significant bit first.

In practice, little endian is used for various reasons including reading the first $n$ bits of a memory address much easier for computers.

### Setting Register Values
In order to write an $N$ bit value into a register of length $M$ where $N \leq M$ you write the $N$ bit value into the $N$ least significant bits and extend the signed bit as described in [[Number Systems#^75b190]] for the rest of the register.

## Memory
Memory in a computer is typically made up of the following segments:
* Dynamic Data - Memory created dynamically, usually from functions like `malloc` or `calloc`.
* Static Data - Memory used to store global variables.
* Text - Where the source code of the progam is stored
* Stack - Used to store local variables used within functions.
* Kernel Space - The section of memory that is used by the operating system.