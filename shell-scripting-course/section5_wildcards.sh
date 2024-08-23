#!/bin/bash

# Exercise 1:
# Write a shell script that renames all files in the current directory that end in ".jpg" to begin with today's date in the following format: YYYYMMDD. 
# For example, if a picture of my cat was in the current directory and today was October 31, 2016 it would change name from "mycat.jpg" to "2016­10­31­mycat.jpg".
# Hint: Look at the format options to the date command.
# For "extra credit" make sure to gracefully handle instances where there are no ".jpg" files in the current directory. 
# (Hint: Man bash and read the section on the nullglob option.)

shopt -s nullglob
todayDate=$(date +"%Y%m%d")
cd "/mnt/c/users/Gnom/Desktop/New folder"
for image in *.jpg
do
    newName="${todayDate}${image}" 
    mv $image $newName
    echo "Renamed $image to $newName"
done 
if [ -z "$(ls *.jpg 2>/dev/null)" ]
then
    echo "No .jpg files found in the current directory."
fi
shopt -u nullglob

Exercise 2:

# Write a script that renames files based on the file extension. The script should prompt the user for a file extension. 
# Next, it should ask the user what prefix to prepend to the file name(s). By default the prefix should be the current date in YYYY­MM­DD format. 
# So, if the user simply presses enter the date will be used. Otherwise, whatever the user entered will be used as the prefix. 
# Next, it should display the original file name and the new name of the file. Finally, it should rename the file.

read -p "Enter the new file extension: " exstension
read -p "Enter the prefix: " prefix
if [[ -z $prefix ]] 
then
    prefix=$(date +"%Y%m%d")
fi
for file in *.$exstension
do
    newName="${prefix}${file}" 
    mv $file $newName
    echo "Renamed $file to $newName"
done

