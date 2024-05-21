---
id: Lecture_4_Remote_Procedure_Calls
created_date: 17/10/2023
updated_date: 17/10/2023
type: note
links:
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Remote Procedure Calls

Remote Procedure Calls (RPC) gives a sense of transparency - the code written for use on multiple computers looks the same as running the code on a single computer - the programmer should not have to think about the network. RPCs were designed to look exactly like regular procedure calls

RPCs are implemented through the use of a library that provides an API. From the server's perspective, the API is used to process requests (The actual implementation of the server responding to the request is defined locally). From the client's perspective, an API call will actually create a network packet and send it to the client (which will unpack the network packet, process the request and send a response).

#### Interface Description Language

The arguments passed to and from need to be machine independent (different machines may use different integer sizes or endianness). This is achieved through an Interface Description Language (IDL) which provides a way of interpreting the correct meaning of the arguments sent across a network.

Specifically, compiling the IDL produces:
* The types in the native language.
* Marshalling: converting and reverting machine neutral byte streams for network transmission.
* Stub routines: For passing requests from client to server.

#### Sun RPC and XDR (External Data Representation)

Sun microsystems has their own RPC. Defining procedure calls between the client and the server is done using an XDR file `foo.x`. Compiling this file with:

```
rpcgen foo.x
```

Produces c implementations of the XDR file:
* The `foo.h`
* The `foo_clnt.c` contains the stub procedures the client will use to make RPC requests to the server.
* The `foo_svc.c` contains the stub code to determine (dispatch) the request that was received and call the relevant procedure and send a response.
* The `proto_xdr.c` file handles marshalling and unmarshalling routines and byte

XDR procedures can only take in a single argument (which can be a struct).

```xdr
// struct declarations

program API_NAME_PROG {
	version VERSION_NAME {
		returnType NAME_OF_PROCEDURE (arguments) = PROCEDURE_ID
	} = VERSION_ID; 
} = PROGAM_ID;
```

You can have multiple versions for a single procedure in the API. When a new version is added the old should be kept for older clients. The unique procedure ID must be unique to all other procedures in the version.

---

###### Aside for Coursework 1

The return type of server routine values must be pointers or static so it is not de-allocated. Additionally arguments to server side procedure are pointers to temporary storage - they are only allocated during the procedures runtime. 

---

#### NFS and Transparency RPC

Client side NFS code acts as stubs for system calls which then invoke RPC calls. These stubs are syntactically transparent (the same) when compared to system calls. 

On server side file system code there are some changes. NFS makes use of kernel threads for requests that are making lengthy disk operations. File handles are sent over wire rather than file descriptors, generation numbers are added to on disk inodes. The `userid` is sent along with the arguments to the RPC request so the kernel knows the ID of the owner (usually the owner of the process would be used but since this request comes from a different machine we can't use that here).

NFS does not, however, provide semantic transparency. This is to say the same system call made on a local system and NFS system is not guaranteed to always provide the same behaviour. This means when migrating code from a local system to NFS, we need to change the code to handle these different behaviours.

An example is `open()`, locally this only fails if the specified file does not exist, but on an NFS system this could fail if the server is down. This is true for all file system calls.

Generally, preserving semantics in a distributed system is either EXTREMELY difficult or produces poor performance.

###### Multi-Module Distributed System

NFS is very simple, we have only one server and a single data type ([[Lecture_3_Network_File_System#File Handles|file handles]]). **Multi-Module Distributed Systems** contain multiple servers which all interact with each other.


# Questions / Thoughts