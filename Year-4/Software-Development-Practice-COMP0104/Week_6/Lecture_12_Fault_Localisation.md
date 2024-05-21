---
id: Lecture_12_Fault_Localisation
created_date: 14/11/2023
updated_date: 14/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Fault Localisation

In order to debug you need to:
* Detect the fault
* Find the location of the fault
* Fix the fault.

Fault localisation is the process of locating the fault and is normally the most expensive task in debugging.

Faults can only appear in the code that is executed when a [[Lecture_8_JUnit#^4f9701|failure]] occurs. Tests are often used to narrow down the area of where the fault could be. 

An execution slice is the set of lines of code that were executed by a test. We can narrow the execution slice by locating executions "dices", which are the lines of code executed by failing tests but not passing tests. Faults can be located by comparing the execution slice of a failing test with its nearest neighbour according to some distance metric.

The more passing tests that execute a piece of code, the less likely it is for it to contain a fault. Similarly, the more failed tests that execute a piece of code, the more likely for it to contain a fault.

The **Tarantula** approach uses coverage. Given some entity $e$:
* $failed(e)$: number of tests covering $e$ that fail.
* $passed(e)$: number of tests covering $e$ that pass.
* $totalfailed$: number of tests that fail.
* $totalpassed$: number of tests that pass.

The suspiciousness of an element $e$ is therefore defined as:
$$
\begin{align}
\frac{\frac{failed(e)}{totalfailed}}{\frac{failed(e)}{totalfailed} + \frac{passed(e)}{totalpassed}}
\end{align}
$$

Code that is not executed by the failing test cannot be the location of the fault, passing tests that execute the fault do not cause problems.

The **Ochiai** approach uses the following:
$$
\begin{align}
\frac{failed(e)}{\sqrt{totalfailed \times (failed(e) + passed(e))}}
\end{align}
$$
Ochiai is better suited when there is more than one fault and works better than tarantula when there are multiple faults.

# Questions / Thoughts