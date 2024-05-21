---
id: Lecture_17_Software-Based_Fault_Isolation
created_date: 12/12/2023
updated_date: 12/12/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Software-Based Fault Isolation

We want to be able to constrain the behaviour of application so that bugs cannot corrupt memory and cause exploits.

Often applications are extended using publicly available binaries. These binaries could contain vulnerabilities or be from an untrusted source which could cause harm when ran in your applications address space. Untrusted code could:
* Overwrite trusted code or data
* Read private data from trusted code's memory.
* Execute privileged instruction
* Call trusted functions with bad arguments
* Jump into the middle of a trusted function (skipping security checks)
* Contains vulnerabilities that allow the above.

We can be okay with untrusted code:
* Reading/Writing its own memory
* Execute its own code
* Call explicitly calling allowed functions in trusted code at the correct entrance points.

This could be done using Linux processes, and allow communication between the application and the untrusted extension using RPCs. This has the benefit of processes having separate memory address spaces. However this is not transparent if the app and the extension are closely coupled, operations that could be done directly will need to be done through RPCs. This will cause a performance hit due context switches between processes.

#### SFI (Software based Fault Isolation)

The idea behind SFI is to run the extension in the same process as the trusted app code. The code and data for the extension is placed in a sandbox - a memory region within the address space. The extension cannot transfer control to anywhere outside of the sandbox. Additionally the extension cannot write to the memory outside the sandbox. This is done by adding additional instructions to inspect the targets of jump and write instructions to ensure it is in the sandbox.

The writer of the extension will run a sandboxer on the unsafe extension code to produce a safe and sandboxed version of their code. The user of the extension runs a verifier to ensure that the code of the extension is correctly sandboxed.

SFI confines untrusted code in a **fault domain**. A fault domain consists of:
* A Unique ID (used for access control on syscalls)
* Code segment: Virtual address range that holds the code of the extension. This region is contiguous.
* Data Segment: Virtual address range to hold data of the extension. This region is also contiguous.

The higher order bits of the address range of a segment act as a segment identifier.

Untrusted code should be able to jump within its code segment and write within its data segment. The sandboxer needs to ensure that this remains true for all jump, call and memory store instructions in the extension code. Addresses can either be direct or indirect.

For direct addresses all jump instructions must have the higher order bits that match the segment identifier of the extensions code segment. Additionally for store instructions the address must have higher order bits that match the data segment identifier. This can be done statically, at compile time. This means the application runtime doesn't change as no instructions are added.

For indirect addresses, the full address is known at compile time. Instructions involving these are unsafe and need to be made safe at runtime. For instructions that are unsafe, the sandboxer rewrites it to:
* Copy the target address into some register.
* Shift right by some amount of bits (stored in another register) to get the segment ID.
* Check that the segment ID matches the expected segment ID (stored in another register and depends on the instruction).
* If they are not equal, branch to some fault function
* Else perform the actual instruction with the argument that was copied, not the actual argument.

The registers used by the sandboxer are not allowed to be used by the extension.

The argument that is used in the final instruction is the register because the register will always contain a safe address. If the extension code jumps into the final instruction where the actual command is issued, the argument will use a dedicated argument.

Adding these instructions will cause a slowdown (since more instruction to execute), and so does using registers as the extension may need to use memory.

The cost can be reduced by forcing addresses to be in memory. This is done by:
* Performing a logical AND with the argument and a mask that sets the segment ID portion to 0, and store the result in a dedicated register.
* Then force the segment id bits to be the correct segment ID using a logical and, storing the result in the dedicated register.
* Now perform the operation with the argument in the dedicated register.

###### Guards

Some instructions take a register and an offset for memory addressing. The sandboxer will need to add an additional ADD instruction. However the offset has a fixed size (in MIPS +/- 64K). To make use of this, they add a guard zone to the top and bottom of all segments. The guard zones are the size of the offset (again +/-64K bits in MIPS). Permissions are turned of within the guard zones, so accessing them will cause a page fault. This way it is enough to check just the base register in a register + offset addressing instruction.

###### The Stack Pointer

The stack pointer is used a lot, it is read to a lot but not often written to. Sandboxing is only performed on the writes of the stack pointer.


###### The Verifier

The verifier receives "supposedly" sandboxed binary and ensures that all instructions are safe. The segment ids can be used to verify statically named addresses and pattern matching for offset addressing. The verifier ensures there are no privileged instructions ran and that the PC stays in the confines of the code segment.

#### Limitations

SFI was made for MIPS, which has fixed length instructions, however on x86 instructions are variable length. This means it is possible to jump into the middle of an instruction. For example, jumping into the middle of a safe instruction could result in a privileged instruction being executed. Additionally x86 has fewer registers so it is not as easy to dedicate registers.

---

The attacker can still exploit the extensions execution but not the hosting applications execution.

# Questions / Thoughts