 # Hash Functions
A `hash function` takes in a string of potentially infinite length and shrinks it down to a string of fixed length. 

Hash Functions should be:
* Unique to the initial string - hash functions *should* aim to be one to one. It's not possible to guarantee they will be unique, but there should be a very low chance that a collision occurs.
* Sensitive/uniformity: A small change to the input string should drastically alter the output string.
## Merkle Damgard 
The `merkle dangard` construct is used for all hash functions and works as follows:

To hash some input, the input is split into blocks and then that input is split into blocks, and processed individually. The length of each block will be of equal length $m$. Some function will then be applied on each block. The function takes as an input, the current block and the output of the last block. The output of the last block is the hashed input and one of the inputs of the first function is an `initialisation vector`.

## Cryptographic Hash Functions
Cryptographic hash functions should abide by the following constraints:
* Pre-image resistance: Given the output of the hash function $h$, it is hard to find the message $m$ such that $H(m) = h$.
* Collision resistance: Hard to find messages two different messages $x,y$ such that $H(x) = H(y)$. 

## Collision Attacks
A collision attack involves finding two different messages that have the same hash value. This can be found relatively quickly. For a hash function that gives an $n$ bit hash value, an attacker has an almost 40 percent chance to find a collision after $\sqrt{2^n}$ hash evaluations, (birthday paradox).

## Hash Function Applications
* Checksum - Used to detect errors introduced by humans or for corruption when transmitting large files.
* (H)MACs - Constructs a [[Message-Authentication-Codes|MAC]] using a hash function:
	$HMAC(k,m) = H(k\oplus opad || H(k\oplus ipad || m ))$ 
	Where $ipad,opad$ are fixed strings and $k$ is the key. ^a4a75c
* Blockchains:
	Hashes are computed by splitting data into blocks and performing hashes on the current block concattenated with the hash of the block before it.

HMACS are liable to length extension attacks if done incorrectly:
$HMAC(k,m) = H(k || m)$

This works as the the $HMAC(k,m)$ can just be fed back into the  function with an additional string concatenated to it (extending it's length) and the value produced will be a valid MAC.