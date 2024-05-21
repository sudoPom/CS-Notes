---
id: Lecture_6_Two_Phase_Commit
created_date: 27/10/2023
updated_date: 27/10/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Two Phase Commit

There are two different kinds of atomicity:
* **Serialisability**: Requests made by a user must appear to be completed in a total order. One operation must be completed before the next is processed. This requires locking. This does not mean that concurrency cannot be used but the result must appear as though one operation was completed after the other.
* **Recoverability**: Each operation is either completed fully or is not completed at all. (We focus on this)

The desirable properties of an atomic commit system include, given two processes, A and B, and a transaction coordinator:
* **Safety**: Correct execution, if someone commits nobody aborts.
* **Liveness**: If there are no failures and A and B can commit then they should. If there are failures, conclude it as soon as possible.

A safe protocol for a transaction that contains action on two separate systems operates as follows:
* The client sends a request to the TC (Transaction Coordinator)
* The TC sends prepare messages to systems A and B
* A and B send a "yes" or "no" response (whether they will or not do their part of the action).
* If either sends a "no", the TC sends "abort" messages to both processes.
* If both sends yes the TC sends a "commit" message and both processes complete their part of the action.
* A acknowledged message is sent from both systems to the TC.
* The TC sends an "OK" back to the client.

This guarantees safety but not liveness.

##### Timeouts

To deal with timeout issues it is possible for the TC to send an abort while waiting for a "yes" or "no", although this sacrifices liveness - if both processes send a "yes" but the messages are lost during transmission the TC will abort despite both processes being able to handle their requests. 

When processes A/B Is waiting for a "commit" or "abort", if the waiting system sent a "no" message then it is safe for the system to abort.

However if the waiting system sent a "yes" it will either have to wait until a response from the TC or communicate with the other system and abort/commit when appropriate, for instance if B is waiting for a commit/abort message from the TC it will communicate with node A:
* If node A doesn't respond, wait for the reply from TC.
* If node A has not decided yes/no yet, both nodes should abort (the TC couldn't have sent a commit).
* If node A has received a commit/abort, node B should do the same.
* If node A sent a yes, no correct decision can be made.

##### Crashes

Once a system says it will commit, it must commit - it cannot back out on it.

The use of persistent state can be used to recover. Before a message is sent, write it to disk first. This way if a crash occurs the decision made can be restored.


# Questions / Thoughts