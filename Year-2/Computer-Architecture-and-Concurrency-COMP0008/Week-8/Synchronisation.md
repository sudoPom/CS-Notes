# Java Synchronisation
Threads can interact with each other by accessing shared objects that are stored in the heap memory. Recalling the fact that there are multiple interleavings:  

![[Concurrency-Abstraction#^0873c9]]

Some interleavings of threads will cause interference with each other which will cause a race condition. `Interference` is a type of race condition where a destructive update is caused by the arbitrary interleaving of read and write instructions. The general solution to solve interference bugs is to make blocks of code `mutually exclusive` which will only allow one thread to run the block of code at a time.

### Synchronisation in Java
To make a method synchronised in java you can use the `synchronized` keyword:

```java
synchronized public threadSafe(){
	//Code accessing shared variables
}
```

The way synchronisation works is through the use of an `object lock`. When ever a thread attempts to access a synchronised method, they take the object lock, and begins executing the method. Now any other thread that tries to access the method will not be able to execute it as they do not have the lock, so they will have to wait, see [[Java-Threads#Thread Life Cycle]], until the lock is returned.

A thread can still access the object but cannot execute any other synchronised methods in the same object.

Locks need to have a count to determine how many nested synchronised methods a thread has access to. When the lock reaches zero, the thread releases the lock. This prevents a thread from `deadlocking` itself - where two or more threads waiting for each other indefinitely. A way of preventing deadlocks is by decreasing the scope of a lock.

This can be done with synchronised statements:

```java
class doStuff(){
	//Some thread safe stuff
	synchronized(this){
		//Code accessing shared variables
	}
	//More thread safe stuff
}
```

### Lock Implementations
###### Spinlock
A spinlock is a memory location that can either have the value 0 for being unlocked and 1 for being locked.
```java
while(spinlock_mem != 0){
	;
}
spinlock = 1; //lock
//Code accessing shared variables
spinlock = 0; //unlock
```

This is a pretty bad implementation since if a context switch occurs after the spinlock is unlocked the multiple threads could have access to the lock, meaning it is prone to race conditions.

Special hardware instructions are needed to support the implementation of locks. MIPS also has special instructions that can aid in implementing thread safe locks:

```assembly
ll $s2, 0x0000($s1) //Load linked Loads a value from memory

sc $s2, 0x0000($s1) //Store conditional - Store a value into memory if it has not 
					//been changed since the last load linked instruction. $s2 is 
					//set to 1 on success and 0 on failure
```

Using these commands a spinlock can be implemented like so:

```assembly
lockit:
	ll $s2, 0($s1)      #Load linked to get lock values
	bne $st, $0, lockit # Try again if the lock is not 0
	addiu $s2, $0, 1    # Set lock to 1
	sc $s2, 0($s1)      # Store conditional lock value
	beq $st, $0, lockit # If lock has been accessed since last load linked, retry
```

