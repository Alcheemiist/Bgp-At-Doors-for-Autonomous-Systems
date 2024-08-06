/usr/lib/frr/frrinit.sh start

sleep 5


hostname Leaf1
!
interface lo
 ip address 2.2.2.2/32
!
interface eth0
 ip address 10.0.1.2/24
!
interface eth1
 ip address 192.168.1.1/24
!
interface vxlan1
 vxlan id 10
 vxlan local-tunnelip 2.2.2.2
!
bridge vlan-aware
!
vlan 10
 bridge 10
!
router ospf
 network 2.2.2.2/32 area 0
 network 10.0.0.0/8 area 0
!
router bgp 65000
 bgp router-id 2.2.2.2
 neighbor 1.1.1.1 remote-as 65000
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
!
evpn
 vni 10
  rd auto
  route-target import auto
  route-target export auto
!

 ip link add br0 type bridge 
 ip link set dev br0 up 
 ip addr add 10.1.1.1/24 dev eth0
 ip link add name vxlan10 type vxlan id 10 dev eth0 group  239.1.1.1 dstport 4789
 ip addr add 20.1.1.1/24 dev vxlan10
 brctl addif br0 eth1 
 ip link set dev vxlan10 up

tail -f /dev/null
