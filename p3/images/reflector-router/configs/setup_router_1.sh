/usr/lib/frr/frrinit.sh start

sleep 5
hostname Spine1
!
interface lo
 ip address 1.1.1.1/32
!
interface eth0
 ip address 10.0.1.1/24
!
interface eth1
 ip address 10.0.2.1/24
!
interface eth2
 ip address 10.0.3.1/24
!
router ospf
 network 1.1.1.1/32 area 0
 network 10.0.0.0/8 area 0
!
router bgp 65000
 bgp router-id 1.1.1.1
 neighbor ibgp-peers peer-group
 neighbor ibgp-peers remote-as 65000
 neighbor ibgp-peers update-source lo
 neighbor 2.2.2.2 peer-group ibgp-peers
 neighbor 3.3.3.3 peer-group ibgp-peers
 neighbor 4.4.4.4 peer-group ibgp-peers
 !
 address-family l2vpn evpn
  neighbor ibgp-peers activate
  neighbor ibgp-peers route-reflector-client
 exit-address-family
!

# ip link add br0 type bridge 
# ip link set dev br0 up 
# ip addr add 10.1.1.1/24 dev eth0
# ip link add name vxlan10 type vxlan id 10 dev eth0 group  239.1.1.1 dstport 4789
# ip addr add 20.1.1.1/24 dev vxlan10
# brctl addif br0 eth1 
# brctl addif br0 vxlan10 
# ip link set dev vxlan10 up

sh