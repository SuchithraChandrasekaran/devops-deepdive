# AWS Production VPC with Public & Private Subnets (Including Bastion Host)

##  Overview
This project demonstrates a **secure, scalable AWS VPC architecture** designed for a **production environment**.

The architecture uses **public and private subnets across two Availability Zones**, an **Application Load Balancer**, **Auto Scaling Group**,

**NAT Gateways**, and a **Bastion Host** for secure administrative access to private EC2 instances.

---
## Architecture Components

### Networking
- Virtual Private Cloud (VPC)
- Internet Gateway
- Route Tables
- Public Subnets (2 AZs)
- Private Subnets (2 AZs)

### Public Subnet Components
- Application Load Balancer (ALB)
- NAT Gateway (one per AZ)
- Bastion Host

### Private Subnet Components
- EC2 Instances
- Auto Scaling Group
- Security Groups

---
## Traffic Flow

### Application Traffic
1. User sends request from the internet
2. Request reaches the **Application Load Balancer** in the public subnet
3. ALB forwards traffic to EC2 instances in **private subnets**
4. EC2 instances respond back through the ALB

### Outbound Internet Access
- Private EC2 instances access the internet **only via NAT Gateway**
- Used for OS updates, package downloads, etc.
---

## Bastion Host (Jump host/Jump Box/Jump Server)

A **Bastion Host** is used to securely manage EC2 instances in private subnets.

### Purpose
- Provides controlled SSH access
- Prevents exposing private instances to the internet
- Follows least-privilege and defense-in-depth principles

### Bastion Host Details
- Deployed in a **public subnet**
- SSH access allowed **only from trusted admin IPs**


## High Availability & Scalability

- Deployed across **two Availability Zones**
- **Auto Scaling Group**:
  - Automatically scales EC2 instances based on demand
  - Replaces unhealthy instances
- **Multi-AZ NAT Gateways**:
  - Avoids single point of failure
- Load Balancer distributes traffic evenly

---

## Implementation Steps (High Level)

1. Create VPC with CIDR block
2. Attach Internet Gateway to VPC
3. Create public and private subnets in two AZs
4. Configure route tables:
   - Public subnets → Internet Gateway
   - Private subnets → NAT Gateway
5. Create Application Load Balancer
6. Launch Bastion Host in public subnet
7. Create Launch Template for EC2
8. Create Auto Scaling Group in private subnets
9. Configure Security Groups
10. Validate traffic flow and SSH access

---

## Use Cases

- Production web applications
- Secure backend systems
- Enterprise-grade workloads
- Scalable cloud-native applications

---

## Key Benefits

- No direct internet access to private servers
- Secure admin access via Bastion Host
- High availability across AZs
- Automatic scaling 
- Strong security posture


