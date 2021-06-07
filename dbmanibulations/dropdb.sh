#!/bin/bash
let num="$(ls data/ | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no database to drop"
	echo "================================================"
	sleep 2 
	clear
	source databasemenu.sh
else
	echo "your DataBases are : "
	ls data/
	echo "enter database name to drop : "
	read dbname
	if [[ -d data/$dbname ]]
	then
		echo "are you sure ? y/n"
		read response
		case $response in
			[Yy] )
				rm -r data/$dbname
				echo "$dbname database deleted successfully"
				echo "================================================"
				sleep 2
				clear
				source databasemenu.sh
				;;
			[Nn] )
				echo "Operation aborted "
				echo "================================================"
				sleep 2
				clear
				source dbmanibulations/dropdb.sh
				;;
			* )
				echo "Wrong Entry"
				echo "================================================"
				sleep 2
				clear
				source dbmanibulations/dropdb.sh
				;;
		esac
	else
		echo "Database $dbname doesn't exist in your databases"
		echo "================================================"
		sleep 2
		clear
		source dbmanibulations/dropdb.sh
	fi
fi
