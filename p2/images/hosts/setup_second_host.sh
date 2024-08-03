#! /bin/ash

# Wait for eth1 to appear
while ! ip link show eth1 > /dev/null 2>&1; do
  echo "Waiting for eth1..."
  sleep 2
done

cat >> /etc/network/interfaces << EOF
# Static config for eth1
auto eth1
iface eth1 inet static
	address 30.1.1.2
	netmask 255.255.255.0
	gateway 192.168.1.1
#	up echo nameserver 192.168.1.1 > /etc/resolv.conf

# DHCP config for eth1
#auto eth1
#iface eth1 inet dhcp
#	hostname alpine-1
EOF

ifup eth1