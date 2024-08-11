#!/bin/sh

# Function to configure static IP
configure_static_ip() {
    # Check if eth0 exists and is up
    if ip link show eth1 up > /dev/null 2>&1; then
        echo "Configuring static IP on eth1..."
        # Remove any existing IP addresses
        ip addr flush dev eth1
        # Add the static IP
        ip addr add 30.1.1.1/24 dev eth1
        # Add a default route
        ip route add default via 239.1.1.1 
        echo "Static IP configuration complete."
    else
        echo "eth1 not found or not up. Using default network configuration."
    fi
}

# Attempt to configure static IP
configure_static_ip

# Log the IP address
echo "Container IP address:"
ip addr show eth1

exec tail -f /dev/null