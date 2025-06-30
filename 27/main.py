def power_of_m(n, m=2):
    """ 
    The function returns the number n raised to the power of m. 
    If m is not provided, it defaults to 2.
    """
    return n ** m

def personal_info(name, age, city, country, *args):
    """This function prints personal information."""
    print(f"Name: {name}, Age: {age}, City: {city}, Country: {country}")
    if args:
        print("Additional interests or hobbies:", ", ".join(args))
 
def kwargs_example(**kwargs):
    """This function prints keyword arguments."""
    for key, value in kwargs.items():
        if key == "country":
            value = value.upper()
        print(f"{key}: {value}")


n = input("Enter a number to raise: ")
m = input("Enter the power to raise to (default is 2): ")

result = power_of_m(int(n),int(m))  # Example usage, should return True

print("The result of " + n + " to the power of " + m + " is:", result)


personal_info("Alice", 30, "New York", "USA", "reading", "traveling", "coding")

kwargs_example(name="Alice", age=30, city="New York", country="Lithuania", hobby="reading", profession="developer")