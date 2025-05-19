#!/bin/bash

DATE=`date '+%Y-%m-%d'`
set -x 
set -e

echo "Hello World!"

function logtofile() {
    case $1 in
    1)
        local INFOLEVEL='[INFO]'
        ;;
    2) 
        local INFOLEVEL='[WARNING]'
        ;;
    3) 
        local INFOLEVEL='[ERROR]'
        ;;
    esac

    echo "[`date '+%d-%m-%Y %H:%M:%S'`]" $INFOLEVEL" "$2 >> $DATE.log
}

function backup() {
    pushd /home
    local LIST=`ls`
    echo "$LIST"
    popd
    for DIR in $LIST
    do
        pwd
        tar -cf $DIR-$DATE.tar /home/$DIR
        if [ -f $DIR-$DATE.tar ]; then 
            gzip -9 $DIR-$DATE.tar
        else 
            logtofile "3" "File does not exist"
            return 1
        fi

    done
     
}

logtofile "1" "Script is starting"

backup

logtofile "1" "Script successfully run" 