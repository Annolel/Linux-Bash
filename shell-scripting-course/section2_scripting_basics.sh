#!/bin/bash
# 1. Write a shell script that prints "Shell Scripting is Fun!" to the screen.
echo "Shell Scripting is Fun!"

# 2. Modify the shell script from exercise 1 to include a variable. The variable will hold the contents of the message "Shell Scripting is Fun!".
text="Shell Scripting is Fun!"
echo $text

# 3. Store the output of the command "hostname" in a variable. Display "This script is running on _______." where "_______" is the output of the "hostname" command.
a=$(hostname)
echo "This script is running on ${a}."

# 4. Write a shell script to check to see if the file "/etc/shadow" exists. 
# If it does exist, display "Shadow passwords are enabled." Next, check to see if you can write to the file. 
# If you can, display "You have permissions to edit /etc/shadow." If you cannot, display "You do NOT have permissions to edit /etc/shadow."
if [ -f /etc/shadow ] 
then
    echo "Shadow passwords are enabled."
    if [ -w /etc/shadow ]
    then
        echo "You have permissions to edit /etc/shadow."
    else
        echo "You do NOT have permissions to edit /etc/shadow."
    fi
else
    echo "Shadow passwords are disabled."
fi

# 5. Write a shell script that displays "man", "bear", "pig", "dog", "cat", and "sheep" to the screen with each appearing on a separate line. 
# Try to do this in as few lines as possible.
list="man bear pig dog cat sheep"
for word in $list
do
    echo $word
done

# 6. Write a shell script that prompts the user for a name of a file or directory and reports if it is a regular file, a directory, or other type of file. 
# Also perform an ls command against the file or directory with the long listing option.
read -p "Write a name of a file or directory: " P
if [ -f $P ]
then
    echo "$P is a regular file"
    ls -l
elif [ -d $P ]
then
    echo "$P is a directory"
    ls -l
else
    echo "$P is some other type of file"
    ls -l
fi


# 7. Modify the previous script so that it accepts the file or directory name as an argument instead of prompting the user to enter it.
if [ -f $1 ]
then
    echo "$1 is a regular file"
    ls -l
elif [ -d $1 ]
then
    echo "$1 is a directory"
    ls -l
else
    echo "$1 is some other type of file"
    ls -l
fi

# 8. Modify the previous script to accept an unlimited number of files and directories as arguments. Hint: You'll want to use a special variable.
for P in $@
do
    if [ -f $P ]
    then
        echo "$P is a regular file"
        ls -l
    elif [ -d $P ]
    then
        echo "$P is a directory"
        ls -l
    else
        echo "$P is some other type of file"
        ls -l
    fi
done