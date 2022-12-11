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
}
echo "Hello..."
Calc

