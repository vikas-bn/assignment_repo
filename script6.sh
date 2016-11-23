#!/bin/bash
if [ $# -lt 1 ]
then echo "pass atleast terminating string as argument"
else 
{ 
	echo $(pwd) > temp
	wd=$(replace "/" "_" < temp)
	if [ $# == 1 ]
	then
		path=$wd
		terstr=$1	
	else
	{
		path=$1
		terstr=$2
	}
	fi
	
	find $path -type f -empty -exec rm -i {} \;
	du -a $path | sort -h | awk '{print $2}' > tmp1.txt
	while read filepa
	do 
		if [ -f "$filepa" ]
		then 
			echo $(basename $filepa) > tmp2.txt
			v1=$(grep  -c "^$terstr$" tmp2.txt)
			if [ $v1 -gt 0 ]
			then 
			{	
				
				fv1=$(replace "$terstr" razorthink$wd < tmp2.txt)
				echo $fv1 >> output.txt
				mv $filepa $(dirname $filepa)/razorthink$wd 
				
				
				continue
			}
			fi 
			v2=$(grep -c "$terstr$" tmp2.txt)
			if [ $v2 -gt 0 ]
			then
			{ 	
				fv2=$(replace "$terstr" "" < tmp2.txt)
				echo $fv2 >> output.txt
				mv $filepa $(dirname $filepa)/$fv2
						
				continue
			}
			fi
			cat tmp2.txt >> output.txt
			echo "this is output.txt outside if"
			
			 
		fi
	done < tmp1.txt
	cat output.txt     
	rm output.txt
	
}
fi

