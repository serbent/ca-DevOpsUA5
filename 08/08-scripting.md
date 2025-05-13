# Bash scripting 

## Tips
- (TIP: $? is a variable representing the exit code of last run command.)

## Script 1
Create a script that will:
1. Output a message to the *output.log* file that the script is starting. The log file should be appended not re-writen
- Log file format for each line should be `$TIMESTAMP $MESSAGE`
2. Check if the file "run.run" exists. If it exists delete it. If it does not exist - create it.
3. Log the result to the log file. And action taken.  (e.g. `$TIMESTAMP File run.run exists. Deleting the file`)
4. Check if the last command ran successfully ($? -eq 0). Write message to the log. 
- Run a script a few times. See the log. 
- Change the permission on the file that only the owner has **write** permissions and run the script. 

## Script 2
Prerequisites:
- Create a nginx docker container and forward the ports 8080:80
Create a simple monitoring script that will: 
1. `curl` the created docker container. 
2. Check the exit code of the `curl` command.
3. Log a message in *output.log* file:
- $TIMESTAMP "O.K." if command was successfull
- $TIMESTAMP "Something went wrong. The exit code was $EXITCODE" 
4. `sleep` for 2 seconds. 
5. Repeat steps 1-4 for 5 times in total. 
