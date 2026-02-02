# Day 18
#!/bin/bash

COUNTRY=INDIA

echo "I am in: $COUNTRY"
echo "PID of script 1 is $$"

# call another script using sh -  this will have another process id, cannot access script 1 variables.
sh 11_2_CallfromAnotherScript.sh

# I am in: INDIA
# PID of script 1 is 14696
# I am in: UAE
# PID of script 2 is 14697

# or use source - second script will share same process id with script 1, can access script 1 variables.
source ./11_2_CallfromAnotherScript.sh

# I am in: UAE
# PID of script 2 is 14696