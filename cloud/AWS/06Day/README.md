# Route 53 – Domain Registration & Hosted Zones

## 1. Domain Registration
Domain registration is the process of purchasing a unique domain name or a website name.

Example:

- example.com
- myapp.in

We register a domain so no one else can use that name.

### Who manages domain registration?
- Route 53 is a domain registrar
- When we buy a domain, AWS becomes the official manager of that name

### Using Route 53
- 1. We can do domain registration
- 2. Update the DNS records using hosted zones
- 3. Perform health checks on web servers or web application

### Flow
1. Search for a domain
2. Purchase and register
3. Name servers are assigned
4. Domain becomes active

---

## 2. Hosted Zones
A hosted zone is a container for DNS records of a domain.

### Types of Hosted Zones

#### Public Hosted Zone
- Used for public websites
- Accessible from the internet

#### Private Hosted Zone
- Used inside AWS VPC
- Not accessible from the internet

### Hosted Zone Components
- Domain name
- Name Server (NS) records
- Start of Authority (SOA) record
- DNS records (A, CNAME, ALIAS, etc.)

### Domain & Hosted Zone Relationship
- Domain is purchased
- Hosted zone holds DNS rules
- Name servers connect domain to hosted zone
