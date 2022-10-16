# Security Principles

The term `security` describes techniques (security mechanisms) that control that who may use or modify the computer or the information contained in it.

`security principles` guide the design and contribute to an implementation without security flaws.

## The Design Principles

The 8 design principles are:

### Least privilege
Only give users the minimum privileges needed to perform the task they want to carry out. For example a group of users that need to read files should only have permissions to read files, nothing more.
### Separation of responsibilities
Have multiple people who are responsible for a manageable amount of tasks to ensure that a single person cannot (accidentally or maliciously) destroy the systems security.
### Complete mediation
Tightly control access to objects that we want to be kept secure. For example, when reading a private file, it is best practice to check authentication when someone tries to access the file every time. (Within reason)
### Fail-safe default
Ensure that the default setting for a system is good for security. For example, by default, when accessing the internet, by default only white-listed sites may be accessible rather than using a user's (empty) black list. (Within reason)
### Defence in depth
Have more than one security measure. Each security measure should be able to cover a unique type of attack, to cover the vulnerabilities of other measures. (Within reason)
### Open design or Study of Attacks  
Try to ensure that the security policy is known to the public, or at least not hidden from the public. You can keep the exact thing needed to keep the system secure a secret (like a key for encryption) but the mechanism shouldn't be hidden (like the encryption algorithm). This can help build a more secure system as you may encourage people to ethically attempt to break the system and inform you so you can improve on it.
### Psychological acceptability
Ensure that users are likely to follow your security guidelines. For example passwords that require 27 characters, 3 special symbols, cannot contain any words in the English dictionary and must contain your mother's maiden name is not a good security measure as people will either not use the system or will just write the password down.
### Economy of mechanisms
`KISS (Keep It Simple Stupid!)` make sure mechanisms are easy to use so time is not wasted on authentication. 
### Prudent Paranoia
Do not underestimate the effort that the attacker will put into breaking your systyem.
### Privacy Promotion
Only collect information that is strictly necessary. 

The `TCB Trusted Computing Base` is all the components of the system upon which the security policy relies. If something within the TCB goes wrong then it may cause a violation of the security policy, therefore it should be kept small.

Principles should not be used as a blind checklist, only the ones relevant to your system. The system is only as secure as it's weakest security tool. (More security measures does not necessarily mean more secure).



