#!/bin/bash

CODE_DIR="./Code"
OUTPUT_FILE="./output.csv"

# -j                 - # of concurrency 
# flock $FileName    - ensure only 1 thread to execute on $FileName (-x ensure 1 process can hold at a time) 
# {1..501..100}      - start, stop (not include), step

echo -e "Starting integer, Ending integer, Sum" > $OUTPUT_FILE
# Use parallel with flock to ensure only one process writes to the file at a time
parallel -j 6 "./${CODE_DIR}/sum {} \$(({}+99))" ::: {1..600..100} | flock -x $OUTPUT_FILE -c "cat >> $OUTPUT_FILE"

# show the content & info the combined file
echo "Below is the content of $OUTPUT_FILE," 
cat $OUTPUT_FILE