---
id: Lecture_7_Paxos
created_date: 31/10/2023
updated_date: 31/10/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Paxos

In previously discussed systems, there were nodes with an authoritative copy of data, meaning there's a single point of failure in the system. If data is replicated across multiple servers we may still be able to make progress given some set of servers fail.

2 Phase commit works well if nodes have to do different things but it isn't perfect:
* All nodes and TC have to be up
* Must know if each node (A/B) voted yes.
* TC must be up to decide on what is to be done (commit or abort)
* If a fault occurs, we must wait for the node to come back up.

Replication can be done by treating each server as a state machine, where the Disk, RAM and CPU registers are state. User requests causes state transitions. We could replicate this state across multiple servers. If the servers are given the same instructions in the same order (given said instructions are deterministic) each replicated server will end in the same state.

One way of implementing this is by having a primary server which receives all requests. The primary server determines the order of the operations and sends it to all replica servers and they all compute the instructions. However there is still a single point of failure (primary server).

---
##### Primary Failure

The last instruction received by a primary may not be completed before it fails. Once this happens a new primary server needs to be elected. Only one primary should be selected - there cannot be two, since the ordering of operations each primary can compute may be different.

We can say that the lowest numbered (numbered by id) live server is the primary. This could be done by all live nodes pinging everyone and setting their primary to be the lowest numbered id server that responds. This can fail and result in two primaries if pings are lost/delayed or if the server that failed causes a partition in the network.

---

The idea behind the Paxos algorithm is to have a majority of nodes agree on a primary. A majority means more than half, so there can only be at most one majority. If pings are lost, resulting in two primaries, the majorities must overlap (huh?). Nodes in the overlap can see both potential primaries and raise an alarm about non agreement.

There could be zero partitions that contain a majority, in which case we never agree on a primary.

All nodes have an exhaustive list of all nodes in the network and will therefore be able to tell if they are in a minority.

---

##### View Change Algorithm

A system goes through a series of views. A view contains a number representing the view number and the set of all live nodes. Whenever a node crashes, the view change algorithm needs to make sure that all live nodes agrees on the new view. If every node has the same view then every node can agree on the next primary (again by the lowest numbered ID).

Again there is no promise that this algorithm will succeed but it will never provide incorrect values, making it safe - at most one view will be chosen. This should be the case in a network where crashes and delayed messages are present, it is a fault tolerant agreement protocol - **Paxos**.

Paxos does not generate values, it takes in values from the application and agrees on one value.

---

#### How Paxos Works

As an overview:
* One (or more) nodes decide to be leader
* The leader chooses a proposed value to agree on (in our case, a view)
* The leader contacts other Paxos participants and tries to assemble a majority.
	* Participants can be all nodes in a pre configured set of nodes or all nodes in an old view.
* If a majority responds, then the proposed value is accepted.

Paxos consists of three phases and may need to restart if nodes fail or timeouts occur. Each node running Paxos (per view) has the following state:
* $n_a$: Greatest $n$ accepted by the node, initially -1
* $v_a$ value received together with $n_a$
* $n_h$ greatest $n$ seen in Q1(n) message initially -1
* done: leader says agreement has reached and the new value can be used, initially fault.

###### Phase 1

```
If a node decides to be a leader:
	Pick proposal number n
	Send a Q1(n) message to all nodes (including self)
if node receives Q1(n) and n > n_h
	n_h = n
	send reply R1(n_a, v_a) message
```

The proposal number should be as unique and as high as possible, higher than any other possible proposal number. Use the last known proposal number + 1 and append the nodes own ID.

###### Phase 2

```
if the leader recieves an R1 from a majority of nodes (including itself)
	if any R1(n, v) contained a value (v)
		set our v to be the value (v) sent with the highest n 
	else the leader chooses a value (v)
		v = {old view# + 1, set of pingable nodes}
	send a Q2(n (same as before), v) message to all responders
if node receives Q2(n, v) and n >= n_h
	n_h = n_a = n
	v_a = v
	send a R2() reply message
```

###### Phase 3
```
if leader receives R2() messages from majority of participants
	send Q3() message to all participants
if node recieves a Q3():
	set done = True
	value v_a is agreed upon to use
```

All nodes waiting for a message has a maximum timeout for messages they expect. If the timeout is reached, the node declares itself a leader and initiates a new phase 1 of the algorithm. Every node must be willing to become a leader for liveness sake. This could be chosen by all nodes waiting for a random period of time after noticing the number of ping-able nodes has changed, or by waiting for time = unique id * constant.

If a newly appointed leader's proposal number is too low, eventually a new leader will be appointed that knew the old leaders proposal number and will make a new highest proposal number. All nodes need to store it's state in a persistent manner in case it fails and restarts.





# Questions / Thoughts