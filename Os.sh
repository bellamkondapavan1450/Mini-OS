function system_info {
       echo "### OS information ###"
       uname -a
       echo "### Processor information ###"
       processor=`grep -wc "processor" /proc/cpuinfo`
       model=`grep -w "model name" /proc/cpuinfo  | awk -F: '{print $2}'`
       echo "Processor = $processor"
       echo "Model     = $model"
       echo
       echo "### Memory information ###"
       total=`grep -w "MemTotal" /proc/meminfo | awk '{print $2}'`
       free=`grep -w "MemFree" /proc/meminfo | awk '{print $2}'`
       echo "Total memory: $total kB"
       echo "Free memory : $free kB"
       if read -t 5 c; then
	    echo "Closing: "
	    start
	   else
	    start
       fi
}

function calc {
    
    sum=0
    i="y"
    clear
    echo "Enter one no."
    read n1
    sum=$n1
    while [ $i = "y" ]
    do
    echo "Enter your Operation"
    read ch
    echo "Enter second no."
    read n2
    case $ch in
        +)sum=`expr $sum + $n2`
         echo "Sum ="$sum;;
        -)sum=`expr $sum - $n2`
         echo "Sub = "$sum;;
        *)sum=`expr $sum \* $n2`
         echo "Mul = "$sum;;
        /)sum=`expr $sum / $n2`
         echo "Div = "$sum;;
        *)echo "Invalid choice";;
    esac
    echo "Do u want to continue ?"
    read i
    if [ $i != "y" ]
    then
        start
    fi
    done
}

function transfer {
echo "Press Enter to enter your command"
if read -t 2 response;
  then
	start
else
    clock
fi
}

function clock {
clear
runtime="1 second"
endtime=$(date -ud "$runtime" +%s)

while [[ $(date -u +%s) -le $endtime ]]
do
    echo "Time Now: `date +%H:%M:%S`"
    sleep 1
    clear
done

transfer
}

function create {
	echo "Type 1 for File Creation"
	echo "Type 2 for Directory creation"
	echo "Type 3 for both"
	read ch
	case $ch in
		1)echo "enter file name"
		 read text3
		 touch $text3;;
		2)echo "enter the name of folder to be created"
		 read text
		 mkdir "$text";;
		3)echo "enter the name of folder to be created"
		 read text
		 mkdir "$text"
		 echo "do you want to create a file in this folder"
		 read text1
		 if [ $text1 == "y" ]
		 then
			 echo "enter file name"
			 read text3
			 touch $text/$text3
		 fi;;
	esac
    	if read -t 5 c; then
	    echo "Closing: "
	    start
	else
	    start
    fi
}

function display {
    echo "Displaying Directories:"
    echo 
    for item in *
    do
    	if [ -d $item ]
    	  then
    		echo -e '\U1F4C1'
    		echo $item
    	fi
    done
    echo
    echo "Displaying Files:"
    echo
    for item in *
    do
    	if [ -f $item ]
    	  then

    		echo -e '\U1F4C4'
    		echo $item
    	fi
    done
    if read -t 5 c; then
	    echo "Closing: "
	    start
    else
	    start
    fi
}

function dup {

TMP_FILE=$(mktemp /tmp/temp_file.XXX)
DUP_FILE=$(mktemp /tmp/dup_file.XXX)

function add_file() {
  echo "$1" "$2"  >> $TMP_FILE
}

function red () {
   /bin/echo -e "\e[01;31m$1\e[0m" 1>&2
}

function del_file() {
    rm -f "$1" 2>/dev/null
    [[ $? == 0 ]] && red "File \"$1\" deleted"
}

function srch_file() {
  local NEW="$1"
  local SUM="0"
  if [ -f $NEW ] && [ ! -s $TMP_FILE ];then
     echo $(sha512sum ${NEW} | awk -F' ' '{print $1}')
     return
  fi
  while read ELEMENT; do
    SUM=$(sha512sum ${NEW} | awk -F' ' '{print $1}')
    ELEMENT_SUM=$(echo $ELEMENT | awk -F' ' '{print $1}')
    ELEMENT_FILENAME=$(echo $ELEMENT | awk -F' ' '{print $2}')
    if [ "${SUM}" == "${ELEMENT_SUM}" ];then
       echo $ELEMENT_FILENAME > $DUP_FILE
       return 1
    else
       continue
    fi
  done<$TMP_FILE
  echo "${SUM}"
}

function begin_search_and_deduplication {
  local DIR_TO_SRCH="$1"
  for FILE in `find ${DIR_TO_SRCH} -type f`; do
     RET=`srch_file ${FILE}`
     if [[ "${RET}" == "" ]];then
         FILE1=`cat $DUP_FILE`
         echo "$FILE1 is a duplicate of $FILE"
         while true; do
            read -rp "Which file you wish to delete? $FILE1 (or) $FILE: " ANS
            if [ $ANS == "$FILE1" ];then
               del_file $FILE1
               break
            elif [ $ANS == "$FILE" ];then
               del_file $FILE
               break
            fi
         done
         continue
     elif [[ "${RET}" == "0" ]];then
          continue
     elif [[ "${RET}" == "1" ]];then
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
if read -t 5 c; then
	    echo "Closing: "
	    start
	   else
	    start
       fi
}

function playmusic {
  echo "the list of the mp3 files are"
  echo -e '\U1F3B6'
  find /home/Pavan -name "*.mp3"
  echo "the list of the mp3 files are"
  find /home/Pavan -name "*.mp4"
  echo -e '\U1F39E'
  echo "the list of the mp3 files are"
  echo -e '\U1F39E'
  find /home/Pavan -name "*.mkv"
  echo "enter the song name you want to play with extension"
  read name 
  echo "playing song in "$(find /home/paidipraneeth -name $name)""
  play $(find /home/paidipraneeth -name $name)
echo "do you want to play another song"
		 read text1
		 if [ $text1 == "y" ]
		 then
			 playmusic
		 elif read -t 5 c; 
		 then
	    			echo "Closing: "
	    			start
	   			else
	    			start
       		fi
}

function search {
	echo " Enter file Name"
	read ser
	find /home -name "$ser"
	if read -t 5 c; then
	    echo "Closing: "
	    start
	else
	    start
       fi
}
function list {
echo "the list of commands are"
echo "------------------------"
echo "1-display"
echo "2-create"
echo "3-calc"
echo "4-about"
echo "5-clock"
echo "6-dup"
echo "7-media"
echo "8-search"
echo "9-off"
echo "10-visualization(still working on it)"
echo "------------------------"
if read -t 5 c; then
	    echo "Closing: "
	    start
	   else
	    start
       fi
}
function start {
echo "Enter Your COMMAND: "
read c
case $c in 
	display)display;;
	create)create;;
	calc)calc;;
	about)system_info;;
	clock)clock;;
	dup)dup;;
	media)playmusic;;
	search)search;;
	list)list;;
	off)notify-send 'BYE - BYE' 'OUR OPERATING SYSTEM WAITS FOR YOU' -u critical -t 10000 -i face-worried
	 exit ;;
	*)clock;;
esac
}

clear
sleep 2
i="y"
while [ $i = "y" ]
do
	clear
	echo "BOOTING UP YOUR OS..."
	sleep 1
	echo -e "_ \c"
	if read -t 1 c;
	then
	    	break
	else
	    	continue
	fi
done
clear
notify-send 'WELCOME TO OUR OPERATING SYSTEM' 'Created By Pavan, Prabhath, Venkatesh, Sharath, Rohith!!!' -u critical -t 10000 -i checkbox-checked-symbolic
start
