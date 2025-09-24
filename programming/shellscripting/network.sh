#!/bin/sh

# ===================================================================
# DEVOPS NETWORKING CONCEPTS 
# ===================================================================

echo "===== DEVOPS NETWORKING CONCEPTS ====="
echo ""

echo "1. BASIC NETWORK INFORMATION"
echo ""

echo " Network Interfaces:"
ip addr show | grep -E '^[0-9]+:|inet '
echo ""

echo " Hostname:"
hostname
echo ""

echo " IP Address:"
hostname -I
echo ""

echo " Default Gateway:"
ip route | grep default
echo ""

echo "2. DNS - DOMAIN NAME SYSTEM"
echo ""

echo " DNS Servers:"
cat /etc/resolv.conf
echo ""

echo "DNS Lookup - google.com:"
nslookup google.com
echo ""

echo "Quick DNS lookup:"
dig google.com +short
echo ""

echo "3. PORTS AND PROTOCOLS"
echo ""

echo "Common DevOps Ports:"
echo "22   - SSH"
echo "80   - HTTP"
echo "443  - HTTPS"
echo "3306 - MySQL"
echo "5432 - PostgreSQL"
echo "6379 - Redis"
echo "27017 - MongoDB"
echo "8080 - Common app port"
echo ""

echo "Open Ports on  System:"
netstat -tuln
echo ""

echo "Listening Ports Only:"
netstat -tuln | grep LISTEN
echo ""

echo "Process Using Ports:"
ss -tulpn
echo ""

echo "4. CONNECTIVITY TESTING"
echo ""

echo "Ping Test to google.com:"
ping -c 3 google.com
echo ""

echo "Test Port 80 Connection:"
nc -zv google.com 80
echo ""

echo "Test Port 443 Connection:"
nc -zv google.com 443
echo ""

echo "5. NETWORK ROUTING"
echo ""

echo "Routing Table:"
ip route show
echo ""

echo "Network Interface Statistics:"
cat /proc/net/dev
echo ""

echo "6. HTTP/HTTPS TESTING"
echo ""

echo "HTTP Headers from httpbin.org:"
curl -I http://httpbin.org/get
echo ""

echo "Test HTTPS Connection:"
curl -I https://google.com
echo ""

echo "Get HTTP Status Code:"
curl -o /dev/null -s -w "%{http_code}" http://google.com
echo ""
echo ""

echo "7. DNS RESOLUTION TESTING"
echo ""

echo "DNS Resolution Time Test:"
dig google.com | grep "Query time"
echo ""

echo "Multiple DNS Lookups:"
for domain in google.com github.com stackoverflow.com; do
    echo "Testing $domain:"
    dig $domain +short
done
echo ""

echo "8. NETWORK MONITORING"
echo ""

echo "Network Connections:"
ss -tuln | head -20
echo ""

echo "Active Network Connections:"
netstat -an | grep ESTABLISHED | head -10
echo ""

echo "Network Interface Statistics:"
ip -s link
echo ""

echo "9. SERVICE CONNECTIVITY CHECKS"
echo ""

echo "Check if SSH is running:"
netstat -tuln | grep :22
echo ""

echo "Check if HTTP service is running:"
netstat -tuln | grep :80
echo ""

echo "Check if HTTPS service is running:"
netstat -tuln | grep :443
echo ""

echo "10. PRACTICAL DEVOPS COMMANDS"
echo ""

echo "Test if port is available:"
PORT=8080
if netstat -tuln | grep -q ":$PORT "; then
    echo "Port $PORT is in use"
else
    echo "Port $PORT is available"
fi
echo ""

echo "Simple Health Check Function:"
echo "curl -f http://localhost:8080/health && echo 'Service OK' || echo 'Service DOWN'"
echo ""

echo "Database Connection Test:"
echo "nc -z localhost 5432 && echo 'DB Connected' || echo 'DB Connection Failed'"
echo ""

echo "11. FIREWALL AND SECURITY"
echo ""

echo "UFW Firewall Status:"
ufw status 2>/dev/null || echo "UFW not available or need sudo"
echo ""

echo "iptables Rules (first 10):"
iptables -L 2>/dev/null | head -10 || echo "Need sudo to view iptables"
echo ""

echo "12. TROUBLESHOOTING COMMANDS"
echo ""

echo "Network Troubleshooting Checklist:"
echo "1. Check network interface: ip addr show"
echo "2. Check default route: ip route show"
echo "3. Test DNS: nslookup domain.com"
echo "4. Test connectivity: ping host"
echo "5. Check port: nc -zv host port"
echo "6. Check firewall: iptables -L"
echo "7. Check services: netstat -tuln"
echo ""

echo "Common Network Commands:"
echo "ip addr show                 - Show interfaces"
echo "ip route show                - Show routes"
echo "netstat -tuln                - Show ports"
echo "ss -tuln                     - Socket stats"
echo "ping -c 3 host               - Test connectivity"
echo "nslookup domain              - DNS lookup"
echo "dig domain                   - DNS details"
echo "nc -zv host port             - Test port"
echo "curl -I url                  - HTTP headers"
echo "traceroute host              - Trace path"
echo ""

echo "13. LOAD BALANCER SIMULATION"
echo ""

echo "Round Robin Load Balancing Example:"
servers="server1 server2 server3"
counter=1
for i in 1 2 3 4 5 6; do
    server_num=$(((i-1) % 3 + 1))
    echo "Request $i -> server$server_num"
done
echo ""

echo "14. DOCKER NETWORKING"
echo ""

if command -v docker > /dev/null 2>&1; then
    echo "Docker Networks:"
    docker network ls 2>/dev/null || echo "Docker not running"
    echo ""
    
    echo "Docker Bridge Network:"
    docker network inspect bridge 2>/dev/null | head -10 || echo "Docker not running"
    echo ""
else
    echo "Docker not installed"
    echo "Docker networking concepts:"
    echo "- bridge: Default network"
    echo "- host: Use host network"
    echo "- none: No network"
    echo "- custom: User-defined networks"
    echo ""
fi

echo "15. KUBERNETES NETWORKING"
echo ""

if command -v kubectl > /dev/null 2>&1; then
    echo "Kubernetes Services:"
    kubectl get services 2>/dev/null || echo "No K8s cluster"
    echo ""
    
    echo "Kubernetes Pods:"
    kubectl get pods 2>/dev/null || echo "No K8s cluster"
    echo ""
else
    echo "kubectl not available"
    echo "Kubernetes networking concepts:"
    echo "- Pods: Get unique IPs"
    echo "- Services: Stable endpoints"
    echo "- Ingress: HTTP routing"
    echo "- NetworkPolicy: Security rules"
    echo ""
fi

# ===================================================================
# SUMMARY
# ===================================================================
echo "===== NETWORKING SUMMARY ====="
echo ""
echo "Key networking concepts covered:"
echo "- Network interfaces and IP configuration"
echo "- DNS resolution and testing"
echo "- Ports and protocol testing"
echo "- Connectivity verification"
echo "- HTTP/HTTPS requests"
echo "- Network monitoring"
echo "- Security and firewall basics"
echo "- Container networking"
echo "- Troubleshooting methods"
echo ""
echo "Essential commands for DevOps:"
echo "ip, netstat, ss, ping, curl, nc, dig, nslookup"
echo ""
echo "Script completed!"
