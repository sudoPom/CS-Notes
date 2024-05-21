---
id: Lecture_18_OKWS
created_date: 12/12/2023
updated_date: 12/12/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# OKWS

A subsystem should only have the minimal access to system data and resources to do its job, so if the subsystem is exploited the attacker cannot do very much. Additionally the interfaces between subsystems should be as narrow as possible, again only enough to do the expected task. This is known as the [[Security-Principles#Least privilege|principle of least privlage]]. 

This cannot be enforced within the subsystem but must be enforced by something above the subsystem, for example the operating system.

The process of separating a system into subsystems with the minimal access to resources and permissions is known as **compartmentalisation** and **privilege separation** respectively.

OKWS is a web server that runs on UNIX. Before OKWS, Apache was primarily used which ran under the same user for all clients - it was **monolithic**. If Apache was exploited then all data associated with the web-server would be accessible. OKWS avoids this by splitting the server into multiple processes which have their own responsibilities. Each process has the minimal privileges to perform their tasks.

### Tools for Principle of Least Privilege

The `chroot` system call (change root) limits the callings process so that it cannot access directories above the specified path. For example:
```
chroot("/usr/local/alone")
cd / 
```

Will have the process be at `/usr/local/alone`.

If the process then becomes unprivileged it then has no way of exiting this directory. Before doing this, all the system files needed by the process (included shared libraries) needs to be put into the directory before this happens.

---

The first process when a server started is initially privileged. Children processes should be unprivileged however some children may want to keep access to files outside the `chroot`ed directory the child belongs to. Any file descriptors opened by the parent will still be accessible to the child of the parent. This is known as **file descriptor passing**. Additionally processes can send file descriptors between processors. This can also be used to give file descriptors of an accepted privileged port (accepted by the parent) to the child process, so they can still receive data.


### OKWS System Design

OKWS is a framework to run multiple front facing services.

#TODO Include image

The `okld` process is the launcher process that starts of all other processes. The children include:
* `okd` parses user input and holds no sensitive data. This is never read from by `okld`.
* `oklogd` logs information
* `svc_i` front facing services

`okd` makes requests to and receives requests from services through RPC requests. Even if `okd` receives malicious input and is exploited, it cannot communicate outside of using RPCs which can be validated on the service side. Similarly logging is done by sending RPCs to the `oklogd` process. Each service is `chroot`ed so it has access to the file system that it needs, nothing more nothing less.

#TODO Database part

It is okay for `okld` to run as root since it receives no (potentially harmful) input, that is received by process `okd`. OKWS has a process running per service. That means if a multiple users are using the same service their data is in the same address space. A stricter model may have a process per user, with each process implementing all services on each service. While this provides more isolation it is unfeasible to have a process per user. As a result, under OKWS, if a service is exploited, other users using that service may have data taken but no other services will be accessible due to the exploit.

---

Although it may be more difficult, you should `chroot` and pass in needed file descriptors.  
# Questions / Thoughts