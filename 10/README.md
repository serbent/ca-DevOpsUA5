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