#!/bin/bash
let num="$(ls data/ | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no databases To connect"
	echo "================================================"
	sleep 2 
	clear
	source databasemenu.sh
else
	echo "your databases : "
	ls data/
	echo "================================================"
	echo "enter database name to connect : "
	read dbname
	if [ -d data/$dbname ]; then
		select option in "create table" "list tables" "drop table" "insert into table" "select from table" "delete from table" "exit"
		do
			case $option in
				"create table" )	
					source tblmanibulations/createtable.sh $dbname
					;;
				"list tables" )
					source tblmanibulations/listtables.sh $dbname
					;;
				"drop table" )  
					source tblmanibulations/droptable.sh $dbname
					;;
				"insert into table")
					source tblmanibulations/insertrecord.sh $dbname
					;;
				"select from table" )  
					source tblmanibulations/selectrecord.sh $dbname
					;;
				"delete from table" )
					source tblmanibulations/deleterecord.sh $dbname
					;;
				"exit" )
					exit
					;;
				* )
					echo "Wrong entry";
					echo "================================================"
					sleep 2
					clear
					source dbmanibulations/connectdb.sh
					;;
			esac
		done
	else
		echo "Database $dbname doesn't exist";
		echo "================================================"
		sleep 2
		clear
		source dbmanibulations/connectdb.sh
	fi
fi
