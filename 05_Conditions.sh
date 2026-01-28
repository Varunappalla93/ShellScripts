# Day 15
#!/bin/bash

# Conditions
# if-else if -else
if [Condition]; then
code
elif [Condition]; then
code
else
code
fi

# -gt -lt -eq -ne -ge -le

NUMBER=$1

if [$NUMBER -gt 20] then;
echo "Given Number: $NUMBER is greater than 20"
fi

