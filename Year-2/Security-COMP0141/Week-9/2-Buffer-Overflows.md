[[High-Level-Languages#The Stack]]

## Buffer Overflows

**Function calls**
- How does the called function know where to return to?
- The OS keeps track of the return address using a **stack** 


**Call Frame**
- What happens when a function is called?
	- Allocate new frame for the callee
	- Caller pushes arguments and return address
	- Callee:
		- Pushes old **frame pointer** (fp): this points to bottom of frame of currently executing function
		- Sets fp = sp (**stack pointer**): this points to top of stack
		
• What happens when a function is returned?
	- Callee pops local storage and sets sp = fp
	- Callee pops frame pointer
	- Callee pops return address and returns to next instruction in caller frame
	

------

### Adversary wants to Smash the Stack

If we overlow the buffer, we can even mess with the stack

Could overwrite:
- Another local variable
- Saved fp
- Return address
- Function argument
- Deeper stack frames
- Exception control data

## What happens if you overwrite...
- **Local Variables**
	- Depends!
	- Bad if:
		- Results of a **security check** (isValid)
		- Variable used in security check (buff_size)
		- **Data pointer** (potential for further corruption)
		- **Function pointer** (direct transfer of control when called)
		
- **Saved fp**
	- Probably terrible things!
	- When the function returns, the stack **moves to an attacker-supplied address** ⇒ complete control of execution
	- Even a **single byte** may be enough for this attack

- **Return Address**
	- Terrible things!
	- When the function returns, control is transferred to an attacker-supplied address ⇒ **complete control of arbitrary code execution** (re-direct to their own code)
	- This is often called **return-oriented programming**
	
- **Worst case**: you can transfer control to an address of your choice

---- 

## Shellcode
- The best thing an attacker can do is **launch the shell**, because that allows them to **execute arbitrary code** (with **higher** privileges)
- This type of malware is often called **shellcode**
- Attacker **ensures** shellcode is **somewhere in the stack** before overwriting return address but they might not know exactly where it is.


### NOP Sleds
- NOP sled (also known as a NOP slide) is **a long sequence of instructions preceding shellcode**
- **Relies** on the NOP **(“no-op”) instruction**
- The attacker uses the NOP sled to make the target address bigger: the code can jump anywhere in the sled, instead of exactly at the beginning of the injected code.
- As long as the attacker’s **guess** lands s n jump to the start of the shellcode as desired 

----

## Mitigations 
- **Thinking like an attacker**: 
	- Does the code check for **bounds on memory access**? 
	- Is the **test** invoked along **every path** leading up to the actual access (complete mediation)? 
	- Is the **test correct**? Can the test itself **be** attacked?
- Investigate security aspects of tools, frameworks, libraries, APIs that you use and understand how to use them safely. **The default way of doing something is often insecure!** 
- Use `strncpy` instead of strcpy, etc. 
	- Has a way to check for memory bounds
- Lots of other techniques (stack canaries, ASLR, non-executable stack, etc.) 