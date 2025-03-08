#!/bin/bash 

# This a simple script that compile the executables & do checking

# Show the current working directory 
CURR_DIR=$(pwd)
cd "${CURR_DIR}/Code"
echo "Change to the directory: $(pwd)"  

# Compilation & checking 
g++ sum.cpp -o sum
if [ $? -ne 0 ] # exit state is not 0
then  
    echo "Compilation fails." >&2 
    exit 1 
else
    echo "Compilation succeeds !"
fi 

cd "$CURR_DIR"