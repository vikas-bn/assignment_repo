#!/bin/bash
if [ "$#" -ne 2 ]
then echo "give a filename and path as arguments in commandline";
else
{
filename=$1
path=$2
if(find $path -name "$filename" | grep -q $filename )
then rm $path/$filename
else
 tar -cf "$path.tar" $path 
fi
}
fi
