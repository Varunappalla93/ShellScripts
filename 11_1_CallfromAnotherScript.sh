# Day 18
#!/bin/bash

COUNTRY=INDIA

echo "I am in: $COUNTRY"
echo "PID of script 1 is $$"

# call another script
sh 11_2_CallfromAnotherScript.sh

# I am in: INDIA
# PID of script 1 is 14242
# I am in: UAE
# PID of script 2 is 14243