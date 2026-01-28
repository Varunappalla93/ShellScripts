# Day 15
#!/bin/bash

# Conditional Statements:
# if-else if -else condition:
# if [Condition]; then
# code
# elif [Condition]; then
# code
# else
# code
# fi

# greater than, lesser than, equals to, not equals to, greater than equal to, less than equal to conditions
# -gt -lt -eq -ne -ge -le

# eg: to check if number is greater, equal or less.
NUMBER=$1
if [ $NUMBER -gt 20 ]; then
    echo "Given Number: $NUMBER is greater than 20"
elif [ $NUMBER -eq 20 ]; then
    echo "Given Number: $NUMBER is equal to 20"
else
    echo "Given Number: $NUMBER is less to 20"
fi

$? -> exit status of previous command -> 0 to 127 
0 - stands for success
anything not 0 - failure

# eg: 
# to check if we can run this script only with root user, not normal user based on user id.
# root user id is always 0 , other users id is always greater than 0
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Pls run this script with root user access"
    exit 1
fi

echo "Installing nginx"
dnf install nginx -y

# to check if nginx installation is passed or failed, based on the previous command, i.e. nginx installation exit status.
if [ $? -ne 0 ]; then
    echo "Installing nginx... failed"
    exit 1
else
    echo "Installing nginx... success"
fi