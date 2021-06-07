#!/bin/bash
echo "welcome to our DBMS developed by Eng. Ahmed Mahmoud Elbehery"
echo "And Eng. Ali Ebrahim Abdelaziz ... Enjoy ^_^ ! "
echo "================================================"
select option in createdb listdb connectdb dropdb exit_DBMS
do
	case $option in
			createdb )
				echo "enter Database Name : "
				read dbname
				source dbmanibulations/createdb.sh $dbname
				;;
                        listdb )
                               	#echo "this is the list of created databases"
                                source dbmanibulations/listdb.sh
				;;
                        connectdb )
                                source dbmanibulations/connectdb.sh
				;;
                        dropdb )
                                #echo "drop a database"
                                source dbmanibulations/dropdb.sh
				;;
			exit_DBMS )
				exit
				;;
                        * )
                                echo "Invalid value, please enter option from [ 1 .to. 5 ]"
				sleep 2
				clear
                                source databasemenu.sh
                                ;;
	esac
done
