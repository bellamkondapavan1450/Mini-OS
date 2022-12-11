function Boot
{
	clear
	echo -e "\n\n\n\n\n\n\n\n\t\t\t\t\c"
	echo -e "WELCOME...\c"|pv -qL 3
	sleep 1.5
	echo -e "\n\n\n\t\t\t\t\t\t\c"
	echo -e "Getting Things Ready for you...\c"|pv -qL 5
	sleep 3
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

function Restart
{
    clear
	echo -e "\n\n\n\n\n\n\n\n\t\t\t\t\t\c"
	echo -e "Signing out...\c"|pv -qL 3
	sleep 1.5
	echo -e "\n\n\n\t\t\t\t    \c"
	echo -e "Saving All your data...\c"|pv -qL 5
	i="Y"
	while [ $i = "Y" ]
	do
		clear
		echo -e "\n\n\n\n\n\n\n\n\t\t\t\t\tSigning out...\c"
	    echo -e "\n\n\n\t\t\t\t    Saving All your data\c"
	    echo -e "...\c"|pv -qL 5
		if read -t 2 c;
		then
		    	break
		fi
	done
    clear
    sleep 3
	echo -e "\n\n\n\n\n\n\n\n\n\t\t\t\t\t\c"
	echo -e "Restarting...\c"|pv -qL 3
    while [ $i = "Y" ]
	do
		clear
		echo -e "\n\n\n\n\n\n\n\n\n\t\t\t\t\tRestarting\c"
	    echo -e "...\c"|pv -qL 5
		if read -t 2 c;
		then
		    	break
		fi
	done
    Boot
}
Restart