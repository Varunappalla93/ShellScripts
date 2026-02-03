# Day 19
#!/bin/bash

# touch -d 20260101 shipping.log -> creates file with date
# -d stands for date

# find files more than 14 days
# find . -name "*.log" -type f -mtime +14

NORMAL='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$0.log"


if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR does not exitst"
    exit 1
fi

FILESTODELETE=$(find $LOGS_DIR -name "*.log" -type f -mtime +14)
echo "$FILES_TO_DELETE