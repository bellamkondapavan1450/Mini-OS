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
	if read -t 5 c;
	then
		echo "Closing: "
		start
	else
		start
	fi
}
Dup
