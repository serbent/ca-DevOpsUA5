

file = open("README.md", "r")

# Read the entire file

content = file.read()

# Print the content of the file
print(content)

# Close the file
file.close()

# Open the file in write mode
file = open("README.md", "w")
# Write new content to the file
file.write("# Python. Decorators, File IO, popular libraries\n")

# Close the file
file.close()

# Open the file in append mode
file = open("README.md", "a")
# Append new content to the file
file.write("\n# Additional content added to the file.\n")