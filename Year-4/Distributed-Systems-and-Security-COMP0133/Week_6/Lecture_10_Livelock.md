---
id: Lecture_10_Livelock
created_date: 16/11/2023
updated_date: 16/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Livelock

Servers have limited CPU capacity, network link, capacity, memory, etc. Demand for these resources can reach/exceed the server's capacity and ideally the server should still be able to operate in these cases.

An example of this is the use of a computer as a packet forwarder. Said computer has two 10 Mbps Ethernet interfaces (for input and output). When the computer receives a packet, it is passed through a firewall and output. A second computer sends packets at a slowly increasing rate. Initially the output packet rate is equal to the input packet rate. However after a certain point the output rate decreases, eventually down to zero.

![[Pasted image 20231116155459.png]]

When an event happens at an I/O device the I/O device needs to notify the CPU of said event, for example the arrival of a packet. The CPU can find out of the event in two ways. **Polling** is when the CPU "asks" the hardware device if an event has occurred synchronously (pausing what it was currently doing). The second is the hardware device triggering an **interrupt** notifying the CPU.

**Event latency** is the amount of time between the event occurring and the CPU being notified of it. 

##### Polling

Polling is relatively slow as it uses programmed/memory mapped (mapping virtual memory to the hardware's address) I/O. To guarantee a low event latency the CPU should poll frequently, however polling has a high CPU overhead as a lot of the polling operations could be unnecessary if no events have occurred.

##### Interrupts

I/O devices can send interrupts to the CPU over dedicated wires. Each interrupt has an IPL (interrupt priority level). If the IPL of the interrupt is higher than the CPU priority level, the CPU context switches to it:
* CPU state is saved
* Control flow jumps to the ISR (interrupt service routine) in the kernel
* Invokes the device driver, asking for device events
* Returns to previously running program
The CPU priority level is kernel set state which specifies which interrupts are paid attention to. Interrupt latency is about 3 micro seconds.

Interrupts are useful for rare events as there is a lower latency than polling infrequently and has no overhead when there are no events. Interrupts occur asynchronously.

Disk I/O requests come from the OS and are therefore rate controlled - if there are too many requests, the OS can just send less. However network packets can be received at any time, and since interrupts take priority over other system processing, all the time is spent servicing interrupts. This is called **received livelock**.

---
###### Goals for a Network I/O System
* Low Latency for responding to I/O devices.
* Low Jitter (variance in latency)
* Fairness all tasks get an equal amount of access to CPU resources
* High Throughput for I/O

These goals often contend each other.

A network server needs to send/receive packets, process protocols (done in the kernel), other I/O processing (maybe disk operations) and application code that needs to run.

---

Originally network processing worked as follows:
* A packet arrived
* An interrupt is generated with a high IPL (Network cards had a small amount of RAM that acts as a buffer so packets needed to be processed as quickly as possible to prevent dropped packets).
* ISR adds the packet to a queue for further processing and returns. (Quickly removing the packet from the small buffer)
* Low IPL software interrupt dequeues the packets from the queue and performs network (IP, UDP, TCP) processing. After the packet is enqueued for whatever destination process it was intended for (another application, further transmission)
* Process reads data with the `read()` syscall

The queues are used to denote scheduling and priority level boundaries.

When a queue is filled up the routine trying to enqueue the packet will instead just drop it. For applications that are sending packets, if the socket buffer is full the kernel can just send the process to sleep.

If there is a high enough packet receive rate, the ISR's input queue is filled up and any received packets are dropped. Since ISR's operate under a high IPL, no other processing will be done as long as more packets are received - livelock.

For a burst of packets, the first packet (or any packets) are not read by the application/transmission until the entire burst of packets are processed.

###### Minimising Receive Interrupts

The receive ISR sets a flag indicating the network has received one (or more) packets. A kernel thread is scheduled to start polling network interfaces for received packets. Packet received interrupts are not re enabled.

###### Kernel Polling Thread

When the kernel thread is scheduled it checks all network interfaces that have set the packet received flag. For each interface, process each packet all the way, ending with the interface output queue or socket buffer to application. Each interface has a maximum quota of packets processed on one kernel thread invocation. Round robin among interfaces and between packet transmission and reception. Only re enable interface's receive interrupts when there are no pending packets at that interface.

When overload occurs, packets are dropped immediately with no extra cost to the CPU load.

This significantly improves performance under high loads.:

![[Pasted image 20231116164439.png]]

Without quotas, the packets were not being transmitted since all the focus went to packet reception.

###### Disabling Receive Interrupts on Full Queue

When the application queue is filled up, no more receive interrupts are allowed, so the application can start receiving data from the queue.

![[Pasted image 20231116164737.png]]
# Questions / Thoughts