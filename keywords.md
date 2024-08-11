NET MASK
OSPF 
VXLAN
LOOPBACK
EVPN
VTEP
Reflector Router

Border Gateway Protocol (BGP) is a set of rules that determine the best network routes for data transmission on the internet.

HOST_ID=$(echo ${HOSTNAME} | sed -E 's/.+-//')


> show ip route
-Use the show ip route EXEC command to display the current state of the routing table.
- https://www.cisco.com/E-Learning/bulk/public/tac/cim/cib/using_cisco_ios_software/cmdrefs/show_ip_route.htm

> show ip bgp summary : 
- Displays a summary of the status of all BGP connections.
- http://www.powerfast.net/bgp/BGP_Nd60.html

> show ip bgp l2vpn evpn
- Displays the internal BGP routes in the L2VPN EVPN address family in EVPN instances.
- https://www.dell.com/support/manuals/fr-ma/smartfabric-os10-emp-partner/vxlan-evpn-10-5-2_ug/show-ip-bgp-l2vpn-evpn?guid=guid-fa4693e0-8ba4-4373-9987-760df6431696&lang=en-us