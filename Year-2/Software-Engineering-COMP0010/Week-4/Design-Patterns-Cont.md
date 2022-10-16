# Design Patterns - Continued



## Observer

Used to notify multiple object when events happen to the object, For example, when one object changes, multiple other objects may also need to be changed, these set of objects may not be known beforehand.

```python
class Channel:
    
    
    def __init__(self):
        this.news = None
    
    def update(self, news):
        self.news = news

        
class Agency:
    
    
    def __init__(self):
        this.channels = set()
        
    def attatch(self, channel):
        this.channels.add(channel)
	
    def detatch(self, channel):
        this.channels.remove(channel)
        
    def update(self):
        for channel in channels:
            channel.update
        
       
```

 

## Visitor  

Separate algorithms from the objects that they are operated on. Used to perform an operation on all elements of a tree of objects.

```python
class Expression():
    def accept(self, visitor):
        return self.visitor.visit(self)

class Add(Expression):
    
    def __init__(self, left, right):
        self.left = left
        self.right = right
 
        
class Sub(Expression):
    
    def __init__(self, left, right):
        self.left = left
        self.right = right
                
        
class Num(Expression):
    
    def __init__(self, num):
        self.val = val
        
class Visitor:
    
    def visit(self, exp, *args):
        method = None
        for clas in exp.__class__.__mro__:
            method = getattr(self, 'visit'+clas.__name__, None)
            if method:
                break
        return method(self, args)
    
    def visit_Add(self, *args):
        return args[0].accept(this) + args[1].accept(this)
    
    def visit_Sum(self, *args):
        return args[0].accept(this) - args[1].accept(this)
    
    def visit_Num(self, *args):
        return args[0].val
           
```

## Strategy 

Used to define a family of algorithms, put each of them into a separate class, and make their objects interchangeable.

```python
class Item:
    
    def __init__(self, name, amount):
        self.amount = amount
        self.name = name
   	
class ShoppingCart:
    
    
    def __init__(self):
        self.items = set()
        
    def add_item(self, item):
        pass
    
    def remove_item(self, item):
        pass
    
    def calculate_total(self):
        pass
    
    def pay(self, payment_method):
        amount = self.calculate_total()
        payment_method.pay(amount)
    
class PayPalPayment:
    
    def __init__(self):
        pass
    
    def pay(self):
        pass

class CardPayment:
    
    def __init__(self):
        pass
    
    def pay(self):
        pass
    
```

## Template

Template allows the creation of a skeleton of an algorithm in the super-class but allows sub-classes to override specific steps of the algorithm without changing it's structure.



```python
class Network:
    
    def __init__(self, username, password):
        self.username = username
        self.password = password
    
    def post(self, message):
        if(self.log_in(self.username, self.password)):
            result = self.send_data(message)
            self.log_out()
            return result
       	return False
    
    def log_in(self, username, password):
        #To be implemented by subclasses
    
    def log_out(self):
        #To be implemented by subclasses
    
    def send_data(message):
        #To be implemented by subclasses
```

## Iterator

The iterator pattern traverses through a sequence of unknown/infinite length.
