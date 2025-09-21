#!/bin/bash
# Trap and Error Handling
# Demonstrate signal trapping and error handling

set -e
set -o pipefail

trap "echo 'Script interrupted! Exiting...'; exit 1" SIGINT SIGTERM

echo "Starting script..."

ls /nonexistent_folder  # This will fail and stop the script
echo "This line will not execute if previous command fails"

##Explanation:
##set -e → exit script if any command fails
##set -o pipefail → catch failures in pipelines
##trap → catch signals like Ctrl+C
