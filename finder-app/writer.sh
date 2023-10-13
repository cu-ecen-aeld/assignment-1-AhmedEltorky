#!/bin/bash
writefile=$1
writestr=$2

# check if the args are 2 and the write str isn't empty
if [ $# == 2 ] && [ -n "$writestr" ]; then
    # check if the directory exists and has write permission
    if [ -w "$writefile" ]; then
        # write string to the output file
        echo $writestr >$writefile
    else
        # create the directory
        mkdir -p -- "${writefile%/*}" && touch -- "$writefile"
        if [ $? != 0 ]; then
            echo "cann't create this file!!!"
            exit 1
        fi
        # write string to the output file
        echo $writestr >$writefile
    fi
else
    echo "invalid input!!!"
    exit 1
fi
