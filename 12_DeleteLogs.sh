# Day 19
#!/bin/bash

# touch -d 20260101 shipping.log -> creates file with date
# -d stands for date

# find files more than 14 days
# find . -name "*.log" -type f -mtime +14

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR=/home/ec2-user/applogs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR does not exist"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -type f -mtime +14)

# echo "$FILES_TO_DELETE"

# O/P:
# /home/ec2-user/applogs/shipping.log
# /home/ec2-user/applogs/cart.log


while IFS= read -r filepath;
do
   echo "Deleting file: $filepath" 
   rm -f $filepath
   echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE  # <<< for inputting variable