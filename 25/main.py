print ("Hello World")


integer = 5
float_number = 3.14
string = "Hello, Python!"
boolean = True
list_of_numbers = [1, 2, 3, 4, 5]
list_of_strings = ["apple", "banana", "cherry"]
dictionary = {
    "name": "Alice",
    "age": 30,
    "city": "New York"
}

# Printing the variables
print("Integer:", integer)
print("Float:", float_number)
print("String:", string)
print("Boolean:", boolean)
print("List of Numbers:", list_of_numbers)
print("List of Strings:", list_of_strings)
print("Dictionary:", dictionary)


# List manipulation 
list_of_numbers.append(6)  # Adding an element
list_of_numbers.remove(2)  # Removing an element
list_of_numbers.insert(1, 10)  # Inserting an element at index 1
list_of_numbers.pop(4)  # Removing the last element
print("Updated List of Numbers:", list_of_numbers)

list_of_strings.append("peach")
list_of_strings.remove("banana")  # Removing an element
list_of_strings.sort()  # Sorting the list of strings
list_of_strings.insert(1, "orange")  # Inserting an element at index 1
print("Updated List of Strings:", list_of_strings)
list_of_strings.pop(2)  # Removing the element at index 2

print("Updated list of fruits: ",list_of_strings)  # Sorting the list of strings



# Dictionary manipulation
dictionary["country"] = "USA"  # Adding a new key-value pair
dictionary["age"] = 31  # Updating an existing key
dictionary["height"] = 5.5  # Adding another key-value pair

print(dictionary.keys())  # Printing keys
print(dictionary.values())  # Printing values   
print("Updated Dictionary:", dictionary)