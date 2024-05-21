---
id: Lecture_3_Network_File_System
created_date: 12/10/2023
updated_date: 12/10/2023
type: note
links:
  - "[[Lecture_4_Remote_Procedure_Calls]]"
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Network File System (NFS)

NFS is an early distributed system that allows multiple clients to access files in a central server.

NFS has the benefits of allowing clients to share data while using their own, separate machines. Additionally, backing up is simplified as only one workstation needs to be backed up. 

Disks used to be expensive, so only having to buy disks for one server helped reduced costs. The same can be said for displays, as you could potentially work on multiple servers with a smaller amount of displays.

NFS was designed to:
* Work with already existing applications and with the same semantics as the unix filesystem. 
* Be easy to deploy to existing unix systems
* Compatible with other OSes (not just unix)
* Efficient enough ~ about 80% the speed of disk filesystems.

Each client in an NFS is connected to the server via Ethernet in a LAN. Clients will make requests for files on a server through the use of a [[Lecture_4_Remote_Procedure_Calls|remote procedure call (RPC)]]. 

When making a call to access a file `open("f", 0)` for example the following happens:
* The RPC `LOOKUP(dirfh, "f")` is made to the server. This searches the filesystem for the file `"f"` using the file handle `dirfh`.
* If the file is found on the server, a new file handle is created for the file "f" and sends it back to the client. 

The server is stateless in the sense that it does not keep track of which file is open by which user or where a user has read up to in a file. This gives the benefit of not having to do the complicated work of restoring state if the server goes down.

### File Handles

File handles are a 32 byte data structure that acts as a pointer to an **object** (file or directory) on a remote server. Clients cannot access the bytes of the file handle and interpret them. All RPCs are given a file handle so the server is aware of the target object.

File Handles contain:
* Filesystem  ID: The partition on disk of where the filesystem holding the target file is located.
* i(node) number: The location of the metadata of the target object in the partition of the disk.
* Generation number

###### Generation Number

The reason for the generation number is to keep some unix behaviour where if two processes have a file open and process 1 deletes the file and creates a new one, process 2 will still have access to the old file (until it closes it).

Without a generation number in this scenario, process 2 will lose access to the old file and will then be accessing the new file. This is because when the old file is deleted, the inode for the old file is freed and when the new file is created, it could use this inode (the deleted files inode) in its file handle. So now the inode being used by process 2 now points to the new file.

To fix this, every time the server frees an inode the generation number is incremented. This means that when process 2 makes requests for this file handle they will get an error (as the inode is not being used for the old file anymore). This is not the same as the unix semantics but it's a simpler fix. Generation numbers are specific to each inode. 

---

inodes are used rather than path names so RPCs are based on the object, not the pathname, which preserves semantics of some renaming shenanigans. Unix uses file descriptiors for referring to files which do not change even when a file is renamed. ^9a4bd3

In NFS, clients store file handles in a vnode (virtual inode). vnodes act as a wrapper for objects in a filesystem (remote or local).

The `MOUNT` RPC is used to obtain the file handle of the root directory which can then be used to access all other files in the filesystem. 

Within the kernel, there is a vnode interface which defines all file system operations in terms of vnodes (which can either refer to local or remote files). System calls refer to file names which brings up [[Lecture_3_Network_File_System#^9a4bd3|these]] problems if we were to send entire system calls to the server.

For `write()` system calls in NFS v3, the server replies asynchronously saying it will eventually write to disk. The `COMMIT` command ensures that everything that has been written to the file by the client is on disk and will not return until it has been written.

##### Caching

For performance reasons the server caches disk blocks and the client caches:
* File content blocks (some clean some dirty)
* File attributes
* Name to file handle mappings
* Directory contents

However if two clients cache changes made to the same file, the cached values will not be consistent with each other.

To fix this, most applications can make use of **close to open consistency** which works as follows:

---

If Client A writes to a file then closes it and client B opens the file and then reads it, B is guaranteed to see what A had previously read. This means that the server only needs to be contacted on every `open()/close()` call which typically will not cause too bad of a latency overhead.

---

This only really works if client A and B can communicate with each other in some way.

In any other situation (like client B opening the file before client A closing it) there is no guarantee of consistency.

FreeBSD Implements close to open consistency as follows:
* The client stores the file `mtime` (time of last modification) and size for each cached file.
* `close()` begins to write all dirty (edited) blocks of the file to the server.
* `close()` does not return until all blocks are written.
* `open()` always sends a GETATTR check to get the `mtime` and size of the file from the server's perspective and caches the contents.
* When a `read()` occurs we only read from the buffer cache if the cached `mtime` and size have not changed.
* Similarly with directories we check the cached value with the result of the GETATTR call

Name to file handle cache is not always checked for consistency on each LOOKUP call. Because of this, if the file is renamed or deleted, weird corner cases can occur.

### Limitations

NFS has no way for authenticating server replies (except for MOUNT which has a weak IP based authentication - IP addresses can easily be [[Threat-Modelling#^db35a5|spoofed]].)

NFS faces scalability problems as writes will always go through to the server (eventually) meaning that if a lot of clients flood the server with writes, it will slow down. Additionally private files defeat the purpose of a shared file system.

Network latency, packet loss and bottlenecks become additional problems for larger complex networks.

That being said NFS is compatible with many other OSes and performs well enough for it to still be widely used.

# Questions / Thoughts