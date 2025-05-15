# Bash scripting. Conditions, Loops, Case statements​

# Note: Please try writing scripts yourself.  
ChatGPT can help but shouldn't do the whole work for you.

## Script01

1. Create 3 `.env` files: `.env`, `.env.dev`, `.env.stage`
2. Populate the files with values:
    - **.env:**
        - `ENVIRONMENT="production"`
        - `CUSTOM_TEXT="This is production instance"`
    - **.env.dev:**
        - `ENVIRONMENT="development"`
        - `CUSTOM_TEXT="This is development instance"`
    - **.env.stage:**
        - `ENVIRONMENT="staging"`
        - `CUSTOM_TEXT="This is staging instance"`
3. Create a script with a menu.

* 1 - Dev
* 2 - Staging
* 3 - Production
* Default - dev
* E - Exit script


4. Get the user input and run the Docker image that we used in lecture 5.  
Use environment variables from the selected file to set up Docker.
5. Check the package if the environment variables from the file are correct.

---

## Script02

1. Create a script that will generate a random 10-character string until it generates  
a string that contains a user-inputted 3-character long value.  
*(Tip: `cat /dev/urandom | tr -dc 'a-z' | head -c 10`)*
2. Display the number of tries used to find the pattern.
3. Check if user input is correct. If not, display an error message and exit.

---

## Script03

1. Write a wrapper script to provide a menu and launch previously written  
scripts depending on the user input.
