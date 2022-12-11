function Boot
{
	clear
	echo -e "\n\n\n\n\n\n\n\n\t\t\t\t\c"
	echo -e "WELCOME...\c"|pv -qL 3
	sleep 1.5
	echo -e "\n\n\n\t\t\t\t\t\t\c"
	echo -e "Getting Things Ready for you...\c"|pv -qL 5
	sleep 2
	clear
	echo -e "BOOTING UP YOUR OS...\c"|pv -qL 5
	sleep 1
	i="y"
	while [ $i = "y" ]
	do
		clear
		echo -e "BOOTING UP YOUR OS\c"
		sleep 1.5
		echo -e "...\c"|pv -qL 3
		if read -t 1 c;
		then
		    	break
		fi
	done
	clear
	# start
}
Boot