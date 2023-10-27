# SF-SITE-102-TOR-1A

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
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
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Match-lists](#match-lists)
- [ACL](#acl)
  - [IP Access-lists](#ip-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [Quality Of Service](#quality-of-service)
  - [QOS](#qos)
  - [QOS Class Maps](#qos-class-maps)
  - [QOS Policy Maps](#qos-policy-maps)
  - [QOS Profiles](#qos-profiles)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | default | 192.168.0.23/24 | - |

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
   ip address 192.168.0.23/24
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 10.255.0.2 | default | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf default 10.255.0.2
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
| arista | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username arista privilege 15 role network-admin secret sha512 <removed>
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

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 102 | vlan_102 | - |
| 103 | vlan_103 | - |
| 202 | vlan_202 | - |
| 203 | vlan_203 | - |

### VLANs Device Configuration

```eos
!
vlan 102
   name vlan_102
!
vlan 103
   name vlan_103
!
vlan 202
   name vlan_202
!
vlan 203
   name vlan_203
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet1 |  BRANCH-VPWS-CE2_Ethernet1 | access | 99 | - | - | - |
| Ethernet3 | SF-SITE-102-BL-1_Ethernet11 | *trunk | *102-103,202-203 | *- | *- | 3 |
| Ethernet4 | SF-SITE-102-BL-1_Ethernet12 | *trunk | *102-103,202-203 | *- | *- | 3 |
| Ethernet7 |  BRANCH-A2A-CE3_Ethernet1 | access | 102 | - | - | - |
| Ethernet8 |  CORP-A2A-CE3_Ethernet1 | access | 202 | - | - | - |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description BRANCH-VPWS-CE2_Ethernet1
   no shutdown
   switchport access vlan 99
   switchport mode access
   switchport
!
interface Ethernet3
   description SF-SITE-102-BL-1_Ethernet11
   no shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description SF-SITE-102-BL-1_Ethernet12
   no shutdown
   channel-group 3 mode active
!
interface Ethernet7
   description BRANCH-A2A-CE3_Ethernet1
   no shutdown
   switchport access vlan 102
   switchport mode access
   switchport
!
interface Ethernet8
   description CORP-A2A-CE3_Ethernet1
   no shutdown
   switchport access vlan 202
   switchport mode access
   switchport
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel3 | SF-SITE-102-BL-1_Po11 | switched | trunk | 102-103,202-203 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel3
   description SF-SITE-102-BL-1_Po11
   no shutdown
   switchport
   switchport trunk allowed vlan 102-103,202-203
   switchport mode trunk
   qos trust dscp
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-1G
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback10 | Inband management | default | 192.168.101.23/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback10 | Inband management | default | - |


#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback10
   description Inband management
   ip address 192.168.101.23/32
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
| default | False |

#### IP Routing Device Configuration

```eos
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

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

## ACL

### IP Access-lists

#### IP Access-lists Configuration

```eos
ip access-list BUSINESS
   5 remark Management SSH
   10 permit tcp any any eq ssh
   20 permit tcp any eq ssh any
   30 remark Management telnet
   40 permit tcp any any eq telnet
   50 permit tcp any eq telnet any
   60 remark Management SOC
   70 permit ip host 172.0.193.0 0.255.0.255 any
   80 permit ip any host 172.0.193.0 0.255.0.255
   90 remark Web CSR Accountlink SSL
   100 permit tcp any any eq https
   110 permit tcp any eq https any
   120 remark Messaging - Print
   130 permit tcp any any eq ldp
   140 permit tcp any eq ldp any
   150 permit tcp any any eq 9100
   160 permit tcp any eq 9100 any
   170 remark Login MS-DS
   180 permit tcp any any eq microsoft-ds
   190 permit tcp any eq microsoft-ds any
   200 permit tcp any any eq 137
   210 permit tcp any eq 137 any
   220 permit tcp any any eq 138
   230 permit tcp any eq 138 any
   240 permit tcp any any eq 139
   250 permit tcp any eq 139 any
   260 permit tcp any any eq 1748
   270 permit tcp any eq 1748 any
   280 remark other
   290 permit tcp any any range 18480 19999
   300 permit tcp any range 18480 19999 any
   310 permit tcp any any range 20021 20479
   320 permit tcp any range 20021 20479 any
   330 remark Voice AES Traffic
   340 permit tcp any any eq 1050
   350 permit tcp any eq 1050 any
   360 permit tcp any any eq 450
   370 permit tcp any eq 450 any
   380 remark Wireless CAPWAP
   390 permit udp any any eq 5246 5247
   400 permit udp any eq 5246 5247 any
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |

### VRF Instances Device Configuration

```eos
```

## Quality Of Service

### QOS

#### QOS Summary

QOS rewrite DSCP: **disabled**

##### QOS Mappings


| COS to Traffic Class mappings |
| ----------------------------- |
| 0 to traffic-class 0 |
| 1 to traffic-class 1 |


| DSCP to Traffic Class mappings |
| ------------------------------ |
| 0 1 2 3 4 5 6 7 |
| 8 9 10 11 12 13 14 15 |


| Traffic Class to DSCP or COS mappings |
| ------------------------------------- |
| 0 to cos 0 |
| 0 to dscp 0 |
| 0 to exp 0 |
| 1 to cos 1 |
| 1 to dscp 8 |
| 1 to exp 1 |

#### QOS Device Configuration

```eos
!
qos map cos 0 to traffic-class 0
qos map cos 1 to traffic-class 1
qos map dscp 0 1 2 3 4 5 6 7
qos map dscp 8 9 10 11 12 13 14 15
qos map traffic-class 0 to cos 0
qos map traffic-class 0 to dscp 0
qos map traffic-class 0 to exp 0
qos map traffic-class 1 to cos 1
qos map traffic-class 1 to dscp 8
qos map traffic-class 1 to exp 1
```

### QOS Class Maps

#### QOS Class Maps Summary

| Name | Field | Value |
| ---- | ----- | ----- |
| BUSINESS | acl | BUSINESS |

#### Class-maps Device Configuration

```eos
!
class-map type qos match-any BUSINESS
   match ip access-group BUSINESS
```

### QOS Policy Maps

#### QOS Policy Maps Summary

**TENANT-INGRESS-CLASSIFIER-1G**

| class | Set | Value |
| ----- | --- | ----- |
| BUSINESS | traffic_class | 2 |

#### QOS Policy Maps configuration

```eos
!
policy-map type quality-of-service TENANT-INGRESS-CLASSIFIER-1G
   class BUSINESS
      set traffic-class 2
```

### QOS Profiles

#### QOS Profiles Summary


QOS Profile: **TENANT-1G**

**Settings**

| Default COS | Default DSCP | Trust | Shape Rate | QOS Service Policy |
| ----------- | ------------ | ----- | ---------- | ------------------ |
| - | - | - | - | TENANT-INGRESS-CLASSIFIER-1G |

**TX Queues**

| TX queue | Type | Bandwidth | Priority | Shape Rate | Comment |
| -------- | ---- | --------- | -------- | ---------- | ------- |
| 0 | All | 5 | no priority | - | - |
| 1 | All | 1 | no priority | - | - |
| 2 | All | 19 | no priority | - | - |
| 3 | All | 20 | no priority | - | - |
| 4 | All | 30 | no priority | - | - |
| 5 | All | 25 | no priority | - | - |

QOS Profile: **TENANT-10G**

**Settings**

| Default COS | Default DSCP | Trust | Shape Rate | QOS Service Policy |
| ----------- | ------------ | ----- | ---------- | ------------------ |
| - | - | - | - | TENANT-INGRESS-CLASSIFIER-10G |

**TX Queues**

| TX queue | Type | Bandwidth | Priority | Shape Rate | Comment |
| -------- | ---- | --------- | -------- | ---------- | ------- |
| 0 | All | 5 | no priority | - | - |
| 1 | All | 1 | no priority | - | - |
| 2 | All | 19 | no priority | - | - |
| 3 | All | 20 | no priority | - | - |
| 4 | All | 30 | no priority | - | - |
| 5 | All | 25 | no priority | - | - |

#### QOS Profile Device Configuration

```eos
!
qos profile TENANT-1G
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-1G
   !
   tx-queue 0
      bandwidth percent 5
      no priority
   !
   tx-queue 1
      bandwidth percent 1
      no priority
   !
   tx-queue 2
      bandwidth percent 19
      no priority
   !
   tx-queue 3
      bandwidth percent 20
      no priority
   !
   tx-queue 4
      bandwidth percent 30
      no priority
   !
   tx-queue 5
      bandwidth percent 25
      no priority
!
qos profile TENANT-10G
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-10G
   !
   tx-queue 0
      bandwidth percent 5
      no priority
   !
   tx-queue 1
      bandwidth percent 1
      no priority
   !
   tx-queue 2
      bandwidth percent 19
      no priority
   !
   tx-queue 3
      bandwidth percent 20
      no priority
   !
   tx-queue 4
      bandwidth percent 30
      no priority
   !
   tx-queue 5
      bandwidth percent 25
      no priority
```

#### QOS Interfaces

| Interface | Trust | Default DSCP | Default COS | Shape rate |
| --------- | ----- | ------------ | ----------- | ---------- |
| Port-Channel3 | dscp | - | - | - |
