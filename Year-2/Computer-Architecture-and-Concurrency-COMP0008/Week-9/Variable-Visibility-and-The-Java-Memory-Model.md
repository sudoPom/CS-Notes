# Variable Visibility and The Java Memory Model

### Visibility

 If a thread updates a variable, another thread may not see this variable change as the thread changes the variable in local cache or local registers. This is called a `visibility error`. This is because some compilers may choose to store variable changes in the cache or a thread's local register. 
 
 Another cause of this is the re ordering of instructions. Recall:
 
![[Instruction-Level-Parallism#^91862e]]

Changes in the order of execution could interfere with the expected output of the program. This is because of the techniques used to make programs run faster such as out of order execution. Ordering can be preserved through the use of synchronisation. 

In the java specification it is stated that all threads must synchronise their working memories with the main memory upon entering and exiting synchronised segments.



### The Java Memory Model

The `java memory model` defines how memory management works for Java.  It defines what changes made by one thread should be visible to another. Objects that need to be seen by other threads are known as `safely publised`.

#### Safely published Objects

An object is safely published if the latest reference to the object and its state will be made visible to other threads at the same time. This can be done by:
* Initialising an object reference from a static initialiser
* Storing a reference to it into a volatile field
* Storing a reference to it into a final field of a properly constructed object
* Storing a reference to it into a field that is properly guarded by a lock.

###### Immutable Objects
An immutable variable is by definition thread safe as they cannot be changed doing runtime. Objects are immutable if:
* Its state cannot be modified after construction
* All it's fields are marked as final
* It is properly constructed - The reference does not "escape" during construction, allowing threads to see a partially constructed object.

Immutable objects can be published through any mechanism.

###### Effectively Immutable 
An object is effectively immutable if it is guaranteed by the program that it does not change after creation. It does not need to obey all the conditions for an immutable object. The object does however need to be safely published.

###### Mutable objects
An object is mutable if its state can change after creation. Mutable objects need to be safely published but also thread safe/guarded by a lock.

The JMM ensures that any variables accessed in a synchronised method is visible to all threads. This is ensured by additional hardware. The mips `SYNC` instruction syncs variables across all threads.

#### Volatile
A reference with the `volatile` keyword guarantees memory visibility for that reference. Threads are not blocked when accessing it meaning that multiple threads can still access it at the same time. A volailte reference is visible but not mutually accessible. Synchronisation ensures mutually exclusive access as well as variable visibility, so volatile is not as used.

