# Day 20

# disk utilsation, trigger email if utilization is more than 3%

#!/bin/bash

NORMAL='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'
MESSAGE=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1"
}

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7}')

    if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
        MESSAGE+="High Disk usage on $PARTITION: $USAGE% <br>"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"

# call mail script to trigger mail
sh 17_mail.sh "info@joindevops.com" "High Disk Usage Alert on $IP_ADDRESS" "$MESSAGE" "HIGH_DISK_USAGE" "$IP_ADDRESS" "DevOps Team"