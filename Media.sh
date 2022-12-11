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
}
Media