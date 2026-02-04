# Day 20

# 1. user should pass source_dir dest_dir, default is 14 days, but user can override
# 2. verify the directories exist and root user too
# 3. find the files
# 4. archive them and place into dest_dir
# 5. check archive is success or not
# 6. if success you can delete from source_dir

#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
SRC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is default value if DAYS arg is not supplied by user

# colors
NORMAL='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[33m'

log()
{
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") || $1" | tee -a $LOGS_FILE
}


if [ $USERID -ne 0 ]; then
    log -e "$RED Pls run this script with root user access $NORMAL"
    exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE()
{
    log "$RED USAGE :: sudo backup <SRC_DIR> <DEST_DIR> <DAYS>[Default 14 DAYS] $NORMAL"
    exit 1
}


if [ $# -lt 2 ]; then
    USAGE
fi


if [ ! -d $SRC_DIR ]; then
    log -e "$RED source directory $SRC_DIR does not exist $NORMAL" 
    exit 1
fi


if [ ! -d $DEST_DIR ]; then
    log -e "$RED destination directory $DEST_DIR does not exist $NORMAL" 
    exit 1
fi


# find the files
FILES=$(find $SRC_DIR -name "*.log" -type f -mttime +$DAYS)

log "Backup started"
log "source directory: $SRC_DIR"
log "destination directory: $DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then 
    log "No files to archive"
else
    log "Files Found to archive: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/applogs/$TIMESTAMP.tar.gz"
    log "Archive name: $ZIP_FILE_NAME"
    tar -zcvf $ZIP_FILE_NAME $(find $SRC_DIR -name "*.log" -type f -mtime +$DAYS)

    # Check archive is success or not
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archival is success"

        while IFS= read -r filepath;
        do
        # Process each line here
        log "Deleting file: $filepath" 
        rm -f $filepath
        log "Deleted file: $filepath"
        done <<< $FILES  
    else
        log "Archival is failed"
        exit 1
    fi
fi

# to execute script - sudo sh 15_backup.sh /home/ec2-user/applogs /home/ec2-user/destdir

# copy files in one path and adds execute permission for user, group, and others so that to execute like a command.
# sudo cp 15_backup.sh /usr/bin/backup 
# sudo chmod +x /usr/bin/backup 
# sudo backup /home/ec2-user/applogs /home/ec2-user/destdir - to execute like a command for cron jobs.