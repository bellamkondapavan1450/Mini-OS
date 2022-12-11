function system_info {
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
}
system_info
