The word ladder game is defined as follows:
* You start of with a starting word and ending word.
* You need to pick words that differ from the previous word by one letter.
* You win once you reach the target word by following step 2.

We can reach the ending word in $T$ steps where $T \leq |\Sigma^{|S|}|$ as this is the total number of possible words that can be formed in this instance of the ladder game.

![[Pasted image 20230418135419.png]]

A non deterministic proof will work as follows:
![[Pasted image 20221206123006.png]]

This shows that the ladder language is in $NPSPACE$. The only words stored in memory is the words $w$ and $t$, as well as a counte variable.

However this problem is also in $PSPACE$. This is as a DTM could solve this problem in the same way. A way of solving it in NP time can be done by repeat checking if a word is reachable from our starting word in $k/2$ steps and if the same word can reach the target word in $k/2$ steps:

![[Pasted image 20230418141206.png]]

The depth of the recursion is $|s|\log{\Sigma} = O(n)$ and each time we recurse we store a word, $m$, where the size of $m$ is $|s| = O(n)$