# Additional excercises for Linmux Fundamentals 

## ls - listing files
use `ls --help` to get a list of all available options  
use `ls` to list files sorted by time modified.  
use `ls` to list files sorted by time modified in reverse order (newest at the bottom).  
use `ls` to list a specific file. Note the size and permissions of the file  

## cd - changeing directory / navigating
Change current directory to one level above.  
Change current directory to two levels above using a single command.  
Change directory to user home directory. (we will be calling 'user home directory' $HOME)  
Create a directory named `backups`.  
Navigate to `backups`.  
Change directory to /var/log  
Change directory to previous one (`backups`)  

## cp, mv, rm, mkdir, touch file/directory manipulation
Create an empty file in `backups/` directory named `homework`.  
Navigate to `backups/`.  
Create a copy of `homework` file with a name `homeworkv2`.  
Move `homeworkv2` one level above.  
Create a copy of `homeworkv2`. Name it `homeworkv3`.  
Remove file `homeworkv2`.  
Rename `homeworkv3` to `homeworkv2`.  

## cat, grep, head, tail - file content
Use `cat` to display the content of `homework`.  
Use `cat` and `>` to create a new file named `notes.txt` with a few lines of text.  
Use `grep` to find a specific word in `notes.txt`.  
Use `head` to view the first 5 lines of `notes.txt`.  
Use `tail` to view the last 3 lines of `notes.txt`.  
Use `grep -i` to search case-insensitively in `notes.txt`.  
Use `tail -f` on a system log file to view real-time updates (e.g., `/var/log/syslog` or `/var/log/messages`).  

## free, df, top, ps - system resources
Use `free` to check RAM and swap usage.  
Use `df -h` to check available disk space in a human-readable format.  
Use `top` to see a real-time view of system processes.  
Use `ps aux` to list all running processes.  
Use `ps -ef | grep bash` to find your current shell process.  
Use `top` and sort by memory usage (`M` key in `top` interface).  

## tar, gzip, bzip2 - archiving
Create a `.tar` archive of the `backups/` directory.  
Extract the contents of a `.tar` archive.  
Compress the `.tar` archive using `gzip`.  
Uncompress a `.tar.gz` archive.  
Compress a file using `bzip2`.  
Decompress a `.bz2` file.  
List the contents of a `.tar.gz` archive without extracting.  
