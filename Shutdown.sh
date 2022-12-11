function Shutdown
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
    echo -e "\n\n\n\n\n\n\n\n\n\t\t\t\t\t\c"
    echo -e "Thank You for Using this OS...\c"|pv -qL 5
    sleep 6
    clear
}
Shutdown