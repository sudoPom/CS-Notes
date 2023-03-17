---
id: I_O
created_date: 16/03/2023
updated_date: 16/03/2023
type: note
links: 
---
[[Shells]]
* **🏷️Tags** : #Computer-Systems-COMP0019 
# I_O

There are two sets of I/O sets, system level and C level I/O. The C library implements its functions (`fopen, fread`) using the system level functions. These I/O operations operate on files, which are just a sequence of bytes.

| System Function | Description              |
| --------------- | ------------------------ |
| open()          | Opens a file             |
| close()         | Closes a file            |
| seek()          | Move to offset in file   |
| lseek()         | Move to position in file |
| write()         | Write to a file          |


There are three file types:
* Regular file
* Directory
* Socket (Communicating across networks)

#### Regular File

A regular file contains arbitrary data. There are text files, holding readable characters and there are binary files. The kernel does not know the difference between these.

Text files are a sequence of *text lines*, which are terminated by `\n`. However in windows and internet protocols terminate newlines with `\r\n`.

#### Dicrectories

A directory contains an array of links, with each link pointing to a file. Every directory has links `.` and `..` being links to the current and parent directory.


### Short Counts

A short count occurs when less bytes are written/read than what is requested. This can happen for a number of reasons:
* Encountering EOF character on reads
* Reading text lines from terminal
* Reading and writing network sockets (due to the buffer potentially being full)

Short counts never happen when reading from disk files (unless an EOF is found) or when writing to disk files, unless the disk runs out of memory.

## File Metadata

*File metadata* is data about files. File metadata is maintained by the kernel and can be accessed by users with the `stat` and `fstat` functions. Some metadata includes:
* The device the file is on
* The times of last access, modification and time
* Total size
* Owner user id
* etc

### File Descriptors

File Descriptors are held in the *descriptor table* in the kernel. An entry in the file descriptor table points to an `open file table` which points to the `vnode table entry` which holds the `stat` metadata of the file. The open file table also stores the file position, reference count and other things.

Opening the same file twice will allow you to access the same file with different file descriptors which allows two different positions of the file to be accessed at the same time.

When a child is created using `fork` the child has the exact same file descriptors, with each file having the exact same files being open, as its parent.

# Questions / Thoughts