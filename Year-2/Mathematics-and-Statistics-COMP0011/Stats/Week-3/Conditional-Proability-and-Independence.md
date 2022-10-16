# Conditional Probability and Independence
`Conditional Probability` refers to the probability of an event $E_1$ occuring given that $E_2$ has occured.
$$
P(E_1|E_2) = \frac{P(E_1\land E_2)}{P(E_2)}
$$
Two events, $E_1,E_2$ are considered `independant` if the $E_1$ is not affected by $E_2$.
$$
P(E_1\land E_2) = P(E_1)P(E_2)
$$
or
$$
P(E_1|E_2) = P(E_1)
$$
`Bayes Theorem` allows the computation of $P(E_1|E_2)$ given $P(E_2|E_1)$.

![[Pasted image 20220128204145.png]]

The `law of total probability` states that if $E_1,...E_n$ is a collection of mutually exclusive events such that $E \superset E_1\lor E_2 \lor ... \lor E_n$ then:

$$
P(E) = \sum^n_i{P(E\lor E_i)}
$$
or

$$
P(E) = \sum^n_i{P(E| E_i)P(E_i)}
$$

## Intersection of Three Independant Events
This can be done similarly to how the intersection of two events can be calculated, if you group the first two events as one event:

![[Pasted image 20220128210058.png]]

Intuitively this means that the probability of three events happening is equal to the probability that:
* The first event happens multiplied by
* The probability that the second event happens, given that the first event happens multiplied by
* The probability that the third event happens given that both the first and second events happen.
## Union of Three Independent Events
By adding up the probabilities of each event, we count each intersection between each of the pairs of events twice, meaning we need to subtract each of these once. We then need to add the intersection of all three of the events happening, as this is included in the probabiliity of any pair of events occuring, which we subtracted a total of three times: 

![[Pasted image 20220128211106.png]]

If the events are mutually exclusive then the union of these events is just the sum of their probabilities.