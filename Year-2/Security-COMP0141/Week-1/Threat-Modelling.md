# Threat Modelling 

Policies should address:

* Threats: What bad things can happen. (Attacker-centric)
* Vulnerabilities: What weaknesses in our system can a adversary make use of to cause these threats. (System-centric)
* Likelihood: What is the likelihood of this happening. This can be based on things like cost of the attack, the adversary's goal, the adversary themselves etc.
* Impact: What effect will the attack have on the system/company. The scale of an attack could range from being a small group impacted to the entire world (Asset-centric)
* Protection: What can we do to protect the system from the adversary.

* Goals: What do people want to achieve from using the system? Security systems implemented should not make goals difficult/cumbersome to achieve.

There are various "tiers" of adversaries, ranging from common vandals to specialist hackers, which can have goals ranging from curiosity to national interest.

We should take note of what `resources` the adversary gas access to, what can they:

* Observe (network connection)
* Corrupt (devices like routers)
* Influence (network configuration)
* Modify (packet data)
* Control (blackmailing employees)

An `attack` is a series of actions that allow and adversary to violate a given security policy.

A `strategic` adversary chooses the optimal way to use their resources to mount an attack.

## STRIDE (Threats)

`STRIDE` is an acronym that represents some of the possible threats that systems are liable to.

* `Spoofing`: pretending to be someone else to gain their information. (Attack on Integrity)
* `Tampering`: Listening in to a communication and impersonate one of the communicators by getting in between the communication. (Attack on Integrity)
* `Repudation` : Denying that you sent a message. (Attack on integrity)
* `Information Disclosure` (Protected against via Confidentiality)
* `Denial of Service` Prevent communications. (Attack on availability)
* `Elevation of privelage`: Obtaining info that the user should not have access to. (Attack on Confidentiality and Integrity)

 

A system is secure if an adversary constrained by a specific threat model cannot violate the security policy. Threat models are pretty broken since if they are wrong then an adversary could violate the system.

## Security Mechanisms

A system is secure if there is a security argument that an adversary constrained by a specific threat model cannot violate the security policy. 

A `Security argument` is a rigorous argument that the security mechanisms ensure that the security policy is not broken. (with an adversary acting within the threat model)

A `security mechanism` is a technical mechanism used to ensure that the security policy is not violated by an adversary. For example for an online banking system, a security mechanism could include encryption of bank details so that the adversary does not have access to them, which could be a constraint in the security policy.
 
Security mechanisms can be:

* Software
* Hardware
* Cryptography
* People
* Procedures

