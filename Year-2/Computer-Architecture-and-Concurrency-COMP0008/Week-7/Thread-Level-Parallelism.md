# Thread Level Parallelism
Modern day CPU's consist of multiple cores, each of which have the capacity to carry out one or multiple threads of execution. This is known as `thread level parallelism`.

### Threads and Processes
Threads of execution are different processes that are scheduled by an OS onto different cores. Single programs that make use of multiple threads are known as `multithreaded programs`. Programs that use more threads tend to be more efficient as they utilise more of the CPUs resources. 

OS Processes are instances of a program being executed with:
* An address space containing memory segmants
* Shared I/O resources
* Multiple Threads

Each thread contains it's own:
* Registers - a PC, stack pointer and general purpose registers
* Stack in the address space
Threads do however share machine code (the text segment) and data (static/dynamic data segments)

### Multithreading
`Virtual processors` allow cores to switch between threads, allowing a single core to execute multiple threads "simulataneously". A virtual processor consists of multiple sets of registers, where each set of registers belongs to a thread.

Whenever a thread is stalled, the core can switch between threads to resume execution of another process until the other thread can resume execution. This is done by the `thread scheduler`.

Threads that are not currently running need to have their information stored. The `process control block` contains all information about a given process while a `thread control block` stores information about a thread, such as register values.

A `context switch` occurs when a thread is swapped onto the processor. `Hardware timers` generate `interrupts`, which stops the execution of a program to execute part of the OS Kernel, which can cause a context switch. This process is called `time slicing`. Whenever a context switch occurs the register values of the thread being swapped out are stored and the thread being swapped in has it's register values loaded in.

### Hazards
Parallelism can cause some issues.

##### Memory Coherence
A value in shared and core specific cache can differ if another core changes the value in it's own cache. A write through/write back won't solve this issue as it will only update the shared cache, not other core specific caches.

A fix to this is to broadcast a `write invalidate message`, which notifies all other cores that their own copy of the value being updated should be updated. 
