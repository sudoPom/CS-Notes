# Using Encryption

## Encryption Across the Internet

When recieving content from a server we typically want the packets to be encrypted so attackers cannot read your web traffic.

`Session keys` can be used when communicationg online, which makes use of the senders public key, this is known as `Hybrid Encryption` - a combination of [[Public-key-Crypto|symmetric]] and [[Symmetric-key-Crypto|asymmetric]] cryptography.

#### Process
* Alice sends an encrypted `session key` to Bob using Bob's public key $pk_b$.
* Bob decrypts the session key using their private key, $sk_b$.
* The session key is now used as a symmetric key as communication between Alice and Bob.
 
 Hybrid Encryption still leaves IP addresses visible, since they are required in routing. 
 Using `proxies`, or `onion routing` can prevent people from evesdropping. Side channels can still attack the communicators messages, eg: the reciever may have malware on their device or has some other way of retriving the key from the endpoint of the message.

All forms of encryption assumes that the private information cannot be obtained through side channels such as:
* timing
* power draw - measuring the influences of power consumption of the device - inferring the activity the device is being used for.
* acoustics - measuring the sounds produced by a device. (This can include typing)

 ## Using Encryption
 `Hyper text transfer protocol Secure (HTTPS)` is a protocol in which web traffic from the host is encrypted. As time went on, browsers indicate when a page is not secure (not encrypted) rather than just notifying you that the page is secure. This is because that positive indicators are less likely to protect users than negative indicators.