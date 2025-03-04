#!/bin/bash

# Ensure the backup directory exist 
BACKUP_DIR="./BackUp"
CURR_DIR=$(pwd)

if [ -d "$BACKUP_DIR" ]
then 
    echo "${BACKUP_DIR} exists."
else
    mkdir $BACKUP_DIR
    echo "${BACKUP_DIR} is created."
fi 

# Copy the csv file there 
if find "$CURR_DIR" -type f -regex "$CURR_DIR/sum_[0-9]+_[0-9]+\.csv"| xargs -I {} cp {} $BACKUP_DIR
then
    echo "Files copied successfully."
    echo "Below are the content of the $BACKUP_DIR, "
    ls -lt $BACKUP_DIR
else
    echo "Failed to copy files."
fi



