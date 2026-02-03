# Day 19
#!/bin/bash

# eg:
count=1

while [ $count -le 5 ];
do
    echo "count is $count"
    sleep 1
    ((count++))
done


# count is 1
# count is 2
# count is 3
# count is 4
# count is 5

# eg:
while IFS= read -r line;
do
    echo "$line"
done < 12_DeleteLogs.sh