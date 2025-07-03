class encapsulated():
    def __init__(self, value):
        self.__value = value  # Private attribute
        self._value = value

    def __print_value(self):
        print("The value is:", self.__value)
    
    def _print_value_protected(self):
        print("The protected value is:", self._value)
    
    def print_value(self):
        self.__print_value()

    def get_value(self):
        return self.__value  # Getter method

    def set_value(self, value):
        if isinstance(value, int):  # Simple validation
            self.__value = value
        else:
            raise ValueError("Value must be an integer")  # Setter method with validation

object_encapsulated = encapsulated(10)
print("Object encapsulated created with initial value:", object_encapsulated.get_value())
print("The value of the object is", object_encapsulated.get_value())  # Accessing private attribute through getter
print("Set value to 20", object_encapsulated.set_value(20))  # Setting new value through setter
print("The value of the object is",object_encapsulated.get_value())  # Accessing updated value through getter

# print("Get the value directly:", object_encapsulated.__value)  # This will raise an AttributeError since __value is private

object_encapsulated.__value = 30  # This will not change the private attribute, it creates a new attribute __value in the object

print("The value of the object is still", object_encapsulated.get_value())  # Accessing updated value through getter

print("Get the value of protected attribute:", object_encapsulated._value) # Accessing protected attribute directly, which is not recommended but possible
object_encapsulated._value = 30  # This will change the protected attribute, but it's not recommended to do so outside the class
print("The value of the object is still", object_encapsulated._value)  #


object_encapsulated._print_value_protected()  # Accessing protected method, which is not recommended but possible
object_encapsulated.print_value()  # Accessing public method to print the value
object_encapsulated.__print_value()  # Accessing protected method directly, which is not recommended but possible