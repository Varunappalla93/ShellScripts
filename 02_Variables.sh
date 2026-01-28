# Day 15
#!/bin/bash

# Variables
# NAME="Varun"
# AGE=32

# echo "Hi ${NAME}, how are you doing ? and your age is ${AGE}" 


# passing variable arguments via terminal
# NAME=$1
# AGE=$2
# echo "Hello I am ${NAME} and my age is ${AGE}"

# O/P - Hello I am QA and my age is 49

# read output from terminal and assign to the variable name
echo "Please enter your username"
read USERNAME
echo "username is ${USERNAME}"

echo "Please enter your password"
read -s PASSWORD
echo "password is ${PASSWORD}"