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
| SF_101 | pe | SF_SITE_101_BL-1 | 192.168.0.14/24 | vEOS-lab | Provisioned | - |
| SF_101 | pe | SF_SITE_101_BL-2 | 192.168.0.15/24 | vEOS-lab | Provisioned | - |
| SF_101 | rr | SF_SITE_101_RR-1 | 192.168.0.13/24 | vEOS-lab | Provisioned | - |
| SF_101 | p | SF_SITE_101_SPINE-1 | 192.168.0.11/24 | vEOS-lab | Provisioned | - |
| SF_101 | p | SF_SITE_101_SPINE-2 | 192.168.0.12/24 | vEOS-lab | Provisioned | - |
| SF_101 | ethernet_aggregation | SF_SITE_101_TOR-1A | 192.168.0.16/24 | vEOS-lab | Provisioned | - |
| SF_101 | ethernet_aggregation | SF_SITE_101_TOR-1B | 192.168.0.16/24 | vEOS-lab | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.1.0.0/24 | 256 | 2 | 0.79 % |
| 100.1.1.0/24 | 256 | 1 | 0.4 % |
| 100.1.2.0/24 | 256 | 2 | 0.79 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SF_101 | SF_SITE_101_BL-1 | 100.1.2.1/32 |
| SF_101 | SF_SITE_101_BL-2 | 100.1.2.2/32 |
| SF_101 | SF_SITE_101_RR-1 | 100.1.1.1/32 |
| SF_101 | SF_SITE_101_SPINE-1 | 100.1.0.1/32 |
| SF_101 | SF_SITE_101_SPINE-2 | 100.1.0.2/32 |

### ISIS CLNS interfaces

| POD | Node | CLNS Address |
| --- | ---- | ------------ |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
