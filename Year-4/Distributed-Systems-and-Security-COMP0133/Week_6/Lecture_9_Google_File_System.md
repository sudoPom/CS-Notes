---
id: Lecture_9_Google_File_System
created_date: 14/11/2023
updated_date: 14/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Google File System

Google makes use of distributed nodes to handle computing. It is very likely that nodes fail due to a variety of problems, so their distributed system needs to be able to detect and handle node failure automatically.

The files google handles are typically pretty big, larger than 100MB and each reading operation will be pretty big as well, at least 1MB. Reads will also typically be sequential and reading of one section will only be done once. Writes are also sequential and mostly appends - very little modifying of already written blocks. This means that caching will not be really helpful. The system will also need to handle concurrent writes so the writes should be atomic without synchronisation (locking) overhead.

---
#### GFS Architecture

There is one master server, with its state replicated on backups, and 100s-1000s of chunk servers. Chunk servers are spread across racks, with connections between servers on the same rack being larger than inter-rack connection. The unit of data in GFS are **chunks** which are a 64MB chunk of a file, which can be accessible through a GUID.

The master server holds the namespace, which contains file metadata.

The application has GFS client which communicates with the GFS master and chunk server to obtain data. Each chunk server has a standard Linux file system storing the actual chunks. When requesting for data the client contacts the master with control messages to obtain the information of which chunk server contains the target chunk. The data does not go through the master, only between the client and the target chunk server.

---

The metadata stored on the master server includes:
* Namespace (directory hierarchy)
* Access control information
* Mapping from files to chunks
* Location of chunks (which chunk server holds which chunks)

###### Master Server

The master server is also responsible for "leasing" chunks to chunk servers. A chunk server that has a lease on a chunk is temporarily in charge of ordering the operations made on the chunk. Chunks that are not referenced in the namespace are garbage collected by the master server. If a chunk is present on too few chunk servers the master server may also migrate that chunk to an additional chunk server. All metadata is stored on RAM (metadata is small) for fast access.

###### Chunk Server

The chunk server holds 64 MB file chunks on local disk with a version and checksum. They handle read/write requests by accepting requests with a chunk handle and byte range. Chunks are replicated on a configurable number of chunk servers, which is 3 by default. File data is not cached beyond the Linux buffer cache.

###### Client

The client sends control requests to access metadata, which is cached, and uses the metadata to make requests directly to the target chunk server. Data is not cached on the client. Cached metadata is only valid for a certain amount of time before it needs to be updated (which is known to the client).

The GFS library provides the following operations:
* Open
* Delete
* Read
* Write
* Snapshot: create a copy of a file. This is done by notifying the master to notify which chunks need to be kept. Any mutations made to these chunks should be made to a copy of these chunks. A copy of a chunk is not made until it is mutated. 
* Append: Appends to the file, at least once, possibly with gaps between duplicate appends being possible. GFS guarantees somewhere in the file will contain the contiguous data.

###### Client Write

For a given chunk, a chunk server is the primary. Leases are renewed using heartbeat messages between the master and chunk servers. The client will ask for the primary and secondaries of all chunk servers that hold the chunk. The client will then send data to all replicas. Data is sent in a **Daisy chain** meaning that each replica sends the data to the next replica. This is pipelined - all data does not to be received for it to be forwarded to the next replica.

Upon receiving the data, chunk servers will send an ACK message to the client. The client will then send a write request to the primary which assigns a serial number to write requests - dictating the order operations should occur in. This serial number is forwarded to all secondaries. All secondaries reply to the primary after completing the write and lastly the primary sends a success (or failure) back to the client.

###### Client Record Append

Google uses files as queues between multiple producers and consumers. For record append the exact same thing is done as with writes but the client pushes data to the replicas of the last chunk of the file.

The data typically fits into the last chunk. In this case the primary just appends the data to their replica and tells the secondaries to do the same at the same byte offset.

If the data does not fit into the last chunk, the primary adds padding into the last chunk and gets the secondary to do the same thing. The client is then asked to make the request again on the next chunk. The append can fail (due to multiple clients making requests on the same chunk at the same time), in which case the client just needs to retry the request. The operation succeeds if all replicas append data at the same byte offset. This means that there could be duplicates/garbage data before the appended data.

###### File Deletion

When a client deletes a file the master renames the file to a hidden name, including the timestamp. In the background the file is deleted after 3 days (configurable) after the timestamp in the hidden file name. This allows users to undo deletions if needed and allows the load of deletion to be postponed. Unreferenced chunks are deleted in the background.

#### Consistency Model

Changes to the namespace (metadata) is only handled by the master and is therefore always atomic. The master uses a log to define the total ordering of namespace change operations.

File regions are **consistent** in GFS If all replicas of that region contains the same data. A file region is **defined** if it is consistent and all clients see the entire mutation.

Concurrent write successes are consistent but not defined as writes are done with no locking so some bytes may be overwritten by another mutation. Concurrent append successes will guarantee that the data is defined but the region of failed append attempts could be inconsistent.

Applications should use check sums in records written with record append, so that readers can identify padding/record fragments.

##### Leasing

When a write request is made, if there is no primary for the chunk the master grants a lease to a chunk server. Each time a master grants a new lease it increments the version and informs all replicas. The master can also revoke leases.

##### Failure

When a master fails and reboots it recovers its namespace and file to chunk id mapping using it's log. It also asks all chunk servers for the chunks it holds. If any chunks have a lower version number, it contains stale data. If a chunk has a higher version number then the master updates its version number for that chunk.

If a chunk server fails the master will notice the missing heartbeat message. (Theres more to this).

---

GFS is not really good on all applications as it works well given the very specific constraints that Googles applications operate under. 





# Questions / Thoughts