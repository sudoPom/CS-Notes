---
id: Lecture_11_Profiling_and_Coverage
created_date: 14/11/2023
updated_date: 14/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Profiling and Coverage

**Tuning** is the process of systematically improving software. **Profiling** can be used to determine the areas of the program where resources (time, memory, etc) are used the most.

System tuning involves:
* Establishing acceptable behaviour
* Measure the current performance to see if it is acceptable.
* Identify and modify bottlenecks to see what is causing the system to under perform
* Measure performance again.

The `time` command can be used to see how long it takes a program to run. Time can be analysed using tools like GPROF (runtime of functions), whereas GCOV can be used to determine how often lines of code are executed.

GPROF provides two profiles, **flat** and **structured**. Flat profiles show how runtime is split into individual function calls. Flat profiles in GPROF computes time by pausing the program and determining which function it is in. This is not very accurate.

Structure profiles show which functions are invoked by each function, which function invoked each function and how many times it is invoked.

GCOV is used to measure line coverage by computing how many times each **line** is invoked. Coverage is typically used as a metric for the quality of a test suite. A high coverage means the tests of a test suite invoke a large amount of the lines of the code base.

![[Pasted image 20231114153233.png]]

The numbers represent the number of times the line has been executed. Lines with `#`s indicate lines that are not executed. Lines with no number or `#` indicates lines with no executable code. The numbers are linked to the actual assembly code, not the source code.

Profiling has the compiler produce instrumented code, enriching the code with specific instructions for profiling. For GPROF, functions are compiled so that every called function returns an entry showing when and where it was called. GCOV labels all blocks of code (lines of code always ran together) as nodes and increments a counter every time that block/node is executed.

There are different types of coverage:
* Statement coverage
* Line coverage - since statements can span multiple lines
* Instruction coverage machine code
* Branch coverage - Covers different branches/jumps (ifs, returns, elses, thens, etc)

![[Pasted image 20231114155340.png]]

The line below a branch highlights how often that branch is taken. Below an `if` statement represents how many times the program jumps to the `else` part of the `if` statement.
# Questions / Thoughts