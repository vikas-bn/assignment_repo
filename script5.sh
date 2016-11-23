#!/bin/bash 
timestamp=$(date +%Y%m%d%H%M%S)
echo $timestamp
if [ $# -ne 1 ]
then echo "pass one filename as commandline argument"
else 
{
	
	mkdir $timestamp
	date_var=201509271852
	while read path
	do 	
		sudo cp -pR --parents $path /home/rztl511/$timestamp/
	done < $1
	while read path
	do 
		echo $path
		modtime=$(date -r $path +%Y%m%d%H%M%S)
		modtime1=$modtime
	  	if [ "$date_var" -lt "$modtime1" ] #change to -gt
		then
			echo $path>tmp.txt
			tarname=$(cut -d "/" -f 2 tmp.txt)
			tar -cf /home/rztl511/$timestamp/$tarname.tar $path
		fi
	done < $1
}
fi





