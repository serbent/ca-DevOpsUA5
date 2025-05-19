#!/bin/bash
source lib.sh
DATE=`date '+%Y-%m-%d'`
# set -x 
set -e

echo "Hello World!"



function backup() {
    pushd /home
    local LIST=`ls`
    echo "$LIST"
    popd
    for DIR in $LIST
    do
        # Check if the directory we are about to backup exists
        if [ -d /home/$DIR ]; then
            tar -cf $DIR-$DATE.tar /home/$DIR
        else 
            logtofile "3" "Directory does not exist"
            return 1
        fi
        # Check if the archive file was created
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