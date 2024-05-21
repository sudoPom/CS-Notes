
##### Layered Architecture (Monolithic)

Components are separated into layers. Components in the $nth$ layer can only call components in the $n+1th$ layer.

###### Advantages
Testability, Scalability

###### Disadvantages
Agility, Deployment, Performance, Scalability

##### Micro-kernel Architecture (Monolithic)

Consists of a core component, which contains all the core functionality of the system, and plugins for specific functionality. The core component needs a registry that contains all the supported plugins. Each plugin should have the same input and output.

###### Advantages
Agility, deployment, testability, simplicity

###### Disadvantages
Performance, Scalability

###### Event Driven Architecture

There are two topologies of event driven architectures, broker and mediator.

The broker architecture makes use of events, processes and message queues. Whenever an event happens, the top level event will capture it and send a message on a message queue. A process will receive the message, perform some task then send another message to another message queue. This process is repeated until the event is handled. Error handling needs to be handled in this architecture (possibly through error queues). Extending a broker event driven architecture is done by just adding more processes. 

The mediator architecture  makes use of all the components of the broker topology, but there is now a mediator, where all messages go through. The mediator handles all the messages and will be aware to know if a certain process failed. Adding new functionality requires adding the process for the functionality and a change in the mediator to handle messages for that process.

###### Advantages
Agility, deployment, performance, scalability

###### Disadvantages
Testability, Simplicity

### Pipeline Architecture (Monolithic)

The pipeline architecture makes use of pipes and filters. The pipes are one way and sends data between components. Filters take in data and produce data. There are 4 kinds of filters:
* Producers: The start of the system, produces the data.
* Transformers: modifies the data in some way and sends it out.
* Testers. Does some conditional test and might discard the message if the check fails.
* Consumers. No exit pipe, forms the endpoint of the system.

###### Advantages
agility, testability, simplicity

###### Disadvantages
deployment, performance, scalability

### Space Based Architecture

Space based architecture consists of processing units and virtualised middle-ware which itself consists of a messaging grid, data grid processing grid and a deployment manager:
* Processing Unit: Contains the application in a series of modules. It also contains an in memory data grid that holds all transactional data for the processing unit, and a data replication engine. This is what is deployed.
* Virtualised Middleware:
	* Messaging grid: Manages input request and session. Takes in a request and re directs it to a processing unit to handle the request.
	* Data grid: Manages all data replication between all processing units. When a change is made on one processing unit the data grid makes sure the change is applied to all processing units.
	* Processing Grid: Optional, certain requests need to go to certain processing units, the processing grid manages this.
	* Deployment Manager: Is in charge of the state, if load goes down, the deployment manager will shut down certain processing units.

This architecture aims to eliminate bottlenecks in databases, however this risks data collisions:

$$
\begin{align}
collision~rate = num~grids\times\frac{update~rate}{data~grid~rows}\times replication~latency
\end{align}
$$

###### Advantages
Agility, deployment, performance, scalability

###### Disadvantages
Testability, simplicity

### Microservices Architecture

The Micro services architecture consists of

