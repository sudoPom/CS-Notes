`tags:`
[[Malware]]

## Security in Software

A program is `secure` when it does *exactly what it should* no more, no less.

But… what should a program **do**? **How do we know**?
- Somebody **tells** us -> do we **trust** them?
- We write the code ourselves -> only **sometimes**

Overall, a program is secure **when it doesn’t do “bad things”**
- like crash my system, delete files, or send my password

But what if it **could** do bad things? Is it still secure? 


Security involves understanding **both** the **unintended and intended**
functionalities of the system

### Exploit
- A mechanism by which an attacker **triggers some** **unintended functionality** of the system 
	- blind spot for the developer


What makes security **different** from correctness, safety, robustness? The presence of an **adversary**

- `Correctness
	-  For a given input, a program should provide the correct output
- ``Safety
	- Well-formed programs cannot have bad (wrong or dangerous) **outputs**, no matter the input
- `Robustness
	- Programs should be able to cope with errors in execution

For security, these properties must hold even in the presence of
a resourceful and strategic adversary.


### Software Vulnerability
- a **bug** in a program that **allows** a user **capabilities** that should be **denied** to them
- a very common type of vulnerability is one that **violates control flow integrity** (CFI)
	- attacks that redirect the flow of execution (the control flow) of a program https://en.wikipedia.org/wiki/Control-flow_integrity


### Buffer Overflow
- Program variables get allocated regions of **physical memory** in the form of **buffers**
- Buffer overflows happen when a program writes data **beyond** its allocated buffers
- These are ubiquitous in systems-level languages (C/C++)
	- It's made worse by the fact that many standard library functions make it easy to go beyond array bounds
	- Doesn't happen in other languages like Rust (rustaceans what up???)
- String functions like `strcpy()` and `strcat()` write to the destination buffer until they encounter `\0` in input, so the **user** providing the input (who can easily be the attacker!) **controls** how much gets written
	- There's **no check** that the target of your strcpy() has enough memory allocated for the input

Example: 
- Initialize an array and a short
- Stored consecutively in memory
- Strcpy puts a string in A that's too long
- B gets changed too D:
- Adversary can put whatever in B

![[Screen Shot 2022-05-12 at 10.29.41 PM.png|600]]


### Worms
- **Morris Worm** - first (accidental) worm (1988)
	- idea was for self-replicating software for utilities
	- required the entire Internet to reboot
- Spread autonomously by exploiting vulnerabilities
- Spread quickly and unpredictably
- Easy to detect
- **Slammer worm** (2003) infected 75,000 machines within 10 minutes

It is **not acceptable**/ethical/legal to attack **live systems**, need to instead adopt **responsible** research and disclosure practices (“**white-hat hacking**”)


### Buffer Overflows
- We can trigger some unintended functionality & maybe mess with their if-then-else
- Why do buffer overflows allow you to take over the machine?
	- Your program manipulates data
	- But **data also manipulates your program**!