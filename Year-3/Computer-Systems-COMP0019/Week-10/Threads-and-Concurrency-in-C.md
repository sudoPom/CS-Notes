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
pthread_create(pthread_t tid, )
```

# Questions / Thoughts