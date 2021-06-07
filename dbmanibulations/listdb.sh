#!/bin/bash 
let num="$(ls data/ | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no databases To List"
	echo "================================================"
	sleep 3 
	clear
	source databasemenu.sh
else
	clear
	ls data/
	echo "================================================"
	sleep 2
	source databasemenu.sh
fi
