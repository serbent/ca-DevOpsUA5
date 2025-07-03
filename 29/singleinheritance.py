class Person():
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

class Employee(Person):
    def __init__(self, name, age, position):
        super().__init__(name, age)
        self.position = position

    def greet(self):
        return f"{super().greet()} I work as a {self.position}."
    
Employee1 = Employee("Alice", 30, "Software Engineer")

print(Employee1.greet())  # This will call the overridden greet method in Employee class