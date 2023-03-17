---
id: Memory-Allocation-Methods
created_date: 12/03/2023
updated_date: 12/03/2023
type: note
links: 
---
[[Memory-Allocation-Methods]]
[[Dynamic-Memory-Allocation]]
* **🏷️Tags** : #Functional-Programming-COMP0020 
# Memory-Allocation-Methods

There are a few methods that can be used to allocate memory.

## Pointer Increment

The simplest method to allocate memory. There is a pointer that points to the top of all allocated memory. Everything above the pointer is free memory. There is also an `end` pointer that points to the very top of the heap.

##### Fast Allocation

This strategy does not attempt to re use memory - there is no `free` function. When memory is requested the following pseudocode is ran:
```
if (TOP + N > END)
then error("Out of memory");
else {
	tmp = TOP;
	TOP = TOP + N;
	return(tmp);
}
```
##### Slow Allocation

This strategy makes use of memory compaction for re using memory locations. Each block is given a header tag holding:
* Information on whether the block is free or live.
* Information on the size of the block.
The size of the header depends on the maximum size of the block, $m = 2^s$. The size of the live/free information takes up an entire byte. 

When allocating memory, if the requested size does not fit between the `top` and `end` pointer we apply a [[Memory-Management#Compaction|compaction method]] to attempt to make more space.



# Questions / Thoughts