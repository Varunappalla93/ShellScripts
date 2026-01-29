# Day 15
#!/bin/bash

# Special Variables - can be used only inside double quotes, i.e. " "
# $1 $2......$N  - args passed to script via terminal 
# $@ - All args passed to script  -> $@ - treats args separately
# $# - No of args passed to script
# $0 - Script Name
# $PWD - present working directory
# $USER - who is executing the script
# $HOME - home directory of the current user
# $$ - PID of the script
# $! - Background process id
# $* - All args passed to script  -> $* - treats as single args
# $? - Exit status of previous command

echo "All args passed to script : $@"  
echo "No of variables passed to script : $#"
echo "Script name: $0"
echo "Present working directory : $PWD"
echo "Who is executing the script: $USER"
echo "Home directory of current user : $HOME"
echo "PID of script : $$"
sleep 100 &
echo "PID of recently executed backgroung process : $!"
echo "All args passed to script : $*"  
echo "Exit status of previous command : $?"  


# O/P - 
# All args passed to script : var vin
# No of variables passed to script : 2
# Script name: 03_Variables_2.sh
# Present working directory : /home/ec2-user/ShellScripts
# Who is executing the script: ec2-user
# Home directory of current user : /home/ec2-user
# PID of script : 2163
# PID of recently executed backgroung process : 2164
# All args passed to script : var vin
# Exit status of previous command : 0