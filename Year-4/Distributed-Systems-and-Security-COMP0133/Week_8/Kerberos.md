---
id: Kerberos
created_date: 23/11/2023
updated_date: 23/11/2023
type: note
links: 
---
* **🏷️Tags** : #Distributed-Systems-and-Security-COMP0133 
# Kerberos

Kerberos is an authentication service for open network systems. The goal for Kerberos was to allow a variety of entities using different processes to be authenticated. The authentication was expected to work in an open environment, allowing users to be be super user on their own machine. Additionally, one user can use many different machines - they are not confined to a single workstation. It was also expected to be easy to insert Kerberos into existing systems with other authentication methods.

Kerberos uses private key encryption, which makes use of a one way function applied to a users password to generate the key. The Kerberos database can be hosted on multiple machines, with one machine being the **master**, housing the database on users, and the others being the **slaves** which house read only copies of the database. Timestamps are incorporated to the authentication process to protect against [[Lecture_11_Introduction_to_Security_and_User_Authentication#^4bb328|replay attacks]].

Kerberos keeps a database of all principals and their private keys (Initially a 56 bit DES) - only Kerberos and the principal knows of the private key. For users (people) using Kerberos, the private key is an encrypted password. Kerberos also generates **sessions keys** which are temporary and are used for the encrypted communication between two principals. The expiry date of the keys are also stored. A principal can be a user, workstation or service.

Client names consist of:
* A primary name (username or workstation name)
* An instance (NULL/admin/mail, etc) essentially allowing a user to have a different keys for different modes of work. In the case of service the instance is typically the workstation the service is running on. Instances are optional.
* A Realm
and are of the form `name.instance@realm`

Kerberos allows three levels of security:
* Authenticate on joining the network
* Authenticate on sending messages
* Authenticate on sending messages AND encrypt messages.

Less sensitive information stored about a user is stored on a separate server, **Hesiod**, allowing more sensitive information (passwords) to be handled with a higher security than less sensitive information.

Kerberos makes use of two types of credentials: tickets and authenticators. Both are based on private key encryption but each use different keys. The **ticket** is used to pass the identity of the principal between the authentication server and the end server. It also contains part of the information used to validate that the ticket actually belongs to the sender of the ticket. The **authenticator** contains the remaining information needed to verify the identity of the sender of the ticket. For a client to talk to a server, it must have a shared session key and a ticket for that server.

A ticket contains:
* The server's name
* The client's name
* The address of the client
* A timestamp
* A lifetime 
* A session key between the client and the server.

Tickets are encrypted using the private key of the server. Once a ticket is issued it can be used multiple times by the client until the ticket expires. The client cannot see what is inside the ticket but can forward it to the server, which can read the ticket.

The longer a ticket is valid the less frequently the user needs to retype their password additionally the amount of client requests for re generating tickets is reduced, however this means that the period in which a ticket can be stolen is lengthened.

An authenticator on the other hand can only be used once by the client, and contains:
* The client name
* The address of the client
* The current client's timestamp

Authenticators are encrypted with the session key that is part of the ticket. (Note that the client cannot get the session key from the ticket)

##### Obtaining the First Ticket

The user first enters their username into their workstation. Their workstation then sends a message to Kerberos containing their username and the name of the ticket granting server. The ticket granting server runs on top of the central Kerberos database.

If Kerberos knows of the client, it sends back a response containing a ticket between the client and the ticket granting service encrypted with the ticket granting server's key and a session key between the client and ticket granting server. The entire message is encrypted using the client's private key - derived from the user's password.

The user is then asked for their password which converted to a DES key ($H(password)$) and used to decrypt the message. With the contents of the message the user is able to provide proof of identity for the lifetime of the ticket.

##### Obtaining a Ticket for a Server

To obtain a ticket for a server, the client will already have the ticket for the ticket granting service. The client sends a message to the ticket granting server which contains the name of the server, the ticket granting service ticket encrypted with the ticket granting server's key and the client's Authenticator, encrypted with the session key between the ticket granting server and the client.

If the authenticator and ticket match up the ticket granting server sends back a ticket granting the client access to the server, encrypted with the server's private key, and a session key between the server and the client. The entire response is encrypted with the session key between the client and the ticket granting service. The lifetime of the ticket is the minimum between the default time set by the system and the time remaining on the ticket granting server ticket.

##### Making a Request to a Service

To make a request to a server, the client sends its Authenticator, encrypted with the session key between the client and the server as well as the ticket granting the client access to the server, which is encrypted with the servers private key.

Once received, the server decrypts the ticket and uses the session key inside the ticket to decrypt the authenticator. If they match, the request proceeds.

Clocks are expected to be synchronised within a few minutes of each other, so if a request appears to have been significantly delayed (more than a few minutes), the request is dropped as it is suspected of being part of a [[Lecture_11_Introduction_to_Security_and_User_Authentication#^4bb328|replay attack]]. The timestamps of past requests are also kept track of, allowing requests with the same ticket and timestamp received to be dropped, thwarting more replay attacks.

A server can verify itself by sending a response back containing the timestamp contained in the ticket + 1 back to the client, encrypting the message in the session key.

These operations only require read only access to the Kerberos database and can therefore be ran on any machine that has a read only copy of the database.

#### Kerberos Database Management Service

Requests to change the password of a system has to be carried out on the master machine, which has write access. The service that handles these changes is called the Kerberos Database Management Service (KDBM). The client side program for changing passwords is called `kpasswd` whilst the admin program used for managing the principals stored in the database is called `kadmin`. 

Tickets to make requests to this service are given in the same way that tickets to the ticket granting service are. This is done to force the user to enter a password whenever making these changes. If a change is requested to be made, the service checks to see if the user making the request matches the target user of the request. If they don't match, the service checks an access control list, if the sender of the request is not on the list, the request is denied (only admins can change details about another user). All requests made are logged.

Kerberos replicates it's data by simply dumping it all to the slave machines every hour. The checksum of the data is first sent to all slaves using the `kprop` program. The entirety of the data is then sent with the `kpropd` command. The checksum is calculated and compared with the previously received checksum, if they match, the slave updates its record of data. The checksum is encrypted with the master key, which is known to all slaves.

The passwords are encrypted using the master's key, so the data does not need to be encrypted prior to sending it.

---

Kerberos keys are destroyed whenever a user logs out of their workstation. If a user's session lasts longer than the lifetime of the ticket granting service ticket, the next time they make a request to a Kerberos authenticated service, the request will fail since the ticket would have expired. A new ticket can be granted with a new ticket with `kinit` (which requires a password). 

Programmers will need to make use of the `krb_mk_req` and `krb_rd_req` to perform authentication when making and reading requests.

---

Kerberos was still vulnerable to replay attacks because by default, any request made in the last 5 minutes was accepted. Kerberos also expects nodes to have synchronised clocks, so if attacker is able to change the server's clock tickets that should be expired will can still be accepted. Tickets are stored on disk, which could be physically extracted. The database having all of the user keys means that only that server needs to be compromised for the entire system to be compromised.

For large administrative realms, realm wide admins are on the critical path meaning that a lot of requests need to go through them (adding new users, setting up new servers). Users cannot develop new services or upgrade software/protocols without central admins. Essentially central admins have a monopoly on services/servers.

Ticket expirations can also cause problems when running long running background jobs. 



# Questions / Thoughts