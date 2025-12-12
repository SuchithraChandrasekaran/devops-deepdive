# EC2 Deep Dive & Jenkins Deployment

Steps in deploying Jenkins on AWS EC2 Ubuntu instance from Windows.

## Step 1: Launch EC2 Instance

1. **Login to AWS Console** → Navigate to EC2 Dashboard
2. **Click "Launch Instance"**
3. **Configure Instance:**
   - **Name**: `jenkins-server`
   - **AMI**: Ubuntu Server 22.04 LTS
   - **Instance Type**: `t2.medium` (minimum for Jenkins)
   - **Key Pair**: Create new key pair
     - Name: `jenkins-key`
     - Type: RSA
     - Format: `.pem`
     - **Download and save the `.pem` file**

4. **Network Settings:**
   - Create security group: `jenkins-sg`
   - Allow SSH (port 22) from the IP
   - Allow HTTP (port 8080) from anywhere (for Jenkins)
   - Allow HTTPS (port 443) - optional

5. **Storage**: 20 GB gp3 
6. **Click "Launch Instance"**

## Step 2: Connect from Windows

### Using WSL (Windows Subsystem for Linux) 

#### Copy .pem file to WSL (from Windows)
cp /mnt/c/Users/suchithra/Downloads/jenkins-key.pem ~/

#### Set correct permissions
chmod 600 ~/jenkins-key.pem

#### Connect to EC2
ssh -i ~/jenkins-key.pem ubuntu@54.80.128.29

## Step 3: Install Java (Jenkins Requirement)

```
# Update system
sudo apt update
sudo apt upgrade -y

# Install Java 17
sudo apt install openjdk-17-jre -y

# Verify installation
java -version
```

## Step 4: Install Jenkins

```
# Update and install Jenkins
sudo apt update
sudo apt install jenkins -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check status
sudo systemctl status jenkins
```

## Step 5: Access Jenkins

1. **Open browser** on the Windows machine
2. **Navigate to**: `http://18.234.246.19:8080`
3. **Get initial admin password**:

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

4. **Setup Jenkins**:
   - Paste the password
   - Click "Install suggested plugins"
   - Create first admin user
   - Configure Jenkins URL
   - Start using Jenkins!


