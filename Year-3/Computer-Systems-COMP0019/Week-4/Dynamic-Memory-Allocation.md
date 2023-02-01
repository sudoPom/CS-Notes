
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