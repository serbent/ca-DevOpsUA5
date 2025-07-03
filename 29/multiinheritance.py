class Parent1:
    def __init__(self):
        print("Parent1 constructor called")

    def method1(self):
        print("Method from Parent1")

class Parent2:
    def __init__(self):
        print("Parent2 constructor called")

    def method2(self):
        print("Method from Parent2")

class Child(Parent1, Parent2):
    def __init__(self):
        super().__init__()  # Calls Parent1's constructor
        Parent2.__init__(self)  # Explicitly calls Parent2's constructor
        print("Child constructor called")

    def child_method(self):
        print("Method from Child")

object_child = Child()
object_child.method1()  # Calls method from Parent1
object_child.method2()  # Calls method from Parent2
object_child.child_method()  # Calls method from Child