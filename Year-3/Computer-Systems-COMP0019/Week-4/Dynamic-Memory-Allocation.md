
When extra memory is required at run time programmers tend to use a **dynamic memory allocator**. The dynamic memory allocator manages part of a process's virtual memory called the heap, which grows upwards in addresses rather than downwards like the stack does. The kernel maintains a variable `brk` which points to the top of the heap. 

Memory in the heap is either allocated (in use by the application) or free. Blocks of memory remains in this state unless explicitly changed. There are two types of allocators which differ in terms of who is responsible for freeing allocated blocks:

* Explicit allocators require the application to explicitly free any allocated
blocks.
* Implicit allocators require the allocator to detect when
an allocated block is no longer being used by the program and then free
the block. Implicit allocators are also known as garbage collectors, and the
process of automatically freeing unused allocated blocks is known as garbage
collection.

#### Malloc

The `malloc` function in c returns a block of the requested size of memory depending on the input. If done successfully a pointer to the allocated memory is returned, if not `NULL` is returned and the `errno` variable is set to `ENOMEM`. 

```c
void *malloc(size_t size);
```

In 64-bit mode the addresses returned is alwats a multiple of 16, whilst in 32 bit mode they will be a multiple of 8.

**Calloc** is a wrapper around the `malloc` function which zeros out all the bits of the allocated memory.
**Realloc** allows users to re-allocate an already allocated memory address - changing the size of the allocated space.

The actual allocator can use the `mmap, munmap` or `sbrk` functions to allocate or dealocate memory on the heap:

```c
void *sbrk(intptr_t incr);
```

^3c5c43

`sbrk` returns the old stack pointer on success and -1 on error. This function works by growing or shrinking the heap by adding `incr` to the kernel's `brk` pointer. The actual return value is the old `brk + abs(incr)` meaning that while using a negative `incr` value is legal, extra precautions need to be taken when working with the return value.

#### Free

The `free` function can be used to free blocks of memory:

```c
void free(void *ptr);
```

The `ptr` variable must point to the start of a previously allocated block of memory. If not the behaviour is undefined.

#### Explicit Allocator Requirements:

Explicit Allocators have the following constraints:
* Handling arbritrary request sequences: Other than the fact that each `free` request must be performed on a previously allocated memory address, (de)allocation requests should be assumed to be made in any order.
* Immediate responses to requests: Requests must be handled immediately and cannot be re ordered or buffered for performance.
* Using only the heap: In order for the allocator to be scalable, any nonscalar data structures used by the allocator must be stored in the heap itself.
* Aligning blocks: The allocator must align blocks in such a way that they can hold any type of data object.
* Not modifying allocated blocks: Allocators can only manipulate or change free blocks. In particular, they are not allowed to modify or move blocks once they are allocated.

With these goals in mind the creator of an allocator would have the following goals in mind:
* Maximizing throughput - number of requests fulfilled per unit time. This can be achieved by reducing the time for each request.
* Maximizing memory utilisation: Ensuring the memory is being used effectively.
	The **peak utilization** over the first $n+1$ requests is defined as:
	$$
\begin{align}
U_k = \frac{max_{i\leq k}P_i}{H_k}
\end{align}
$$
	Where $P_i$ is the sum of the payloads of the currently allocated blocks after request $R_i$ and $H_k$ is the current size of the heap.

###### Fragmentation 

Fragmentation occurs when unused memory is unable to satisfy allocate requests.

**Internal fragmentation** occurs when the allocated block of memory is larger than the payload. This may happen for a number of reasons, like to satisfy alignment constraints. Internal fragmentation is quantified as:
$$
\begin{align}
\text{total size of allocated blocks} - \text{total payload size}
\end{align}
$$
**External ftagmentation** occurs when there is enough aggregate memory to satisfy a request, but no one block of memory can satisfy the request. External fragmentation is harder to quantify due to it depending on the pattern of future requests.

### Implicit Free Lists

An allocator needs some way of keeping track of the boundaries between blocks, and a way to distinguish free blocks from allocated blocks. One way of doing this is implicityl within the block of memory. The block can contain a header which stores the size of the block, followed by the payload and optional padding:

![[Pasted image 20230201220818.png]]

Assuming a double word allignment rule (8 bytes) addresses will always be saved at multiples of 8, meaning the last 3 bits of the block size will be 0. This means we can use the last 3 bits to encode something else, in this case it is whether or not the block is allocated or free.

At the end of the heap space we need a special "end" block which has a size and allocated bit of 0. The Implicit Free list is simple but inefficient as it takes linear time to search the free list. The systems allignment requirement as well as the allocators block format imposes a minimum block size rule.

Allocated blocks can be placed in three ways:
* First fit: Searches through the implicit free list allocates first block found that is big enough.
* Next fit: Same as first fit but rather than starting from the beginning of the list it starts from the previous search left off.
* Best fit: Searches through the implicit list and allocates to the block with the smallest size that fits.

**Splitting Free Blocks** is the process of splitting a free block into two parts in the event that an allocation does not require the entirety of a free block. The first part consists of the allocated block and the second half is the new free block.

If the program requires more space on the heap then the allocator will attempt to merge (coalesc) free blocks together to produce more free space. If this does not happen then the allocator will make a request to the kernel to add more heap space via the [[Dynamic-Memory-Allocation#^3c5c43|sbrk]] function.

###### Coalescing Free Blocks

When blocks are allocated next to free blocks, freeing those blocks can result in **false fragmentation** where there are two free blocks next to each other that are of a size to small to be used for allocations. Adjacent blocks can be merged to prevent this problem.

Coalescing can be done either immediately (after a block is freed) or deferred (doing it later). For example  coalescing could be done only when an allocation request fails. Immediate coalescing is simple but can cause a form of **thrashing** as blocks of memory are being merged and split repeatedly.

**Boundary tags** are essentially footers for each memory block that contains the exact same information that the header has. This can be used in order to coalesc two blocks of memory in constant time - even if the target block is behind the current block.

![[Pasted image 20230201223809.png]]

The main disadvantage of boundary tags is that it results in a large overhead as the number of blocks in the heap grows. A small optimization can be made by making the allocated/free bit accessible in the low order bits of the block meaning that when checking the previous block to see if it is freeable you just need to check that bit, which can be done in constant time still.

### Explicit Free List

The Explicit Free list makes use of an explicit data structure. Since the body of free blocks aren't being used, they can instead be used to store data. A doubly linked list can be constructed by storing `predecessor` and `successor` free block addresses in each free block. This reduces the allocation time to be linear in the total number of free blocks. Freeing can be done in linear or constant time depending on the ordering policy of blocks in the free list:

![[Pasted image 20230201230500.png]]

There are two ways of maintaining explicit free lists:

* LIFO: A newly freed block of memory is added to the front of the doubly linked list. This allows freeing a block of memory to be done in constant time, and coalescing can also be done in constant time if boundary tags are used.
* Address order: The doubly linked list is kept in address order. This means that freeing a block is done in linear time (as the appropriate predecessor needs to be found). This however leads to better memory utilisation. 

The main disadvantage of explicit free lists is that the minimum block space needs to be high enough to store predecessor and successor tags, which can increase internal fragmentation.

### Segregated Free Lists

Segregated free lists maintain a collection of implicit free lists, where each list holds blocks that are roughly the same size. The allocator maintains an array of free lists, with one list per "size class". When the allocator needs a list of size `n` it will search up the corresponding free list. If it cannot find a free block the next free list is checked.

###### Simple Segregated Storage

With simple segregated storage blocks in a given free list are all the maximum value in the free lists class size. For example if some size class is defined as {17–32}, then the free list for that class consists entirely of blocks of size 32.

Allocation is done in the first available free block within the appropriate size class. Blocks are never plit to satisfy requests. If the list is empty, a new chunk of memory is requested and split into blocks of the appropriate size to form a new free list. An allocated block that is freed is just put at the front of the free list.

Allocation and Freeing are both constant time operations with this method. Due to each block being the same size, as well as no splitting/coalescing there is not a lot of per block memory overhead - boundary tags and free flags do not need to be stored. Each chunk in any given free list has the same size, meaning the address of the block can be inferred. The only think that needs to be stored is the next element in the free list meaning that the minimum word size can be 1 word.

The main downside is the amount of internal and external fragmentation caused due to the lack of coalescing and splitting.

###### Segregated Fits

The allocator maintains an array of free lists which can either be explicit or implicit and each list can contain any size (within its size class) block. Allocation is done by performing a first fit search in the appropriate list, and the next one until the space is found. The found free block is split (if necessary).
If no free list has space then the allocator requests more memory from the heap and extends the appropriate list with the new memory. 

This approach is widely used as it is fast and memory efficient.

**Buddy systems** are special cases of segregated fits where each of the class sizes are powers of two. Given a heap of $2^m$ words we maintain a list for each block size $2^k$ where $0 \leq k \leq m$. Requested blocks are rounded up to the nearest power of two. 

To allocate a block of size $2^k$ we find the first available block of size $2^j$ where $k \leq j \leq m$.
* If $k=j$ then we use that block and we are done.
* Otherwise we recursively split the block in half until $k=j$.  After each split we place the resultant half (buddy) to the appropriate free list.

Freeing a block of size $2^k$ is done by coalescing the corresponding buddies until an allocated buddy is reached.

A key fact about buddy systems is that, given the address and size of a block, it is easy to compute the address of its buddy. For example, a block of size 32 bytes with address:
$$
\begin{align}
xxx\dots00000
\end{align}
$$
has a buddy at
$$
\begin{align}
xxx\dots10000
\end{align}
$$

Their addresses differ in exactly one bit position.

Coalescing can be done very quickly like this at the expense of significant internal fragmentation. Because of this buddy systems tend to only be useful when block sizes are known to be powers of 2.