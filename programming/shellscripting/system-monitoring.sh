#!/bin/bash
# System Monitoring
# Monitor CPU, memory, and process info

echo "Checking system health..."

# CPU & Memory snapshot
top -b -n1 | head -10

# Check if Apache is running
ps -ef | grep apache | grep -v grep

# Log system snapshot
df -h > ~/system_disk_usage.log
echo "Disk usage saved to ~/system_disk_usage.log"

# Commands Used:

# ps -ef → list processes

# grep -v grep → avoid listing the grep command itself

# df -h → human-readable disk usage
