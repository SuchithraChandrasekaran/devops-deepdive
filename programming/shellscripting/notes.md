# 1) Shell and ssh

## 1. !/bin/ksh and #!/bin/bash – Shebang Lines
These are called shebang lines, and they are used at the top of a script file to tell the system which shell interpreter to use to run the script.

### #!/bin/ksh
Tells the system: "Use the Korn shell (ksh) to run this script."

ksh is an older shell with some scripting features useful in enterprise Unix systems.

### #!/bin/bash
Tells the system: "Use the Bash shell (Bourne Again SHell) to run this script."

bash is the most commonly used shell on Linux.

Example:
If you write a script hello.sh:
```
#!/bin/bash
echo "Hi Suchithra!"
```
Then run it:
```
chmod +x hello.sh
./hello.sh
```
It will run with Bash.

## 2. /bin/ksh and /bin/bash – Shell Executables
These are the actual shell programs installed on your system.

/bin/bash → The Bash shell binary file.

/bin/ksh → The Korn shell binary file.

They are located under /bin/ which is the directory for essential user commands.

## 3. ssh – Remote Login Tool
Completely different purpose!

ssh = Secure Shell

It's not a shell like bash or ksh.

It’s a tool used to connect to remote computers securely over a network.

Example:
```
ssh username@remote-ip
```
This will start a secure terminal session with another machine.

# 2) File Permission

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

Numeric (Octal) Mode

Each permission has a value:

r = 4, w = 2, x = 1

Calculate total for each user type:

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
