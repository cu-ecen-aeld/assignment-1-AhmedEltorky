#!/bin/bash
filesdir=$1
searchstr=$2

# check if directory exists in file system andthe string is not empty
if [ -d "$filesdir" ] && [ -n "$searchstr" ]; then
    # $ grep -o get the string in cases there are multiple occurrence in a line.
    # $ grep -r search for the string in the sub-directories.
    # $ wc -l   get the string count.
    str_count=$(grep -o -r $searchstr $filesdir | wc -l)
    file_count=$(grep -l -r $searchstr $filesdir | wc -l)
    echo "The number of files are $file_count and the number of matching lines are $str_count"
    exit 0
else
    echo "invalid input!!!"
    exit 1
fi
