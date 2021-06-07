#!/bin/bash
 let num="$(ls data/$1 | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no tables To insert in "
	echo "================================================"
	sleep 3 
	clear
	source databasemenu.sh
else
	echo "$1 : has these tables : "
	ls data/$1 | grep -Ev '\.(type)$'
	echo "================================================"
	echo "Enter Table Name : "
	read tblname
	if [[ -f data/$1/$tblname ]]; then
			typeset -i fieldcount=`awk -F: '{if(NR==1){print NF}}' data/$1/$tblname;`
			for (( n=1 ; n <= fieldcount ; n++ ));
			do
				colname=`awk -v"n=$n" 'BEGIN{FS=":"}{if(NR==1){print $n}}' data/$1/$tblname;`
		 		coltype=`awk -v"n=$n" 'BEGIN{FS=":"}{if(NR==1){print $n}}' data/$1/$tblname.type;`
		 		flag=0;
		 		while [[ $flag -eq 0 ]]; do
		 			echo "Enter A $colname : "
		 			read value
			 		if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z]) ]]; then
			 			if [[ $n == $fieldcount ]]; then
			 				echo $value >> data/$1/$tblname;
			 			else
			 				echo -n $value":" >> data/$1/$tblname;
			 			fi
			 			flag=1;
			 		fi
		 		done
			done
			echo "data inserted successfully"
			echo "================================================"
		 	sleep 3
		 	clear
		 	source dbmanibulations/connectdb.sh	 			
	else	
		echo "Sorry $tblname Doesn't Exist";
		echo "================================================"
		sleep 3
		clear
		source databasemenu.sh	
	fi
fi
