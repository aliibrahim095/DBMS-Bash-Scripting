#!/bin/bash
if [[ -d data/$1 ]];
then
	echo "DataBase $1 Already Exists"
	echo "================================================"
	sleep 2
	clear
	echo "select creatdb again and enter new name for your Database"
	echo "================================================"
	source databasemenu.sh
else
	mkdir -p data/$1
	echo "Database $1 is created successfully"
	echo "================================================"
	sleep 2
	clear
	source databasemenu.sh
fi
