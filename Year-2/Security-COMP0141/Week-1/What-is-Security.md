# What is Security? 

In Computer Science `Security` refers to a program having three properties:

* `Correctness`: For a given input, a program should provide the correct output
* `Safety`: Well formed programs cannot have bad (wrong or dangerous) outputs, no matter the input.
* `Robustness`: Programs should be able to cope with errors in execution.

These properties should hold even in the presence of a `strategic adversary` (a hacker)

## The CIA Triangle

`CIA` stands for confidentiality, integrity and availability:

* `Confidentiality`: Keeps data private
* `Integrity`: System and data have not been improperly altered
* `Availability`: The application is available for use to those who should be able to use it, and not available to those who aren't.

Other properties include:
* `Privacy`
  * Differs from confidentiality - it is not about keeping data secret, but controlling the information revealed by the data. (Facebook should not store the data of every website I visit)
* `Authenticity`
  * Proving that data originated from a specific entity/individual
* `Anonymity`
  * I don't want anyone to know that I am visiting this website.
* `Non-repudiation`
  * Messages are sent with a "signature" showing proof that the owner of the signature sent the message - it cannot be denied that you sent a message.
* `Plausible deniability`
  * The ability to deny you wrote this message.
* `Forward secrecy`
  * If a hacker starts decrypting messages, messages prior to the attack cannot be decrypted.

## Defining a Secure System

Competing philosophies:

* `binary`: your system is either secure or insecure.

The attacker is modelled having limitations X and the policy is modelled as Y.  The system is secure if Y cannot be violated without needing X. For example Y = "only authorised users can access data" and X = "Valid credentials"

Pro: Longevity 

Cons: It is hard to define things like the capabilities of the attackers and can be expensive.

* `risk management`: Secureness is a gradient provided you assess various risks

Something can be insecure but it is too expensive for an adversary to exploit those insecurities.

Pro: Adaptive

Cons: Ways to circumvent defences in ways that are not expected.