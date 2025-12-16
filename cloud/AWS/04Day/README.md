# AWS VPC, Security Group, NACL, and EC2

**VPC, Security Group (SG), Network Access Control List (NACL), and EC2** in AWS.

---

## Step 1: Create VPC

1. AWS Console → VPC → Create VPC
2. Name: `my-vpc`
3. CIDR: `10.0.0.0/16`
4. Create

---

## Step 2: Create Subnet

1. VPC → Subnets → Create subnet
2. Select VPC
3. CIDR: `10.0.1.0/24`
4. Select Availability Zone
5. Create

---

## Step 3: Create Internet Gateway

1. VPC → Internet Gateways → Create
2. Attach to VPC

---

## Step 4: Configure Route Table

1. VPC → Route Tables → Create
2. Add route:
   `0.0.0.0/0 → Internet Gateway`
3. Associate subnet

---

## Step 5: Create Security Group (SG)

1. EC2 → Security Groups → Create
2. Select VPC
3. Inbound rules:

   * SSH: TCP 22 → My IP
   * TCP 8080 → My IP
4. Outbound rules:

   * Allow all traffic
5. Create

Properties:

* Instance-level
* Stateful
* Allow rules only

---

## Step 6: Create Network Access Control List (NACL)

1. VPC → Network ACLs → Create
2. Select VPC
3. Inbound rules:

   * Add required ports (Allow)
4. Outbound rules:

   * Add required return ports (Allow)
5. Associate with subnet

Properties:

* Subnet-level
* Stateless
* Supports allow and deny

---

## Step 7: Launch EC2 Instance

1. EC2 → Instances → Launch instance
2. Select AMI
3. Select instance type
4. Select VPC and subnet
5. Attach Security Group
6. Select key pair
7. Launch

---

## Summary

* Security Group: Instance-level, stateful, allow-only
* NACL: Subnet-level, stateless, allow and deny

---


