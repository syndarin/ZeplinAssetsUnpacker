#!/bin/bash
# zeplin_unpacker.sh
# script for unpacking your Zeplin assets archives to Android project
if [ "$#" -lt 2 ]
then
	echo "You must set source and destination folders as arguments!"
	exit 1
fi

if ! [ -d $1 ]
then
	echo "$1 is not a directory. First arg must be source directory with assets archives."
	exit 1
elif ! [ -d $2 ]
then
	echo "$2 is not a directory. Second arg must be target res/ directory in your project."
	exit 1
fi

count=0
for file in `ls $1*.zip`
do
	if unzip -uo $file -d $2
	then
		((count++))
	fi
done

echo "$count archives were processed"
exit 0
