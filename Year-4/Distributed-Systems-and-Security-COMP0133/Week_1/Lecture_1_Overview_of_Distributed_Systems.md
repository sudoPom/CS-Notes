A **distributed system** is made up of multiple computers (with their own resources) that are connected together over a network. Users that interact with this system often see a **single** system.

Centrailsed systems have issues with scaling, outages, availability and security. If the single server goes down, the entire service stops working.

**Throughput** is the number of requests that can be fulfilled per unit time.

When measuring throughput the x axis has the offered load (number of requests) and output (number of responses) on the y axis.

Distributed systems are hard to design:
* Failure of certain nodes
* Hosts may have different data representation
* Consistency between nodes are required
* Need concurrency for performance