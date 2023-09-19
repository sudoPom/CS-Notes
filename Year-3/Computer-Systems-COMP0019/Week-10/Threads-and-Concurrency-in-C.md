---
id: Threads-and-Concurrency-in-C
created_date: 23/03/2023
updated_date: 23/03/2023
type: note
links: 
---
[[Thread-Level-Parallelism]]

* **🏷️Tags** : #Computer-Systems-COMP0019 
# Threads-and-Concurrency-in-C

A *thread* is a portion of the memory model which consists of its own stack frame. Every process starts off with a *main thread* but more *peer* threads can be created which each have their own stack frame but share a heap space.

### Posix

In C, the posix library is used for writing concurrent programs.

```c
int pthread_create(pthread_t tid,
			   const pthread_attr_t attr,
			   void *(thread_func)(void *),
			   void* thread_arg)
```

`pthread_create` creates a new thread and executes the thread_func on that thread. Upon success it returns 0 abd returns a positive error code on failure.

```c
pthread_exit(void *value)
```

`pthread_exit` returns a pointer which any peer thread can access.

```c
pthread_join(pthread_t thread, void **status)
```

`pthread_join` waits for the thread with id `thread` to finish. The status of the completed thread is returned to `status`. Peer threads can wait for each other, but you can only wait for a single thread at a time, not a group of threads. To avoid zombie threads, every thread created should eventually be waited for.

```c
int pthread_detach(pthread_t thread)
```

`pthread_detach` detaches a thread meaning that when  the thread finishes execution it will vanish, so there is no need to wait for it. Deatching a detached thread is undefined behaviour.

```c
pthread_t pthread_self()
```

`pthread_self` returns the thread id of the calling thread. On linux `pthread_t` is an unsigned long but on mac it is a pointer to `_opaque_pthread_`. 

To compare two threads you should use the `pthread_equal` function:

```c
pthread_equal(pthread_t t1, pthread_t t2)
```

### Synchronisation

If multiple threads are accessing the same shared memory location, their accesses need to be synchronised. If it is not, it is undefined behaviour.

The `stdatomic.h` library provides tools for accessing and altering shared variables safely.

```c
#include <stdatomic.h>
_Atomic unsigned long var = ATOMIC_VAR_INIT(0) // Initialising an atomic unsigned long

unsigned long val = atomic_load(&var) // Load value of atomic variable.

atomic_store(&var, 42) // Atomically write to a variable.

atomic_fetch_add(&var, 2) // Atomically increments value by 2. Similar functions for sub, and, or and xor. 
```


# Questions / Thoughts