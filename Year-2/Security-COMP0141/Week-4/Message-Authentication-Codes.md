# Message Authentication Codes 
`Message authentication codes (MACs)` are the symmetric key equivalent of [[Digital-Signatures|digital signatures]].

Person A generates a tag $t$ on a message $m$ and secret key $sk$ and sends the message, alongside the tag. Person B uses the shared secret key $sk$, the message and the tag to verify that the message is authentic. 

![[Pasted image 20220201140238.png]]

The generation of tags = $MAC(m,k)$ should be:
* Correct $Verify(MAC(m,k), m, k) == 1$
* Unforgeable - Without $k$ it should be very hard to genetate $t$

## MACS from AES-CBC Encryption
AES-CBC Encryption works by:
* Splitting the plaintext into blocks
* XOR the plaintext and the initialisaion vector.
* Encrypt the result using a key and block cipher encryption.
* Repeat the process for each block, XORing with the previously generated cipher text rather than the initialisation vector.

For generating MACs the same process is done with two differences:
* The initialisation vector is fixed (tags should be deterministic) 
* Only the last block of the message is used as the tag.

## Authenticated Encryption (AEAD)
Combining both encryption and MACS will prevent adversaries from evesdropping and from impersonating one another. There are three ways of carrying out AEAD:
* Encrypt-and-MAC - Send the encrypted message and the tag generated from the MAC. (Insecure)
* Encrypt-then-MAC - encrypt the message and send the tag of the ciphertext.
* MAC-then-Encrypt - generate the tag from the MAC, concatenate this to the message and send the encryption of this.

### Threat Model
#### Motivation
* Recover key, to learn all future plaintexts
* Recover the plaintext
* Distinguish plaintext, learn a single bit of the plaintext
* Forge plaintext - ciphertext decrypts to plaintext never encrypted by sender

#### Capabilities
* Known algorithm - knowing which schemes used to encrypt or generate MAC
* Known ciphertext - (partial) information about ciphertext
* Chosen message - adversary picked messages
* Chosen ciphertext - adversary picked ciphertexts