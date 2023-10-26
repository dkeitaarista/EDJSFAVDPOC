# AVD_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [ISIS CLNS interfaces](#isis-clns-interfaces)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| SF_101 | ce | BRANCH-A2A-CE1 | 192.168.0.28/24 | vEOS-lab | Provisioned | - |
| SF_101 | ce | BRANCH-A2A-CE2 | 192.168.0.30/24 | vEOS-lab | Provisioned | - |
| SF_102 | ce | BRANCH-A2A-CE3 | 192.168.0.32/24 | vEOS-lab | Provisioned | - |
| SF_102 | ce | BRANCH-A2A-CE4 | 192.168.0.33/24 | vEOS-lab | Provisioned | - |
| SF_103 | ce | BRANCH-A2A-CE5 | 192.168.0.36/24 | vEOS-lab | Provisioned | - |
| SF_103 | ce | BRANCH-A2A-CE6 | - | vEOS-lab | Provisioned | - |
| SF_101 | ce | BRANCH-VPWS-CE1 | 192.168.0.40/24 | vEOS-lab | Provisioned | - |
| SF_102 | ce | BRANCH-VPWS-CE2 | 192.168.0.41/24 | vEOS-lab | Provisioned | - |
| SF_101 | ce | CORP-A2A-CE1 | 192.168.0.29/24 | vEOS-lab | Provisioned | - |
| SF_101 | ce | CORP-A2A-CE2 | 192.168.0.31/24 | vEOS-lab | Provisioned | - |
| SF_102 | ce | CORP-A2A-CE3 | 192.168.0.34/24 | vEOS-lab | Provisioned | - |
| SF_102 | ce | CORP-A2A-CE4 | 192.168.0.35/24 | vEOS-lab | Provisioned | - |
| SF_103 | ce | CORP-A2A-CE5 | 192.168.0.37/24 | vEOS-lab | Provisioned | - |
| SF_103 | ce | CORP-A2A-CE6 | - | vEOS-lab | Provisioned | - |
| SF_101 | pe | SF_SITE_101_BL-1 | 192.168.0.14/24 | vEOS-lab | Provisioned | - |
| SF_101 | pe | SF_SITE_101_BL-2 | 192.168.0.15/24 | vEOS-lab | Provisioned | - |
| SF_101 | rr | SF_SITE_101_RR-1 | 192.168.0.13/24 | vEOS-lab | Provisioned | - |
| SF_101 | p | SF_SITE_101_SPINE-1 | 192.168.0.11/24 | vEOS-lab | Provisioned | - |
| SF_101 | p | SF_SITE_101_SPINE-2 | 192.168.0.12/24 | vEOS-lab | Provisioned | - |
| SF_101 | ethernet_aggregation | SF_SITE_101_TOR-1A | 192.168.0.16/24 | vEOS-lab | Provisioned | - |
| SF_101 | ethernet_aggregation | SF_SITE_101_TOR-1B | 192.168.0.17/24 | vEOS-lab | Provisioned | - |
| SF_102 | pe | SF_SITE_102_BL-1 | 192.168.0.21/24 | vEOS-lab | Provisioned | - |
| SF_102 | pe | SF_SITE_102_BL-2 | 192.168.0.22/24 | vEOS-lab | Provisioned | - |
| SF_102 | rr | SF_SITE_102_RR-1 | 192.168.0.20/24 | vEOS-lab | Provisioned | - |
| SF_102 | p | SF_SITE_102_SPINE-1 | 192.168.0.18/24 | vEOS-lab | Provisioned | - |
| SF_102 | p | SF_SITE_102_SPINE-2 | 192.168.0.19/24 | vEOS-lab | Provisioned | - |
| SF_102 | ethernet_aggregation | SF_SITE_102_TOR-1A | 192.168.0.23/24 | vEOS-lab | Provisioned | - |
| SF_102 | ethernet_aggregation | SF_SITE_102_TOR-1B | 192.168.0.24/24 | vEOS-lab | Provisioned | - |
| SF_103 | pe | SF_SITE_103_BL-1 | 192.168.0.25/24 | vEOS-lab | Provisioned | - |
| SF_103 | ethernet_aggregation | SF_SITE_103_TOR-1A | 192.168.0.26/24 | vEOS-lab | Provisioned | - |
| SF_104 | pe | SF_SITE_104_BL-1 | 192.168.0.27/24 | vEOS-lab | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| pe | SF_SITE_101_BL-1 | Ethernet3 | p | SF_SITE_101_SPINE-1 | Ethernet3 |
| pe | SF_SITE_101_BL-1 | Ethernet4 | p | SF_SITE_101_SPINE-2 | Ethernet3 |
| pe | SF_SITE_101_BL-1 | Ethernet7 | rr | SF_SITE_101_RR-1 | Ethernet3 |
| pe | SF_SITE_101_BL-1 | Ethernet9 | pe | SF_SITE_102_BL-1 | Ethernet9 |
| pe | SF_SITE_101_BL-1 | Ethernet10 | pe | SF_SITE_104_BL-1 | Ethernet10 |
| pe | SF_SITE_101_BL-1 | Ethernet11 | ethernet_aggregation | SF_SITE_101_TOR-1A | Ethernet3 |
| pe | SF_SITE_101_BL-1 | Ethernet12 | ethernet_aggregation | SF_SITE_101_TOR-1A | Ethernet4 |
| pe | SF_SITE_101_BL-2 | Ethernet3 | p | SF_SITE_101_SPINE-1 | Ethernet4 |
| pe | SF_SITE_101_BL-2 | Ethernet4 | p | SF_SITE_101_SPINE-2 | Ethernet4 |
| pe | SF_SITE_101_BL-2 | Ethernet7 | rr | SF_SITE_101_RR-1 | Ethernet4 |
| pe | SF_SITE_101_BL-2 | Ethernet9 | pe | SF_SITE_103_BL-1 | Ethernet9 |
| pe | SF_SITE_101_BL-2 | Ethernet11 | ethernet_aggregation | SF_SITE_101_TOR-1B | Ethernet3 |
| pe | SF_SITE_101_BL-2 | Ethernet12 | ethernet_aggregation | SF_SITE_101_TOR-1B | Ethernet4 |
| pe | SF_SITE_102_BL-1 | Ethernet3 | pe | SF_SITE_104_BL-1 | Ethernet6 |
| pe | SF_SITE_102_BL-1 | Ethernet4 | p | SF_SITE_102_SPINE-2 | Ethernet3 |
| pe | SF_SITE_102_BL-1 | Ethernet7 | rr | SF_SITE_102_RR-1 | Ethernet3 |
| pe | SF_SITE_102_BL-1 | Ethernet11 | ethernet_aggregation | SF_SITE_102_TOR-1A | Ethernet3 |
| pe | SF_SITE_102_BL-1 | Ethernet12 | ethernet_aggregation | SF_SITE_102_TOR-1A | Ethernet4 |
| pe | SF_SITE_102_BL-2 | Ethernet3 | p | SF_SITE_102_SPINE-1 | Ethernet4 |
| pe | SF_SITE_102_BL-2 | Ethernet4 | p | SF_SITE_102_SPINE-2 | Ethernet4 |
| pe | SF_SITE_102_BL-2 | Ethernet7 | rr | SF_SITE_102_RR-1 | Ethernet4 |
| pe | SF_SITE_102_BL-2 | Ethernet10 | pe | SF_SITE_103_BL-1 | Ethernet10 |
| pe | SF_SITE_102_BL-2 | Ethernet11 | ethernet_aggregation | SF_SITE_102_TOR-1B | Ethernet3 |
| pe | SF_SITE_102_BL-2 | Ethernet12 | ethernet_aggregation | SF_SITE_102_TOR-1B | Ethernet4 |
| pe | SF_SITE_103_BL-1 | Ethernet3 | ethernet_aggregation | SF_SITE_103_TOR-1A | Ethernet3 |
| pe | SF_SITE_103_BL-1 | Ethernet4 | ethernet_aggregation | SF_SITE_103_TOR-1A | Ethernet4 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| SF_SITE_101_BL-1 | Ethernet3 | 10.0.0.1/31 | SF_SITE_101_SPINE-1 | Ethernet3 | 10.0.0.0/31 |
| SF_SITE_101_BL-1 | Ethernet4 | 10.0.0.5/31 | SF_SITE_101_SPINE-2 | Ethernet3 | 10.0.0.4/31 |
| SF_SITE_101_BL-1 | Ethernet7 | 10.0.0.8/31 | SF_SITE_101_RR-1 | Ethernet3 | 10.0.0.9/31 |
| SF_SITE_101_BL-1 | Ethernet9 | 10.1.0.2/31 | SF_SITE_102_BL-1 | Ethernet9 | 10.1.0.3/31 |
| SF_SITE_101_BL-1 | Ethernet10 | 10.1.0.0/31 | SF_SITE_104_BL-1 | Ethernet10 | 10.1.0.1/31 |
| SF_SITE_101_BL-2 | Ethernet3 | 10.0.0.3/31 | SF_SITE_101_SPINE-1 | Ethernet4 | 10.0.0.2/31 |
| SF_SITE_101_BL-2 | Ethernet4 | 10.0.0.7/31 | SF_SITE_101_SPINE-2 | Ethernet4 | 10.0.0.6/31 |
| SF_SITE_101_BL-2 | Ethernet7 | 10.0.0.10/31 | SF_SITE_101_RR-1 | Ethernet4 | 10.0.0.11/31 |
| SF_SITE_101_BL-2 | Ethernet9 | 10.1.0.4/31 | SF_SITE_103_BL-1 | Ethernet9 | 10.1.0.5/31 |
| SF_SITE_102_BL-1 | Ethernet3 | 10.1.0.7/31 | SF_SITE_104_BL-1 | Ethernet6 | 10.1.0.6/31 |
| SF_SITE_102_BL-1 | Ethernet4 | 10.1.0.5/31 | SF_SITE_102_SPINE-2 | Ethernet3 | 10.1.0.4/31 |
| SF_SITE_102_BL-1 | Ethernet7 | 10.1.0.8/31 | SF_SITE_102_RR-1 | Ethernet3 | 10.1.0.9/31 |
| SF_SITE_102_BL-2 | Ethernet3 | 10.1.0.3/31 | SF_SITE_102_SPINE-1 | Ethernet4 | 10.1.0.2/31 |
| SF_SITE_102_BL-2 | Ethernet4 | 10.1.0.7/31 | SF_SITE_102_SPINE-2 | Ethernet4 | 10.1.0.6/31 |
| SF_SITE_102_BL-2 | Ethernet7 | 10.1.0.10/31 | SF_SITE_102_RR-1 | Ethernet4 | 10.1.0.11/31 |
| SF_SITE_102_BL-2 | Ethernet10 | 10.1.0.8/31 | SF_SITE_103_BL-1 | Ethernet10 | 10.1.0.9/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.1.0.0/24 | 256 | 2 | 0.79 % |
| 100.1.1.0/24 | 256 | 2 | 0.79 % |
| 100.1.2.0/24 | 256 | 2 | 0.79 % |
| 100.2.0.0/24 | 256 | 2 | 0.79 % |
| 100.2.2.0/24 | 256 | 2 | 0.79 % |
| 100.3.2.0/24 | 256 | 1 | 0.4 % |
| 100.4.2.0/24 | 256 | 1 | 0.4 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SF_101 | BRANCH-A2A-CE1 | 10.101.101.1/32 |
| SF_101 | BRANCH-A2A-CE2 | 10.101.101.2/32 |
| SF_102 | BRANCH-A2A-CE3 | 10.102.102.1/32 |
| SF_102 | BRANCH-A2A-CE4 | 10.102.102.2/32 |
| SF_103 | BRANCH-A2A-CE5 | 10.103.103.1/32 |
| SF_103 | BRANCH-A2A-CE6 | 10.104.104.1/32 |
| SF_101 | BRANCH-VPWS-CE1 | 10.101.101.5/32 |
| SF_101 | CORP-A2A-CE1 | 10.101.101.3/32 |
| SF_101 | CORP-A2A-CE2 | 10.101.101.4/32 |
| SF_102 | CORP-A2A-CE3 | 10.102.102.3/32 |
| SF_102 | CORP-A2A-CE4 | 10.102.102.4/32 |
| SF_103 | CORP-A2A-CE5 | 10.105.105.1/32 |
| SF_103 | CORP-A2A-CE6 | 10.104.104.2/32 |
| SF_101 | SF_SITE_101_BL-1 | 100.1.2.1/32 |
| SF_101 | SF_SITE_101_BL-2 | 100.1.2.2/32 |
| SF_101 | SF_SITE_101_RR-1 | 100.1.1.1/32 |
| SF_101 | SF_SITE_101_SPINE-1 | 100.1.0.1/32 |
| SF_101 | SF_SITE_101_SPINE-2 | 100.1.0.2/32 |
| SF_102 | SF_SITE_102_BL-1 | 100.2.2.1/32 |
| SF_102 | SF_SITE_102_BL-2 | 100.2.2.2/32 |
| SF_102 | SF_SITE_102_RR-1 | 100.1.1.2/32 |
| SF_102 | SF_SITE_102_SPINE-1 | 100.2.0.1/32 |
| SF_102 | SF_SITE_102_SPINE-2 | 100.2.0.2/32 |
| SF_103 | SF_SITE_103_BL-1 | 100.3.2.1/32 |
| SF_104 | SF_SITE_104_BL-1 | 100.4.2.1/32 |

### ISIS CLNS interfaces

| POD | Node | CLNS Address |
| --- | ---- | ------------ |
| SF_101 | SF_SITE_101_BL-1 | 51.0001.1921.6800.0001.00 |
| SF_101 | SF_SITE_101_BL-2 | 51.0001.1921.6800.0002.00 |
| SF_101 | SF_SITE_101_RR-1 | 51.0001.1921.6800.0001.00 |
| SF_101 | SF_SITE_101_SPINE-1 | 51.0001.1921.6800.0001.00 |
| SF_101 | SF_SITE_101_SPINE-2 | 51.0001.1921.6800.0002.00 |
| SF_102 | SF_SITE_102_BL-1 | 51.0001.1921.6800.0001.00 |
| SF_102 | SF_SITE_102_BL-2 | 51.0001.1921.6800.0002.00 |
| SF_102 | SF_SITE_102_RR-1 | 51.0001.1921.6800.0002.00 |
| SF_102 | SF_SITE_102_SPINE-1 | 51.0001.1921.6800.0001.00 |
| SF_102 | SF_SITE_102_SPINE-2 | 51.0001.1921.6800.0002.00 |
| SF_103 | SF_SITE_103_BL-1 | 51.0001.1921.6800.0001.00 |
| SF_104 | SF_SITE_104_BL-1 | 51.0001.1921.6800.0001.00 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
