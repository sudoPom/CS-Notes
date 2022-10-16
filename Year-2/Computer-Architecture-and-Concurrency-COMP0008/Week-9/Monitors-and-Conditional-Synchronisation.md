# Monitors and Conditional Synchronisation
Most programs have complex execution paths, which is hard to keep track of at a low level. The `Monitor` design pattern "encapsulates the internal state representing an object and provides a set of operations that are the only ways to alter/get information about the internal state".

This means that only one thread can access the state at one time. Monitors also support conditional synchronisation, by allowing methods to run only when the internal state of the object is appropriate. These methods are `guarded actions`.

A concurrent system can be modelled in terms of:

* `Active entities` - which act on other objects. Java threads can be used to model the active entities. 
* `Passive entities` - which are acted upon by other objects. Monitors can be used to model passive entities.

#### Monitor (Passive entities)
A monitor object contains all the states that need to be modelled as well as all methods which care used to alter the states. The states should only be accessible/modifiable through these methods. This prevents simultaneous access to a value as well as ensures all state values are visible to all threads.

```java
class MyMonitor{

	private int state = 100;
	private int state2 = 200;

	public synchronized void updateState(int n){
		state = n;
	}
	public synchronized void updateState2(int n){
		state2 = n;
	}
	
	public synchronized int getState(){
		return state;
	}
	public synchronized int getState2(){
		return state2;
	}

}

```

All state variables should be private for the same reason - so there are no illegal accesses to a state by an active entity (thread).

#### Threads (Active entities)
Threads act on the monitor by calling it's methods.

```java
class myThread extends Thread{
	public myThread(MyMonitor m){
		this.m = m
	}
	public void decrement(){
		int state = m.getState();
		state --;
		m.updateState(state);
	}
}
```

When a thread calls `.wait()` on itself, the lock it is holding is released, allowing other threads to access the object. Once the thread is awakened with `.notify()` it needs to wait until the thread obtains the lock again until it continues operatiom.

##### Guarded Actions
Guarded actions ensure that changes made to a state conforms to a certain set of standards, through the use of the `.wait()` statement within a while loop with a set condition.

```java
class MyMonitor{

	private int state = 100;
	private int state2 = 200;

	public synchronized void updateState(int n){
		while(state == 0){
			wait();
		}
		state = n;
		notifyAll();
	}
}
```

`.notify()` could wake up the wrong thread as it just chooses one thread to wake up.