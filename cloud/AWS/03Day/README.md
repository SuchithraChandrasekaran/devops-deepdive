# AWS VPC – A Simple Real‑World Example

 Explanation of **Virtual Private Cloud (VPC)** using a **realistic company story**

---

##  Situation Before VPC (Problem Statement)

Around **2013–2014**, many companies did not own data centers.
Instead, they rented **virtual servers** from AWS.

### Example companies:

* Company 1 → `eg1.com`
* Company 2 → `eg2.com`
* Company 3 → `eg3.com`

### What they did:

* All companies hosted their websites on **AWS EC2 virtual servers**
* AWS owned the **data center** (example: **Ohio region**)
* Companies paid AWS money
* **All websites were running in the same shared network**

### Big Problem:

* One company got hacked
* Hacker moved to the next company
* All websites got hacked **one by one**

- No network isolation
- No security boundary

---

##  Why AWS Introduced VPC

To solve this **security issue**, AWS introduced **VPC (Virtual Private Cloud)**.

### Simple meaning:

> **VPC is our own private network inside AWS**

Even though:

* AWS owns the data center
* AWS manages hardware

**We control our network completely**

---

## DevOps Engineer Creates a VPC

Example:

* A **DevOps Engineer from company 1** requests AWS to create a VPC
* This VPC is **only for their company**

---

##  Step 1: IP Address Range (CIDR Block)

The engineer requests an IP range, for example:

```
10.0.0.0/16
```

### What this means:

* Total IP addresses = **65,536**
* These IPs are **private**
* Only resources inside this VPC can use them

 This IP range is **reserved only for this company**

---

## Step 2: Subnets (Splitting IPs)

The engineer divides the IP range into **subnets**.

### Example:

| Subnet Type    | Purpose                     |
| -------------- | --------------------------- |
| Public Subnet  | Load Balancer, Bastion Host |
| Private Subnet | Application servers         |
| DB Subnet      | Database servers            |

### Why subnets?

* Better security
* Better traffic control
* Clear separation of resources

---

##  Step 3: Gateway (Entry into VPC)

### Internet Gateway (IGW)

* Acts like a **gatepass** to enter the VPC
* Without IGW → No internet access
* IGW is attached to the **VPC**

 Only **public subnets** use the Internet Gateway

---

##  Step 4: Router (Route Table) – Brain of the VPC

In AWS, the **router is called a Route Table**.

> **Route Table decides where the network traffic should go**

Like **Google Maps for network traffic**.

### What Route Table does:

* Tells traffic:

  * Go to **Internet Gateway**
  * OR go to **private network**
  * OR go to **NAT Gateway**

---

###  Public Route Table

Attached to **public subnets**.

Example routes:

```
Destination        Target
0.0.0.0/0          Internet Gateway (IGW)
10.0.0.0/16        Local
```

- Allows internet traffic in and out

---

###  Private Route Table

Attached to **private subnets**.

Example routes:

```
Destination        Target
10.0.0.0/16        Local
0.0.0.0/0          NAT Gateway
```

1. No direct internet access
2. Secure application servers

---

> **Subnet becomes public or private based on its route table, not by name**

---

## Request Flow (How Website Works – With All Network Components)

### Incoming Request (User → Application)

```
User Browser
   ↓
Internet
   ↓
Internet Gateway (IGW)
   ↓
Route Table (Router decision)
   ↓
Network ACL (NACL) – Subnet level check
   ↓
Public Subnet
   ↓
Security Group – Load Balancer check
   ↓
Load Balancer (LB)
   ↓
Security Group – App Server check
   ↓
Private Subnet
   ↓
Application Server (EC2)
```

---

### What happens at each step

#### 1. Internet Gateway (IGW)

* Entry gate into the VPC
* Without IGW → website not reachable

---

#### 2. Route Table (Router)

* Decides **where traffic should go**
* Example decision:

  * Internet traffic → Public Subnet
  * Internal traffic → Private Subnet

---

#### 3. Network ACL (NACL)

* **First security checkpoint**
* Works at **subnet level**
* Rules:

  * Allow HTTP (80), HTTPS (443)
  * Block unwanted IPs

Stateless (checks request and response separately)

---

#### 4. Security Group (SG)

* **Second security checkpoint**
* Works at **resource level (LB / EC2)**
* Allows only required traffic

Stateful (response automatically allowed)

---

#### 5. Load Balancer (LB)

* Receives traffic from internet
* Distributes requests to healthy servers
* Lives in **public subnet**

---

#### 6. Private Subnet (Application Layer)

* Application servers are hidden
* No direct internet access
* Extra security

---

### Outgoing Request (Application → Internet)

When application needs internet (updates, patches, APIs):

```
Application Server (Private Subnet)
   ↓
Route Table (Router)
   ↓
NAT Gateway
   ↓
Internet Gateway
   ↓
Internet
```

---

###  NAT Gateway (Why it exists)

* Allows **private subnet** servers to access internet
* Prevents internet from accessing private servers
* It masks the IPAddress

1. One-way internet access
2. Improves security

---

### Security Summary

| Component      | Level    | Purpose                |
| -------------- | -------- | ---------------------- |
| Route Table    | VPC      | Traffic direction      |
| NACL           | Subnet   | First firewall         |
| Security Group | Resource | Second firewall        |
| NAT Gateway    | Network  | Safe outbound internet |

---

> **Router decides path → NACL checks subnet → SG checks resource → LB balances → App responds**

---

##  Load Balancer (LB)

### What LB does:

* Distributes traffic
* Prevents overload
* Sends requests only to **healthy servers**

* Load Balancer is placed in **public subnet**
* Application servers stay in **private subnet**

---

##  Security Benefits of VPC

1. Each company has its **own private network**
2. No shared network with other companies
3. Hackers cannot jump between companies
4. Strong isolation

---

## One‑Line Definition

> **VPC is a private, secure, isolated network in AWS where your applications run safely.**

