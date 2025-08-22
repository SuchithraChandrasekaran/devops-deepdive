#!/bin/bash
# Loops and Conditions
# Check file existence and iterate over numbers

files=("file1.txt" "file2.txt" "file3.txt")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "$file exists"
    else
        echo "$file does not exist"
    fi
done

# Break example
for i in {1..10}; do
    echo "Number: $i"
    if [ "$i" -eq 5 ]; then
        echo "Breaking the loop at 5"
        break # stops the loop
    fi
done
