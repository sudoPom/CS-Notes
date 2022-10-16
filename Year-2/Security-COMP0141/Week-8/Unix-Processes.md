`tags:`
[[Access-Control]]

# Unix Processes
`Processes` are isolated - cannot access each others' memory. A process will have a `user ID (uid)` of a specific user. When ran, the process will have access to anything the user with the uid has access to . Processes started by root (uid0) can reduce their privileges by changing to a less privileged uid.

A process will have the following idS:
* `Effective User ID (EUID)` - Determines permissions for the process
* `Real User ID (RUID)` - Determines the user who started the process
* `Saved User ID (SUID)` - EUID prior to any changes

Root is able to change their E/R/SUID whilst unprivileged users can change their EUID to either their RUID or SUID.

`setuid(x)` will change all UIDs 
`seteuid(x)` will change just the EUID.

To prevent unpriviliged users from gaining root priviliges, upon authentication, all their UIDs should be set to their UID.

Users on UNIX are able to set the EUID of an executable to be the file owner using the `setuid bit` command. This allows the user to execute the file with the permissions of the owner. This is denoted with an `s` in the unix access control fields.

### Authenticating a User VIA SSH
* Root authenticates user
* Changes userid and groupid to those of the user (dropping root privileges)
* Executes shell


Pros:
* Simple model that provides adequate protetion
* Flexible enough to make most control access policies possible.
Cons:
* Access control lists are coarse-grained (based on a single factor)
* Can't differentiate processes run by a single user
* Most system operations require root access