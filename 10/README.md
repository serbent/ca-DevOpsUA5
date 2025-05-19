# Bash scripting 

## Noteworthy stuff

`set -euo pipefail` - set at the start of your script  
`if [ -w/-r/-x/-f/-d $SOMETHING ]` only one check per `if` statement.   
Check if  
-w file/directory is writable  
-r file/directory is readable  
-x file/directory is executable  
-f file/directory is a file  
-d file/directory is a directory  

## Additional task
# Exercises

## Script 02

Go to [mockaroo](https://mockaroo.com/) and generate some random data.

**Fields:**
- Full Name
- Age
- Email
- Gender
- Country
- Job Title
- Salary

---

### Tasks:

- Create a procedure to display all **countries** in the report.  
- Create a procedure to display all **Job Titles** in the report.  
- Create a procedure to calculate **average salary in a country**.  
- Create a procedure to calculate **average salary by Job Title** and display the **highest paying job**.  
- Create a procedure to calculate **average age by gender and country**.  

---

### Menu:

Create a **multi-choice menu**:

1. Get countries  
2. Get Job Titles  
3. Get average salary by country  
4. Get average salary by Job Title  
5. Get average age by gender and country  
q. Exit  

The script should **exit only** when the user enters `"q"`.  
After each function executes, the script should **display the results** and **show the menu again**.
