#!/bin/bash

# Usage: ./combine.sh > combine.log 2> combine.err.log 

# 1. Set the variables 
OUTPUT_CSV_File="sum_combined.csv"
CURR_DIR=$(pwd)

if [ -f "$OUTPUT_CSV_File" ]
then 
    rm $OUTPUT_CSV_File
    echo -e "Previous $OUTPUT_CSV_File is removed. \n"
fi 

# 2. Loop through the content of different csv and combine the data

echo -e "Now working in directory : $CURR_DIR \n"
echo "Starting integer, Ending integer, Sum" > "$OUTPUT_CSV_File" # header 
for file in $(find $CURR_DIR -type f -regex "${CURR_DIR}/sum_[0-9]+_[0-9]+.csv"); 
do
    # Extract the base name from the full path
    basename=$(basename "$file")

    # Append the content of each CSV file, excluding the header, to the output file
    echo "Processing the file ${basename}"
    tail -n +2 "${basename}" >> "$OUTPUT_CSV_File"

done
echo -e "\n"

# Calculate the sum as well
# -F set the separator to be comma 
# END {print sum} - show the sum after processing all lines 
column_sum=$(awk -F, '{sum += $3} END {print "The sum is " sum}' "$OUTPUT_CSV_File")
#echo "The sum is ${column_sum}"
echo $column_sum >> $OUTPUT_CSV_File

# show the content & info the combined file
echo "Below is the content of $OUTPUT_CSV_File, " 
cat $OUTPUT_CSV_File





