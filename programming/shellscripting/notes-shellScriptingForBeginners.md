## 1. Introduction to Automation & Shell Scripting

Automation is reducing repetitive manual work using scripts.

**Example:**  Automatically backup files daily instead of copying manually.

**Step:** Use Bash (.sh) files to write scripts.

```
#!/bin/bash
# Simple backup script
cp /home/suchithra/data.txt /home/suchithra/backup/data.txt
echo "Backup completed!"
```

## 2. Basics of Shell Commands
Creating files, listing files, man command, basic file manipulation.

**Steps:** Create files and folders:
```
# Create file
touch file1.txt

# Create folder
mkdir myfolder

# List files
ls -l

# man for help:
man ls
```
## 3. SSH & Terminal Usage
Connect to VM using Putty or Linux terminal.

**Steps:**
Open Putty → enter VM IP → connect via SSH.

**Login with credentials.**
Commands to navigate: cd, ls, pwd.

## 4. Choosing a Shell
bash vs sh

bash supports advanced features like arrays, arithmetic operations.

/bin/sh is simpler, POSIX-compatible.
```
#!/bin/bash
echo "This is Bash shell"
```
## 5. File Permissions & CHMOD

**Step:** Give execution permission to scripts.
```
chmod +x script.sh   # make executable
./script.sh          # run the script
```
**Explanation:**
r → read, w → write, x → execute

Use ls -l to view permissions.

## 6. Basic Scripting Concepts
echo command: print text

echo "Hello World"

**Comments:**
```
# This is a comment
```
**Variables:**
```
name="Suchithra"
echo "Hello $name"
```
## 7. Script Execution & Debugging
**Debug Mode:**
```
#!/bin/bash
set -x   # debug mode
```
**Error handling:**
```
set -e         # exit on errors
set -o pipefail  # catch pipe failures
```
## 8. Process & System Monitoring

**Commands:**
```
top      # monitor processes
ps -ef   # list running processes
```

**Pipe usage:**
```
ps -ef | grep apache   # filter apache process
```

## 9. Input/Output & Processing

**Commands:** grep, awk, cut
```
# Print 2nd column of a file
awk '{print $2}' file.txt

# Count occurrences
grep -o "a" file.txt | wc -l
```

## 10. Loops & Conditional Statements

**If-else:**
```
if [ -f file.txt ]; then
    echo "File exists"
else
    echo "File missing"
fi
```
**For loop:**
```
for i in {1..5}; do
    echo "Iteration $i"
done
```
**Break statement:**  stop loop at condition

## 11. Advanced Scripting

**Trap command:** handle signals like Ctrl+C

      trap "echo Script interrupted; exit" SIGINT

**Find files:**
      find /home/user -name "*.txt"

**Curl for external resources:**
      curl  https://example.com/file.txt

## 12. Links & File Handling

**Soft vs Hard links:**
```
ln file.txt hardlink.txt    # hard link
ln -s file.txt softlink.txt # symbolic link
```
**Read-only mode:**
less file.txt

## 13. Log Management & Best Practices
**Log rotation:** move old logs to backup
      mv logfile.log logfile_$(date +%F).log

**Best practices:**
- Comment scripts
- Use meaningful variable names
- Handle errors
