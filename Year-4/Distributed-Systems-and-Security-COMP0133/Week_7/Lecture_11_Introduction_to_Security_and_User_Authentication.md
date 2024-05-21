---
id: Lecture_11_Introduction_to_Security_and_User_Authentication
created_date: 21/11/2023
updated_date: 21/11/2023
type: note
links:
  - "[[What-is-Security]]"
  - "[[Intractability-and-Reductions]]"
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Introduction to Security and User Authentication
 
When designing a secure system you need to keep in mind that the system is only as secure as it's weakest point. This is because a smart attacker can just exploit the weakest point to take down the system.

Perfect privacy is not a realistic goal. Given a rich and motivated enough adversary, any secure system can be broken.

**[[What-is-Security|Security]]** is the set of techniques used to control who can access/modify the system. A **Principal** is a unit of accountability in a system (for example a user). **Access Control** is the process of restricting operations to certain principals. **Authentication** is the process of verifying the identity of a principal making a request. **Authorisation** is the granting of request to a principal.

The [[What-is-Security#The CIA Triangle|attacks]] on security include:
* Secrecy: Attacker reads information without authorisation
* Integrity: Attacker modifies data without authorisation
* Denial of Service: Makes system unavailable to legitimate users

The general approach to protecting a system is:
* Figure out what you want to protect and what its worth.
* Figure out what attacks you want to defend against
* State goals and desired properties clearly.
* Structure system with two types of components:
	* Trusted: must operate as expected or there will be a breach.
	* Untrusted: Even if compromised, system should still work
* Minimise the amount of trusted components.
* Analyse the system (preferably have other people who did not design the system perform analysis) and monitor success.

---

In security, a **Policy** is a goal of human intent. Often defined in terms of subjects and objects. A subject is a principal and an object is an abstraction that the principal wants to access/operate. Every object has different kinds of access.

Military Access Control allows any process to read any level of secret data. However that same process can only write to data that is of the same level of secrecy or higher.

### Local User Authentication

At a local terminal the goal is to only allow the file's owner to access a file. Unix's authentication policy assigns each file an "owner". A process can only read that file if the process's owner matches the files owner. Each user has to login to get access to their process using passwords which can be stored on disk only readable by root. 

Typically these passwords are encrypted using a **[[Hash-Functions|cryptographic hash function]]**. This is a function $y = H(x)$ such that:
* $H()$ is preimage-resistant: given $y$ and knowledge of $H()$, it is computationally infeasible to recover $x$.
* $H()$ is second-preimage-resistant: given $y$, it is computationally infeasible to find $z\neq x$ such that $H(x) = H(z)$. 

The output of a hash function is fixed size.

To add security against dictionary attacks is to store both the hash of the password and a random string of bytes, $r$. This $r$ is created by the computer whenever the password entry is created, so the value stored in the file is different on every machine. This is a salted password. A dictionary attack can still happen but it must be done on the same host machine.

### Remote User Authentication

Remote user authentication entails secure communication across a network. The network links connecting computers together can be eavesdropped. Ideally the security scheme should be resistant to **replay attacks**. If Alice sends a message and Eve listens to the message, Eve should not be able to repeat that message and gain access to whatever Alice was requesting.  ^4bb328

**S key** authentication makes use of applying multiple hashes to the message. Only Alice and the server knows the number of times the hash is applied. After using the $n$ applied hash function, the server and Alice will expect/send the message with $n-1$ applications of the hash function. This scheme will need to be refreshed every so often (when $n$ becomes 0).

##### [[Symmetric-key-Crypto|Symmetric Encryption]]

Symmetric key encryption makes use of an encryption and decryption messages. Two parties communicating have a shared key $k$ used for encryption and decryption. The goal is for the attacker to be unable to derive the message $m$ from the cipher $c$ without $k$. The key is known as a one time pad as they are only used once. Decryption and encryption can be carried out by XOR-ing the cipher/message with the OTP. There are two ways of encrypting, [[Symmetric-key-Crypto#Stream Cipher|stream]] and [[Symmetric-key-Crypto#Block Ciphers|block]] ciphers. Messages are verified to have come from the correct source using a [[Message-Authentication-Codes|Message Authentication Code (MAC)]] (although they do not provide provide protection against replay attacks.). [[Hash-Functions#^a4a75c|HMACs]] are MACs constructed using a cryptographic hash function.

**[[Public-key-Crypto|Public Key Encryption]]** makes use of public and private keys to send messages. Messages are deciphered with the private key and encrypted with the public key. The private key acts as an inverse function to the public key, however it is not feasible to compute the private key from the public key. 

Modular arithmetic limits precision - any single arithmetic in a system of $\mod n$, where $n$ is $k$ bits long, the output will at most be $2k$ bits long. Additionally, some operations in modular arithmetic are very difficult, specifically the [[Math-and-Crypotgraphy#Discrete Logarithm (1)|discrete logarithm]] which is what makes public key encryption secure.




# Questions / Thoughts