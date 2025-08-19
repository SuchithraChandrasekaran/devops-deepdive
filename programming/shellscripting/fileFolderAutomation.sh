#!/bin/bash
# Script 1: File & Folder Automation
# Creates folder, files, and sets permissions

# Step 1: Create a folder
mkdir -p ~/my_project

# Step 2: Create files
touch ~/my_project/file1.txt ~/my_project/file2.txt

# Step 3: Add content
echo "This is file1" > ~/my_project/file1.txt
echo "This is file2" > ~/my_project/file2.txt

# Step 4: Set permissions
chmod 644 ~/my_project/file1.txt
chmod 600 ~/my_project/file2.txt

# Step 5: List files with permissions
ls -l ~/my_project

# Commands Used:

# mkdir -p → creates folder if it doesn’t exist

# chmod → sets read/write/execute permissions

# echo → writes content into files

# Run:

# chmod +x fileFolderAutomation.sh
# ./fileFolderAutomation.sh
