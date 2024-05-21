---
id: Introduction
created_date: 09/01/2024
updated_date: 09/01/2024
type: note
links: 
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Introduction

**Validation** is the process of checking to see if the software system meets the users real needs, whilst **verification** is checking to see if the software meets the requirements specification.

The users/clients provide the [[Lecture_2_Requirements_Process_Overview|requirements]] to developers, who then come up with a specifications that the software should meet. 

Validation primarily deals with the fundamentals of software testing, specifically:
* **Black-box Testing** tests the input output behaviour of the code, not the code itself.
* **White-box Testing** tests the code's features such as control & data flow, structural testing, etc.

### Why Test Software?

**Software testing** is an investigation conducted to provide stakeholders with information on the quality of the product or service being tested. It can be used to show correctness/problems and ensure the code is of a high quality. It is the process of finding differences between observed behaviour and the behaviour of the implemented system.

**Unit tests** finds differences between the specification of an object and its implementation as a component.

**Structural testing** finds differences between the system design model and a part of the integrated subsystem.

**Functional Testing** finds the differences between the use case model and the system.

**Performance testing** finds differences between nonfunctional requirements and the actual system performance.

We test to avoid **faults** (an anomaly in a source code that can cause the program to enter an invalid state or an error), **errors** (the effect of executing a fault which can cause a failure) and **failures** (observable behaviour that differs from the expected/specified behaviour). The aim of testing is to locate the faults in code, this is done by provoking failures in a planned way.

### Difficulties Behind Testing

**Exhaustive testing** is the act of testing a system with ALL possible inputs. If a system works for every single possible input then you can theoretically guarantee that the program is correct. This is of course difficult because of how large the total number of inputs can be.

However the idea behind testing is to find the existence of bugs, not the absence.

Test oracles will need two different ways of computing some function. The first way is the way to be tested and the second is the way that the tested value will be compared to. However, the second method could also be faulty, making the oracle in accurate.

**Reliability Testing** is used to check the proportion of failure free execution over a certain period of time. This is useful for safety critical systems that must be working as much as possible.

**Equivalence Partitioning** is the process of splitting up the input domain into partitions. The program should exhibit the same behaviour on all elements within the equivalence class. If one element in a partition causes an error, it is expected that all other test cases in the equivalence class (partition) would also cause the error. Boundary testing involves using values that are on the boundary of partitions in test cases, this is done because developers tend to make mistakes in processing a value near a boundary.


# Questions / Thoughts