#!/usr/bin/env sh

# GNS3 start command: sh p3_host.sh

HOST_ID=$(echo ${HOSTNAME} | sed -E 's/.+-//')
echo "This is: ${HOSTNAME} with ${HOST_ID}"

# Give IP address to the machines on eth0 device
ip addr add 20.1.1.${HOST_ID}/24 dev eth0

tail -f /dev/null