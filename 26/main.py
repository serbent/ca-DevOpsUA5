greeting = "Hello, {}"

name = input("Enter your name: ")

message = greeting.format(name + "! Welcome to Python programming.") #+ name + "! Welcome to Python programming."
# print(message)



# repeat = message * 3  # Repeating the message 3 times
# print(repeat)  # Printing the repeated message 

print("="*45)
print(message)
print("="*45)  
print(message.ljust(50, '*'))  # Left-justifying the message with '*' padding
print(message.rjust(50, '*'))  # Right-justifying the message with '*'
print(message.center(50, ' '))  # Centering the message with '*' padding


# String manipulation
print("Length of the message:", len(message))  # Length of the message
print(message[7:25])
print(message[7:])  # Slicing the message from index 80 to the end

print(message.upper())  # Converting to uppercase
print(message.lower())  # Converting to lowercase

print(message.split())  # Splitting the message into words

if name == "Alice":
    print("Hello Alice! You are a special user.")
elif name == "Bob":
    print("Hello Bob! You are a special user.")
else:
    print("Hello {}! You are a regular user.".format(name)) # Using function on a string without declarint a variable first

# for i in range(5):
#     print("This is iteration number", i + 1)

list = [1, 3, 5, 7, 9]
for val in list:
    print("This is iteration number", val)


fruit = ["apple", "banana", "cherry", "date", "elderberry"]
for fruit in fruit:
    print("Current fruit:", fruit)

string = "Hello, Python!"
for char in string:
    print("Current character:", char)

for i, char in enumerate(string):
    print("Character at index", i, "is", char)


for i in range(1, 11):
    for j in range(1, 11):
        print(f"{i} x {j} = {i * j}")

while True:
    user_input = input("Enter a number (or 'exit' to quit): ")
    if user_input.lower() == 'exit':
        print("Exiting the loop.")
        break
    else:
        print(f"You entered: {user_input}")

x = 5
while x > 0:
    print("Current value of x:", x)
    x -= 1 