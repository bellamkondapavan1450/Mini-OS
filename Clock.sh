function Clock
{
	clear
	while !(read -t 1 c;)
	do
		clear
		echo -e "Time Now: `date +%H:%M:%S`\c"
	done
}
Clock
