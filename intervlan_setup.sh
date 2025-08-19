#!/bin/bash
# VLAN Setup on Kali Linux (Router-on-a-Stick)

# Enable 802.1q trunking on interface eth0
modprobe 8021q

# Create VLAN sub-interfaces
ip link add link eth0 name eth0.10 type vlan id 10
ip link add link eth0 name eth0.20 type vlan id 20

# Bring them up
ip link set eth0.10 up
ip link set eth0.20 up

# Assign IPs to sub-interfaces (Gateway for VLANs)
ip addr add 192.168.10.1/24 dev eth0.10
ip addr add 192.168.20.1/24 dev eth0.20

echo "Inter-VLAN setup complete!"

