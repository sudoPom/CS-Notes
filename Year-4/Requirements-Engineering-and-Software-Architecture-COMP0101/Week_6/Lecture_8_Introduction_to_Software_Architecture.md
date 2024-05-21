---
id: Lecture_8_Introduction_to_Software_Architecture
created_date: 21/11/2023
updated_date: 21/11/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Introduction_to_Software_Architecture



A software architects role is to identify and engage stakeholders, to understand their concerns, create and take ownership of the architectural description and to take a leading role in the realisation of the architecture. The twin peaks model of architecture and requirements states that requirements inform the definition of the architecture, which in turn reveals costs and trade-offs which can be considered to improve the requirements. Whereas the three peaks model incorporates development after architecture is defined, which can in turn help refine the architecture by revealing architectural smells.

The architecture definition process is iterative:
* Identify architecturally significant requirements
* Produce candidate architectures
* Evaluate said candidates
* Modify architecture/requirements until an acceptable architecture is found.

An architecturally significant requirement (ASR) is a requirement that has significant impact on architectural decisions. If the absence of this requirement does not change the architecture, it is not architecturally significant. ASRs likely refer to:
* Core features
* Quality Requirements
* Contraints
* Application Environment (where the system should run).

Producing candidate architectures involve splitting the system into functional elements with well defined responsibilities.

Evaluating an architecture can be done by coming up with perspective specific requirements (related to peformance, availability, security, etc) and coming up with methods for evaluating the architecture against these requirements.

The architecture can then be modified using architectural tactics for modifying an architecture to satisfy the requirements.
# Questions / Thoughts