#!/bin/bash

# Usage: ./combine.sh > combine.log 2> combine.err.log 

# 1. Set the variables 

CURR_DIR=$(pwd)
DATA_DIR="${CURR_DIR}/DataAndCode"
OUTPUT_CSV_File="${DATA_DIR}/sum_combined.csv"

if [ -f "$OUTPUT_CSV_File" ]
then 
    rm $OUTPUT_CSV_File
    echo -e "Previous $OUTPUT_CSV_File is removed. \n"
fi 

# 2. Loop through the content of different csv and combine the data

cd $DATA_DIR
echo -e "Now working in directory : $DATA_DIR \n"
echo -e "Below are the files to be processed:"
filelist=$(find $DATA_DIR -type f -regex "${DATA_DIR}/sum_[0-9]+_[0-9]+.csv")
for file in $filelist
do 
    basename $file | xargs -I {} echo {}
done 

while true
do
    echo "Are you sure to continue? [y/n]"
    read user_input
    if [ "$user_input" == "y" -o "$user_input" == "Y" ]; then
        break
    elif [ "$user_input" == "n" ]; then
        echo "The script will be terminated."
        exit 0
    else
        echo "Invalid input. Please enter 'y' or 'n'."
    fi
done

echo "Starting integer, Ending integer, Sum" >> "$OUTPUT_CSV_File"
for file in $filelist 
do
    # Extract the base name from the full path
    base=$(basename "$file")

    # Append the content of each CSV file, excluding the header, to the output file
    echo "Processing file : ${base}"
    tail -n +2 "${base}" >> "$OUTPUT_CSV_File"

done

# Calculate the sum as well
# -F set the separator to be comma 
# BEGIN - Print the message before the start of program 
# NR > 1 - Process the data from row 1. Go through the file row by row. $3 refers to 3rd rows
# END {print sum} - show the sum after processing all lines
column_sum=$(
    awk -F , '
    NR > 1 {
        sum += $3 
    }
    END {
    print "The sum is " sum 
    }' "${OUTPUT_CSV_File}" 
)
echo $column_sum >> $OUTPUT_CSV_File

# show the content & info the combined file
echo -e "Below is the content of $OUTPUT_CSV_File, \n " 
cat $OUTPUT_CSV_File

cd $CURR_DIR





