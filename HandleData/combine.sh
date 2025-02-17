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
for file in "$CURR_DIR"/*.csv; do 
    # exclude the sum.csv 
    # Append the content of each CSV file, excluding the header, to the output file
    tail -n +2 "$file" >> "$OUTPUT_CSV_File"
done

# Calculate the sum as well
# Handle the error 

# show the content & info the combined file
echo "Below is the content of $OUTPUT_CSV_File, " 
cat $OUTPUT_CSV_File
wc --line $OUTPUT_CSV_File

