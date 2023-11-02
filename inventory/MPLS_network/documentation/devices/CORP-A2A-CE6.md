# CORP-A2A-CE6

## Table of Contents

- [Management](#management)
<<<<<<< HEAD
  - [DNS Domain](#dns-domain)
=======
  - [Management Interfaces](#management-interfaces)
>>>>>>> dk-avdpoc-20231102
  - [IP Name Servers](#ip-name-servers)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [AAA Authorization](#aaa-authorization)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Configuration](#internal-vlan-allocation-policy-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Router BGP](#router-bgp)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Match-lists](#match-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)

## Management

<<<<<<< HEAD
### DNS Domain

#### DNS domain: EDJ.poc

#### DNS Domain Device Configuration

```eos
dns domain EDJ.poc
!
=======
### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | default | 192.168.0.39/24 | - |

##### IPv6

| Management Interface | description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | default | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   no shutdown
   ip address 192.168.0.39/24
>>>>>>> dk-avdpoc-20231102
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
<<<<<<< HEAD
| 8.8.8.8 | default | - |
| 8.8.4.4 | default | - |
=======
| 10.255.0.2 | default | - |
>>>>>>> dk-avdpoc-20231102

#### IP Name Servers Device Configuration

```eos
<<<<<<< HEAD
ip name-server vrf default 8.8.4.4
ip name-server vrf default 8.8.8.8
=======
ip name-server vrf default 10.255.0.2
>>>>>>> dk-avdpoc-20231102
```

### Clock Settings

#### Clock Timezone Settings

Clock Timezone is set to **CST**.

#### Clock Configuration

```eos
!
clock timezone CST
```

### NTP

#### NTP Summary

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 0.north-america.pool.ntp.org | default | True | - | - | - | - | - | - | - |
| 1.north-america.pool.ntp.org | default | - | - | - | - | - | - | - | - |

#### NTP Device Configuration

```eos
!
ntp server 0.north-america.pool.ntp.org prefer
ntp server 1.north-america.pool.ntp.org
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| default | - | - |

#### Management API HTTP Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf default
      no shutdown
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
<<<<<<< HEAD
| cvpadmin | 15 | network-admin | False | - |
=======
| arista | 15 | network-admin | False | - |
>>>>>>> dk-avdpoc-20231102

#### Local Users Device Configuration

```eos
!
<<<<<<< HEAD
username cvpadmin privilege 15 role network-admin secret sha512 <removed>
=======
username arista privilege 15 role network-admin secret sha512 <removed>
>>>>>>> dk-avdpoc-20231102
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | local |

Authorization for configuration commands is disabled.

#### AAA Authorization Device Configuration

```eos
aaa authorization exec default local
!
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 192.168.0.5:9910 | - | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=192.168.0.5:9910 -cvauth=token,/tmp/token -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

### Logging

#### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | critical |
| Monitor | disabled |
| Buffer | informational |
| Trap | warnings |
| Synchronous | critical |

| Format Type | Setting |
| ----------- | ------- |
| Timestamp | high-resolution |
| Hostname | hostname |
| Sequence-numbers | true |

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 180000 informational
logging trap warnings
logging console critical
no logging monitor
logging synchronous level critical
logging format timestamp high-resolution
logging format sequence-numbers
logging source-interface Loopback10
logging policy match match-list SAKlogs discard
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 32768 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
spanning-tree mst 0 priority 32768
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
<<<<<<< HEAD
| Ethernet1 | Uplink to SF_SITE_102_TOR-1B | routed | - | 10.255.104.3/31 | default | - | - | - | - |
=======
| Ethernet1 | Uplink to SF_SITE_104_BL-1 | routed | - | 10.255.104.3/31 | default | - | - | - | - |
>>>>>>> dk-avdpoc-20231102

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
<<<<<<< HEAD
   description Uplink to SF_SITE_102_TOR-1B
=======
   description Uplink to SF_SITE_104_BL-1
>>>>>>> dk-avdpoc-20231102
   no switchport
   ip address 10.255.104.3/31
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
<<<<<<< HEAD
| Loopback10 | Inband management | default | {{ mgmt_loopback_ipv4_pool | ansible.utils.ipmath((management_interfaces[0]['ip_address'] | string | ansible.utils.ipaddr('address')).split('.')[3]) }}/32 |
=======
| Loopback0 |  CE IP for test | default | 10.104.104.2/32 |
>>>>>>> dk-avdpoc-20231102

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
<<<<<<< HEAD
| Loopback10 | Inband management | default | - |
=======
| Loopback0 |  CE IP for test | default | - |
>>>>>>> dk-avdpoc-20231102


#### Loopback Interfaces Device Configuration

```eos
!
<<<<<<< HEAD
interface Loopback10
   description Inband management
   ip address {{ mgmt_loopback_ipv4_pool | ansible.utils.ipmath((management_interfaces[0]['ip_address'] | string | ansible.utils.ipaddr('address')).split('.')[3]) }}/32
=======
interface Loopback0
   description  CE IP for test
   no shutdown
   ip address 10.104.104.2/32
>>>>>>> dk-avdpoc-20231102
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
<<<<<<< HEAD
| default | False |
=======
| default | True |
>>>>>>> dk-avdpoc-20231102

#### IP Routing Device Configuration

```eos
<<<<<<< HEAD
=======
!
ip routing
>>>>>>> dk-avdpoc-20231102
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65526|  10.255.104.3 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- |
<<<<<<< HEAD
| 10.255.104.4 | 6.6971 | default | - | - | - | - | - | - | - | - |
=======
| 10.255.104.2 | 6.6971 | default | - | - | - | - | - | - | - | - |
>>>>>>> dk-avdpoc-20231102

#### Router BGP Device Configuration

```eos
!
router bgp 65526
   router-id 10.255.104.3
<<<<<<< HEAD
   neighbor 10.255.104.4 peer group CE-PEER-GROUP
   neighbor 10.255.104.4 remote-as 6.6971
=======
   neighbor 10.255.104.2 peer group CE-PEER-GROUP
   neighbor 10.255.104.2 remote-as 6.6971
>>>>>>> dk-avdpoc-20231102
   redistribute connected
   !
   address-family ipv4
      neighbor CE-PEER-GROUP activate
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## Filters

### Match-lists

#### Match-list Input String Summary

##### SAKlogs

| Sequence | Match Regex |
| -------- | ------ |
| 10 | MKA-6-SAK_ACTIVATED |
| 20 | MKA-6-SAK_CREATED |
| 30 | MKA-5-STATE_CHG |
| 40 | MKA-3-SESSION_FAILURE |


#### Match-lists Device Configuration

```eos
!
match-list input string SAKlogs
   10 match regex MKA-6-SAK_ACTIVATED
   20 match regex MKA-6-SAK_CREATED
   30 match regex MKA-5-STATE_CHG
   40 match regex MKA-3-SESSION_FAILURE
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |

### VRF Instances Device Configuration

```eos
```
