---
id: Lecture_12_Cryptographic_Primitives_II
created_date: 21/11/2023
updated_date: 21/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Cryptographic Primitives II

There are ways in which RSA can be misused which breaks secrecy.

Lets say a company encrypts documents with RSA. If an employee dies the company should be able to decrypt the documents to ensure business continuity. The company could naively use a public key and requires employees to encrypt documents with this key. Lets then say that employee A encrypts a top secret document with the public key.
* Some outsider E could take the cipher text of the document $c=m^e \mod n$
* E then computes $c^\prime = c2^e \mod n$ and has it stored in the company.
* Company releases the decryption $(c2^e)^d mod n = 2m$ to employee F.
* F and E can then use the inverse euclidean algorithm to get $m$.

In modular arithmetic, exponentiation does not raise the power of a message, it acts as a permutation. RSA does not guarantee non invert-ability for individual parts of the message/cipher.

To avoid problems with the multiplicative property of RSA some transform properties should be included:
* Randomness: The plaintext input to RSA multiple times should provide a different cipher.
* Redundancy: Make most strings invalid ciphertexts
* Entanglement: Knowing partial information about input to RSA should not reveal anything from the message.
* Invertability: The cipher should be decryptable. 

RSA allows the computation of [[Digital-Signatures|digital signatures]]. 

Public key encryption is more expensive than symmetric key encryption (by about 100 times). So public key tends to be used for signatures and short messages only.

**Hybrid cryptography** makes use of both public and symmetric key cryptography. The symmetric key is generated on one end and sent across the network to the other end using public key encryption. Communication is then carried out using the symmetric key.

**The key provenance problem** involves a middleman attack where the attacker gives the client their own public key, rather than the client receiving the public key of the server. The attacker can then pretend to be the server and act as a proxy to the server. 
# Questions / Thoughts