function Search
{
	echo e " Enter File Name : \c"
	read ser
	find / -name "$ser"
	if read -t 5 c; then
	    echo "Closing: "
	    start
	else
	    start
       fi
}
Search
