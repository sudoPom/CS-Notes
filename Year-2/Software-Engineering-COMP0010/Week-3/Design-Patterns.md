# Design Patterns

Design patterns shoould only be used when needed, even if they can be implemented, it does not mean they should be used.

## Singleton 

A class that can **only** have one instance. It consists of one class: `Singleton`

```java
public final class Singleton{
    
    private static final Singleton INSTANCE = new Singleton();
        
    private Singleton(){}
    
    public static Singleton getInstance(){
        return INSTANCE;
    }
}
```



The init method of `Singleton` is private. There is a single instance `INSTANCE` of the `singleton` class which is a new instance of the `Singleton` class and a method `getInstance()` which returns a reference to the instance. 

Problems:

* Creates a global state (variable) which is evidence of bad design.
* Can cause memory leaks - The object is never deallocated by memory.
* Limits polymorphism.

## Factory 

Used to create objects without specifiying the class of the object. Useful for when you are not sure the types/dependencies your class willneed to work with.

``` python
class coin():
    def description():
        return("I am a coin")

class SilverCoin(coin):
	def description():
        return("I am a silver coin")
class GoldCoin(coin):
    def description():
        return("I am a gold coin")
def coin_factory(coin_type:str) -> object:
    coins = {
        "gold": GoldCoin,
        "silver": SilverCoin
    }
    return coins[coin_type]
```



## Builder 

Used to create complex objects step by step. Essentially, individual methods are used to "build" an object. The (semi)completed object can be returned at any point with a  method.

```python
class Person:
    def __init__(self, first_name, second_name, age, sex):
        this.first_name = first_name
        this.second_name = second_name
        this.age = age
        this.sex = sex
        
class PersonBuilder:
    def __init__():
        this.first_name = None
        this.second_name = None
        this.age = None
        this.sex = None
    def set_first_name(self, first_name):
        this.first_name = first_name
    def set_second_name(self, second_name):
        this.second_name = second_name
    def set_age(age):
        this.age = age
    def set_sex(self, sex):
        this.sex = sex
    def construct_person()
        p = Person(this.first_name, this.second_name, this.age, this.sex)
        return p
```



## Decorator 

Adds new behaviours to existing objects. Can be used to add extra behaviour to an existing object during runtime without breaking other parts of the program.

```python
class LivingThing:
    def communicate():
        pass
    

class Caveman(LivingThing):
    def communicate():
        return "Ooga booga"
    
    
class EvolvedThing(LivingThing):
    def __init__(self, living_thing):
        self.living_thing = living_thing
    def communicate():
        return "Don't you think it's so strange that thousands of years ago all we could say was " self.living_thing.communicate()
    
```

## Adapter 

Converts the interface of a class to another interface expected by the client.

 ```java
 import Math.sqrt;
 import Math.pow;
 
 class RoundPeg{
 	private double radius;
 
 	public RoundPeg(double radius){
         this.radius = radius;
     }
     
     public getRadius(){
         return radius;
     }
 }
 class SquarePeg{
 	private double length;
 
 	public RoundPeg(double length){
         this.length = length;
     }
     
     public getLength(){
         return length;
     }
 }
 class SquareToRoundAdapter(RoundPeg){
     SquarePeg peg;
     
     public SquareToRoundAdapter(SquarePeg peg){
         this.peg = peg
     }
     
     @Override
     public double getRadius(){
         double result;
         result = sqrt(pow(peg.getLength()/2,2) * 2);
         return result;
     }
 }
 ```

(Easier to understand in java)