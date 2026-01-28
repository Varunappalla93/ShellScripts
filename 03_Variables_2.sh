# Day 15
#!/bin/bash

# Special Variables - can be used only inside " "
# $1 $2......$N  - args passed to script via terminal 
# $@ - All variables passed to script
# $# - No of variables passed to script
# $0 - Script Name
# $PWD - present working directory
# $USER - who is executing the script
# $HOME - home directory of the current user
# $$ - PID of the script
# $! - Background process id

echo "All args passed to script : $@"
echo "No of variables passed to script : $#"
echo "Script name: $0"
echo "Present working directory : $PWD"
echo "Who is executing the script: $USER"
echo "Home directory of current user : $USER"
echo "PID of script : $PID"
sleep 100 &
echo "PID of recently executed backgroung process : $!"
echo "All args passed to script : $*"