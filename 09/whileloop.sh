#!/bin/bash

COUNTER=0

while [ '1' == '1' ]
do
    echo "To the infinity and beyond!!!!"
    sleep 2

    if [ $COUNTER -ge 3 ]; then
        break;
        echo $COUNTER
    fi

((COUNTER++))
done