# Day 15
#!/bin/bash

# DataTypes - Variables hold data types
NUM1=100
NUM2=200

# String is considered as 0

SUM=$(($NUM1+$NUM2))
echo "SUM is ${SUM}"


# Arrays
FRUITS=("APPLE","BANANA","POM")
echo "Fruits are ${FRUITS[@]}"