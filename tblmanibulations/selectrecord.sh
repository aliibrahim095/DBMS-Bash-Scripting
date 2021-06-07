#!/bin/bash 
let num="$(ls data/$1 | wc -l)"
if [[ $num -eq 0 ]]
then
	echo "There is no table to make a query on !"
	echo "================================================"
	sleep 3 
	clear
	source databasemenu.sh
else
	echo "Available tables in  $1 database : ";
	ls data/$1 | grep -Ev '\.(type)$'
	echo "================================================"
	read -p "Enter table Name: " tblname;
	select choice in "Select star" "select specific columns" "select columns where condition"
	do
		case $choice in
			"Select star") awk '{print}' data/$1/$tblname
				;;
			"select specific columns")
					read -p "Enter Number of columns: " number;
					for (( i = 1; i <= number; i++ )); do
						read -p "Enter column $i: " colname;
						awk -F: '{if(NR=1){
							for(i=1 ;i <= NF; i++){
								if($i=="'$colname'"){
									var=i
							    		break;
								}
								}
							} {print $var}
						}' data/$1/$tblname
					done
					echo "================================================"
				;;
			"select columns where condition") 
				awk -F: '{if(NR==1){print}}' data/$1/$tblname
				echo "Enter column name of the condition :"
				read colntarget
				echo "Enter condition value :"
				read valtarget
				awk -F:  '{
					if(NR==1){
						for(i=1;i<=NF;i++){
							if($i=="'$colntarget'"){var=i}
						}
					}
					else{
						if ( $var == '$valtarget' ) {
							targetloc=NR
						}
					}
					{if(NR==targetloc) print
					}
				}' data/$1/$tblname
				echo "================================================"
				;; 		
		esac
	done
fi
