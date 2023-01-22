A **universal program** treats other programs as meaningful inputs and runs them. For example operating systems takes in executables as programs and files as input (Microsoft Word and .doc files) and allows us to execute the program and see a result. A universal machine is **programmable** to be able to solve any algorithmical task.

A universal turing machine takes a strin $y$ as input. It first checks whether $y$ is the encoding of a turing machine $M$ and of a string $x$ in the alphabet $\Sigma_|$ of $M$. If this is the case, the UTM simulates the action of $M$ on $x$.

![[Pasted image 20221018122728.png]]

When we say simulate, we mean that the UTM will yield the same output as the turing machine $M$ on the same input.

### Encoding A Turing Machine
$code$ is a function that will translate a turing machine into a string over the alphabet $\set{0,1}$. Recall the definition of a turing machine:

![[Turing-Machines#^184f03]]

The special symbols (blank, start, left and right) also need to be encoded. The $ith$ state and action can be encoded with the $1$ character $i+1$ times. A single tuple of the transition function can then be encoded by delimiting each state, symbol and action with a $0$.

![[Pasted image 20221018123350.png]]

Similarly the entire transition function can be encoded by delimiting the code of each tuple with another $0$ symbol (this means there will be two zeros delimiting each tuple).

![[Pasted image 20221018123542.png]]

Halting states are identified by never occuring in the first position of a tuple.

For example for two tuples:
$$
\begin{align}
code(t_1) = 10101101110\\
code(t_2) = 10110101110
\end{align}
$$
The transition function would look like this:
$$
\begin{align}
code(\delta) = 10101101110010110101110
\end{align}
$$

Different machines can have different encodings but will still be able to do the same job. Additionally the encoding is 1-1, meaning that two different machines are encoded to different strings. Furthermore it is possible to **decide** if a given string is an encoding of a turing machine.

### Defining a UTM using a TM

A UTM is defined as a three tape turing machine where:
* Tape 1 will maintain the tape of $M$ in encoded form
* Tape 2 will maintain the $code(M)$
* Tape 3 will maintain the current state of $M$ in encoded form

Simulation follows the steps:
* Check if $y = code(M)code(x)$ for some TM $M$ and input $x$. If not loop, if yes the tape 1 contains $code(M)code(x)$.
* Move $code(M)$ from tape 1 to tape 2.
* Shift $code(x)$ on tape 1 to the left and precede it with $code(\rhd)0code(blank)0$. Now tape 1 contains the starting tape of $M$ on input $x$, in encoded form.
* Write $code(q_0)$ on tape 3
* Place head 1 at encoded blank before $code(x)$, head 2 at the start of $code(M)$ and head three at the start of $code(q_0)$

