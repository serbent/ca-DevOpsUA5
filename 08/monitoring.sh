#!/bin/bash

echo "##############################"
echo "#                            #"
echo "# Our great monitoring       #"
echo "#                            #"
echo "##############################"


#SPACE=$(free) 

#echo $SPACE > space.out #| awk '{ print $4 }' 


for FREE in `free | awk '{print $4}'`
do
	if [ $FREE -ge 0 ]; then
		echo "Great!"
	else
		echo "Not so great!"
	fi
done
