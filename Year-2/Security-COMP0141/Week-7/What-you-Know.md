# What you Know
While certificates are used to authenticate servers, `passwords` are used to authenticate users. There are three ways to authenticate users:
* [[What-you-Know|What the user knows]]
* [[What-you-Have|What the users have]]
* [[Who-you-Are|Who the user is]]

Servers store passwords by storing them into a database. However to make sure that nobody that shouldn't know the passwords stored in the database finds out about them, the haashed passwords are stored. 

The problem with plain hashes is that if multiple users have the same password, the hashes will be the same. 

A rainbow table is a type of `dictionary attack` that uses the hashes of common passwords and their hashes, and these hashes are compared to the hashed values of the passwords stored on the server.

Remotely, attacks like this will not work as most services restrict the amount of times you can enter a password before locking the user out temporarily.

`DES encryption` can be used as a hash function. A password is used as an encryption key to encrypt the NULL string, truncating passwords to 8 characters. This is repeated 25 times to slow down the speed of brute force attacks. This is not super effective again due to people using common passwords.


 ## Salting 
 
A `salt` can be stored alongside with the username and the hash of the salt concatenated to the password. This means that hashes (should) be unique even if the passwords are identical.

###### Unix
Old unix passwords uses `DES` encryption which encrypts the `NULL` string using the password as a key (after truncating the password to 8 key). This is done 25 times for artificial slowdown which slows down brute force attacks. This is not as good as a hash function as passwords do not tend to be random and therefore the encryption will provide multiple ciphertexts.

In modern unix systems, passwords stored in the /etc/shadow directory store passwords in the form:

$$ID\$salt\$hash$$
Where $ID$ is the standard of hashing method. $salt$ is a random number, different for every user and $hash$ is the result of the hash function.

| $ID$   | $salt$ | $hash$        |     
| ------ | ------ | ------------- |
| $id_1$ | $s_1$  | $H(p_1++s_2)$ |

Where $ID$ is the method of encryption and the $hash$ is the result of hashing the $salt$ and the password.

Salts protect against attackers since each password can have as many hash values as there are salt values.  

### Authentication as a user
When authenticating the user a system should:
* Unaided recall
* Recall and entry must be completely correct (should not allow users in even if they just miss one character)
* No corrective feedback (Notifying the user that $n$ characters are incorrect)

##### Coping mechanisms for password based authentication
* Writing down passwords
* Re-using the same or a small set of passwords
* Relying on the reset functionality

### Additional authentication methods
In case the user forgets their password, some services will ask a "security question" which is a question that the user answered earlier and *should* be known just by then. These don't work as well as passwords as relatives and friends are likely to know the answer to these questions.