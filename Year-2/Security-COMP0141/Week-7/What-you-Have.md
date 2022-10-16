`tags:`
[[Symmetric-key-Crypto]]
[[Message-Authentication-Codes]]

# What you Have
 Authentication using what you have relies on the property of having something that only you will have, and using that to authenticate yourslelf. A `challenge response protocol` can be used to authenticate two users:

 * Alice sends a message to Bob, requesting to authenticate herself.
 * Bob sends a challenge/`nonce` (randomly generated one use value) to Alice. 
 * Alice is then tasked with encrypting the challenge using a key (that is only known by the two of them) and sends the encrypted challenge back.
 * Bob decrypts the cipher using the same key. Alice is authenticated successfully if the result of the decryption gives the original challenge.

This method works well as there is randomness. If Eve was to listen in to one authentication protocol between alice and bob, she cannot just store and use the response alice sends to authenticate to bob as alice due to the challenge being sent by bob being different each time. This is the reason why [[Message-Authentication-Codes]] do not work - they are deterministic.

## Two way Challenge Response
The two way challenge requires both parties to verify that they are who they say they are:

 * Alice sends a message to Bob, requesting to authenticate herself.
 * Bob sends a nonce to Alice. 
 * Alice is then tasked with encrypting the challenge using a key (that is only known by the two of them) and sends the encrypted challenge back.
 * Bob decrypts the cipher using the same key. Alice is authenticated successfully if the result of the decryption gives the original challenge.
 * Alice then sends a nonce to Bob.
 * Bob is tasked to encrypt the message using their shared key.
 * Alice deciphers using the same key, and authenticates Bob if the result of the decryption is equal to the nonce.

This process must be done sequentially in order for it to be secure.