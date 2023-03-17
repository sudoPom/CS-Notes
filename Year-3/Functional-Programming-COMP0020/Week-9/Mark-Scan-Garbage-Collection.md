---
id: Mark-Scan-Garbage-Collection
created_date: 13/03/2023
updated_date: 13/03/2023
type: note
links: 
---
[[Memory-Management]]
[[Memory-Allocation-Methods]]
[[Graph-Reduction]]
[[Miranda]]
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Mark-Scan-Garbage-Collection

*Mark Scan* is triggered by `malloc()` when free memory is low. This typically pauses the program. Mark Scan traces all live pointers and marks all the blocks pointed to by the blocks. All blocks not marked are made free (if they aren't already). Once freed it is put on the free list - which is newly created at the start of the scan. Miranda uses Mark Scan.

The live blocks aren't moved around so to prevent fragmentation a seperate compactor could be used.


### Assumptions
* `malloc()` allocates free memory from a free list.
* All live blocks are reachable by tracing all live pointers.
* Pointers can be distinguished from other data.
* All pointers to the start of a block of data.
* All live pointers can be found by tracing from a "root set" of pointers.
* Evaluation pauses during the Mark Scan.
* Every block has an associated "mark but", initialised to 0.

### Implementation

Iterative and recursive techniques can be used to implement Mark Scan garbage collection, however, since this is called when low on memory it is a good idea to use a method which does not have a risk of us running out of memory. 

To solve this we can make use of [[Graph-Reduction#Pointer Reversal|pointer reversal]]. Each block has a block header containing fields:
* `n` field: represents the number of pointers in a block.
* `i` field: represents the number of pointers processes so far.

The `i` field determines the next pointer to process and which pointer currently holds the back pointer. The `i` field also doubles as a mark bit.

| Advantages                          | Disadvantages                 |
| ----------------------------------- | ----------------------------- |
| Only requires small, constant space | Additional per block overhead |
| Helpful when memory is low          | Slower than stack traversal                              |

## Scanning

Scanning depends on the amount of memory that a program uses, so for programs that use a large amount of data memory, scan() can be very slow compared to mark(). This is important as scanning normally pauses the program.

*Lazy scanning* aims to solve this probelm that reduces the pause caused by running scan(). 

# Questions / Thoughts`