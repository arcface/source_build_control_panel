#!/bin/sh
# SBCP [Source Build Control Panel]
# ARCFACE
# 03.01.2020
# www.arcface.net
clear
echo
echo -e "\033[32m TEXT 2 \033[0m"
echo
echo -e "\033[31m SBCP(SOURCE BUILD CONTROL PANEL)! \033[0m"
echo -e "\033[31m SOURCE COMPILATION CONTROL PANEL! \033[0m"
echo
echo -e "\033[32m Choose What to build; \033[0m"

echo -e "\033[36m
 1 - GAME\n
 2 - DB\n
 3 - GAME + DB \033[0m"
echo
echo -e "\033[32m To select it, simply enter the digit. \033[0m"
echo
read build_file_cont
while ! [ "${build_file_cont}" = "${build_file_cont#*[^0-9]}" ] || [ $build_file_cont -lt 1 ] || [ $build_file_cont -gt 3 ]; do
    clear
    echo
    echo "You made a mistake, do it again and again;"
    echo
    echo -e "\033[32m Choose What to build; \033[0m"
    echo -e "\033[36m
     1 - GAME\n
     2 - DB\n
     3 - GAME + DB \033[0m"
    echo -e "\033[32m To select it, simply enter the digit. \033[0m"
    echo
    read build_file_cont
done

clear
echo
echo -e "\033[32m Do you want backup of old files? Select; \033[0m"
echo
echo -e "\033[36m
 1 - Make a Backup \n
 2 - Making a Backup \033[0m"
echo
echo -e "\033[32m To select, just enter the number and press ENTER. \033[0m"
echo
read backup_cont
while ! [ "${backup_cont}" = "${backup_cont#*[^0-9]}" ] || [ $backup_cont -lt 1 ] || [ $backup_cont -gt 2 ]; do
    clear
    echo
    echo "You keyed incorrectly, select again;"
    echo
    echo -e "\033[36m
     1 - Make a Backup \n
     2 - Making a Backup \033[0m"
    echo
    echo -e "\033[32m To select, just enter the number and press ENTER. \033[0m"
    echo
    read backup_cont
done

clear

echo -e "\033[32m Select source folder; \033[0m"
echo
work
echo
echo -e "\033[36m You must enter the full name of the source folder\n
If you want to choose which source file by paying attention to upper and lower case letters \n
write it in full. \033[0m"
echo
echo -e "\033[32m Just press ENTER after typing the file name. \033[0m"
echo
read build_source_dir

while [ ! -d "$build_source_dir" ]; do
    clear
    echo
    echo -e "\033[31m Folder Not Found. \033[0m Please select again;"
    echo
    work
    echo
    echo -e "\033[32m Re-enter the folder name; \033[0m"
    read build_source_dir
done

case $build_file_cont in
one*)
clear
echo
echo -e "\033[36m Because there are sources with different paths \n
You need to enter the path to your game src field; \n
\033[31m
E.g; \n
$build_source_dir/source/game/src \n
$build_source_dir/game/src
\033[0m

 \033[0m"
echo
echo -e "\033[32m $build_source_dir Your directory contents are listed below. \033[0m"
ls $build_source_dir
echo
echo -e "\033[32m Enter the directory path as in the examples. \033[0m"
echo
read build_source_dir_game

while [ ! -f "$build_source_dir/$build_source_dir_game/input.cpp" ]; do
    clear
    echo
    echo -e "\033[31m You did not enter the directory path correctly \033[0m Please type the path again;"
    echo
    echo -e "\033[36m Since there are sources with different paths, you need to enter the path of your game src field; \n
    \033[31m For example; \n $build_source_dir/source/game/src \n $build_source_dir/game/src \033[0m"
    echo
    ls $build_source_dir
    echo
    echo -e "\033[32m Re-enter the folder path; \033[0m"
    read build_source_dir_game
done
clear

echo -e "\033[32m Starting build... \033[0m"
sleep 2

echo -e "\033[32m Cleaning source... \033[0m"
sleep 2

cd /usr/src/$build_source_dir/$build_source_dir_game

gmake clean

echo -e "\033[32m Compiling source... \033[0m"
sleep 2
gmake dep
gmake -j20

clear
echo -e "\033[33m GAME Source build completed. \033[0m"
    echo
    echo -e "\033[36m Enter the name of the newly created file to compress the resulting game file. \033[0m"
    echo
    ls /usr/src/$build_source_dir/$build_source_dir_game/../
    echo
    echo -e "\033[32m You need to choose from above listed; \033[0m"

    cd /usr/src/$build_source_dir/$build_source_dir_game/../

    read build_source_dir_game_file

    while [ ! -f "$build_source_dir_game_file" ]; do
        clear
        echo
        echo -e "\033[31m You entered an incorrect filename \033[0m Please retype;"
        echo
        ls /usr/src/$build_source_dir/$build_source_dir_game/../
        echo
        echo -e "\033[32m You need to choose from above listed; \033[0m"
        cd /usr/src/$build_source_dir/$build_source_dir_game/../

        read build_source_dir_game_file
    done

    clear

    cd /usr/src/$build_source_dir/$build_source_dir_game/../

    strip -s $build_source_dir_game_file

    echo -e "\033[33m File compressed. \033[0m"

    echo -e "\033[32m Renaming selected file... \033[0m"

    sleep 2

    cd /usr/src/$build_source_dir/$build_source_dir_game/../
    mv $build_source_dir_game_file game

    echo -e "\033[33m Filename changed. \033[0m"

    sleep 2
    clear
    echo
    echo -e "\033[36m Enter game path to move the built file; \033[0m"
    echo -e "\033[36m For example; \n
   share \n
    Do not share/bin \n share/game or share/bin/game, just enter the directory where the game file is located.
     \033[0m"
    echo
    ls /usr/game/
    echo
    echo -e "\033[32m Enter the path from the list above; \033[0m"

    cd /usr/game/

    read files_game_dir

    while [ ! -f "$files_game_dir/game" ]; do
        clear
        echo
        echo -e "\033[31m The game was not found at the path you entered.\033[0m \033[36m Try again; \033[0m"
        echo
    echo -e "\033[36m For example; \n
    share \n
    Do not share/bin \n share/game or share/bin/game, just enter the directory where the game file is located.
     \033[0m"
    echo
        ls /usr/game/
        echo
        echo -e "\033[32m Enter the path from the list above; \033[0m"

        cd /usr/game/

        read files_game_dir
    done
    if [ $backup_cont = 1 ]
    then
    clear
    
    echo -e "\033[32m Backing up old game file... \033[0m"

    sleep 2
    cd /usr/game/$files_game_dir && tar cvzf $build_source_dir"_game_"`date +"%Y_%m_%d_%H_%M_%S"`.tar.gz game
    echo -e "\033[33m Backup has been created. You can access the backup via /usr/game/$files_game_dir. \033[0m"
    sleep 2
    fi

    clear
    echo -e "\033[32m Deleting old game... \033[0m"
    sleep 2
    rm /usr/game/$files_game_dir/game
    echo -e "\033[32m Old game deleted. Transferring new file... \033[0m"
    sleep 2
    cp /usr/src/$build_source_dir/$build_source_dir_game/../game /usr/game/$files_game_dir
    echo -e "\033[33m File transferred. Granting file permissions... \033[0m"
    rm /usr/src/$build_source_dir/$build_source_dir_game/../game
    sleep 2
    chmod 0777 /usr/game/$files_game_dir/game
    clear
    echo -e "\033[33m File transferred. File permissions Granted. \033[0m"
;;
2nd*)
clear
echo
echo -e "\033[36m Because there are sources with different paths \n
You need to enter the path to your db src field; \n
\033[31m
E.g; \n
$build_source_dir/source/db/src \n
$build_source_dir/db/src
\033[0m

 \033[0m"
echo
echo -e "\033[32m $build_source_dir Your directory contents are listed below. \033[0m"
ls $build_source_dir
echo
echo -e "\033[32m Enter the directory path as in the examples. \033[0m"
echo
read build_source_dir_db

while [ ! -f "$build_source_dir/$build_source_dir_db/Main.cpp" ]; do
    clear
    echo
    echo -e "\033[31m You did not enter the directory path correctly \033[0m Please type the path again;"
    echo
    echo -e "\033[36m Since there are sources with different paths, you need to enter the path of your DB src field; \n
    \033[31m For example; \n $build_source_dir/source/db/src \n $build_source_dir/db/src \033[0m"
    echo
    ls $build_source_dir
    echo
    echo -e "\033[32m Re-enter the folder path; \033[0m"
    read build_source_dir_db
done
clear

echo -e "\033[32m Starting build... \033[0m"
sleep 2

echo -e "\033[32m Cleaning source... \033[0m"
sleep 2

cd /usr/src/$build_source_dir/$build_source_dir_db

gmake clean

echo -e "\033[32m Compiling source... \033[0m"
sleep 2
gmake dep
gmake -j20

clear
echo -e "\033[33m DB Source build completed. \033[0m"
    echo
    echo -e "\033[36m Enter the name of the newly created file to compress the resulting DB file. \033[0m"
    echo
    ls /usr/src/$build_source_dir/$build_source_dir_db/../
    echo
    echo -e "\033[32m You need to choose from above listed; \033[0m"

    cd /usr/src/$build_source_dir/$build_source_dir_db/../

    read build_source_dir_game_file

    while [ ! -f "$build_source_dir_game_file" ]; do
        clear
        echo
        echo -e "\033[31m You entered an incorrect filename \033[0m Please retype;"
        echo
        ls /usr/src/$build_source_dir/$build_source_dir_db/../
        echo
        echo -e "\033[32m You need to choose from above listed; \033[0m"
        cd /usr/src/$build_source_dir/$build_source_dir_db/../

        read build_source_dir_game_file
    done

    clear

    echo -e "\033[32m Renaming selected file... \033[0m"
    sleep 2

    cd /usr/src/$build_source_dir/$build_source_dir_db/../
    mv $build_source_dir_game_file db
    echo
    echo -e "\033[33m Filename changed. \033[0m"

    sleep 2
    clear
    echo
    echo -e "\033[36m Enter the DB path to move the built file; \033[0m"
    echo -e "\033[36m For example; \n
    share \n
    Do not share/bin \n share/db or share/bin/db, just enter the directory where the DB file is located.
     \033[0m"
    echo
    ls /usr/game/
    echo
    echo -e "\033[32m Enter the path from the list above; \033[0m"

    cd /usr/game/

    read files_db_dir

    while [ ! -f "$files_db_dir/db" ]; do
        clear
        echo
        echo -e "\033[31m DB not found at the path you entered.\033[0m \033[36m Try again; \033[0m"
        echo
    echo -e "\033[36m For example; \n
    share \n
    Do not share/bin \n share/db or share/bin/db, just enter the directory where the DB file is located.
     \033[0m"
    echo
        ls /usr/game/
        echo
        echo -e "\033[32m Enter the path from the list above; \033[0m"

        cd /usr/game/

        read files_db_dir
    done
    if [ $backup_cont = 1 ]
    then
    clear
    
    echo -e "\033[32m Backing up old DB file... \033[0m"
    
    sleep 2
    cd /usr/game/$files_db_dir && tar cvzf $build_source_dir"_db_"`date +"%Y_%m_%d_%H_%M_%S"`.tar.gz game
    
    clear
    echo -e "\033[33m Backup has been created. You can access the backup via /usr/game/$files_db_dir. \033[0m"
    sleep 2
    fi

    echo -e "\033[32m Deleting old DB... \033[0m"
    sleep 2
    echo
    rm /usr/game/$files_db_dir/db
    echo -e "\033[32m Old DB deleted. Transferring new file... \033[0m"
    sleep 2
    echo
    cp /usr/src/$build_source_dir/$build_source_dir_db/../db /usr/game/$files_db_dir
    echo -e "\033[33m DB transferred. Granting file permissions... \033[0m"
    rm /usr/src/$build_source_dir/$build_source_dir_db/../db
    sleep 2
    clear
    chmod 0777 /usr/game/$files_db_dir/db
    echo -e "\033[33m DB transferred. File permissions Granted. \033[0m"
;;
esac
echo
echo -e "\033[33m Build completed. \033[0m"
