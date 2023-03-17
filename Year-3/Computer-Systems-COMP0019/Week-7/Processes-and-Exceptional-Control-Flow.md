
---
id: Processes-and-Exceptional-Control-Flow
created_date: 02/03/2023
updated_date: 02/03/2023
type: note
links: 
---
[[Processes-and-Virtual-Memory]]
[[Machine-Level Representation of Programs]]
[[MIPS-and-Jumps]]
* **🏷️Tags** : #Computer-Systems-COMP0019 
# Processes-and-Exceptional-Control-Flow

Processors read a sequence of instructions and processes them. A program that does this in a linear order is sequential. Additional features like [[MIPS-and-Jumps|jump]] instructions can cause changes in the ordering of instructions depending on changes in the program state.

---
## Exceptional Control Flow

For a useful system we need to be able to react to changes in system state. An exception is a change in the control flow in response to a low level system event.

High level mechanisms include:
* Process context switch
* Signals: Something happened to the system that the process should know of.
* Nonlocal jumps

### Exceptions

Exceptions transfer control to the OS kernel in response to an event. These can include:
* Division by 0
* Arithmetic overflow
* Ctrl-C
* Page faults

Once the kernel's execution is finished, depending on the exception the process either:
* Attmepts to run the instruction that called the exception again
* Call the next instruction in the program
* Abort the instruction

##### Exception Table

The kernel holds an exception table which is an array of pointers to blocks of code that responds to the given exception. Each exception has a number which is the index into this exception table.


##### Classes of Exceptions

There are asynchronous and synchronous exceptions:
* Asynchronous Exceptions are cause by events external to the processer (I/O interrupts ctrl-C). The handler will return to the next instruction after handling the exception.
* Synchronous Exceptions occur as a result of executing an instruction.
	* A **trap** is a deliberate way to cause an exception. Traps always return to the next instruction.
	* A fault is an unintentional (but potentially) recoverable exception. After handling the exception the program instruction is either re ran or the program is aborted.
	* An abort exception is unintentional and unrecoverable. The program is always aborted. Examples includes illegal instructions, and machine checks (which ensure the CPU is not faulty). 

## System Calls

A system call is a system-level function that allows a program to request the service of the kernel. System calls have an number associated with them. Some common ones are:

| Number | Name   | Description                          |
| ------ | ------ |:------------------------------------ |
| 0      | read   | Read file                            |
| 1      | write  | Write file                           |
| 2      | open   | Open file                            |
| 3      | close  | Close file                           |
| 4      | stat   | Get info about file                  |
| 9      | mmap   | Map memory page to file              |
| 12     | brk    | Reset the top of the heap            |
| 32     | dup2   | Copy file descriptor                 |
| 33     | pause  | Suspend process until signal arrives |
| 37     | alarm  | Scedule delivery of alarm signal     |
| 39     | getpid | Get process ID                       |
| 57     | fork   | Create Process                       |
| 59     | execve | Execute a program                    |
| 60     | \_exit | Terminate process                    |
| 61     | wait4  | Wait for a process to terminate      |
| 62     | kill   | Send signal to a process             |

The integer represents an offset to jump to in the kernel's system call jump table.

The C function `syscall` can be used to make a system call directly, however there are numerous wrapper functions making this unnecesary.

In assembly the instruction to make a system call is also `syscall`. The system call number is passed into `$rax` and input arguments are passed into the regular [[Machine-Level Representation of Programs#Accessing Data|argument registers]]. The return value of the system call is stored in `$rax` and the system call registers `$rcx, $r11` are destroyed. A negative return value corresponds to an error corresponding to negative `errno`. The `syscall` is executed by the kernel, with it's privileges.

## Process Control

On error, the systemcall will set the global variable `errno` to indicate cause. It is good practice to check the return status of every system call:

```c
if((pid = fork()) < 0){
	fprintf(stderr, "fork error: %s\n", strerror(errno));
	exit(-1);
}
```

An error function can be declared doing the above but you may want to handle different syscalls differently.  

##### Obtaining Process Ids
`getpid` gets the current process id.
`getppid` gets the current process' parent's id.

Processes can be in one of three states:
* Running: Is currently executing or waiting to be executed
* Stopped: stopped temporarily
* Terminated: stopped permanently 

##### Process Termination

Processes become terminated by recieving a signal which causes termination, by returning from main or by calling the `exit(status)` function. `exit` is called once but never returns.
###### Process Creation
A parent process can create a new process using the `fork()` function. `fork()` returns 0 to the child process and the child's `pid` to the parent process. The child process is identical to the parent process but gets its own address space, a different pid and has the same file descriptors (the same files are open for the child). `fork` is called once but returns twice. It is non deterministic which process returns first. 

When creating multiple processes a **process graph** can be used to capture the ordering of statements in a concurrent program:
* Each vertex is the execution of a statement.
* a -> b means a happens before b
* Edges can be labeled with current value of variables
* `printf` vertices can be laveled with output
* Each graph begins with a vertex with no in edges.
Any topological sort of the graph corresponds to a feasible total  ordering of execution, where edges point from left to right.

##### Reaping Child Processes

When a process terminates it still takes up system resources, such as the `exit` status, and OS tables allocated for that process. This process is called a **zombie**. Reaping is the process of cleaning up after a terminated child. Calling the `wait` or `waitpid` function performs reaping. The parent revieves the exit status of the child and the kernel deletes the child.

If the parent doesn't reap it's child and the parent terminates then the child will be reaped by the `init` process, with `pid == 1`. This means that the child process really only needs to be reaped if the program runs for a significant period of time.

`wait` suspends the current process until one of its children terminates:

```c
int wait(int *child_status)
```

The return value of `wait` is the process id of the child that was terminated. The `child_status` will hold the reason why the child terminated after the `wait` call. 

There are macros such as `WIFEXITED(child_status)` to easily make checks as to how the child terminated.

`waitpid` allows the parent to wait for a specific process to terminate.

```c
pid_t waitpid(pid_t pid, int *status, int options)
```

##### Loading and Running Programs

The `execve` function clones loads a program.

```
int execve(char *filename, char *argv[], char *envp[])
```

The `v` stands for argument vector and the `e` stands for environment variables which can be configured for the program being ran. The calling program is only returned to if there is an error. `*argv` represents the command line arguments for the program and `envp` (enviroment pointer) is a null terminated array of pointers to environment variable strings, each being a name value pair of the fomr `name=value`. The first argument `argv[0]` is the name of the executable object file. Environment variables can be used with:
* `getenv()`: Gets an environment variable.
* `putenv()`: Sets or adds an environment variable.
* `printenv()`: Prints all environment variables.

The executable file pointed to by `filename` can either be a binary executable file or a script file (which begins with a shbang (`!#`).

`execve` is called once and never returns, unless there is an error. The program is ran on the same process, meaning it overwrites the code, data and stack.

##### Setting up the Stack

When `execve` is called the environment variables and command line arguments are loaded into the bottom of the stack. Above them are pointers to these values. 

![[Pasted image 20230309103143.png]]


# Questions / Thoughts