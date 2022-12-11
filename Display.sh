function Display
{
    echo -e "Enter the dir in which you want to display all sub dirs and files : \c"
    read dir
    echo "Displaying all the dirs and files : "
    ls $dir *
}
Display