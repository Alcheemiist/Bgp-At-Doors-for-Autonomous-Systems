# BGB

Now it’s time to take on the routing and switching for the network**. *There are an astonishing number of table-based decisions that have to be made in order to get a single packet across a network, let alone across a series of networks*.** Not limited to routers, switches, and access points, these decisions are made at each and every device, including hosts. As networks are constructed and devices configured to forward packets and frames, network administrators must make critical decisions affecting performance, security, and optimization.

# ETHERNET

[How the Ethernet Protocol Works – A Complete Guide](https://www.freecodecamp.org/news/the-complete-guide-to-the-ethernet-protocol/#ethernet-frame-overview)

# **Switching: Forwarding and Filtering Traffic**

Most protocols are foregone conclusions, so when building networks, many of the choices are not choices at all. It is highly probable that a network will be a mixture of Ethernet and 802.11 nodes. These nodes will run the Internet Protocol at Layer 3 of the Transmission Control Protocol/Internet Protocol (TCP/IP) networking model (see [Figure 1-1](https://www.oreilly.com/library/view/packet-guide-to/9781449311315/ch01.html#tcp_solidus_ip_model)). The applications will be designed for TCP or the User Datagram Protocol (UDP).

***Switches operate at Layer 2 of the TCP/IP (and OSI) model and are the workhorses of most networks***. The operation of switches and bridges is defined in the IEEE 802.1D standard. The standard also describes the behavior of other Layer 2 protocols, such as the Spanning Tree Protocol.

In addition to forwarding Ethernet frames based on Media Access Control (MAC) addresses and processing the Cyclical Redundancy Check (CRC), switches provide a couple of very important services:

- Filter out traffic that should not be forwarded, such as local unicast frames
- Prevent the forwarding of collisions
- Prevent the forwarding of frames with errors

## Forwarding Based on MAC Addresses

***To forward or filter Ethernet frames, the switch consults a source address table (SAT) before transmitting a frame to the destination***. The SAT is also called a MAC address table or content addressable memory(CAM). Only the destination indicated in the table receives the transmission. In general, a switch receives a frame, reads the MAC addresses, performs the Cyclical Redundancy Check (CRC) for error control, and finally forwards the frame to the correct port.

Network nodes have unique MAC addresses and Ethernet frames indentify the source and destination by these MAC addresses. A MAC address is a 6-byte value, such as `00:12:34:56:78:99`, which is assigned to the host. ***The SAT is a mapping between the MAC addresses and the switch ports.*** This table also keeps track of the virtual local area networks, or VLANs, configured on the switch.

VLANs can reduce the effect of flooding or broadcasting because they can be used to break the switch into smaller logical segments.

## ROUTER

A router is a device that connects two or more packet-switched networks 
or subnetworks. It serves two primary functions: managing traffic 
between these networks by forwarding [data packets](https://www.cloudflare.com/learning/network-layer/what-is-a-packet/) to their intended [IP addresses](https://www.cloudflare.com/learning/dns/glossary/what-is-my-ip-address/), and allowing multiple devices to use the same Internet connection.

# **Routing: Finding Paths**

When building networks, we typically divide routing into two components: host and router. Routers handle traffic flowing between networks but hosts make many decisions long before the packets hit the network. Most routing protocols used to find pathways to destinations are router based, however.

Hosts are typically configured one of two ways: statically with an IP address, default gateway, and domain name server, or with values learned via the Dynamic Host Configuration Protocol (DHCP). Hosts send all traffic going off the local network to the default gateway, with the hope that the gateway can route the packets to the destination. One of my favorite questions to ask is “What is the first thing that a host does before sending a packet?” Before doing anything else, a host must process its routing table.

**The routing process is the actual movement of IP packets from one port to another and the routing table holds the information used by the routing process. Routing protocols such as the Routing Information Protocol (RIP) or Open Shortest Path First (OSPF) are used to communicate with other routers and may end up “installing” routes in the routing table for use by the routing process. When a router is configured, the routing table is constructed by bringing interfaces up and providing the interfaces with IP addresses**

# What Is a VLAN?

A virtual local area network (VLAN) is a logical grouping of ports which is independent
of location. A single VLAN (and the nodes connected in a single VLAN) will behave in
the same way as if it was a separate Layer 3 network. VLAN membership need not be
limited to sequential ports or even ports on the same switch.

# What is a VXLAN?

# Bridging Network Interfaces in Linux

https://www.baeldung.com/linux/bridging-network-interfaces

# how a packet travels from source to destination in a LAN using the TCP/IP model.

The TCP/IP model consists of four layers, and we'll examine the process at each layer.

1. Application Layer:
    - The process begins here with the user interacting with an application (e.g., a web browser).
    - The application generates data to be sent.
2. Transport Layer:
    - The data is passed to the Transport layer, typically using TCP or UDP.
    - If TCP is used, it breaks the data into segments, adds sequence numbers, and creates a header with source and destination port numbers.
    - A checksum is calculated for error detection.
3. Internet Layer:
    - The segments are passed to the Internet layer.
    - This layer adds an IP header, including the source and destination IP addresses.
    - In a LAN, these IP addresses will typically be in the same subnet.
4. Link Layer (also called Network Access Layer):
    - The packet is passed to the Link layer.
    - This layer adds a frame header and trailer, including the source and destination MAC addresses.
    - To get the destination MAC address, the Address Resolution Protocol (ARP) might be used if it's not already in the ARP cache.
5. Physical transmission:
    - The frame is converted into electrical, optical, or radio signals (depending on the physical medium) and transmitted over the LAN.
6. Reception and reverse process:
    - The destination computer receives the signals and converts them back into a digital frame.
    - The frame moves up through the layers:
        - Link Layer: Checks the frame for errors and strips off the frame header/trailer.
        - Internet Layer: Checks the IP header and removes it.
        - Transport Layer: Reassembles segments if needed, checks for errors, and passes the data to the correct application based on the port number.
        - Application Layer: Receives the data and processes it.

In a LAN environment, this process is typically very fast because:

- Devices are physically close.
- There are no routers involved (unless it's a large LAN with multiple subnets).
- The network is usually not congested compared to WANs.

It's worth noting that in modern switched LANs, the frame is typically only sent to the specific switch port where the destination device is connected, thanks to the switch's MAC address table.

Would you like me to elaborate on any specific part of this process?

# how a packet travels from source to destination in a VXLAN environment. VXLAN (Virtual Extensible LAN)

VXLAN adds an additional layer of encapsulation to extend Layer 2 domains across Layer 3 networks. Here's the process:

1. Application Layer:
    - The process starts the same way, with an application generating data to send.
2. Transport Layer:
    - Data is passed to the Transport layer, typically using TCP or UDP.
    - The layer adds its header with port information and creates segments.
3. Internet Layer:
    - Segments are passed to the Internet layer.
    - An IP header is added with source and destination IP addresses.
4. Link Layer:
    - The packet is passed to the Link layer.
    - A frame header and trailer are added, including source and destination MAC addresses.
5. VXLAN Encapsulation (performed by the VTEP - VXLAN Tunnel Endpoint):
    - The entire Ethernet frame is encapsulated in a VXLAN packet.
    - A VXLAN header is added, which includes a 24-bit VXLAN Network Identifier (VNI).
    - This VXLAN packet is then encapsulated in a UDP packet.
    - An outer IP header is added with the source and destination IP addresses of the VTEPs.
    - An outer Ethernet header is added for transmission on the physical network.
6. Physical transmission:
    - The encapsulated packet is converted to signals and transmitted over the physical network.
7. VXLAN De-encapsulation (at the destination VTEP):
    - The destination VTEP receives the packet.
    - It removes the outer Ethernet header, IP header, UDP header, and VXLAN header.
    - The original Ethernet frame is extracted.
8. Regular Layer 2 forwarding:
    - The original frame is then forwarded based on its destination MAC address within the VXLAN segment.
9. Reception and reverse process at the final destination:
    - The destination device receives the original Ethernet frame.
    - The frame moves up through the layers as in a regular LAN scenario:
        - Link Layer: Checks for errors and removes the Ethernet header/trailer.
        - Internet Layer: Processes the IP header.
        - Transport Layer: Reassembles segments if needed and passes data to the correct application.
        - Application Layer: Receives and processes the data.

Key differences in VXLAN:

1. The original frame is encapsulated, allowing it to traverse a Layer 3 network.
2. VTEPs handle the encapsulation and de-encapsulation.
3. The VNI in the VXLAN header allows for many more virtual networks than traditional VLANs.
4. The outer headers allow the VXLAN packet to be routed across IP networks.

This process allows VXLAN to create large, flexible Layer 2 domains that can span across Layer 3 boundaries, which is particularly useful in data center and cloud environments.Would you like me to elaborate on any specific part of this VXLAN process?

# What Is Layer 2 Connectivity?

At a basic level, Layer 2 connectivity refers to the use of the data link layer of the OSI Model. It is often used to connect local area networks (LANs) or to provide point-to-point connectivity between two networks or even broadcast domains or devices.

Often, Layer 2 connectivity is referred to as Ethernet connectivity, as Ethernet is one of the most common Layer 2 protocol used today, and it comes several advantages.

First off, Layer 2 connectivity generally provides low latency as it requires fewer network hops than Layer 3 connectivity. This makes it ideal for applications that require low latency, such as real-time voice, video or highly interactive applications.

Layer 2 connectivity is also relatively simple to configure and maintain when compared to Layer 3 connectivity. Its connectivity reduces the complexity of network configurations by eliminating the need for complex routing protocols and configurations. This makes it an attractive option for small- to medium-sized businesses that do not have dedicated IT resource

# What Is Layer 3 Connectivity?

On the other hand, Layer 3 connectivity refers to the use of the network layer of the OSI model for network communication. It is often used to provide wide area network (WAN) connectivity, to connect different LANs and to provide access to the internet. Layer 3 connectivity is often referred to as IP connectivity, as IP is the most common Layer 3 protocol used today.

As with Layer 2, Layer 3 connectivity comes with its own set of advantages.

To start, Layer 3 connectivity is highly scalable and can handle large networks with many devices. Likewise, its connectivity provides flexibility in terms of routing and network design, making it suitable for complex network architectures.

Opposite of Layer 2, Layer 3 connectivity provides enhanced security features, including firewalls and virtual private networks (VPNs), which can protect the network from external threats.

Additionally, its connectivity can help reduce network congestion by providing more efficient routing of network traffic, versus the management of large broadcast domains.
Layer 2 vs. Layer 3 Connectivity: Which Is Better?

The decision to use Layer 2 or Layer 3 connectivity depends on the specific needs of the application(s) or network. However, there are some general guidelines to consider.

For local network connectivity, Layer 2 connectivity is generally more suitable. It provides low latency and high performance, making it ideal for real-time applications such as voice and video.

For wide-area network connectivity, on the other hand, Layer 3 connectivity is generally more suitable as it provides scalability, flexibility and enhanced security features, making it ideal for connecting different LANs and for accessing the internet.

For applications that require both local and wide area network connectivity, a combination of Layer 2 and Layer 3 connectivity might be necessary to achieve optimal network performance.

Both Layer 2 and Layer 3 connectivity have their own distinct advantages and benefits.

While Layer 2 connectivity is simple to configure, provides low latency and high performance and is ideal for local network connectivity, Layer 3 connectivity is highly scalable, flexible and provides enhanced security features, making it ideal for wide-area network connectivity.
