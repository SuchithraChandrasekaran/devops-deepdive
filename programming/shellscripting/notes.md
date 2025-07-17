
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
