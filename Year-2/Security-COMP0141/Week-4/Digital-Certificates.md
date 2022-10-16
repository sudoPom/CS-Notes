# Digital Certificates
`Digital Certificates` give information about a secure website, such as the protocols, digital signatures and encryption algorithms the webpage uses, under what domains the certificate is valid for and it's public key.

When communicating with someone you follow a series of steps called `Transport Layer Security / Secure Socket Layer (TLS/SSL)`

#### Process
* Agree on the algorithms to be used during communication (`cipher suite`)
* Validate the certificate
	This is done by checking the hash of the certificate or the 
 fingerprint. This fingerprint is then verified by using the public key of a certificate authority, the services' public key and the fingerprint. 
 * Establish a session key 
	Client sends a session key securely using public-private key encryption to the service.
* Session key is used to communicate with service using [[Message-Authentication-Codes#Authenticated Encryption AEAD|AEAD]]
TLS is the standard for secure communication with SSL being the predecessor. 

Certificates need to be signed by a trusted certificate authority. Certificate authority keys are stored on web browsers. This is known as the `X.509 standard`. 