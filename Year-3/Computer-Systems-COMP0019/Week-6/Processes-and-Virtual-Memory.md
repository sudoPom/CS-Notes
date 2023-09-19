---
id: Processes-and-Virtual-Memory
created_date: 23/02/2023
updated_date: 23/02/2023
type: note
links: 
---
[[Thread-Level-Parallelism]]
* **🏷️Tags** : #Computer-Systems-COMP0019 
# Processes-and-Virtual-Memory

A **process** is an instance of a running program. A process acts as if they have full access to the CPU and registers (due to context switching provided by the kernel). 

Each process has a PID (process ID). At any given instance, a CPU is only running one process at a time. However the CPU will **context switch** between different processes. A CPU with multiple cores can actually run multiple processes at a time.

If a process is context switched out, it needs to store the CPU register values so that they can be loaded back in when it's the process' turn to be executed by the CPU again.

Two processes are concurrent if their logical control flow overlap at the same time. If not they are sequential.

##### Context Switching

The kernel is a shared chunk of memory-resident OS code. Kernel code is not a process - it runs as part of an exsisting process. A context switch passes control flow to the kernel.

---

## Virtual Memory 

Processes have a private address space in main memory which is provided by the kernel, this address space is called **virtual memory**. This address space contains:
* Stack
* Heap
* Data
* Code

The CPU has an Memory Management Unit (MMU) that translates a virtual memory address to a physical address (the actual address in memory).

Virtual memory allows DRAM to be used as cache for parts of the virtual address limit. It also isolates address spaces - preventing processes from interfering with another processes memory.

### Memory Management

A process has its own virtual space. There's a mapping function which maps addresses in the virtual space to addresses in the physical space. This allows the required pages for a process to be scattered anywhere in physical memory, even if the virtual pages are contiguous.

![[Pasted image 20230228121659.png]]

Multiple virtual pages can map to the same physical page, even across processes. Copy on write is a type of page that is accessible by 2+ processes. If the shared page is written to by process 1, then a protection fault is raised (writing in a read only area of memory). However rather than halting execution, a new read/write page is allocated in physical memory and changes the mapping of the page table entry in process 2 to map to the new page.

Virtual address spaces allow every processes' memory map to be the same. Meaning, for example, the heap will start at virtual address $n$ for every process.


### Memory Protection

Page table entries can also have additional permission bits which can be used to determine if a user process can modify/read a given page. For example a process should not be able to modify anything in its read only code section.

The permission bits are:
* READ: Can the process read the contents of the page.
* WRITE: Can the process write to the page.
* EXEC(ute): Can the process execute the page.
* SUP(ervisor): Does the process need to be in kernel mode.

### Address Translation

Address translation is done by the MMU and translates addresses between address spaces:
* Physical $N$ bytes on disk
* Virtual $M$ bytes on disk

###### Basic Parameters
* Page size $P = 2^p$
* Number of physical addresses $M = 2^m$
* Number of virtual addresses $N=2^n$


The MMU performs the MAP function:
$$
\begin{align}
MAP(A) \to \begin{cases} 
A^{\prime} \text{ if data at virtual address A is present at address } A^{\prime} \text{ in physical memory} \\
\emptyset \text{ if data at virtual address A is not present in physical memory}
\end{cases}
\end{align}
$$

##### Address format
Virtual addresses consist of a **virtual page offset (VPO)** and **virtual page number (VPN)**

Similarly physical addresses consist of a PPO (which is the same as the VPO) and the VPN. 

The most significant $n-p$ bits of the address represents the page number (VPN/PPN) and the least significant $p$ bits represents the offset (VPO/PPO), where $p$ is the number of bits needed to represent a page and $n$ is the address size. 

To get an address from physical memory given a virtual address: ^17b5a8
* The processor generates a virtual address and sends it to the MMU.
* The MMU generates the PTE address and requests it from the cache/main memory.
* The cache/main memory returns the PTE to the MMU.
* The MMU constructs the physical address and sends it to the cache/main memory.
* The cache/main memory returns the requested data word to the processor.

![[Pasted image 20230228124702.png]]

However if the address is not present in memory/cache we do something slightly different. The first three steps of the process is the same as if there were a [[Processes-and-Virtual-Memory#^17b5a8|hit]].

* The valid bit in the PTE is zero, so the MMU triggers an exception, which transfers control in the CPU to a page fault exception handler in the operating system kernel.
* The fault handler identifies a victim page in physical memory, and if that page has been modified, pages it out to disk.
* The fault handler pages in the new page and updates the PTE in memory.
* The fault handler returns to the original process, causing the faulting instruction to be restarted. The CPU resends the offending virtual address to the MMU. Because the virtual page is now cached in physical memory, there is a hit, and after the MMU translates retrieves PTE and gives the translated physical address to memory, the main memory returns the requested word to the processor.

![[Pasted image 20230228124722.png]]

### Including Cache

Systems that have virtual memory and cache will check to see if the requested data is stored in cache.

![[Pasted image 20230228125144.png]]

There is a slight delay accessing the L1 cache. To offset this we use a **Translation Lookup Buffer (TLB)**. The TLB is an n-way set associative cache that makes use of two bit fields, the TLB Index and the TLB Tag. 

![[Pasted image 20230228125358.png]]

The TLB operates exactly like the [[Cache-Memory#^|set associative cache]].

![[Pasted image 20230228130009.png]]

Since pages are very large, TLB lookup misses are rare, but if this happens then the PTE needs to be searched for in L1 cache, then L2, etc.

![[Pasted image 20230228130112.png]]

### Multi Level Page Tables

For a 4KB page size, 48 bit virtual address space and 8 byte PTE we would need 512 GB of data to store the page table. (A lot)

A $k$ level page table helps fix this problem. The page table in level one will store page table entries which each point to another page table (in level 2). This continues until reaching level $k$, where each page table entry points to a virtual page in virtual memory. 

If every page table entry in a page table is null then it does not need any memory to be allocated.

![[Pasted image 20230228131239.png]]

##### Translating K Level Page Table

The address for a page table consists of $k$ VPN's rather than 1. Each VPN represents the page table entry to access in a given level.

![[Pasted image 20230228131439.png]]

In an intel i7 processor, the cache index and offset fit in the same space as the physical/virtual page offset. This means that the cache lookup can happen during address translation. The benefit of this is speed but this restricts the size of the cache in such a way that makes the cache index and cache offset fit into the PPO/VPO.

--- 
## Memory Mapping

When an area of memory is intialized by associating them with disk objects we call the **memory mapping**. This area can be backed by:
* Regular files
* Anonymous files (initially empty). Once the page is written it is like any other page.

A swap file is used to copy anonymous files back and forth in memory.

The function `mmap` maps a certain number of bytes of a file into an address:

```c
void *mmap(void *start, int len, int prot, int flags, int fd, int offset);
```

`mmap` is useful for reading large files. It can also be used to access data structures which of course has it's own risks.

# Questions / Thoughts