#!/bin/bash 

NAME=''
SURNAME=''
DOB='11/11/1999' # dd/mm/yyyy
ADDRESS=''
MAIDEN_NAME=''
CY=`date +%Y`

function age(){
	YOB=$(echo $DOB | awk -F'/' '{print $3}')
	let AGE=CY-YOB 
	echo "User age is $AGE"
}

function getFullName(){
	local FULL_NAME=$NAME" "$SURNAME
	echo $FULL_NAME 
}

read -p "Enter your date of birth in a dd/mm/yyyy format: " DOB
age

getFullName
