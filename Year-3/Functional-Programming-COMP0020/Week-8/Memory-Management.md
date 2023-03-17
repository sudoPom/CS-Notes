---
id: Memory-Management
created_date: 09/03/2023
updated_date: 09/03/2023
type: note
links: 
---
[[Dynamic-Memory-Allocation]]
[[Graph-Reduction]]
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Memory-Management

In functional languages, the heap memory tends to grow quite large. When data is not in use anymore it is good to free up the space in memory so that it can be re used. Memory that was previously stored in the heap but is unreachable is known as *garbage*.

#### Dynamic Memory Management

A storage manager library contains the functions [[Dynamic-Memory-Allocation#Free|free]] and [[Dynamic-Memory-Allocation#Malloc|malloc]] to manage memory. With dynamic memory managem.ent, the user needs to make sure they allocate (and free) memory as and when they need.

#### Automatic Memory Management

With automatic memory management the compiler automatically generates calls to malloc and free automatically, meaning that users do not need to do it themselves. Primarily they:
* Identify data to be allocated dynamically in the heap
* Detect the "garbage" data in the heap
* Make garbage blocks available for re use.

## Memory Management in Functional Programming

In functional programming an automatic memory manager is used as users do not typically have access to pointers. During graph reduction blocks of code tends to be generated whicch eventually become garbage like when copying cells during [[Graph-Reduction#Performing Beta Reduction|beta reduction]] or during [[Graph-Reduction#Performing Delta Reduction|delta reduction]].

### Compaction

The same issues of [[Dynamic-Memory-Allocation#Fragmentation|fragmentation]] arise with functional languages as they do with imperative languages.

To solve fragmentation there are three phases:
* Mark live blocks
* Compact via reloaction of live blocks 
* Update pointers to moved blocks.

Compaction techniques:
* Arbritary: Blocks are moved without regard to their original order. This is fast but does not allow for good spatial locality.
* Linearising: Blocks that are pointed to each other are moved to adjacent positions (if possible).
* Sliding: Blocks are "slid" to one end of the heap, "squeezing out" free blocks, maintaining the original ordering of the heap.


[[Dynamic-Memory-Allocation#Coalescing Free Blocks|Coalescing]] is also used for merging adjacent free blocks.


# Questions / Thoughts