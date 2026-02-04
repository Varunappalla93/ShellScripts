# Day 20

# disk utilsation, trigger email if utilization is more than 3%

#!/bin/bash

NORMAL='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'
MESSAGE=""

log()
{
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") || $1" | tee -a $LOGS_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')

    if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
        MESSAGE+="High Disk usage on $PARTITION:$USAGE% \n"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"