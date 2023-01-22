
The **K-sat** problem is the satisfiability problem where each of the clauses has at most $k$ clauses:

$$
\begin{align}
\phi= (i\lor i_2 \lor i_3) \land (i_4\lor i_5 \lor i_6)
\end{align}
$$

If a clause, $C$ has more than $k$ literals we can do the following to reduce it to multiple clauses:
* Let $C = (l_1 \lor l_2 \lor ... \lor l_m)$
* Introduce new variables $x_1,x_{m-1}$ 
* Replace $C$ with:
$$
\begin{align}
G(C) = &(l_1 \lor x_1) \land (\bar{x_1} \lor l_2 \lor x_2) \land (\bar{x_2} \lor l_3 \lor x_3)\land \\ &... \land (\bar{x_{i-1}} \lor l_i \lor x_i) \land \\&... \land (\bar{x_{m-2}} \lor l_{m-1} \lor x_{m-1}) \land (\bar{x_{m-1}} \lor l_m \lor)
\end{align}
$$
The clause is only true when $l_i$ is true when $p_1 = ... = p_{i-1} = T$ and $p_i = ... = p_{m-1} = F$ 

### Correctness
For a formula $\phi$ we can re write each clause in $\phi$ as stated above. If $\phi$ is satisfiable then there exiss an assignment $v$ such that $v(\phi) = T$. However we need to show that $G(\phi)$ is satisfiable to solve the $\text{K-SAT}$ problem. For each clause:
$$
\begin{align}
C = (l_1 \lor l_2 \lor ... \lor l_m)
\end{align}
$$
We need $v(l_i)$ = $T$ for some $i$ with $1 \leq i \leq m$ 