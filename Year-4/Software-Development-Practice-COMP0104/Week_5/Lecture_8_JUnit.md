---
id: Lecture_8_JUnit
created_date: 30/10/2023
updated_date: 30/10/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Testing & JUnit

A **failure** is defined as the inability of a system/component to perform its required function within some specified performance behaviour. A **fault** is defined as an incorrect step, process or data definition which causes a program to behave in an unintended manner. Faults are often called bugs and can cause a failure. A fault will not cause failure if it is not executed.  ^4f9701

An **error** (or mistake) is a human action that causes a fault. In terms of computation, an error (discrepancy) is a difference between a measurement  of something and the actual true value.

Software testing aims to transform faults into failures by executing the faults under conditions which will cause a failure. **Coverage** is the proportion of all lines of code that is executed. High coverage does not mean safe code as the code needs to be ran under a variety of scenarios. Tested software is used to:
* Provide information on the quality of the developed product to stakeholders
* Observe the execution of a software system to see if it acts as intended.

#### Unit Testing

Unit testing involves splitting up a system into units, which are the smallest blocks of code that can be tested. Unit tests are normally automated and ran by developers. Each unit can be ran and tested independently of other units. Unit tests are specified in the language that the unit is written in.

Unit test frameworks provides features that help developers write and run unit tests. They also allow developers to see the result of running unit tests, displaying deviations from expected values.

---
###### Components

Component tests involve testing components which are less fine grained than units. Components are often classes, packages and sub systems while units are procedures and methods. Component testing is often used as useful tests often require access to multiple components.

---

##### Assertions

Assertions are used to compare actual behaviour to expected behaviour. If an assertion is not correct, a failure is generated, if it is then computation proceeds as usual.

Using standard assertions is not the best practice for testing as execution stops on the first failure, without executing the rest of the tests. Testing frameworks do not do this and will always execute all tests even if one fails.

#### JUnit

JUnit organises tests into test cases. Each test case is realised by it's own class. There are annotations that can be used to execute code before/after a test is ran, to highlight which methods are tests, etc. JUnit also has it's own assertion module:

![[Pasted image 20231030134517.png]]

Tests often require some set up and clean up methods (fixtures) to work correctly. In JUnit, this is done by decorating methods with annotations:
* `@Before` code to be executed before each test.
* `@After` code to be executed after each test.

```java
public class RationalTest {
	private Rational a_third;
	
	@Before
	public void setUp() throws Rational.Illegal {
		a_third = new Rational(1, 3);
	}
	@After
	public void tearDown() {
		a_third = null;
	}
	@Test
	public void testEquality() throws Rational.Illegal { 
		assertEquals(a_third, new Rational(1, 3)); 
		assertEquals(a_third, new Rational(2, 6)); 
		assertEquals(new Rational(1, 1), new Rational(3, 3));
	}
}
```

#### Test Driven Development

Component tests allow the testing of code that has not been written yet. Said tests act as a specification of the component to be tested. The test initially fails (since the code does not exist yet) and code is written to satisfy said test. This is known as **test driven development**.

This results in a lot more tests being written and development takes place in small steps, where tests are written and then code is written to satisfy those tests.

This results in:
* Code being able to be tested automatically
* Debugging being easier
* Code being as simple as possible (code is written just to satisfy tests and nothing else).

# Questions / Thoughts