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
VALIDATE()
{
if [ $1 -ne 0 ]; then
    echo "Installing $2... failed"
    exit 1
else
    echo "Installing $2... success"
fi
}

echo "Installing nginx"
dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "nginx installation"

echo "Installing mysql"
dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "sql installation"

# Redirections
ls -l > ou.txt-> stores command output to ou.txt file.
ls -l > ou.txt -> stores only successful command output to ou.txt file.
lsfd 2> ou.txt-> stores only failed command output to ou.txt file.
fdsls -l &> ou.txt -> stores all success and failed command outputs to ou.txt file.
ls -l &>> ou.txt -> stores all failed and success command outputs to ou.txt file along with to append previous outputs.