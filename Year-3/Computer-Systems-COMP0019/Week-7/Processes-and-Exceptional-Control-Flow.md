
---
id: Processes-and-Exceptional-Control-Flow
created_date: 02/03/2023
updated_date: 02/03/2023
type: note
links: 
---
[[Processes-and-Virtual-Memory]]
* **🏷️Tags** : #Computer-Systems-COMP0019 
# Processes-and-Exceptional-Control-Flow

Processors read a sequence of instructions and processes them. A program that does this in a linear order is sequential. Additional features like [[MIPS-and-Jumps|jump]] instructions can cause changes in the ordering of instructions depending on changes in the program state.

---
## Exceptional Control Flow

For a useful system we need to be able to react to changes in system state. An exception is a change in the control flow in response to a low level system event.

High level mechanisms include:
* Process context switch
* Signals: Something happened to the system that the process should know of.
* Nonlocal jumps

### Exceptions

Exceptions transfer control to the OS kernel in response to an event. These can include:
* Division by 0
* Arithmetic overflow
* Ctrl-C
* Page faults

Once the kernel's execution is finished, depending on the exception the process either:
* Attmepts to run the instruction that called the exception again
* Call the next instruction in the program
* Abort the instruction

##### Exception Table

The kernel holds an exception table which is an array of pointers to blocks of code that responds to the given exception. Each exception has a number which is the index into this exception table.


##### Classes of Exceptions

There are asynchronous and synchronous exceptions:
* Asynchronous Exceptions are cause by events external to the processer (I/O interrupts ctrl-C). The handler will return to the next instruction after handling the exception.
* Synchronous Exceptions occur as a result of executing an instruction.
	* A **trap** is a deliberate way to cause an exception. Traps always return to the next instruction.
	* A fault is an unintentional (but potentially) recoverable exception. After handling the exception the program instruction is either re ran or the program is aborted.
	* An abort exception is unintentional and unrecoverable. The program is always aborted. Examples includes illegal instructions, and machine checks (which ensure the CPU is not faulty). 


# Questions / Thoughts