# SBCP Source Build Control Panel

## Information about the system

It allows you to perform the long build process and subsequent transfers with a few short commands.

## Usage GAME BUILD

##STEP 1:
Invoke the file on the terminal.
```BASH
cd /usr/src
sh build.sh
```

##STEP 2:
There will be 3 different options. 1 builds only GAME, 2 builds only DB and 3 builds GAME and DB.

First I will show you how to build a GAME. We choose 1.
##STEP 3:
The backup process will create a backup of your old game file, if you choose it as a backup, and assign it as .tar.gz as the source name and the date as the name.
If you choose the option to make a backup, the backup phase will be blank. In the example, I will choose the backup option so that you can see that area as well.
##STEP 4:
Choosing the file to build SBCP will list you all the folders in the src folder.
In this area, you will select the source folder you want to build. You must enter your name completely, paying attention to upper and lower case letters.
I will select the Vectors_Source folder and show this example through this source.
##STEP 5:
You need to enter the game src path, I thought of doing this automatically, but many friends change it
e.g; source/game/src,server/game/src or directly game/src that's why I presented it as selectable.
It will show in the example with the source name you selected on the screen that comes up.

The build process will start. Wait until it's over...
##STEP 6:
After the build process is completed, you need to select the game file created. I thought to do this automatically, but everyone assigns a name to the game file compiled according to their head, so I have to choose this one too, or it will give an error.
I want you to enter the name of the file I am giving you as a list so that you can see the files that have been created.
Since the name of the game file created in Vectors_Source is game_r_55170_32, I enter its name.
##STEP 7:
It will wait for a few seconds to compress and rename the file you selected.
Then you have to specify where you want it to be moved. I'm giving you the directory list, what you need to do is specify which directory your game file is in, the game file of the game I use is in the share/bin directory, so I enter it as share/bin.
##STEP END
That's it, if you chose backup, your old game file will be backed up.
Then the old game file will be deleted and the new game file will be moved and then the file permissions will be given.
Finally, you will receive a warning that the build process has been completed and the process will be completed.

## USAGE DB BUILD

#STEP 1:
Invoke the file on the terminal.
```BASH
cd /usr/src
sh build.sh
```

##STEP 2:
There will be 3 different options. 1 builds only GAME, 2 builds only DB and 3 builds GAME and DB.

Second, I will show you how to build a DB. 2 We choose.
##STEP 3:
The backup process will create a backup of your old db file if you choose it as backup, assigning the source name and date as .tar.gz and creating it.
If you choose the option to make a backup, the backup phase will be blank. In the example, I will choose the backup option so that you can see that area as well.
##STEP 4:
Choosing the file to build SBCP will list you all the folders in the src folder.
In this area, you will select the source folder you want to build. You must enter your name completely, paying attention to upper and lower case letters.
I will select the Vectors_Source folder and show this example through this source.
##STEP 5:
You need to enter the db src path, I thought of doing this automatically, but many friends change it
e.g; source/db/src,server/db/src or direct db/src that's why I presented it as selectable.
It will show in the example with the source name you selected on the screen that comes up.

The build process will start. Wait until it's over...
##STEP 6:
After the build process is completed, you need to select the created db file. I thought of doing this automatically, but everyone assigns a name to the compiled db file, so I have to choose this as well, or it will give an error.
I want you to enter the name of the file I am giving you as a list so that you can see the files that have been created.
Since the name of the db file created in Vectors_Source is db_r55170, I enter its name.
##STEP 7:
It will wait for a few seconds to compress and rename the file you selected.
Then you have to specify where you want it to be moved. I'm giving you the directory list. What you need to do is to specify which directory your db file is in. The db file of the game I use is also in the share/bin directory, so I enter it as share/bin.
##STEP END
That's it, if you chose backup, your old db file will be backed up.
Then the old db file will be deleted and the new db file will be moved and then the file permissions will be given.
Finally, you will receive a warning that the build process has been completed and the process will be completed.

## USAGE GAME AND DB BUILD
There is nothing to explain at length here, you choose 3 and you do the 2 operations we have done above, one after the other.

Let's say you selected 1,2 or 3, completed the process and chose backup.
The backed up files are transferred to the directory where the game and db file are located, and you can find them there.

Finally, you don't need to take any action. You can use the built files by restarting the game.
The backups are named based on the name of your source file and the date you built it, and compress it as tar.gz.

