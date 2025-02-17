#!/bin/bash

# Just input ./combine_csv.sh <Lx> <Ly> <h_value>

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <Lx> <Ly> <h_value> <K_value>"
    exit 1
fi

# Assign the input parameters to variables
Lx=$1
Ly=$2
h_value=$3
K_value=$4 

# Calculate the inverse of Lx
inverse_Lx=$(awk "BEGIN {print 1/$Lx}")

# Define the base name of the files and the range
base_name="results_L${Lx}_${Ly}_${inverse_Lx}_${h_value}_${K_value}_rank_"
output_file="results_L${Lx}_${Ly}_${inverse_Lx}_${h_value}_${K_value}_combined.csv"
range=63

# Remove the output file if it already exists
rm -f "$output_file"

# Combine the files
for i in $(seq 0 $range); do
    input_file="${base_name}${i}.csv"
    if [ -f "$input_file" ]; then
        cat "$input_file" >> "$output_file"
    else
        echo "Warning: File $input_file does not exist."
    fi
done

echo "Combined CSV file created: $output_file"
wc -l $output_file
