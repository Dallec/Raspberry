#!/bin/bash

downMode=$1
folder=""

if [ "$downMode" = "d" ]

then

    dateTime=$(date)
    newDay=${dateTime:0:3}
    folder=$newDay
    echo "Mode is: $downMode and Day of the day is: $folder"

else

   folder="Gen"
   echo "Mode and folder is: $folder"

fi

sudo killall -s 9 startvideo.sh
sudo killall -s 9 omxplayer
sudo rm -rf /home/pi/Videos/$folder/*
echo "Removing file /home/pi/Videos/$folder/*"

echo "Downloading file from the folder $folder on Google Drive"
rclone sync -v GoogleTestDrive:$folder/ /home/pi/Videos/$folder/

echo "Download finished, check the video in the $folder folder."
