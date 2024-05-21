---
id: Lecture_16_ASLR_Taint_Check_and_Defences
created_date: 07/12/2023
updated_date: 07/12/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Defences

**Host based defences** are expected to work on executables, without needing the source code. There should be little performance overhead on the system while protecting against a broad amount of attacks and there should be no false positives/negatives.

#### W XOR X (Write XOR Execute) Page Protections

Operating systems provide page level protection using permission bits to restrict operations a process can carry out on a page. A lot of exploits involves a user entering malicious input that contains malicious code and the malicious code is jumped into.

The idea behind WXORX is to prevent the CPU from executing instructions stored in data pages. Each page can be writable or executable but not both (hence write exclusive or execute). For instance the text pages are executable and the data pages are only writable.

AMD and Intel introduced an NX (no execute) bit which is available on today's CPUs in "PAE mode". Linux PaX implements WXORX without adding a new bit by segmenting the memory address space of processes into write and execute segments. This reduces the address space by half and provides a slight performance reduction.

WXORX breaks just in time code generation in legacy applications (as they do not inherently have a separation between code and memory segments). For example web browsers that contain a JS compiler, compiles code for different types and writes the compiled code into a page, the browser then jumps into the page to execute it.

###### Return to lib C

Instead of putting shell code onto the stack, they put arguments onto the stack and overwrites the return pointer to a well known library function, like `systen()` which executes system commands. This attack would still work against WXORX.

#### Address Space Layout Randomisation (ASLR)

In order for all these attacks to work, the attacker needs to know information about the address space (where a library function is, the address of the return pointer, etc). The idea here is to randomise the addresses in process so it is really difficult for an attacker to guess the correct address. Guessing unmapped memory will result in a crash and jumping to an invalid instruction will also cause a crash.

Additionally exploits can be detected efficiently as memory faults or illegal instructions suggest that the server is under attack.

Linux processes contain three memory regions:
* Executable: text, init data, uninit data
* Mapped: heap, dynamic shared libraries, thread stacks and shared libraries.
* User stack

ASLR adds a random offset to each area when the process is created. This is easily supported by VM hardware. The offset for each region is 16, 16 and 24 bits respectively. After mapping, the offset is limited to 16 bits (in a 32 bit CPU). This is because the first 12 bits represent the offset within the page and randomising that will cause pages to be unaligned. The upper 4 significant bits cannot be randomised as these bits are used for large memory maps - grabbing multiple pages at once.

###### De-randomisation Attack on ASLR

The 16 bits for the mapped area is not very big, so the idea is to attempt to guess that random offset so that the addresses of shared libraries can be found. Then a return to lib C attack can be performed again.

The plan for the attack is:
* Perform a classic buffer overflow return to lib c attack. The called libc function is `usleep()` which sleeps for the input time in microseconds.
* If the attacker guesses wrong then the program crashes and closes connection immediately (forked processes will have the same random offset).
* If the attacker guesses correctly, `usleep()` will execute causing the process to crash after a delay. The attacker has to edit the return address that is used to jump after `usleep()` finishes to a invalid pointer to cause the crash.


Each guess is of the form:
$$
\begin{align}
base+usleep()offset+guess
\end{align}
$$
A big delay value should be used to the delay is obvious. Additionally the delay should not have any 0s in it (in hex) so it is not truncated on copy.

Once the correct address offset is guessed the return to Lib C attack can be used.

For 64 bit architectures about 40 bits can be used for randomisation making it a lot harder to brute force without attracting attention.

#### Taint Check

The idea behind TaintCheck is to detect when an exploit happens by observing the execution of the servers code. This is done by instrumenting the code to monitor code execution. This should work on binaries (no source code required).

A lot of exploits occur by data being supplied which causes the control flow to change. This is done by modifying jump instructions, call instruction targets or function return addresses. During execution, before any control transfer the target address is validated to make sure that the address has not been influenced by user supplied data. If it is, an alarm is raised.

The bytes in memory that are from a user, or anything derived from this memory is marked as "tainted". Any tainted data is not trusted. Data that comes from a socket, read system call, input files, etc are user input and the address range it is stored in are marked as tainted. Any results of operations performed on tainted data are marked as tainted. Any copies of tainted data are also marked as tainted. Addresses can become untainted by being overwritten.

Valgrind is used to modify executables during runtime by adding code to the binary. Valgrind takes in a program that describes how to modify the input. Instructions are of the form "when you see this instruction, add this instruction". The processing loop works as follows:
* Fetch the next basic block (sequence of instruction up until the next control transfer instruction) of the program.
* This code is translated into UCode (valgrinds instruction set).
* Add instrumentation code to the Valgrind UCode.
* Translate the code back to the native code, for example x86. This is cached for reuse.
* Execute instrumented native code block.
* Repeat.

Before all control transfer instruction, if the register being used for the control transfer is tainted then raise an alarm. Additionally use the above rules to mark addresses as tainted for loads, stores, arithmetic instructions, etc.

Taint is tracked using a shadow memory data structure that stores information on every byte of memory that provides the following:
```
isTainted(addr) -> {T | F}
taint(addr, len)
unTaint(addr, len)
```

There are two modes of operation:
* Fast: single bit for each byte
* Detailed: 4 bytes per byte

###### Implicit Flows

Given the following code:
```c
if(x == 0)
	y = 0;
else
	y = 1;
```

If `x` is tainted then `y` is not considered to be tainted despite `y` being based on the value of `x`. TaintCheck does not take into account [[Program-Control#Control Codes|condition flags]] . This is because this would cause a lot of false positives. However the result of this is that false negatives are possible.

--- 

Taint check can be used to detect exploit payloads. A trace of tainted data can be stored. When an exploit is detected you can walk back to identify the input that led to the exploit. These input payloads can be studied to produce firewall rules to block these payloads.

However it does cause a significant slowdown (25x), which may seem unattractive for production servers. TaintCheck could be applied to only a sample of servers so that some exploits are detected.
# Questions / Thoughts