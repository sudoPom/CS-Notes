---
id: Software_Testing
created_date: 09/05/2024
updated_date: 09/05/2024
type: note
links: 
---
* **🏷️Tags** : #Validation-and-Verification-COMP0103 
# Software_Testing

**Software testing** is an investigation conducted to provide stakeholders with information on the quality of the product or service being tested. It can be used to show correctness/problems and ensure the code is of a high quality. It is the process of finding differences between observed behaviour and the behaviour of the implemented system.

Software qualities include:
* Correctness: If the program is consistent with it's specification.
* Reliable: Probability of correct function for some unit of behaviour.
* Safe: Prevents hazards.
* Robust: Acceptable behaviour under extreme conditions.

Testing is the process of finding differences between the expected behaviour specified by system models and the observed behaviour of the system.

**Unit tests** finds differences between the specification of an object and its implementation as a component.

**Structural testing** finds differences between the system design model and a part of the integrated subsystem.

**Functional Testing** finds the differences between the use case model and the system.

**Performance testing** finds differences between nonfunctional requirements and the actual system performance.

When differences are found the developers identify the cause (defect) causing the failure and make changes to the system to fix it.

**Fault**: Anomaly in the source code of a program that may lead to an erroneous state (error).

**Error**: Runtime effect of executing a fault which may result in a failure.

**Failure**: The external (to the program) manifestation of an error.

Testing is a form of **dynamic analysis** as we have to execute the program to see if it behaves correctly.

**Test Input**  is a set of input values used to execute a given program.  

**Test Oracle** is a mechanism for determining whether the actual behaviour of a test input execution matches expected behaviour, such as an `assert` statement.

**Test Case** is a test input and test oracle pair.

**Test Suite** is a set of test cases.


Alpha tests are performed by users in a controlled environment and are observed by the development organisation. Beta tests are performed by real users in their own environment, performing actual tasks without interference or close monitoring.
# Questions / Thoughts