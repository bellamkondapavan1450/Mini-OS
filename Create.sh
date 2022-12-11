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
    if read -t 5 c;
    then
        echo "Closing: "
        start
    else
        start
    fi
}
Create