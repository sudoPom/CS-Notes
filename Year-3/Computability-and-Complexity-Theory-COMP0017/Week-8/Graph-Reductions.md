
---
id: Graph-Reductions
created_date: 29/11/2022
updated_date: 14/04/2023
type: note
links: 
---
* **🏷️Tags** : #Computability-and-Complexity-Theory-COMP0017 
# Graph-Reductions

The [[Cook-Levin-Theorem#3-Sat|3SAT]] problem can be used to prove the completeness/hardness of other problems. This can be done with SAT but its easier to do so with a simpler problem like 3SAT.

### Independent Set

The indpendent set problem takes in an undirected graph, $G$, and an integer, $k$, and attempts to see if there is a set of vertices of size $k$ with no edges between them.

##### Independent Set is in NP

This can simply be done by guessing a set of $k$ vertices non deterministically and accept if there are no edges between the vertices.

##### Independent Set is Hard

The strategy is to reduce a 3SAT formula to an IS graph.

In a 3SAT formula, in each clause we can select a "representative" variable to make the clause true. If there is no conflict in the chosen representatives then the formula is satisfiable.

The graph we construct from a formula will contain a vertex for each literal in the formula. All vertices in the same clause will be connected together in a triangle. Additionally variables are connected to their negations:

![[Pasted image 20230414212321.png]]

This graph contains an independent set of 4 vertices if and only if there is a set of representative variables for each clause.

## Hamiltonian Circuit

The [[Intractability-and-Reductions#Problems|Hamiltonian circuit problem]] (HCP) can also be shown to be NP-complete. The best way to do this is to show the directed version of this problem (DHCP) is NP-complete and then show that DHCP reduces HCP.

##### DHCP is Hard

To show this, given a 3 CNF formula with $m$ clauses and $n$ variables, we can create a graph.

For each variable in the 3CNF we create a bidirectional path of length $2m+2$:

![[Pasted image 20230414213338.png]]

Next, connect every "+" and "-" verte to the "+" and "-" vertices in the row below.

![[Pasted image 20230414215409.png]]

Add two additional vertices at the top and bottom of the graph. The bottom most "+" and "-" vertices connect to the bottom most vertex. The bottom most vertex points to the top most vertex. And the top most vertex points to the top most "+" and "-" vertices. This now contains multiple ($2^n$) hamiltonian circuits.

![[Pasted image 20230414215904.png]]

Intuitively, every circuit in the graph represents an assignment. The assignment $x_i$ is true if and only if the last $x_i$ vertex visited was the positive one. For example $x_1$ is positive in this assignment:

![[Pasted image 20230414220257.png]]

For each clause we will add a vertex and each clause is responsible for two columns in our graph (this is why we needed $2m$ nodes).

![[Pasted image 20230414221543.png]]

For each clause, if the variable is positive we connect it to the clause from left to right and if its negative we connect it left to right. If the variable does not appear in the clause there is no connection on the variable's row of vertices.

![[Pasted image 20230414223113.png]]

If we can pick a representative for each clause (satisfying the 3 CNF formula), we can find a hamiltonian circuit in this graph.

The size of this graph is $m*n$ (linear) meaning that it can be constructed in polynomial time.

## Undirected Hamiltonian Circuit is NP-Complete

Reducing DCHP to HCP in polynomial time can be done as follows:

Given a directed graph, all incoming nodes to a given vertex $v$ instead goes into a node $v_{in}$ and all outgoing nodes are preceeded by the node $v_{out}$. For example:

![[Pasted image 20230414225341.png]]

Since this follows from an NP-complete problem, HCP is also NP-complete.

# Questions / Thoughts