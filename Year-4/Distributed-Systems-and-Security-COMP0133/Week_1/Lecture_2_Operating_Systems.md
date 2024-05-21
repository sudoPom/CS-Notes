---
id: Lecture_2_Operating_Systems
created_date: 05/10/2023
updated_date: 05/10/2023
type: note
links:
  - "[[I_O]]"
  - "[[Processes-and-Virtual-Memory]]"
  - "[[Signals]]"
  - "[[Thread-Level-Parallelism]]"
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Operating Systems

All systems (including distributed systems) run on an OS, meaning that the design of a distributed system needs to take the features of the OS into consideration.

An OS should be able to:
* Share hardware resources
* Protection of data between apps and also between apps and the OS
* Communication between apps and the OS
* Hardware Independence

This is done through various abstractions that do things such as provide an [[Processes-and-Virtual-Memory |address space]] for each application, and a way to communicate with other processes through [[Shells#Pipe |pipe()]].
  
OSs also virtualises hardware so that application writers do not need to worry about the fact that the application they are writing could be used via different I/O devices.

The kernel has elevated privilege and can therefore access the memory of other applications and can also access the system's hardware directly. If an application wants to access the hardware of the system it needs to do it through the kernel using system calls. The `trap` system call switches to the kernels address space, sets the privileged flag and then sets the program counter to the address of the trap handler. The trap handler saves the registers of the current process and sets the stack pointer to the kernel stack. The computer is then able to call whichever function the process wanted to call.

### I/O Concurrency

[[I_O|I/O]] operations can be slow (like seeking to a disk) so the kernel will make use of the [[Signals | sleep signal]], switching out to another run-able process. Once the I/O is complete, an interrupt is generated, notifying the kernel that the the operation is complete and the kernel marks the process as run-able, which will be rescheduled to run by the process scheduler. 

Correct I/O concurrency can dramatically speed up the speed of a process due to how slow I/O is. This can be achieved using multiple processes and threads but the OS can also help out with this too. Some OS will **read ahead** from a file that is requested to read from, meaning that it will store additional bytes in a buffer. In the same fashion, a **write behind** can be performed which will store bytes to be written in a buffer and will send them off at some point, returning from the `write()` call before it is actually written.

### CPU Concurrency

Increasing CPU concurrency is both harder to implement and has less performance potential than I/O concurrency.

CPU concurrency can be achieved using [[Processes-and-Virtual-Memory|processes]] or [[Threads-and-Concurrency-in-C|threads]]. Creating a new process is an expensive operation and each process is isolated (by default). Threads on the other hand share memory between each other but requires the use of locks.

Threads can be **user** or **kernel supported**. 

Kernel supported threads mean that the kernel knows about all threads and whether a thread blocks and can re schedule the execution of the thread in a process. For this, the kernel needs to have a stack per thread and a table per thread (storing saved registers).

Processes have their own address space and file descriptors, while threads have their own user, kernel stack and kernel state.

Kernel threads are more expensive as a system call is required to create a new thread or to perform any other thread operations. Additionally, kernel threads have a different implementation based on the OS (because each OS has it's own kernel design).

User level threads are implemented within the application code. This means the application code will need to handle thread scheduling. The user level thread library will have fake system call functions which invokes the system call **without blocking** and marks the thread as waiting,  switching to a runnable thread. Once the operation is completed the kernel notifies the process (since the kernel has no concept of threads) and the thread library checks which threads were waiting on the now completed operation and marks them as runnable.

This process requires the kernel to have implemented these non blocking system calls as well as notifications for completed system calls, which is not present for all system calls - typically these were present for network system calls but not most file system calls.

Non blocking system calls are difficult to implement. However as a result user level threads have high performance as they do not need to trap to the kernel.

The use of threads for I/O concurrency still requires the use of locks even if the CPU has only one core and there is no real time concurrency (as a thread can be context switched out at any time).

Event driven programming allows for I/O concurrency without CPU concurrency. When an event happens (`read()` finishes) a certain function is executed. In event driven programming events should come in serially. Event driven programming is hard to debug as the order of execution is entirely based on the order events are received.

# Books

* General Overview: Modern Operating Systems 4th Edition
* The Design and Implementation of the 4.4 BSD Operating Systems
# Questions / Thoughts