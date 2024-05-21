---
id: Lecture_19_Meltdown
created_date: 14/12/2023
updated_date: 14/12/2023
type: note
links:
  - "[[Instruction-Level-Parallism]]"
  - "[[The-Memory-Hierarchy]]"
  - "[[Memory-Hierarchy]]"
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Meltdown

The assumption that processes are isolated from others is the basis of cloud computing - multiple users running things on the same computer can safely do so without needing to trust each other. However the meltdown vulnerability is located within the CPU hardware. Kernel maps all physical memory of all processes. If a process gets access to the kernel then the process can read the memory of all processes.

This affected all modern Intel CPUs since the 1995 P6. This also effected the ARM CPUs despite not sharing the same design.

To reduce stalling in pipelined execution, instructions tend to be ran out of order. This is done if the result of an instruction is needed in a later instruction but the first instruction has not finished yet. Instructions are still finished in program order but are executed out of order. If a later instruction is executed but a prior instruction fails (segfaults for example) then the later instruction's value is **squashed** - not written back to registers.

### Flush and Reload Attack

A flush and reload attack aims to find out if a target address has been accessed by a process within some time period. It includes three phases:
* Flush part of the data cache that holds the target address that we want to know about. The cache line flush `clflush` instruction allows this.
* Let the program execute.
* Try and read the target address and time the read. If the latency is short then the program must have accessed the address since it is in the cache again. If not the process has not accessed the address.

This is an example of a time based side channel attack.

### Actual Meltdown Attack

The goal of a meltdown attack is to read data from another processes virtual memory from within a user level non root process. The approach is:
* Flush the CPU data cache for a range of valid process memory addresses.
* Tell the OS not to kill the process on a segfault.
* Read from the target kernel virtual memory that corresponds to the other processes data. This should cause a segfault.
* Read from a valid in process memory address that is derived from the value read from the kernel virtual memory address. This will execute due to out of order execution.
* Time reads from all addresses the prior step may read from. If one completes faster than others reveals kernel memory value.

##### Mitigation

A fix would be to not map the kernels pages into user processes page tables. This is known as **Kernel page table isolation**. This has a performance cost since when making system calls ,the OS must change the active page table to map kernel memory and reverse when switching back to the process.

Other hardware mitigations causes memory reads to check if a target address is legal before out of order execution of later instructions can modify the cache.
# Questions / Thoughts