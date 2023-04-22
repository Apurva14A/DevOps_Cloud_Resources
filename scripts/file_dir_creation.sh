#!/bin/bash


# Creating a file

echo -e "Please choose the one of below options\n 1. File creation \n 2. Directory creation "

read NUM

if [ $NUM -eq 1 ]
 then
     read -p "Please provide the name of the file you want to create" FILE_NM
     touch $FILE_NM
     echo "File successfully created"
else
     read -p Please provide the name of the directory you want to create" DIR_NM
     mkdir $DIR_NM
     echo " Directory successfully created"
fi
