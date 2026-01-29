# Day 16
#!/bin/bash

# Functions

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Pls run this script with root user access"
    exit 1
fi


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
dnf install nginx -y
VALIDATE $? "nginx installation"

echo "Installing mysql"
dnf install mysql -y
VALIDATE $? "sql installation"