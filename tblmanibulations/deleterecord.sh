#!/bin/bash 
let num="$(ls data/$1 | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no Tables To delete from "
	echo "================================================"
	sleep 3 
	clear
	source dbmanibulations/connectdb.sh
else
	echo "Available tables in $1 database : "
	ls data/$1 | grep -Ev '\.(type)$'
	echo "================================================"
	read -p "Enter table Name : " tblname
	if [[ -f data/$1/$tblname ]]; then
		awk -F: 'BEGIN{FS=":"}{if(NR==1){print $0}}' data/$1/$tblname;
		echo "================================================"
		read -p "Enter column to delete record from  : " coldeltarget;
		read -p "Enter value : " vldeltarget;
		awk -F:  'BEGIN{FS=":"}
		{
			if(NR==1){
				for(i=0;i<=NF;i++){
					if($i=="'$coldeltarget'"){var=i}
				}
			}
			else{
				if($var=='$vldeltarget'){
					loctarget=NR
				}
			}
			if(NR!=loctarget) print 
		}' data/$1/$tblname > tmp && mv tmp data/$1/$tblname;
		echo "================================================"
	else
		echo "$tblname doesn't exist";
		echo "================================================"
		sleep 3
		clear
		source dbmanibulations/connectdb.sh
	fi
fi
