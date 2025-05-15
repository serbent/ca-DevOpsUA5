#!/bin/bash

FILECOUNT=$(ls | wc -l)

if [ $FILECOUNT -eq 5 ]; then
    echo "Number of files is 5" 
elif [ $FILECOUNT -lt 5 ]; then
    echo "Number of files is less then 5" 
else 
    echo "There are more files then 5"
fi