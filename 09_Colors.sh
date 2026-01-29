# Day 16
#!/bin/bash

# echo -e "$RED Hello World $DEFAULT, $GREEN I am learning linux $DEFAULT"

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
# colors
NORMAL='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'


if [ $USERID -ne 0 ]; then
    echo -e "$RED Pls run this script with root user access $NORMAL"
    exit 1
fi

mkdir -p $LOGS_FOLDER

# Validate function
# tee - tee is a command that copies input to both the screen and the log file at the same time.
VALIDATE()
{
if [ $1 -ne 0 ]; then
    echo -e "Installing $2... $RED failed $NORMAL" | tee -a $LOGS_FILE
    exit 1
else
    echo -e "Installing $2... $GREEN success $NORMAL" | tee -a $LOGS_FILE
fi
}

for package in "$@" 
do
    dnf list installed "$package" &>> "$LOGS_FILE"
    if [ $? -ne 0 ]; then
        echo "$package is not installed, installing now"
        dnf install "$package" -y &>> "$LOGS_FILE"
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $BLUE SKIPPING $NORMAL"
    fi
done