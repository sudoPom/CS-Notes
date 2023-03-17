---
id: Signals
created_date: 16/03/2023
updated_date: 16/03/2023
type: note
links: 
---
* **🏷️Tags** : #Computer-Systems-COMP0019 
# Signals

Signals can be used to send a message to a process, notifying it about some kind of event that happened. Some common ones are:

| ID  | Name     | Default Action | Corresponding Event                        |
| --- | -------- | -------------- | ------------------------------------------ |
| 2   | SIGINT   | Terminate      | Ctrl + c                                   |
| 9   | SIGKILL  | Terminate      | Kill program (Cannot be overriden/ignored) |
| 11  | SIGSEGV  | Terminate      | Segmentation Fault                         |
| 14  | SIGALARM | Terminate      | Timer Signal                               |
| 17  | SIGCHILD | Ignore         | Child stopped or terminated                                           |

The kernel sends the signal to a destination process by updating some state in the context of the destination process.

Processes can kill another process if it belongs to the same usergroup using the `kill` function.

```c
kill(pid_t pid, int signal)
```

When a signal is sent it is not carried out immediately, only when the target process is scheduled to be ran, the signal is delivered. Until recieved by the process the signal is pending. Only one signal (of a given type) can be pending at a time, any other signals are lost.

When a signal is recieved the process must either:
* Ignore the signal
* Terminate the process
* Catch the signal by executing a user-level function called *signal handler*

Processes can block particular signals, preventing the signal from being delivered until the signal is unblocked. The kernel stores information on blocked and pending signals as bit fields for each process.

To find the non blocked signals the kernel computer:
```
pnb = pending & ~blocked
```

The `signal()` function modifies the associated with recipt of signum:

```c
handler_t *signal(int signum, handler_t *handler);
```

`handler` can either be:
* SIG_IGN (ignore)
* SIG_DFL (default)
* the address of a user level signal handler

Handlers can be interrupted by other handlers. However a handler cannot be interrupted by the same signal it is handling - the kernel won't send a signal that is currently being handled. Signal handlers are ran concurrently (logically not physically) in the same process.

`pause()` sleeps the process until a signal arrives.
`sigsuspend()` can be used to atomically wait for a signal to arrive. 

```
int sigsuspend(const sigset_t *mask)
```

This is equivalent to:
```
sigprocmask(SIG_SETMASK, &mask, &prev);
pause();
sigprocmask(SIG_SETMASK, &mask, &prev);
```

Where SIG_SET

###### Process Groups

Every process belongs to one group. A signal can be sent to every single process in a process group. The process group that is in the *foreground process group* is delivered.

A function is async-signal-safe if it is either reentrant (variables are stored on a stack frame) or are non interruptable by signals.

Guidelines for Signal Handlers:
* Keep your handlers as simple as possible
* Call only async-signal-safe functions in your handlers
	* `printf` is not async-signal-safe
* Save and restore `errno` on entry and exit
* Protect accesses to shared data structures by temporarily blocking all signals.
* Declare global variables as `volatile`
	* Prevents compiler from storing it in a register.
* Declare global flags as `volatile sig_atomic_t`
	* Flag can only be read or written to, no incrementing.
	* Flag does not need to be protected against like other globals.


## Portable Signal Handling



# Questions / Thoughts