# Concurrency Abstraction
The `concurrency abstraction` is based on having a number of processes, each consisting of `totally ordered` sequences of `atomic actions`. The abstraction itself models the overall system by `interleaving` the execution of `atomic actions` of the processes.

#### Definitions
A `sequential program` consists of a single process carrying out a totally ordered sequence of atomic actions. Given a fixed input, the program is deterministic.

A `concurrent program` consists of two or more processes carrying out atomic actions.

An `atomic action` is an action that is not divisible in terms of processing - it is either completed entirely or not started at all. Each atomic action takes 1 arbritrary unit of time.

An `interleaving` is an abstract term used to describe the model in which atomic actions from different processes are carried out.

![[Pasted image 20220503112015.png]]

In the concurrency abstraction, atomic actions do not get carried out simultaneously, they are interleaved. There are multiple interleavings for concurrent programs, these can be seen as the different ways of ordering atomic actions from processes.  ^548d37

If a program doesn't work under all interleavings then there is a `race condition/concurrency bug`, and the program is said to be broken. ^0873c9

### Synchronisation
Blocks of code that must be executed as an atomic unit in order for the program to work correctly are known as `critical sections`. An example includes java declarations of doubles, as this consists two atomic instructions.

`Synchronisation` is the process of making a block of code atomic. This restricts the possible interleavings, which makes the program more resilient to concurrency bugs.
