#!/bin/bash

# This is a bash script that takes the user's name in terminal, or read user's name after the start of the program 
# and says "Merry Christmas" to the user afterwards. 

# 1. Handle the user's input 
if [ $# -eq 0 ]
then 
    echo -n "Please input your name: " 
    read name
    echo " Hello, $name"
elif [ $# -eq 1 ]
then 
    echo "Hello, $1"
    name=$1 
else
    echo "Too many variables are given." 
    echo "Script usage: " 
    echo "./MerryChristmas <your name>"
fi 

echo " At this moment, I just wanna say ... " 
echo -e "\n" 
echo -e "\n" 

sleep 3                                     # Add some delay 

# 2. Says Merry Christmas  
echo " ###################################################################### "
echo " ###################################################################### "
echo "                                                                        " 
echo "                                                                        " 
echo "                                  *                                     "
echo "                                 ***                                    "
echo "                                  *                                     "
echo "                                  *                                     "
echo "                                 ***                                    "
echo "                                *****                                   "
echo "                               *******                                  "
echo "                              *********                                 "
echo "                             ***********                                "
echo "                            *************                               "
echo "                           ***************                              "
echo "                          *****************                             "
echo "                                 ***                                    "
echo "                                                                        " 
echo "                                                                        " 
echo " ###################################################################### "
echo " ###################################################################### "
echo -e "\n"

echo " ###################################################################### "
echo " #                      Merry Christmas, $name !                      # "
echo " ###################################################################### "
