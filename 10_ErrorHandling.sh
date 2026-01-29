# Day 16
#!/bin/bash

# Error Handling
# set and trap to use instead of validate function
set -e  # this will check for errors, will exit if errors are there.
trap 'echo "There is error in $LINENO, Command: $BASH_COMMAND"' ERR

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
# colors
DEFAULT='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'

if [ $USERID -ne 0 ]; then
    echo -e "$RED Pls run this script with root user access $DEFAULT"
    exit 1
fi

mkdir -p $LOGS_FOLDER

for package in $@    # sudo sh 08_Loops.sh nginx mysql
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
    else
        echo -e "$package is already installed, $BLUE skipping $NORMAL"
    fi
done