#!/bin/bash 

# This a simple script that compile the executables & do checking

# Show the current working directory 
CURR_DIR=$(pwd)
echo -e "You are now at: $CURR_DIR \n"

# Compilation & checking 
g++ sum.cpp -o sum
if [ $? -ne 0 ] # exit state is not 0
then  
    echo "Compilation fails." >&2 
    exit 1 
else
    echo "Compilation succeeds !"
fi 