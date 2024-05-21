---
id: Lecture_8_Bayou
created_date: 02/11/2023
updated_date: 02/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Bayou

The idea behind Bayou is to allow (some form of) consistency in a distributed network which has poor connectivity. 

This note covers the use of Bayou for a calendar booking system. Users will want to use the system to book rooms. Each user's device acts as a server and client. We want every user to see the same set of calendar entries (eventually) so that rooms are not double booked, show up to the wrong room, etc.

---
###### Central Server Model

Traditionally we have a single server handling requests. The order can be picked however the server wants (typically in order of request arrival).

If a server wants to check for conflicts in our example it can check the current set of bookings. If there is a conflict the server can easily return an error. The user can then decide what to do.

If the client wants a local copy of the calendar then there is suddenly no single source of truth for the calendar. A client may want this because connectivity is not always cheap or available for short bursts.

A solution to sync calendars between two clients near each other, perhaps by bluetooth, has each client sends their entire database. There are issues to do with network bandwidth (calendars could be massive) and there is also the problem of how to deal with conflicts. Bayou attempts to decide how to automatically resolve these conflicts.

---

#### Automatic Conflict Resolution

Items stored cannot just be viewed as bits. Just because a file was changed by two different users it doesn't necessarily mean that there is a conflict. The semantics (meaning) needs to be extracted to be able to resolve conflicts.

Additionally, two different nodes will need to resolve the same conflicts in the same way so data is consistent between replicas.

The general plan is:
* Each server keeps a list of updates.
* Every node should hold the same updates
* Every node should apply updates in the exact same order.
* Updates should be deterministic.

The ordered list of writes is called a **write log**. When making a request for a log there should be alternative options in case the desired write causes a conflict. For example "1-hour meeting, room 6.12 at 9, else 10, else 11". Each write should also have some unique ID for example: (local-time-stamp, originating-node-ID).

The write request is essentially a request for the calendar system.

When a node learns of a new log, it merges it into it's write log. This means that the calendar view for the user may change after a request is made (due to a conflict happening from a write is received from another node). Initially each entry is "tentative" meaning that it may change. Eventually the entry will become "stable" or "commited". All entries will eventually become commited, provided no new entries are added for a while and every node has seen all writes.

Generally it is good to assume that there is no global time synchronisation. Nodes could have different clocks. **Bayou** does not guarantee that the first write made in real time will happen first in the system.  Ordering by ID arbitrarily constrains order as you may receive some entry from the past at any point in the future. This entry could cause a conflict - so all entries will be tentative forever.

If a log entry, X, is commited, all nodes must agree on:
* The total order of all previous commited entries.
* X is the next entry in the total order
* All uncommitted entries are after X,

For total ordering in Bayou, there is a primary replica which prepends a permanent CSN (commit sequence number) to all entry timestamps. When an entry has a CSN the entry is commited. The CSN defines the total ordering of commited writes. All nodes eventually agree on the total order of the commited writes.

A commited write is not stable until the node has seen all the commited writes in order, however Bayou always propagates writes in order. A slow node will not prevent commits from other nodes as CSNs are only created (and commited) by the primary replica.

Two nodes can disagree with uncommitted writes but this disagreement will be solved by the CSN given to each write. 

Once a commited entry has been received, it does not need to be kept in the write log. These entries can be freely displayed in the calendar.

The primary cannot just arbitrarily order entries. The order of writes made at an individual node must stay the same.

Nodes use Lamport logical clocks for timestamps. 
# Questions / Thoughts