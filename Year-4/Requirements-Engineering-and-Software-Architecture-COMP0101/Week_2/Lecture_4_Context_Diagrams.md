---
id: Lecture_4_Context_Diagrams
created_date: 18/10/2023
updated_date: 18/10/2023
type: note
links:
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Context Diagrams

A context diagram shows the set of world actors connected through interfaces. They are primarily used to define the scope of the project and to give additional context of the world the machine operates in.

###### Elements

| Concept                                         | Notation                             | Meaning                                                               |
| ----------------------------------------------- | ------------------------------------ | --------------------------------------------------------------------- |
| [[Lecture_1_Foundations#^6e1dde\|Actors]]       | ![[Pasted image 20231018131141.png]] | (See link)                                                            |
| Interface                                       | ![[Pasted image 20231018131232.png]] | The interaction between two actors in the world, initiated by actor A |
| [[Lecture_3_Initiation#^c92e10\|Work]] boundary | ![[Pasted image 20231018131636.png]] | (See link)                                                                      |

---
###### Interfaces

An interface can be uni or bidirectional and contain a label and optionally content, which is the set of [[Lecture_1_Foundations#^2141e5|phenomena]] that occurs at the interface between the two actors.

---

The intricacies of the machine (or really any individual actor) should not be visible in a context diagram.

The model should only contain language specific to the application domain, not software engineering terminologies. The work boundary should be clearly classified.

# Questions / Thoughts