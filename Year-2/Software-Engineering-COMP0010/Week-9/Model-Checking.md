# Model Checking 

## Formal Verification

Given a model of a system and some specification, determining whether or not the system model satisfies a specification is not decidable. This is `Formal Verification`.

## Model Checking

`Model checking` restricts the problem to a decidable one:

* Finite state reactive systems.
* Propositional temporal logics for specification.

### Finite State System

A system that can only have a finite number of states, eg: a traffic light only has 4 different states.

* Hardware designs
* Controllers
* Communication protocols

#### Kripke structures

A set of states, transitions and initial states, similar to modal logic frames.

### Temporal Logic

A system of rules for representing and reasoning about propositions qualified in terms of time. Can be used to express phrases such as "The sun always shines" or  "The moon will eventually rise".

#### Linear Temporal Logic

Path in transition system - Sequence of states over time.

$G$ - Globally. For example $G$ Red means that all states will have the property of red.

$F$ - Future. For example $G$ Red for some state in the future.

$X$ - Next. For example $X_i$ Red means at state $i+1$ the state will be red 

$U$ - Until: For example Red $U$ Green means states will be red until a green one is met.

These can be nested and applied with propositional logic.



## Applications

Temporal logic can be used in applications to set restrictions:

* $G\neg($ReactorTemp > 1000$): $ The reactor temperature will never reach a temperature over 1000 in any state in the application.

Model Checkers will take in a finite state model and a temporal logic acting as a specification and returns True if the specification is satisfied and false as well as a counter example if the specification is not satisfied. 

### Limitations

The biggest limitation is that the number of states in a system is REALLY big and will therefore take up a large amount of space in memory.

Some fixes can be made to make Model Checking more effective:

* Symbolic model checking
* Bounded model checking with SAT/SMT
* Abstraction