

def addition(a, b):
    """
    This function returns the sum of 2 and 3.
    """
    return a + b
def subtraction(a, b):
    """
    This function returns the difference of 5 and 2.
    """    
    return a - b 
def multiplication(a, b):
    """
    This function returns the product of 4 and 3.
    """
    return a * b
def division(a, b):
    """
    This function returns the quotient of 10 and 2.
    """
    return a / b

def greeting(name):
    """
    This function prints a greeting message.
    """
    print("Hello, " + name + " welcome to the mini calculator!")


if __name__ == "__main__":
    input1 = int(input("Enter first number: "))
    input2 = int(input("Enter second number: "))

    print("Addition:", addition(input1, input2))
    print("Subtraction:", subtraction(input1, input2))
    print("Multiplication:", multiplication(input1, input2))
    print("Division:", division(input1, input2))

    print("Enter your name:")
    name = input()
    greeting(name)