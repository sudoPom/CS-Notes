---
id: Shells
created_date: 09/03/2023
updated_date: 09/03/2023
type: note
links: 
---
[[Processes-and-Exceptional-Control-Flow]]
* **🏷️Tags** : #Computer-Systems-COMP0019 
# Shells

A `shell` is an application that takes commands from the user typed from the command line. There are several shells such as `sh,csh` and `bash`.

There are some **built in** commands in shells which do not execute a file but is a functionality that is hardcoded into the shell. 

When a command is ran in the shell, we create a child process and run the command in the shell using [[Processes-and-Exceptional-Control-Flow#Process Creation|execve]]. This is because after the command is finished is that after the command is finished we still want to use the shell. 

## Pipe

**Unix tools philosophy**: Simple modular tools that can be plumbed together to do complex, varied tasks, without custom C programming. The standard data format is human readable text.

Some of these simple tools include:
| Command | Description                        |
| ------- | ---------------------------------- |
| ls      | List directory contents            |
| wc      | Word count                         |
| grep    | Search for matching lines in input |
| more    | Show input one screen at a time    |
| cat     | Print the contents of a file       |
| sort    | Sort input lexicographically       |

**Pipes** allow the shells user to combine these tools together to do more complex tasks.

###### Piping Implementation

* All commands conform to simple standard I/O interface (stdin, stdout and sterr). 
* Shell can open a new I/O channel between a process and itself with `pipe()` one `fd` is for "read end", and one for "write end".
* Shell uses `fork()` to start a process that will later invoke commands; initially these process copies of shell itself. (fork copies file descriptors)
* Shell reconfigures standatd I/O `fd`s (0, 1, 2) among processes with `dup2()` to plumb commands together
* Finally the command is ran with `execve`

The shell implementation handles the plumbing process.


```
int pipe(int fd[2])
```

The `pipe` function takes in two file descriptors and establishes two new file descriptors. All bytes written in `fd[1]` are readable in `fd[0]`

The `dup2` function returns a new non negative file descriptor.

```
int dup2(int fd1, int fd2)
```

`dup2` makes the file previously referred to by `fd1` accessible to `fd2`. 
* If `fd1` and `fd2` are equal, they are already accessing the same file and nothing needs to be changed, so `fd2` is returned.
* If `fd2` points to an open file then the file is closed and the file descriptor points to whatever `fd1` is.

If the reader dies but the writer does not the writer will be killed. This is *not* the case in reverse.


# Questions / Thoughts