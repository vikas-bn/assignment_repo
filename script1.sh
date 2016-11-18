#!/bin/bash
timestamp=$(date +%s)
mkdir $timestamp
if(find /tmp -name test | grep -q test )
	then mv /tmp/test $timestamp/
else
 echo "file test not found in //tmp" 
fi

