# System Calls
The MIPS2000 processor actually consists of multiple coprocessors:
* The main CPU 
* Coprocessor 1 - The floating point unit (usually intergrated into modern day CPUs) ^a27d6d
* Coprocessor 0 - Exception handler

![[Memory-Unit-and-MIPS-processors#Memory]]

The kernel aditionally handles exceptions. This is done by changing the PC to an address stored in the kernel space. This allows:
* The state of the program to be stored and returned to if needed.
* Run instructions that are not allowed in the user space, like halting the machine.

When an exception occurs:
* The `exception code` is loaded to coprocessor 0's `cause` register.
* The current `PC` value is stored in the `epc` register in coprocessor 0.
* The `PC` is then changed to `0x8000080` - the location of the exception handler code.
* When writing/modifying exception handlers, registers `$k0` and `$k1` may be used.

Exceptions include:
* Interrupt
* Address fetch, load and store
* System call exceptions
* Reserved instruction exception - For a non exsistant error
* Coprocessor unimplemented - If the piece of hardware used to carry out some form of operation is not present
* Trap - False assertions
* Floating point exception

## Syscall
A system call is a native CPU instruction with encoding `#0x0000000c`, making it an R-type instruction. Syscalls are used for operating system services. The type of service depends on the value in the `$v0` and any parameters the service may need are stored in the `$a0-$a3` registers.

