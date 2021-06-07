#!/bin/bash
echo "Enter Table Name"
read tblname
if [[ -f data/$1/$tblname ]];
then
	echo "$tblname Table Already Exists"
	echo "================================================"
	sleep 3
	clear
	source tblmanibulations/createtable.sh
else
	touch data/$1/$tblname
	echo "Enter Number Of Columns : "
	read colsnum
	for (( i = 1; i <= colsnum; i++ ));
	do
		echo "Enter Column number $i Name : "
		read colname
		echo "Enter Column number $i Datatype [ int | string ] "
		read coltype
		while [[ $coltype != int && $coltype != string ]];
		do
			echo "Wrong Entry, Enter Column number $i Datatype [ int | string ] "
			read coltype
		done
		if [[ i -eq colsnum ]];
		then
			echo $colname >> data/$1/$tblname
			echo $coltype >> data/$1/$tblname.type
		else
			echo -n $colname":" >> data/$1/$tblname
			echo -n $coltype":" >> data/$1/$tblname.type
		fi
	done
	echo "$tblname Table Created Successfully "
	echo "================================================"
	echo "Create New Table ? y/n"
	read response
	case $response in
		[Yy] )
			sleep 2
			echo "================================================"
			clear
			source tblmanibulations/createtable.sh
			;;
		[Nn] )
			sleep 2
			echo "================================================"
			clear
			source databasemenu.sh
			;;
		* )
			echo "Wrong entry "
			echo "================================================"
			sleep 2
			clear
			source databasemenu.sh
			;;
	esac
fi
