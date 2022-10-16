# Instruction Level Parallism
Instruction level parallism involves making use of hardware during idle time. This could mean that rather than fetching an instruction and waiting until the first instruction is completed the next instruction could be fetched. This is known as `pipelining`.

![[Screenshot_20220502_145620.png]]

This requires registers to store intermediate states of instructions. For example:
The first clock cycle would involve fetching the first instruction and storing it in the first $CLK$ register. 
In the second clock cycle the first instruction would be decoded and the result stored in the second $CLK$ register while simultaneously fetching the second instruction and storing it in the first $CLK$ register.

Every time an instruction is decoded, the control signals need to be stored for each instruction. These are stored in their own registers and are propogated down the pipeline.

![[Screenshot_20220502_150231.png]]

### Drawbacks & Fixes
Concurrency unfortunately introduces hazards. This is because registers can be accessed while another process is making a change to it, which can lead to concurrency bugs, as a change made to a register in process one may not be present (as it has not yet been saved) when another process accesses the same register, meaning operations made by the second register will be incorrect

`Forwarding` is the process of moving the result of an operation on a register down the pipeline so that changes made to a register are consistent across the entire pipeline. This requires additional hardware (communication channels)

`Stalling` is the process of stopping the pipeline until the result of the previous calculation is finished. This reduces the efficiency of the pipeline.

`Superscalar Architecture` involves duplicating hardware so that multiple instructions can be carried out in parallel. This still however gives rise to concurrency bugs in the same way that the regular pipeline did.

`Control Hazards` are caused by the incorrect instruction being fetched during pipelining. This often occurs when a branch instruction is not predicted. `Branch delay slots` prevent this by delaying the pipeline until the next instruction is decoded to determine whether a branch is required.

`Out of order execution` involves re ordering instructions in a way to still produce the same output result, but solves hazards, allowing for a more efficient pipeline. This requires complex hardware to carry out. ^91862e