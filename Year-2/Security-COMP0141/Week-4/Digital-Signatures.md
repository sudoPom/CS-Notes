# Introduction to Integrity and Digital Signatures
`Integrity` in security involves knowing that the system and data have not been improperly altered. 

A `Man-in-the-Middle attack` occurs when the adversary intercepts the communication between two people. This is an active attack since it breaks the communication protocol. Communicators should be able to guarantee that the messages they are recieving comes from who they think it is - they should be able to validate the integrity of the messages they are recieving.

![[Screenshot_20220512_174058.png]]
The evesdropper pretends to be Bob with Alice and Alice with Bob.

# Digital Signatures
A `digital signature` is a signature $\sigma$ generated from the message being sent and the users secret key. Upon recieving the message the recipient can verify the signature using the sender's public key, the signature and the message. If the verification passes then the message is authentic and has not been intercepted.

![[Pasted image 20220201132500.png]]

The algorithm for data signatures should be:
* Correct - Valid signatures using valid keys will verify properly. For all $k,m\in [KeyGen(1^k)]$ and all $(pk,sk)$ pairs, $Verify(pk, m, Sign(sk,m)) == 1$
* Unforgeable (Existential Unforgeabliity - Chosen Message Attack or EUF-CMA) - Given a public key the adversary cannot produce a valid signature. $KeyGen(1^k)\to(pk,sk)$. 
Where $KeyGen(1^k)$ means generation of keys that are $k$ bits long.



## Threat Model
#### Motivation
* Recover key: sign all future messages.
* Forge Signature: pretend to be someone else

#### Capabilities 
* Known algorithm: knows how the message is signed.
* Known Signature: Partial information about signature
* Known message: Adversary picked messages which they can recieve the signature back using some oracle.

Again, the goal is to provide a signing scheme such that the adversary with the strongest capabilities cannot achieve the weakest goal.

### Textbook RSA for Digital Signatures
#### Keygen
Keygen is done in the same way it is as stated in [[Year-2/Security-COMP0141/Week-3/Public-key-Crypto|public key crypto]]:
* $N = pq$ where $p,q$ are large prime numbers (usually 2048 bits or longer)
* $e,d$ are two numbers such that $ed = 1 \mod{(p-1)(q-1)}$
* Private key = $sk = (N,d)$
* Public key = $pk = (N,e)$

#### Signing 
The signature is generated with:
$\sigma = m^d \mod{N}$

#### Verification
The signature can be checked using $\sigma^{e}$ If this is equal to $m \mod{N}$ then the signature is valid and therefore the message has not been intercepted

### Security
Textbook RSA is not EUF-CMA safe since if an adversary obtains two messages $m_1,m_2$ and the signatures for those messages, $\sigma_1, \sigma_2$ then the adversay can create a new signature for the message $m_1m_2$, which will just be $\sigma_1\sigma_2$ due to the homomorphic properties of the RSA.

## Improved Diffie-Hellman Algorithm
Recalling that the Diffie-Hellman Algorithm works like so:

![[Symmetric-key-Crypto#Diffie-Hellman key exchange]]

Now instead of just sending $A/B$, the signature of Alice and Bob under messages $A$ and $B$ can also be sent, which can be used to ensure the message is authentic.