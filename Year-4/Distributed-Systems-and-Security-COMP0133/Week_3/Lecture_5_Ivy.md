---
id: Lecture_5_Ivy
created_date: 20/10/2023
updated_date: 20/10/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Ivy (Distributed Shared Memory)

The goal of **Ivy** is to hide the communications with other nodes by creating the illusion that memory is shared between all nodes. Using Ivy, this could be done with multiple cheap PCs and LAN to connect them whereas a supercomputer with the same number of CPUs would be extremely expensive.

Although the memory of the nodes are separate, the goal is for any node to be able to access data even if said data is not stored locally, essentially pooling together all the memory from each of the nodes. Obtaining memory from other nodes is going to be slower than accessing memory stored on disk, so these kinds of requests needs to be limited.

On top of more memory, the program thats being ran on the Distributed Shared Memory System (DSMS) should be faster due to parallelisation. However we need to ensure that the programs ran on a DSMS is correct.

---
###### Correctness

A uni-processor is a machine that has a single CPU. 

For a load instruction to be correct, the value retrieved from memory should be equal to the value passed into the previous store instruction of the same memory address.

Uni-processor CPUs executes code in order (some processors re order lines of code or executes some simultaneously but this is only done if the result won't change). A DSMS needs to be correct with respect to this standard. A **consistency model** is a set of rules that the memory system developers need to follow to ensure the programs ran on the system is correct.

There is no correct consistent model but different models will produce different behaviour, which may be more or less intuitive.

---

Ivy allows memory sharing by sending pages of memory between nodes when requested. If a node requests to read a page it will find the **owner** of the page (the node who most recently wrote to the page) and store it locally. Whenever a node writes to a page it needs to invalidate all read only copies of the page stored on other nodes (because they'll now be inconsistent with the writes).

Ivy makes use of a **Manager** to handle page ownership. A single node will be a manager in a **Centralised Manager** setup.

Each node has a **pagetable** and the manager will also have an info table:

Pagetable:

| lock | access |
| ---- | ------ |
|      |        |
|      |        |

Access is either: read, write or nil (no permissions)

Info:

| lock | copy_set | owner? |
| ---- | ------ | ------ |
|      |        |        |
|      |        |        |

Copy set is the set of all nodes that have a copy of the page.
Owner is true or false and dictates whether you can request to write to the page.

Both tables have a lock which prevents other threads from making requests for a page when one is already being made.

### Reading

The read fault handler does the following:
* Lock corresponding page in the page table.
	* If the work station is the manager, it locks the info table, looks up the page in the info table and makes a request for the page using the owner field of the info table. Then unlocks the info table.
	* If not, the work station requests read access from the manager. When it receives the page, the work station then sends a confirmation.
* The work station then sets the access flag for the page in the page table to read, then unlocks the page table.

The read server works as follows:
* The server workstation locks the corresponding page entry in the page table.
* If the workstation is the owner of the page, then it sets its own permission for the page to read, sends a copy of the page to the client workstation and unlocks the page table entry.
* If the server workstation is the manager of the page then the workstation locks the info table entry of the corresponding page, asks the owner of the page to send a copy of the page to the requesting workstation, waits for confirmation from the requesting workstation and then unlocks the info table entry.

#### Writing

The write fault handler works as follows:
* Lock the corresponding page table entry
	* If the workstation is the manager, then lock the info table, invalidate all workstations with a copy of the page, set the `copy_set` of the page's entry in the page table to empty and unlock the info table.
	* If not, then ask the manager for write access to the page, and send confirmation to the manager when it is received.
* Set the permission for the page to `write` and unlock the page table entry.

The write server works as follows:
* Lock the page table.
* If the server workstation is the owner, then send a copy of the page to the requesting workstation and set the permission of the page to `nil` in the page table.
* Unlock the page table.
* If the server workstation is the manager then, lock the info table, invalidate all workstations with a copy of the page, set the `copy_set` for that page to empty, ask the owner of the page to send a copy of the page to the requesting work station, wait for a confirmation from the requesting node and then unlock the info table.
# Questions / Thoughts