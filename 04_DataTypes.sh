# Day 15
#!/bin/bash

# DataTypes - Variables hold data types - Number or string
NUM1=100
NUM2=200

# String is considered as 0

SUM=$(($NUM1+$NUM2))
echo "SUM is ${SUM}"
# SUM is 300


# Arrays
FRUITS=("APPLE" "BANANA" "POM")

echo "Fruits are ${FRUITS[@]}"
# Fruits are APPLE,BANANA,POM

echo "First Fruit is ${FRUITS[0]}"
echo "Second Fruit is ${FRUITS[1]}"
