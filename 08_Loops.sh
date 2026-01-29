# Day 16
#!/bin/bash

# Loops
# for i in {1,2,3}
# do
#     echo $i
# done
# 1 2 3


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Pls run this script with root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

# Validate function
# tee - tee is a command that copies input to both the screen and the log file at the same time.
VALIDATE()
{
if [ $1 -ne 0 ]; then
    echo "Installing $2... failed" | tee -a $LOGS_FILE
    exit 1
else
    echo "Installing $2... success" | tee -a $LOGS_FILE
fi
}

for package in $@    # sudo sh 08_Loops.sh nginx mysql
do
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE $? "$package installation"
done