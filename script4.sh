#!/bin/bash
if [ $# -ne 2 ]
then
echo "Pass two files"
else
{
	unum=$(wc -l $1 | cut -d " " -f 1)
	pnum=$(wc -l $2 | cut -d " " -f 1)
	if [ $unum -ne $pnum ]
	then echo "uneven number of paswords and users"

	else 
	{
	IFS=$'\n' read  -d'' -r -a users < $1
	IFS=$'\n' read  -d'' -r -a pass  < $2
	counter=0
	cat users | while read usr; 
	do
    		sudo adduser --disabled-password --gecos "" $usr
    		echo -e "${pass[$counter]}\n${pass[$counter]}" | sudo passwd -q $usr
		counter=$(($counter+1))
	done
	echo "users created with corresponding password"
	
	}
	fi
}
fi
