For a given turing machine $M$ that has time ans space complexities $T(n)$ and $S(n)$ there exists a universal turing machine, $U$ that can simulate $M$ in $O(T(n)\log{(T(n))})$ time and $O(S(n))$ space.

A function $S(n)$ is space constructible if it can be computed within $S(n)$ space. 

For any space constructible function $S(n)$ it can be shown that $SPACE(o(S(n))) \subsetneq SPACE(S(n))$:

![[Pasted image 20230418210556.png]]