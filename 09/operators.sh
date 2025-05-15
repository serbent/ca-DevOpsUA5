#!/bin/bash

read -p "What is your name?" NAME 
read -p "What is your age?" AGE

if [ $NAME == 'Andrius' -a $AGE -gt 40 ]; then # Andrius , 45
    echo "Your cleare to access this script!!!"
elif [ ! $NAME == 'Andrius' -o $AGE -gt 40 ]; then # Paulius , 45
    echo "You are not the droid I'm looking for"
else # anything else
    echo "You are not old enought"
fi


if [[ $NAME == 'Andrius' && $AGE -gt 40 ]]; then # Andrius , 45
    echo "Your cleare to access this script!!!"
elif [[ ! $NAME == 'Andrius' || $AGE -gt 40 ]]; then # Paulius , 45
    echo "You are not the droid I'm looking for"
else # anything else
    echo "You are not old enought"
fi

curl -L http0://google.com # > /dev/null 2>&1
CURL_EXIT=$?
if [ $CURL_EXIT -eq 0 ]; then
    echo "Curl succeeded"
fi
echo  $CURL_EXIT

if [ $CPU -ge 95 && $TIME -gt 4 ]; then
    raise_alert
fi

HEALTHCHECK_1
HEALTHCHECK_2

if [ ! $HEALTHCHECK_1 -o ! $HEALTHCHECK_2 ]; then 
    raise_alert
fi