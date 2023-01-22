The word ladder game is defined as follows:
* You start of with a starting word and ending word.
* You need to pick words that differ from the previous word by one letter.
* You win once you reach the target word by following step 2.

We can reach the ending word in $T$ steps where $T \leq |\Sigma^{|S|}|$

A non deterministic proof will work as follows:
![[Pasted image 20221206123006.png]]

This shows that the ladder language is in $NPSpace$.