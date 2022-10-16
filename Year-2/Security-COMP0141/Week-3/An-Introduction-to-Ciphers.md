 # An Introduction to Ciphers
Confidentiality is achieved by either keeping communication secret or establishing a basis for secure communication (usually done by encryption) or both. A method of cryptography is either secure, or insecure - it is not a spectrum.
## Terminology
* A `cryptographer` is someone who makes cryptography. 
* Someone who breaks cryptography is known as a `cryptoanalyst`. 
* In cryptography, `code` is a semantic translation. Essentially a mapping from one piece of information to another.
* When regular plain text is encrypted it is known as `ciphertext`.

### Threat  Model
The motivation of an adversary may be to:
* Recover the key for encryption, allowing them to decipher all future plain texts.
* Decipher a single instance of plain text.
* Distinguish a plaintext from others, i.e which encrypted infor represents the details of the president of the united states amongst all other US citizens.

If any of these are possible given a cryptographic scheme, then the scheme is said to be insecure.

Adversaries should be expected to:
* Have access to the cipher text. *(Weakest)*
* Be aware of the algorithm/scheme used to encrypt the plaintext.
* Know some background information on the plaintext, for example what format the text will be in. 
* The adversary can encrypt / decrypt certain plaintexts/ciphertexts. *(Strongest)*

The goal is to develop a cryptographic scheme where the adversary with the strongest capabilities cannot even achieve the weakest goal.


## Monoalphabetic Substitution 

`Monoalphabetic Substitution` ciphers apply a permutation on a set of symbols and applies some permutation some examples of these include:
* Caesar Shift Cipher: Every character in the alphabet is shifted by $n$ characters in order to get the cipher text.
* Pigpen Cipher 
![[Screenshot_20220512_141230.png]]
*  Adventure of the dancing men

##### Frequency Analysis
The frequency of the most commonly used letter in the cipher text is preserved across monoalphabetic ciphers. So using the most common letters of the english alphabet and the most common letters in the cipher, the key of the cipher can be determined.

##### Repeated/Common words
Repeated phrases are preserved under a given monoalphabetic ciphers.


### Polyalphabetic Substitution
The `Vigenere Cipher` is an extension of the caeser cipher, where each letter in the plaintext is encrypted with a different caeser cipher key.
For example for the plaintext "Hi Alice" and key "secret":

$$
\begin{align}
\text{H maps to } ~ \text{Z}\\
\text{i maps to } ~ \text{m}\\
\text{A maps to } ~ \text{C}\\
etc
\end{align}
$$

This makes decryption less easy since frequency isn't as preserved. 

This is an example of a `polyalphabetic substitution` which maps a permutation of a set of characters to another permutation of the same set of characters. Frequencies are still present and phrases can still be preserved depending on the spacing of the phrases and the length of the key. A solution to this is to just have an extemely long key. Which is not scalable.

### Running Key Cipher
The running key cipher works as follows:
* Split the plaintext into blocks
* A cipher is generated for each block of plaintext.

The same problem remains and can again be solved by using an extremely long key. 

#### One time Pad
Assuming we did have a long key (one as long as the plaintext) this encryption is "perfect" and is known as a `one time pad`. Any plaintext could map to any ciphertext, meaning that the adversary cannot even find one bit of the plaintext. The only problem with this is that the key has to be extremely long. 