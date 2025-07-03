class first():
    def __init__(self):
        self.first = "first"

    def get_first(self):
        return self.first
    
class second(first):
    def __init__(self):
        super().__init__()
        self.second = "second"

    def get_second(self):
        return self.second
    
class third(second):
    def __init__(self):
        super().__init__()
        self.third = "third"

    def get_third(self):
        return self.third
    
object_third = third()
print(object_third.get_first())  # Calls method from first
print(object_third.get_second())  # Calls method from second
print(object_third.get_third())  # Calls method from third