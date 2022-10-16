# Who you Are
The what you are principle of authentication mainly boils down to `biometrics` - a property of an individual that can be measured and from which distinguishing and repeatable features can be extracted to automatically recognise individuals.

A `biometric sample` is raw data obtained from a capture device. 
A `biometric template` is the way the biometric features are stored.

The process of biometric authentication begins with `enrolment` which is the capturing of biometric information and authentication, which is comparing the sample given to the digital features that were stored during enrolement. Multiple samples are normally taken to allow users to provide their biometric sample in ways that were not exactly the same as the biometric sample stored from enrolement.

## Fingerprint Scanners
* Fingerprint scanners are good for checking how close a fingerprint is to the stored ringerprint from authentication.
* They have features which check for the "liveness" of the finger - in case somebody tries to authenticate with an amputated finger.
* In terms of usability occasionally the authentication will fail due to the position of the finger of the scanner.
* Maintainability suffers due to changes to fingers due to injuries, wetness or growth may cause authentication to fail

## Hand Scanners
* Difficult to train 
* Slower than finger prints
* Maintainable as hands do not change overtime
* The main issue with hand scanners as hands must be in a specific position for them to work.

## Retinal Scanners
* Less usable as you must stand in a certain position
* Less stable as contact lenses and glasses can cause issues. 
* Maintainable 
* Good for comparing matches


#### Advantages
* Nothing to remember
* Passive
* Cannot be shared
* Unique (assuming perfect accuracy)

#### Disadvantages
* Hard to revoke 
* Invasive
* Private but can be stolen (finger prints on glass)
* False acceptance is low (1 in a million) but the chance of a single false match within 1609 samples is about 50%.

There is a threat to privacy when it comes to biometrics as the templates stored (finger prints/retina scans) could be used without the users knowledge, and the service will have implicit identification.

Similarly with reliability sophisticated attacks can bypass the system and reduce confidence in biometric systems.

### Multifactor Authentication
Uses a combination of [[Who-you-Are]], [[What-you-Have]] and [[What-you-Know]] to authenticate users. 