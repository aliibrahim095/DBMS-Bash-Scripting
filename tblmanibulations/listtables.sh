#!/bin/bash 
let num="$(ls data/$1 | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no databases To List"
	echo "================================================"
	sleep 3 
	clear
	source databasemenu.sh
else
	clear
	ls data/$1 | grep -Ev '\.(type)$'

	echo "================================================"
	sleep 2
	source databasemenu.sh
fi
