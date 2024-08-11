ip addr add 30.1.1.1/24 dev eth1
ip link set dev eth1 up
ip route add default via 239.1.1.1
