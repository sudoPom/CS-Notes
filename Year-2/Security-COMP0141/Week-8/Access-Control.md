# Access Control
`Access control` is the ability of one entity to permit or deny the use of a particular resource to another. Authentication is a coarse form of access control but does not control the data a user has access to once authenticated.

File Accesses include:

* Subjects - The users of the system.
* Objects - The resources to be accessed  by the users.
* `Access Rights` - The ability to alter and/or observe objects. These include execute, read, write and append.

![[Pasted image 20220314194028.png]]
Where `OBS` stands for observe and `ALT` is alteration.  

An `Access control matrix`  holds access rights where the first column represents the user and the first row represents objects. The elements of the matrix holds access rights.
![[Pasted image 20220314194205.png]]

A `reference monitor` is in charge for checking access rights whenever somebody tries to interact with an object. There can be deafult behaviour in the event that an elements is not accounted for in the matrix, this can be either block by default or grant access by default.

`Unix permissions` specify access rights as follows:

Each of the following has any combination of read, write or execute (r/w/x):

* Object owner
* Group member
* Everyone else

![[Pasted image 20220514154605.png|350]]

The `root user` generally has access rights to everything. The `sudo (super user do)` command allows users to temporarily run things with elevated privileges. All usage with sudo is logged.  When it comes to execution, for files it means running the file and for directories it means accessing the directory.

A `sticky bit (T)` allows users to rename/delete files in a directory only if you are the owner or root.

## Design Principles
* Least Privilege - Only give people the permissions they need.
* Complete Mediation - `Trusted computing base (TCB)` refers to every component of the system on which the policy relies on. Should keep this as small as possibe.
* Failsafe Default - By default allow only root to access to an object.
* Open Design - Transparent
* Psychological acceptability - People can trust them
* Economy of mechanisms - Scalable

## Types of Access Control
Different services will have different access rights, for example social networks may have a "tag" access right, which requires more information like tagee.

Two Access Control Policies are:
* `mandatory (MAC)` - the permissions are automatically assigned.
* `discretionary (DAC)` - the permissions are set by the owner.
* `role based (RBAC)` - [[Access-Control#^971fa1|role based permissions]]

## Graham-Denning

The `Graham-Denning` approach describes how permissions for objects. 

#### Creation
If alice creates an object she has ownership of the object. If alice creates a subject she is the owner of the subject and has control over things like who can view it etc.

#### Deletion
If alice tries to delete an object/subject then the reference monitor checks to ensure thatshe has "owner" rights of the object/subject.

#### Access Rights
Alice can grant rights to bob if she has ownership of the object. Alice can also transfer rights access control rights from bob to pingu if she has ownership of the object.

Rights can be revoked by alice if she owns the object, as well as checking the rights of a user for that object.

For large systems access rights are based on `roles`, which are just a collection of a users. This is known as `Role based Access Control (RBAC)` and is much more scalable than the other two. ^971fa1 People will shift between roles but roles more or less stay the same.

Access Controls should have no:
* Gaps
* Conflicts between two roles
* Unintended restrictions