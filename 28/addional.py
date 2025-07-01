def hello_world():
    print("Hello, World!")

class Additional:
    def __init__(self):
        print("This is an additional class.")
    def greet(self):
        print("Greetings from the Additional class!")


class Person:
    """A class representing a person with a name."""
    age = 0
    height = 0
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return f"Person(name={self.name}, age={self.age}, height={self.height})"
    def __repr__(self):
        return f"Person(name={self.name}, age={self.age}, height={self.height})"

    def greet(self):
        print(f"Hello, {self.name}!")
    
    def age(self, age):
        self.age = age
        print(f"{self.name} is {age} years old.")

    def hight(self, height):
        self.height = height
        print(f"{self.name} is {height} cm tall.")

class Cyborg(Person):
    """A class representing a cyborg, which is a person with additional capabilities."""
    model = "CyborgModel"
    Manufacturer = "CyborgCorp"
    yom = 2025 # Year of manufacture
    def __init__(self, name, capabilities):
        super().__init__(name)
        self.capabilities = capabilities
        # self.yom = 2025 - int(self.age)
    def __str__(self):
        return f"Cyborg(name={self.name}, made={self.yom}, height={self.height}, capabilities={self.capabilities}, Manufacturer={self.Manufacturer}, model={self.model})"
    def __repr__(self):
        return f"Cyborg(name={self.name}, made={self.yom}, height={self.height}, capabilities={self.capabilities}, Manufacturer={self.Manufacturer}, model={self.model})"
    
    def greet(self):
        print(f"Greetings, I am {self.name}, a cyborg with capabilities: {', '.join(self.capabilities)}.")