---
id: Lecture_11_Architecture_and_Quality_Requirements
created_date: 07/12/2023
updated_date: 07/12/2023
type: note
links: 
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Lecture_11_Architecture_and_Quality_Requirements

Architectural perspectives include guidelines for defining perspective specific requirements. These may include performance, availability, etc. There are techniques for evaluating an architecture against a perspective. **Architecture tactics** are methods in which an architecture can be modified to satisfy perspective-specific requirements.

#### Security

An architecture should always be designed with security in mind.

A security goal are goals concerned with protecting an asset from a system. Typically identifying goals begins by listing the assets of a system, as well as their sensitivity and security goals related to them ([[What-is-Security#The CIA Triangle|CIA]]).

There could then be a business policy for each asset that specifies all the actors that have access to the asset.

The attackers to the system should be listed as well as their objective in carrying out an attack. The severity of damage done and likelihood of attacks should be listed as well. Both inside and outside threats should be considered.

###### Common Pitfalls
* No clear security requirements. Security measures are put in place without thought being put to security requirements.
* Complex security policies
* Ignoring insider threat
* Technology driven approach without thinking about security goal.
* Using ad hoc or unproven security technologies
* Security embedded in application code.
* Lack of administration facilities.
* System does not fail securely
* Security as an afterthought

When coming up with security requirements you should consider:
* The system's security goals.
* The systems security policies.
* The systems threats.

When coming up with an Architecture Definition you should consider:
* What security measures should be put in place to prevent/reduce each security threat.
* What mechanisms does your system have to detect and recover from security breaches.
* Have you considered end to end security? What is the system's weakest point?
* Are you using proven third party security infrastructure as much as possible? (This is almost always better than creating your own security infrastructure)

#### Performance and Scalability

**Scalability** is the ability of a system to function under increased workloads. **Throughput** is the number of transactions that the system can complete per unit time. **Performance breakdown** is an attribute of all systems in which, past a given workload amount, the performance of the system degrades abruptly. Performance requirements often include software performance requirements and business oriented requirements.

![[Pasted image 20231207101328.png]]

System response time should be thought of with respect to user experience. For example 0.1 seconds in response time may feel instantaneous to a user whilst a 10 second response time is likely to cause the user to lose attention.

###### Evaluation

Performance models can be used to determine the performance of the system and can vary from simple calculations to complex simulations. The main idea behind using models is to identify bottlenecks and determine at what point the systems performance will breakdown. Models are unlikely to provide a 100% accurate representation of the actual system.

Performance testing can also be used to evaluate performance. This can be carried out using a simple prototype and architecture skeleton.

##### Tactics for Improving Scalability/Performance

To improve the performance of a system you can **scale up** by upgrading existing machines to more expensive and powerful ones, or **scale out** by buying more machines. 

**Replication** can also be used to increase the amount of shared resources that clients of the system can access to reduce contention. Lengthy operations can be **parallelised/partitioned** so operations can be completed faster and less resources are idly waiting.

**Caching** the results of expensive operations will remove the need to re compute them. Systems should also degrade gracefully under a large workload rather than completely stop working. Processing can also be distributed so that some work can be done during common "idle" periods.

##### Common Pitfalls
* Imprecise performance and scalability goals.
* Overconfidence in positive results for simplified models.
* Invalid assumptions about problem domain.
* Inappropriate partitioning. (One element that has a lot of responsibilities is likely to be a bottleneck)
* Failure to take into account transactions with high overhead.

#### Availability and Resilience

Availability and resilience is the ability for the system to be fully/paritaly operational as and when required and to handle failures that could affect system availability effectively.

Availability is often described in terms of number of "9s" representing the proportion of time the service is up and running for example "in 30 seconds the system should be available 99.999% of the time".

Availability does not need to be consistent across services of the service, high priority services should have a higher availability than low priority services. Availability also includes the concern of how quickly the service recovers from failure.  Services can also have planned downtime for hard/software upgrades.

For each service you should list:
* The goal of the service.
* The availability fit criteria (available more than 99% of the time, crashes less than once per month)
* Failure handling requirements.

Availability schedules specify the times where a service must be available.

![[Pasted image 20231207103912.png]]

---
##### Resilience

**Disaster recovery** is the actions that will take place after a disaster in the physical world, such as a flood. These normally include using physical backups and standby machines. **Business continuity** is the recovery of the whole business after a major disruption.

---


##### Evaluating System Availability

For hardware this is:

$$
\begin{align}
availability = \frac{MTBF}{MTBF+MTTR}
\end{align}
$$

Where $MTBF$ is mean time between failure and $MTBR$ is mean time to repair.

For software availability:
* Evaluate how the failure of each component would impact the system and the users.
* Identify which points of failure have major consequences.
* Some software reliability models can also be used for quantitative evaluation.

Additionally the amount of time scheduled for upgrades/maintenance should be revised to see if this is enough time.

##### Tactics for Availability

**Replication strategies** are used to remove single points of failure by duplicating the functionality of a service to multiple machines so if one goes down, another can be used. 

**Designing for failure** is the idea of designing the system assuming that a failure will happen. Tools should be developed to help diagnose and recover from failure. Failure should be graceful and hidden from users where possible. 

**Backups** should also be used to prevent data loss.

##### Problems and Pitfalls
* Overambitious availability requirements
* Single points of failure
* Cascading failure (a failure in one part of the system causes a failure in others)
* Unavailability through overload. Components should still work/degrade gracefully when load increases

# Questions / Thoughts