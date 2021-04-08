#!/bin/bash
#This program makes a backup copy of the folder I need.

name=$1
folder=$2
date=$3
proverka=$4
amountBackups=$5

if [[ -z $date ]]
then
        echo "Backup folder $folder"
        zip -r -q $name $folder
fi

if [[ "$date" == "-d" ]]
then
        echo "Backup folder $folder with date"
        zip -r -q $name-$(date +"%G-%m-%d-%H-%M-%S") $folder
else
        echo "If you want to create folder with date. you need to use -d 3 parametr"
fi

if [[ "$proverka" == "-c" && -n $amountBackups ]]
then
        while [[ `ls | grep "${name}-" | wc -l` > $amountBackups ]]
        do
                oldFile=`ls | grep "${name}-" | head -1`
                echo "delete old file $oldFile"
                rm "${oldFile}"
        done
else
        echo "If you want to delete old file $name. you need to use -c 4 parametr and use number of 5 parametr "
fi
