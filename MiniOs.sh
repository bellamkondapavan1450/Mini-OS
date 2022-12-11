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
	start
}

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

function Clock
{
	clear
	while !(read -t 1 c;)
	do
		clear
		echo -e "Time Now: `date +%H:%M:%S`\c"
	done
    if read -t 100 c;
	then
		start
	fi
}

function Calc 
{
	echo -e "Enter First No. : \c"
	read n1
	echo -e "Enter Operation : \c"
	read ch
	res=0
	case $ch in
		+)
		echo -e "Enter Second No. : \c"
		read n2
		res=`expr $n1 \+ $n2`
		echo "Result = "$res;;
		-)
		echo -e "Enter Second No. : \c"
		read n2
		res=`expr $n1 \- $n2`
		echo "Result = "$res;;
		\*)
		echo -e "Enter Second No. : \c"
		read n2
		res=`expr $n1 \* $n2`
		echo "Result = "$res;;
		/)
		echo -e "Enter Second No. : \c"
		read n2
		res=`expr $n1 \/ $n2`
		echo "Result = "$res;;
		*)
		echo "Invalid Choice...";;
	esac
	echo "Do u want to continue? (Y/N)"
	read i
	if [ $i == "Y" ]
	then
		Calc
	else
		echo "Done..."
	fi
    if read -t 100 c;
	then
		start
	fi
}

function Search
{
	echo -e " Enter File Name : \c"
	read ser
	find / -name "$ser"
	if read -t 100 c;
	then
		start
	fi
}

function Create
{
    echo "Type 1 for File Creation."
    echo "Type 2 for Directory Creation"
    echo "Type 3 for Creating Both."
    read ch
    case $ch in
        1)
            echo -e "Enter File Name : \c"
            read text3
            touch $text3;;
        2)
            echo -e "Enter the Name of Folder to be Created : \c"
            read text
            mkdir "$text";;
        3)
            echo -e "Enter the Name of Folder to be Created : \c"
            read text
            mkdir "$text"
            echo -e "Do you want to Create a File in this Folder (Y/N): \c"
            read i
            if [ $i == "Y" ]
            then
                echo -e "Enter File Name : \c"
                read text3
                touch $text/$text3
            else
                echo -e "Enter the Name of Directory in which you want to Creat : \c"
                read text
                echo -e "Enter File Name : \c"
                read text3
                touch $text/$text3
            fi;;
    esac
    if read -t 100 c;
	then
		start
	fi
}

function Display
{
    echo -e "Enter the dir in which you want to display all sub dirs and files : \c"
    read dir
    echo "Displaying all the dirs and files : "
    ls $dir *
    if read -t 100 c;
	then
		start
	fi
}

function Dup
{
	TMP_FILE=$(mktemp /tmp/temp_file.XXX)
	DUP_FILE=$(mktemp /tmp/dup_file.XXX)

	function add_file()
	{
		echo "$1" "$2"  >> $TMP_FILE
	}

	function red ()
	{
		/bin/echo -e "\e[01;31m$1\e[0m" 1>&2
	}

	function del_file()
	{
		rm -f "$1" 2>/dev/null
		[[ $? == 0 ]] && red "File \"$1\" deleted"
	}

	function srch_file()
	{
		local NEW="$1"
		local SUM="0"
		if [ -f $NEW ] && [ ! -s $TMP_FILE ];
		then
			echo $(sha512sum ${NEW} | awk -F' ' '{print $1}')
			return
		fi
		while read ELEMENT;
		do
			SUM=$(sha512sum ${NEW} | awk -F' ' '{print $1}')
			ELEMENT_SUM=$(echo $ELEMENT | awk -F' ' '{print $1}')
			ELEMENT_FILENAME=$(echo $ELEMENT | awk -F' ' '{print $2}')
			if [ "${SUM}" == "${ELEMENT_SUM}" ];
			then
				echo $ELEMENT_FILENAME > $DUP_FILE
       				return 1
    			else
				continue
			fi
		done<$TMP_FILE
		echo "${SUM}"
	}

	function begin_search_and_deduplication
	{
		local DIR_TO_SRCH="$1"
		for FILE in `find ${DIR_TO_SRCH} -type f`;
		do
			RET=`srch_file ${FILE}`
			if [[ "${RET}" == "" ]];
			then
				FILE1=`cat $DUP_FILE`
				echo "$FILE1 is a duplicate of $FILE"
				while true;
				do
					read -rp "Which file you wish to delete? $FILE1 (or) $FILE: " ANS
					if [ $ANS == "$FILE1" ];
					then
						del_file $FILE1
						break
					elif [ $ANS == "$FILE" ];
					then
						del_file $FILE
						break
					fi
			 	done
				continue
			elif [[ "${RET}" == "0" ]];
			then
				continue
			elif [[ "${RET}" == "1" ]];
			then
				continue
			else
				add_file "${RET}" ${FILE}
				continue
			fi
		done
	}

	echo "Enter directory name to search: "
	echo "Press [ENTER] when ready"
	read DIR
	begin_search_and_deduplication "${DIR}"
	rm -f $TMP_FILE
	rm -f $DUP_FILE
	if read -t 100 c;
	then
		start
	fi
}

function Info
{
	echo
	echo -e "\t\t-----------------OS information-----------------"
	echo
	echo -e "Os Name : \c"
	uname -r
	echo
	echo -e "\t\t-------------Processor information--------------"
	echo
	cat /proc/cpuinfo | grep 'model name' | uniq
	echo -e "No. of Processors : \c"
	cat /proc/cpuinfo | grep processor | wc -l
	echo
	echo -e "\t\t---------------Memory information---------------"
	echo
	free -m
	echo
    if read -t 100 c;
	then
		start
	fi
}

function Media
{
    echo "Type 1 to play music."
    echo "Type 2 to watch videos."
    echo -e "Enter your choice : \c"
    read ch
    case $ch in
        1)
            echo "The List of Music present are : "
            find /home/Music -name "*.mp3"
            echo -e "Enter the song name you want to play : \c"
            read name
            echo "Playing this song (find /home/Music -name $name)"
            play $(find /home/Music -name $name);;
        2)
            echo "The List of Videos present are : "
            find /home/Videos -name "*.mp4"
            echo -e "Enter the video name you want to play : \c"
            read name
            echo "Playing this song (find /home/Videos -name $name)"
            play $(find /home/Videos -name $name);;
    esac
    if read -t 100 c;
	then
		start
	fi
}

function List
{
    echo "the list of commands are"
    echo "------------------------"
    echo "1-Calc"
    echo "2-Clock"
    echo "3-Create"
    echo "4-Display"
    echo "5-Dup"
    echo "6-Info"
    echo "7-Media"
    echo "8-Restart"
    echo "9-Search"
    echo "10-Shutdown"
    echo "------------------------"
    if read -t 100 c;
	then
		start
	fi
}


function start
{
    clear
    echo -e "Enter Your COMMAND : \c"
    read c
    case $c in 
        Calc)Calc;;
        Clock)Clock;;
        Create)Create;;
        Display)Display;;
        Dup)Dup;;
        Info)Info;;
        Media)Media;;
        Restart)Restart;;
        Search)Search;;
        Shutdown)Shutdown;;
        list)list;;
    esac
}
Boot
exit