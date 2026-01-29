# Day 16
#!/bin/bash

# Logs
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

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "nginx installation"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "sql installation"

# sudo less /var/log/shell-script/07_Logs.sh.log - to check logs


# # Redirections
# ls -l > ou.txt-> stores command output to ou.txt file.
# ls -l > ou.txt -> stores only successful command output to ou.txt file.
# lsfd 2> ou.txt-> stores only failed command output to ou.txt file.
# fdsls -l &> ou.txt -> stores all success and failed command outputs to ou.txt file.
# ls -l &>> ou.txt -> stores all failed and success command outputs to ou.txt file along with to append previous outputs.