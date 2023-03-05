---
id: Cache-Memory
created_date: 21/02/2023
updated_date: 21/02/2023
type: note
links: 
---
[[The-Memory-Hierarchy]]
[[Memory-Hierarchy]]

* **🏷️Tags** : #Computer-Systems-COMP0019 
# Cache-Memory

Cache memory is a type of [[The-Memory-Hierarchy#^7fb51a|SRAM]] which lies between the main memory and the CPU registers. This allows them to be accessed almost as quickly as registers (in about 4 clock cycles).  ^4b7de3

There are multiple tiers of cache:
* L1: Small but accessable in 4 clock cycles
* L2: Bigger than L1 but accessable in 10 clock cycles.
* L3: Bigger than L2 but accessable in ~50 clock cycles.
Each tier lays further from the CPU register file than its successor. ^tiers

## Cache Organisation

A cahce system is composed of:

Cache -> $S = 2^s$ Cache sets -> $E$ Cache Lines

A Cache line stores:
* data of $B = 2^b$ bytes 
* tag: uniquely identifies the data in a cache line
* valid bit: Whether or not the data held in the data block is meaningful.

The 4 tuple $(S, E, B, m)$ can be used to describe a cache line, where $m$ is the number of unique addresses in the computer system. The size of the cache ignores the tag and valid bits making it:
$$
\begin{align}
size = S\times E\times B
\end{align}
$$ ^structure

![[Pasted image 20230221225421.png]]

![[Pasted image 20230221230555.png]]
### Data Retrieval

When data is requested from memory, the cache is checked first. If it contains the data stored in the requested address, it returns the data in the data block.

If the address requested is $A$, which will be of the form:

![[Pasted image 20230221225830.png]]

The $s$ bits of $A$ is used to find which set the data should lie in, the $t$ bit is used to determine the line in which the data should lie in and the $b$ bits determine the **byte** offset of the requested data in the data block.

The data stored at the position is only returned if there is a matching tag in a cache set and the valid bit is set.

The set bits are not set to the higher order bits for spatial locality. If they were set to the higher order bits, entire blocks of memory would map to the same set, meaning that accessing sequential blocks in memory would require you to repeatedly swap out blocks in cache.

## Direct Mapped Caches

A direct mapped cache is of the form $(S, 1, B, m)$ - each cache set has exactly one line. This is the simplest form of cache and data retrieval works as follows:

* Set selection: The $s$ bits are extracted to find the desires set.
* Line matching: We determine if the word is in the line.
	* If there is a match in tag bits and the valid bit is set the data is in the line.
	* If not, we fetch the memory from the main memory and insert it into the line's data block at the correct offset and set the valid bit and update the tag bits. Since each set only has one line, we always replace the previously stored data when needed.
* Word Selection: We extract the word from memory starting from the correct offset and return it.

### Conflict Misses

Direct mapped caches can suffer from conflict misses, which is a result from repeatedly swapping out blocks of data stored in cache. This is also referred to as **thrashing**. For example:

```c
float dotprod(float x[8], float y[8])
{
	float sum = 0.0;
	int i;
	for (i = 0; i < 8; i++)
		sum += x[i] * y[i];
	return sum;
}
```

Given floats are 4 bytes long, and `x` and `y` lie next to each other in memory and that each cache block can hold 16 bytes (4 floats) and the cache consists of 2 sets (so that `x[i]` and y[i] maps to the same set) the following would happen:
* x[0] to x[3] is stored in set 0
* y[0] to y[3] is stored in set 0
* x[0] to x[3] is stored in set 0 again
* ...

This can occur when accessing arrays that are a size of a power of 2. 

A problem can be solved with padding the end of each array so that each value at array index `i` now maps to different sets.

## Set Associative Caches

A set associate cache is of the form $(S, E, B, m)$ where $1 < E < C/B$. These are also called E-way set associative caches. Data retrieval is done as follows:
* Set selection: carried out in the exact same way as with direct mapped caches.
* Line matching: For each line in the block you must compare the tag of the line to the tag of the memory address. If there is a match AND the valid bit is set then there is a cache hit. A memory address that maps to a set can be in ANY of the lines in the set.
	* If there is a cache hit, proceed as before.
	* If not retrieve the data from memory and store it in any free line, setting the valid bits and tag. If there are no free lines, then a line is replaced according to a certain policy. The most simple policy is to replace randomly, but there are others such as [[Memory-Hierarchy#LRU Cache|least recently used]] which replaces the line that has been used least recently.

## Fully Associative Caches

A fully associate cache is of the form $(S, E, B, m)$ where $E = C/B$. This essentially means that all the lines are contained in exactly 1 set, removing the need for addresses containing set bits. Data is retrieved as follows:

* Set selection: Always choose set 0 (the only set).
* Line Matching: Works in the same way as set associative caches.

Fully associative caches are only appropriate for smaller caches like translational lookup buffers.

---
## Writing 

A write hit occurs when an address that is being written to is already stored in cache. There are two main methods of updating the memory to reflect a write change. ^write
* ***Write through** involves updating every single instance of the address in all parts of the memory hierarchy (L1, L2, ..., Main memory). This however causes a lot of bus traffic. ^writethru
* **Write back** involves holding back the updation of a value until it is about to be replaced in the cache. When this occurs the value is written to the next lower level of cache. This has the issue of adding additional complexity, as well as an additional bit being required per line which dictates whether or not it has been edited. ^writeback

A write miss occurs when an address being written to is not stored in cache. There are again two main methods for dealing with this case:

* **Write allocate** will load the corresponding block to cache and update the cache block. This is an attempt to explot spatial locallity but results in an entire block being loaded into cache whenever there is a miss. ^alloc
* **Write no allocate** write the block to main memory and does not allocate it. ^noalloc

Caches that are write through caches are normally write no allocate and write back caches are normally write allocate.

---

#### Modern CPU Cache Architecture

For a multicore system, each core tends to have its own L1 and L2 cache. There are two types of L1 cache (one for storing data and the other for instructions). 
All cores also have access to a shared L3 Cache.

#### Performance Metrics

To determine how well a cache system performs you can measure:
* Miss rate: the fraction of memory references not found in cache.
* Hit time: the time to deliver a line in the cache to the processor (in clock cycles).
* Miss penalty: additional time required because of a miss (also in clock cycles).

Since misses are really expensive the miss rate is typically used.


# Questions / Thoughts

* During data retrieval the valid bit is set for multiple blocks of data. What if a data block doesn't contain meaningful data but is still retrieved because another block in the same line does?
	* When an address is read, the WHOLE block is stored in memory, meaning that if another block has been read and the tag bits are still the same, the block that had been read previously will in fact be in the cache, just at a different offset.

^5a8caf
