# Decidability and Recognizability
A `decision problem` consists of a yes or no question and a set of data which can be processed in some way to answer said question. Turing machines can encode a decision problem as the characteristic function of a formal language

#### Formal Language
Given an alphabet (a set of symbols) $\Sigma$, a formal language is a subset of $\Sigma^*$. The `Characteristic Function` of a language $L$ takes in a string formed from the alphabet and returns a 1 or a 0 depending on whether that string belongs to the language $L$.

$$
\begin{align}
\chi_L : \Sigma^* \to \{0, 1\}
\end{align}
$$
$$
\begin{align}
\chi_L(x) = 
\begin{cases}
1 && if~~ x\in L\\
0 && otherwise
\end{cases}
\end{align}
$$
#### Encoding
An encoding scheme takes in the data, $\alpha$, of a decision problem and converts it into a string $code(\alpha)$ that is within an alphabet.

The language, $L$, encoding the decision problem will be:

$$
\begin{align}
L = \{x\in\Sigma^* | x = code(\alpha)\}
\end{align}
$$
Where $\alpha$ is some form of data and $\alpha$ is a yes instance of the problem.
* If $\alpha \neq \beta$ then $code(\alpha) \neq code(\beta)$
* We should be able to check if $x\in \Sigma^*$ is $code(\alpha)$ for some $\alpha$.
* We should be able to retrieve $\alpha$ from $code(\alpha)$

### Turing Machines and Decision Problems
For a turing machine to solve a decision problem we need:
* An encoding of a decision probblem as a language, $L$ over and alphabet $\Sigma^\prime$.
* The turing machine, $M$ with the following properties:
	* The input/output alphabet  $\Sigma_|$ is $\Sigma^\prime$
	* The set of halting states is $H=\set{Y,N}$ 
* For a given input $x\in\Sigma_|^*$ the turing machine $M$ halts in state $Y$ if it accept $x$ and halts in state $N$ if it rejects $x$.

#### Decidability
$M$ `decides` $L$ if:
* When $x \in L$ then $M$ accepts $x$
* When $x \notin L$ then $M$ rejects $x$
A language (decision problem) is decidable if there is a Turing Machine that decides it. It will never loop on any input.

Decidable can also be said to be `Recursive` or `Computable`.

#### Recognisability
A turing machine $M$ `recognises` $L$ if
* When $x\in L$ then $M$ halts. It doesn't matter what state it halts in.
* When $x\notin L$ then $M$ failts to halt.
A Language (decision problem) is recognisable if there is a Turing machine that recognises it.

Recognisable can also be said to be `Recursively Enumerable` or `Computably Enumerable`.

All decidable languages are recognisable.

### Chomsky Hierarchy 

^a5a6f0

![[Pasted image 20221010171429.png]] ^47dd17
