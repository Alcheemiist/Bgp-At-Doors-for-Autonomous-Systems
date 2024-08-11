# RESSOURCE BGP AT DOORS FOR AUTONOMOUS SYSTEMS IS SIMPLE

Certainly, I'll explain each of these networking concepts:

### NETMASK:
A netmask is a 32-bit number that masks an IP address, dividing the IP address into network and host addresses. It's used to define which part of an IP address refers to the network and which part refers to the host. For example, in a subnet with netmask 255.255.255.0, the first three octets represent the network, and the last octet represents the host.

### VXLAN (Virtual Extensible LAN):
VXLAN is a network virtualization technology that encapsulates Layer 2 Ethernet frames within Layer 3 UDP packets. It's designed to overcome the limitations of traditional VLANs, allowing for more scalable multi-tenant environments in cloud computing.

### BGP (Border Gateway Protocol):
You've provided a good brief description. To add: BGP is the protocol that makes core routing decisions on the internet. It's a path-vector protocol that maintains paths to different network prefixes and makes routing decisions based on paths, rules, or network policies configured by network administrators.

### OSPF (Open Shortest Path First):
OSPF is an interior gateway protocol used for routing within a single autonomous system. It uses a link-state routing algorithm and falls into the group of interior gateway protocols (IGPs). OSPF is widely used in large enterprise networks due to its ability to quickly detect network changes and calculate the shortest path to each node.

### EVPN (Ethernet VPN):
EVPN is a technology that provides Ethernet multipoint services over IP/MPLS networks. It combines the functionality of VPNs with the simplicity of Ethernet bridging. EVPN is often used with VXLAN for network virtualization in data centers.

### LOOPBACK:
In networking, a loopback interface is a virtual network interface that your computer uses to communicate with itself. It's often used for testing and for situations where a program needs to communicate with another program on the same device. The IP address 127.0.0.1 is reserved for loopback.

### VTEP (VXLAN Tunnel Endpoint):
A VTEP is the component that performs VXLAN encapsulation and decapsulation. It's the source or destination of the VXLAN tunnel. VTEPs are typically implemented in hypervisors or top-of-rack switches in a data center environment.
Reflector Router:

In BGP, a route reflector is a router that receives BGP routes from connected clients and then "reflects" those routes to other clients. This concept is used to reduce the number of iBGP (internal BGP) peering sessions required in a large autonomous system, improving scalability.

### ID EXTRACTION CMD
sed -E 's/.+-//' : removes everything up to and including the last hyphen


### NET DEBUG COMMANDS 
> show ip route
-Use the show ip route EXEC command to display the current state of the routing table.
- https://www.cisco.com/E-Learning/bulk/public/tac/cim/cib/using_cisco_ios_software/cmdrefs/show_ip_route.htm

> show ip bgp summary : 
- Displays a summary of the status of all BGP connections.
- http://www.powerfast.net/bgp/BGP_Nd60.html

> show ip bgp l2vpn evpn
- Displays the internal BGP routes in the L2VPN EVPN address family in EVPN instances.
- https://www.dell.com/support/manuals/fr-ma/smartfabric-os10-emp-partner/vxlan-evpn-10-5-2_ug/show-ip-bgp-l2vpn-evpn?guid=guid-fa4693e0-8ba4-4373-9987-760df6431696&lang=en-us

### How VXLAN works?

The distinction between Layer 2 and Layer 3 in networking is fundamental to understanding VXLAN (Virtual Extensible LAN). 

Let's break this down:

#### Layer 2 (Data Link Layer):

This is the second layer in the OSI (Open Systems Interconnection) model.
It deals with how data is formatted for transmission over a physical medium.
It's responsible for node-to-node communication within a network segment.
Ethernet is a common Layer 2 protocol.
Data units at this layer are called frames.
Devices are identified by MAC (Media Access Control) addresses.

#### Layer 3 (Network Layer):

This is the third layer in the OSI model.
It's responsible for packet forwarding, including routing through intermediate routers.
It handles logical addressing and routing between different networks.
IP (Internet Protocol) operates at this layer.
Data units at this layer are called packets.
Devices are identified by IP addresses.

### In the context of VXLAN: VXLAN operates by encapsulating Layer 2 Ethernet frames within Layer 3 UDP packets. 

This means:

The original Ethernet frame (Layer 2) is treated as payload.
This frame is then encapsulated in a VXLAN header.
The VXLAN-encapsulated frame is then placed inside a UDP packet (Layer 3).
This UDP packet is then sent over the IP network.

This encapsulation allows Layer 2 network segments to be extended over a Layer 3 network, effectively creating a logical Layer 2 network that can span across different physical locations or data centers.

The benefit of this approach is that it allows for the creation of isolated network segments (similar to VLANs) that can extend across a much larger network infrastructure, overcoming traditional VLAN limitations and enabling more flexible and scalable network designs, particularly in virtualized and cloud environments.