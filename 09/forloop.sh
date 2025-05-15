#!/bin/bash


for FILE in `ls` 
do
    file $FILE
done

for FREE in `free | awk '{print $4}'`
do
	if [ $FREE -ge 0 ]; then
		echo "Great!"
	else
		echo "Not so great!"
	fi
done