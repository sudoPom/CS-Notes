---
id: Lecture_14_SSL_and_TLS
created_date: 30/11/2023
updated_date: 30/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Secure Socket Layer and Transport Layer Security

TLS (Transport Layer Security) is the "evolved" version of SSL (Secure Socket Layer). SSL/TLS addresses the problem between two clients who do not previously know each (no shared key) other wanting to authenticate themselves - i.e. ensure they are speaking to who they think they are.

For example, when communicating with an online shop, a client wants to make sure they share bank details with the online shop server and not some adversary. An adversary could impersonate a server by putting themselves in between the communication between the server and act as a proxy.

To solve this, clients need to be able to find a way of ensuring that the keys used for authentication belong to the server. Previously, keys were exchanged in person but this required people to meet in person (yucky). People additionally could hand off someones public key on behalf of them (**web of trust**).

###### Offline Certificate Authorities

The idea behind certificate authorities (CAs) is to use digital signatures to represent the endorsement of binding between a principals name and their public key. **Certificate Authorities** are third party organisations that are trusted by the parties that wish to mutually authenticate. Every CA has a public and private key pair and they can create a certificate $C_S$ for server $S$ containing:
* Information about the server (URL, organisation name, etc), Public key of server $S$ ($K_S$), expiration date and the CA's name
* Cryptographic hash of the info field, encrypted using the CAs private key.

The server $S$ can present this certificate to clients that wish to communicate with it. If the client knows the public key of the CA, then it can validate that the CA trusts the server. If the client trusts the CA and the CA trusts server $S$ then the client can also trust the $S$.

CAs do not need to be online during authentication, it just needs to present certificates to a server once for the server to be able to authenticate itself. When a web browser is installed it has CAs pre-configured. All browsers trust the CA and know the CA's public key.

###### Old SSL (3.0) Handshake Using RSA

The client sends a "hello" message containing:
* Highest version of SSL that the client supports
* Client Random bits
* List of all ciphers supported by the browser. (Different ciphers had different key lengths. "Military grade" (at the time) used to be illegal for exporting out of the US)

The server then sends a matching "hello" message containing the same information as the client. Additionally the server sends a list of all of its certificates from different CAs. This is to allow clients to validate using any CA that they "trust".

The client validates the server using any CA that it chooses, to ensure it has the correct public key of the server. The client generates the "pre_master_secret" bits and sends them to the server using the public key of the server. The client then sends the "change cipher spec" message to the server containing a cipher that both it and the server supports. Lastly the client sends a "finished" message containing a MAC of the "master secret" and all the messages previously sent in the handshake concatenated together to the server.

The server then sends a change cipher spec as well as the same MAC'd finished message.

This handshake is not secure without the finished message as it is vulnerable to [[Digital-Signatures#^1a6567|man in the middle]] attack. An attacker could intercept the client cipher list and replace it with ciphers that the client doesn't support (or the null cipher). The MAC ensures that the messages are what the client and servers saw, if there is a mismatch then the handshake is aborted.

During this process the session keys are constructed using the client and server random bits as well the pre master secret. This outputs the master secret which is the set of all session keys. The keys generated include:
* Client and Server MAC keys
* Client and Server write keys
* Client and Server Initialisation Vectors

Each SSL record (block) is MACd and includes a sequence number (where in the overall message the packet belongs), the length of the data and the content of the message for that block. The length of the data is required as the data is often padded. SSL 2.0 did not MAC data length, only the padded data. This means that an attacker could modify the data length field to truncate the data received by the receiver. 

###### Properties of SSL

An eavesdropper cannot decrypt any data since the pre master secret is encrypted using the servers public key and therefore can only be decrypted by the server, which has its own private key.

After the handshake, the client can be sure that every message received from the server IS from the server.

The client can be authenticated by the server through the use of client certificates. However most servers don't do this. They just use usernames and passwords and ask users to send them over SSL and TLS.

The server random prevents replay attacks. The MAC also prevent replay attacks of data from earlier in the session. A fake server cannot impersonate a new one since it doesn't have the real servers private key.

Browsers need to check that the name in the certificate matches the name in the URL, as a fake server with the same domain name as a real server could be verified on the CA.

---

Suppose some attacker records (potentially encrypted) data from communications between a server and client. Then suppose that at a later time the attacker obtains the server's private key. If an attacker cannot decrypt data from the previously recorded data, then the scheme used by the client and server provides **Forward Secrecy**.

---

SSL 3.0 with RSA does not provide forward secrecy.

###### More on CAs

Certificates (from VeriSign in the 2000s) can be obtained by simply paying a CA money. A DBA license could also be purchased for a cheaper price from a city hall. A letterhead from the company as well as a notarised document (drivers license) is also needed.

Nowadays CAs are more stringent with purchasing certificates, for instance emailing registered domain name contacts. 

###### TLS 1.3

TLS 1.3 reduces the round trip time of the handshake from 2 to 1. This is done by the client "guessing" the cipher suite of the server. Additionally, parties that have previously communicated supports resumption of TLS connection in 0 round trips. This however does not protect against replay attacks and so the server must protect itself against replay attacks. TLS eliminates the RSA handshake.



# Questions / Thoughts