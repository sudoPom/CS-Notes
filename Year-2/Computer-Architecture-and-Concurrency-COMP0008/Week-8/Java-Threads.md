# Java Threads
Java (and most other languages) support concurrent development.

One of the processes ran by the OS will be the `JVM` (Java virtual machine). Within the JVM there can be multiple threads for the application, as well as the JVM thread which could handle things such as garbage collection. There must be a `main` thread that starts the program. The JVM also has a schedular which determines which application thread is executed at any given time.


## The Thread Class

In Java threads can be created as such:

```java
class MyThread extends Thread{
	public void run{
		//Code to run
	}
}

MyThread thread = new MyThread()
```

or alternatively, if the thread needs to inherit from another class, as java does not support multiple inheritance.

```java
class MyRun implements Runnable{
	public void run(){
		//Code to run
	}
}

Thread thread = new Thread(new MyRun());
```

The thread class includes the following methods:

* `start()`
* `run()`
* `stop()`
* `getState()`
* `sleep(long millis)`
* `interrupt()`
* `isInterrupted()`
* `interrupted()`

There are also methods such as `stop`, `resume` but these are not thread safe and shouldn't be used.

##### Get State
Return the following states:
* New - a thread that has not started execution.
* Runnable - a thread executing in the JVM
* Blocked - A thread that is waiting for a lock
* Waiting - A thread that is waiting indefinitely for another thread to perform an action
* Timed_waiting - A threard that is waiting for another thread to perform an action for up to a specified waiting time
* Terminated - A thread that has exited (finished it's execution)

#### Thread Life Cycle
The life cycle of a thread is as follows:
* The thread starts in the NEW state once created.
* Running the `.start()` method on a thread in NEW to RUNNABLE by allocating system resources to the thread. This does not mean it is executing yet as it needs to be scheduled by the operating system. The thread could also be waiting on I/O and therefore can't execute yet.
* If the `run()` method of the state is finished the thread moves to TERMINATED and can no longer be ran.
* If during termination the thread needs an object lock or if the `wait()` or `sleep()` method is called on it then the thread will be placed in the BLOCKED/WAITING/TIMED_WAITING state respectively.
* To exit the BLOCKED/WAITING/TIMED_WAITING state the thread must either obtain the object lock it is waiting for or the `.notify()` or `.notifyAll()` methods must be called or the time of sleep must elapse.