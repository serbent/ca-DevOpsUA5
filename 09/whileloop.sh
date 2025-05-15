#!/bin/bash

COUNTER=0

while [ '1' == '1' ]
do
    echo "To the infinity and beyond!!!!"
    sleep 2
((COUNTER++))
    if [ $COUNTER -ge 3 ]; then
        break;
        echo $COUNTER
    fi


done

# if [ $COUNTER ]; then 
#     echo "The variable is  so it must be TRUE"

#     while [ '1' == '1' ]
#     do 
#         echo "The variable is still true"
#         sleep 2
#     done
# fi