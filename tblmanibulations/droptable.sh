#!/bin/bash
let num="$(ls data/$1 | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no tables To drop"
	echo "================================================"
	sleep 3 
	clear
	source dbmanibulations/connectdb.sh
else
	echo "List Of Tables in $1 : "
	ls data/$1 | grep -Ev '\.(type)$'
	echo "================================================"
	echo "Enter Table Name To Delete : "
	read tblname
	if [[ -f data/$1/$tblname ]];
	then
		echo "Are You Sure ? y/n "
		read response
		case $response in
			[Yy] )  rm -r data/$1/$tblname
				rm -r data/$1/$tblname".type"
				echo "$tblname Deleted Successfully "
				echo "================================================"
				echo "Delete New Table ? y/n"
				read response
				case $response in
					[Yy] )
						sleep 3
						echo "================================================"
						clear
						source tblmanibulations/droptable.sh
						;;
					[Nn] )
						sleep 3
						echo "================================================"
						clear
						source databasemenu.sh
						;;
					* )
						sleep 3
						echo "================================================"
						clear
						source databasemenu.sh
						;;
				esac	
				;;
				
			[Nn] )	echo "Operation Aborted "
			        echo "================================================"
				sleep 3
				clear
				source databasemenu.sh
				;;
				
			* )	echo "Wrong Entry"
				echo "================================================"
				sleep 3
				clear
				source databasemenu.sh
				;;
		esac
	else
		echo "$tblname Table Dosen't Exist"
		echo "================================================"
		sleep 3
		clear
		source databasemenu.sh
	fi	
fi
