class animal():
    def speak(self):
        raise NotImplementedError("Subclasses must implement this method")

class dog(animal):
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} says Woof!"

class cat(animal):
    def __init__(self, name):
        self.name = name

    def speak(self):
        return f"{self.name} says Meow!"

animals = [dog("Buddy"), cat("Whiskers")]
for animal in animals:
    print(animal.speak())  # Polymorphism in action, calling the speak method of each subclass