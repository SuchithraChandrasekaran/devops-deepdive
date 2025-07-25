#  Shell scripting

## 1. !/bin/ksh and #!/bin/bash – Shebang Lines
These are shebang lines, used at the top of a script file to tell the system which shell interpreter to use to run the script.

### #!/bin/ksh
Tells the system: "Use the Korn shell (ksh) to run this script."

### #!/bin/bash
Tells the system: "Use the Bash shell (Bourne Again SHell) to run this script." bash is the most commonly used shell on Linux.

Example:
hello.sh:
```
#!/bin/bash
echo "Hi Suchithra!"
```
run it:
```
chmod +x hello.sh
./hello.sh
```
It will run with Bash.

### /bin/ksh and /bin/bash – Shell Executables
/bin/bash → The Bash shell binary file.

/bin/ksh → The Korn shell binary file.

They are located under /bin/ which is the directory for essential user commands.

### ssh – Remote Login Tool
ssh = Secure Shell
- It’s a tool used to connect to remote computers securely over a network.

Example:
```
ssh username@remote-ip
```
This will start a secure terminal session with another machine.

## 2. File Permission
Each file and directory in Linux has **three types of permissions** assigned to **three categories of users**.
### Categories of Users
1. **User (u)**: The owner of the file.
2. **Group (g)**: Users belonging to the same group as the file.
3. **Others (o)**: All other users.

### Types of Permissions
| Symbol | Meaning       | File Description           | Directory Description             |
|--------|---------------|----------------------------|-----------------------------------|
| `r`    | Read          | View file contents         | List directory contents (`ls`)    |
| `w`    | Write         | Modify or delete file      | Create, delete, or rename inside  |
| `x`    | Execute       | Run file as a program      | Enter directory (`cd`)            |

Numeric (Octal) Mode : Each permission has a value:  r = 4, w = 2, x = 1

| rwx |	Binary |	Decimal |
|-----|--------|----------|
| rwx |  111	   | 7 |
| r-x	|  101	   | 5 |
| r--	|  100	   | 4 |

File Permission – Octal Summary

| Octal | Symbol     | Meaning                      |
|--------|------------|------------------------------|
| 777   | rwxrwxrwx | Full access to all           |
| 755   | rwxr-xr-x | Owner full, others can read/execute |
| 700   | rwx------ | Only owner has full access   |
| 644   | rw-r--r-- | Owner can read/write, others read-only |
| 600   | rw------- | Only owner can read/write    |
| 444   | r--r--r-- | Read-only for everyone       |
| 000   | ---------- | No permissions at all        |

## 3. Debug & Control
| Command     | Purpose                                     |
|-------------|---------------------------------------------|
| `set -x`    | Print each command before execution (debug) |
| `set -e`    | Exit script if any command fails            |
| `set -o`    | Enable shell options                        |

## 4. System Info Commands
| Command     | Purpose                                     |
|-------------|---------------------------------------------|
| `df -h`     | Show disk usage in human-readable format    |
| `free -g`   | Show memory usage in GB                     |
| `nproc`     | Show number of CPU cores                    |

## 5. Processes
| Command                          | Purpose                                      | 
|----------------------------------|----------------------------------------------|
| `ps -ef`                         | Show all running processes with full details | 
| ```ps -ef \| grep "suchithra" ```     | Filter processes with name "suchithra"       |
| ```ps -ef \| grep suchithra \| awk -F" " '{print $2}'``` | Extracts the PID (2nd field) of matching processes     |

## 6. Process Types
| Type       | Description                                              |
|------------|----------------------------------------------------------|
| Daemon     | Background service (e.g., `cron`, `sshd`)               |
| Orphan     | Parent died, adopted by `init`/`systemd`                |
| Zombie     | Completed but not cleaned up; shows `<defunct>`         |

## 7. Networking
| Command                 | Purpose                               | Example                                                        |
|-------------------------|---------------------------------------|----------------------------------------------------------------|
| `curl <URL>`            | Fetch content from a URL              | `curl https://github.com/SuchithraChandrasekaran`              |
| `wget <URL>`            | Download file from a URL              | `wget https://example.com/file.zip`                            |

## 8. Root Access
| Command      | Purpose                                |
|--------------|-----------------------------------------|
| `sudo su -`  | Switch to root , (sudo -super user do , su substitute user)|

## 9. Find & Filter
| Command                            | Purpose                                 | Example                                              |
|------------------------------------|-----------------------------------------|------------------------------------------------------|
| `find`                             | Locate files/directories                | `find . -name "*.log"`                          |
| `awk`                              | Text processing, field-wise             | `awk -F":" '{print $1}' /etc/passwd`                |

## 10. Control Structures
| Construct      | Purpose                        | Example                                 |
|----------------|--------------------------------|-----------------------------------------|
| `if`, `else`   | Conditional execution          | `if [ $x -eq 1 ]; then echo "Yes"; fi`  |
| `for`          | Loop over items                | `for i in 1 2 3; do echo $i; done`      |

## 11. Signals & Process Control
| Command/Keyword    | Purpose                                | Example                                  |
|--------------------|----------------------------------------|------------------------------------------|
| `trap`             | Catch/handle signals                   | `trap 'echo CTRL+C pressed' SIGINT`      |
| `kill`             | Send signal to a process               | `kill -9 <PID>` to forcefully terminate  |
