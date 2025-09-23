#!/bin/bash
# Download file, filter information, retrieve and process data

# Step 1: Download a file
curl -s -o DP.txt "https://raw.githubusercontent.com/SuchithraChandrasekaran/CPP/main/DesignPatterns/DP.md"

# Step 2: Count occurrences of "class"
echo "Count occurrences of - singleton : "
grep -i "singleton" DP.txt | wc -l

# Step 3: Print first 5 lines using awk
echo "First 5 lines using awk cmd"
awk 'NR<=5' DP.txt
