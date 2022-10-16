# Correct Concurrent Programs
A concurrent system should have specifications for the behaviour we want from it. This is often in terms of:
* Pre-conditions - The state of the system before the method is executed
* Post conditions - The state of the system after the method is executed
* Invariants - Conditions which always need to be met by the system.

A concurrent program is correct if a set of properties are. `Correctness` is a boolean property - it must run correctly *every single time* in order for it to be correct. There are two types of correctness:


#### Safety Properties
`Safety` Assertions that nothing bad will happen during program execution. Leaving the system in a bad state.
`Safety Invariants` are requirements which, if not met means the program is in a bad state. 
##### Deadlock
`Deadlock` is an example of a safety invariant where multiple threads are waiting for a lock, preventing the program from continuing execution. Deadlock can alos be considered a liveness property as nothing "good" can happen, certain threads cannot carry out their task.

Generally, threads should access resources in the same order to prevent deadlocks occuring. Deadlocks exist in a system if:
* If Processes have shared access to a resource with mutual exclusion - they need to wait.
* Processes hold onto resources while waiting to acquire additional resources
* Processes cannot have their resources forcefully withdrawn.
* A cycle of processes exist such that each holds a resource while waiting for a resource held by the next process in the cycle.

#### Liveness Properties
`Liveness`: Assertions that something good (a desired outcome) will eventually happen during every execution. 

Excessive locking can cause liveness problems, which can show up as deadlocking. In a `live system` every method invoked is eventually executed.

Liveness Issues include: 
##### Deadlock
[[Correct-Concurrent-Programs#Deadlock|See above]]

##### Livelock
`Livelock` - rather than threads being blocked but repeatedly respond to each other in such a way that prevents them from progressing.

##### Thread Starvation
 `Starvation` - threads do not get the resource required for them to progress due to the structure of the program or overloading of system resources.

Thread starvation can be fixed through the use of `fairness`. Eventually every single thread completes its execution. Fairness can be implemented by only allowing a thread to run for a specified time while other threads are waiting for them. OR by ensuring threads take "alternate turns".

