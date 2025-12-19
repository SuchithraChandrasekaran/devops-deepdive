# AWS Security Groups and Network ACLs (NACLs)

## Overview

AWS provides multiple layers of security to protect our resources. Security Groups and NACLs are two fundamental components that control network traffic in our Virtual Private Cloud (VPC).

### What They Protect

- **Security Groups**: Control traffic at the instance level (EC2, RDS, Lambda in VPC, etc.)
- **NACLs**: Control traffic at the subnet level, affecting all instances within the subnet

## Security Groups

### What is a Security Group?

A Security Group acts as a virtual firewall for our AWS resources, controlling inbound and outbound traffic at the instance level.

### Key Features

#### Stateful
- If we allow inbound traffic, the response is automatically allowed
- Return traffic is automatically permitted without explicit rules
- Simplifies rule management

#### Default Behavior
```
Inbound:  DENY ALL (must explicitly allow)
Outbound: ALLOW ALL (can be restricted)
```

### Example Rules

#### Web Server Security Group

**Inbound Rules:**
```
Type        Protocol    Port Range    Source              Description
HTTP        TCP         80            0.0.0.0/0           Public web access
HTTPS       TCP         443           0.0.0.0/0           Secure web access
SSH         TCP         22            203.0.113.0/24      Admin access
```

**Outbound Rules:**
```
Type        Protocol    Port Range    Destination         Description
All traffic ALL         ALL           0.0.0.0/0           Allow all outbound
```

#### Database Security Group

**Inbound Rules:**
```
Type        Protocol    Port Range    Source              Description
MySQL       TCP         3306          sg-webapp123        App server access
```

### Security Group Limits

- Default limit: 5 security groups per network interface
- Default limit: 60 inbound rules and 60 outbound rules per security group
- Maximum: 16 security groups per network interface (by request)

## Network ACLs

### What is a Network ACL?

A Network Access Control List (NACL) is a stateless firewall that controls traffic at the subnet level, providing an additional layer of security.

### Key Features

#### Stateless
- Inbound and outbound rules must be explicitly defined
- Return traffic must be explicitly allowed
- Requires rules for ephemeral ports (typically 1024-65535)

#### Default Behavior

**Default NACL:**
```
Inbound:  ALLOW ALL
Outbound: ALLOW ALL
```

**Custom NACL:**
```
Inbound:  DENY ALL
Outbound: DENY ALL
```

#### Rule Components

| Component | Description | Example |
|-----------|-------------|---------|
| Rule # | Evaluation order (1-32766) | 100, 200, 300 |
| Type | Protocol type | HTTP, SSH, Custom |
| Protocol | Network protocol | TCP, UDP, ICMP |
| Port Range | Port or port range | 80, 443, 1024-65535 |
| Source/Destination | CIDR block | 0.0.0.0/0, 10.0.0.0/16 |
| Allow/Deny | Action to take | ALLOW or DENY |

### Example NACL Rules

#### Web Subnet NACL

**Inbound Rules:**
```
Rule #    Type              Protocol    Port Range    Source          Allow/Deny
100       HTTP              TCP         80            0.0.0.0/0       ALLOW
110       HTTPS             TCP         443           0.0.0.0/0       ALLOW
120       SSH               TCP         22            203.0.113.0/24  ALLOW
130       Ephemeral         TCP         1024-65535    0.0.0.0/0       ALLOW
*         ALL Traffic       ALL         ALL           0.0.0.0/0       DENY
```

**Outbound Rules:**
```
Rule #    Type              Protocol    Port Range    Destination     Allow/Deny
100       HTTP              TCP         80            0.0.0.0/0       ALLOW
110       HTTPS             TCP         443           0.0.0.0/0       ALLOW
120       Ephemeral         TCP         1024-65535    0.0.0.0/0       ALLOW
*         ALL Traffic       ALL         ALL           0.0.0.0/0       DENY
```

#### Block Specific IP Address

```
Rule #    Type              Protocol    Port Range    Source          Allow/Deny
50        ALL Traffic       ALL         ALL           198.51.100.5/32 DENY
100       HTTP              TCP         80            0.0.0.0/0       ALLOW
```
*Note: Lower rule numbers are evaluated first*

## Comparison

### Security Groups vs NACLs

| Feature | Security Groups | NACLs |
|---------|----------------|--------|
| **Operating Level** | Instance (ENI) | Subnet |
| **State** | Stateful | Stateless |
| **Rules Type** | Allow only | Allow and Deny |
| **Rule Evaluation** | All rules evaluated | Sequential by rule number |
| **Return Traffic** | Automatically allowed | Must be explicitly allowed |
| **Default Behavior** | Deny inbound / Allow outbound | Custom: Deny all / Default: Allow all |
| **Scope** | Specific instances | All instances in subnet |
| **Rule Limit** | 60 per direction | 20 per direction (soft limit) |
| **Changes Applied** | Immediately | Immediately |

### When to Use Each

**Use Security Groups for:**
- Instance-specific security policies
- Application-tier security (web, app, database)
- Allowing traffic between security groups
- Most common security requirements

**Use NACLs for:**
- Subnet-level security policies
- Blocking specific IP addresses (blacklisting)
- Additional layer of defense
- Compliance requirements for stateless firewalls

## Best Practices

### Security Groups

1. **Use Descriptive Names**: Name security groups clearly (e.g., `prod-web-sg`, `dev-db-sg`)

2. **Principle of Least Privilege**: Only allow necessary traffic
   ```
    Bad: Source 0.0.0.0/0 for SSH
    Good: Source 203.0.113.0/24 for SSH
   ```
3. **Tag the Security Groups**: Use tags for organization
   ```
   Environment: Production
   Tier: Web
   Owner: Platform Team
   ```

### Network ACLs

1. **Leave Space Between Rule Numbers**: Use increments of 10 or 100
   ```
   Rule 100, 200, 300 (allows inserting rule 150 later)
   ```

2. **Order Matters**: Place deny rules before allow rules
   ```
   Rule 50:  DENY 198.51.100.5/32
   Rule 100: ALLOW 0.0.0.0/0
   ```

3. **Don't Forget Ephemeral Ports**: Always allow ephemeral ports for return traffic
   ```
   Outbound: TCP 1024-65535 to 0.0.0.0/0
   ```

4. **Use for Subnet-Wide Policies**: Don't replicate Security Group rules in NACLs

5. **Document the Rules**: Add descriptions explaining each rule's purpose


For questions or contributions, please open an issue or submit a pull request.
