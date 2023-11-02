# SF-SITE-101-SPINE-2

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
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Router ISIS](#router-isis)
- [MPLS](#mpls)
  - [MPLS and LDP](#mpls-and-ldp)
  - [MPLS Interfaces](#mpls-interfaces)
- [Filters](#filters)
  - [Match-lists](#match-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [EOS CLI](#eos-cli)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | default | 192.168.0.12/24 | - |

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
   ip address 192.168.0.12/24
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

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
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
| Ethernet3 | P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet4 | routed | - | 10.0.0.4/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet4 | routed | - | 10.0.0.6/31 | default | 1500 | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet3 | - | CORE | 10 | point-to-point | level-2 | True | - |
| Ethernet4 | - | CORE | 10 | point-to-point | level-2 | True | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3
   description P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet4
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.4/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet4
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.6/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | LSR_Router_ID | default | 100.1.0.12/32 |
| Loopback10 | Inband management | default | 192.168.101.12/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | LSR_Router_ID | default | - |
| Loopback10 | Inband management | default | - |

##### ISIS

| Interface | ISIS instance | ISIS metric | Interface mode |
| --------- | ------------- | ----------- | -------------- |
| Loopback0 | CORE | - | passive |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description LSR_Router_ID
   no shutdown
   ip address 100.1.0.12/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 12
!
interface Loopback10
   description Inband management
   ip address 192.168.101.12/32
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
| default | True |

#### IP Routing Device Configuration

```eos
!
ip routing
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

### Router ISIS

#### Router ISIS Summary

| Settings | Value |
| -------- | ----- |
| Instance | CORE |
| Net-ID | 51.0001.1921.6800.0012.00 |
| Type | level-2 |
| Router-ID | 100.1.0.12 |
| Log Adjacency Changes | True |
| Local Convergence Delay (ms) | 10000 |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet3 | CORE | 10 | point-to-point |
| Ethernet4 | CORE | 10 | point-to-point |
| Loopback0 | CORE | - | passive |

#### ISIS Segment-routing Node-SID

| Loopback | IPv4 Index | IPv6 Index |
| -------- | ---------- | ---------- |
| Loopback0 | 12 | - |

#### ISIS IPv4 Address Family Summary

| Settings | Value |
| -------- | ----- |
| IPv4 Address-family Enabled | True |
| Maximum-paths | 4 |
| TI-LFA Mode | node-protection |
| TI-LFA Level | level-2 |

#### ISIS IPv6 Address Family Summary

| Settings | Value |
| -------- | ----- |
| IPv6 Address-family Enabled | True |
| TI-LFA Mode | node-protection |
| TI-LFA Level | level-2 |

#### Router ISIS Device Configuration

```eos
!
router isis CORE
   net 51.0001.1921.6800.0012.00
   is-type level-2
   router-id ipv4 100.1.0.12
   log-adjacency-changes
   timers local-convergence-delay 10000 protected-prefixes
   !
   address-family ipv4 unicast
      maximum-paths 4
      fast-reroute ti-lfa mode node-protection level-2
   !
   address-family ipv6 unicast
      fast-reroute ti-lfa mode node-protection level-2
   !
   segment-routing mpls
      no shutdown
```

## MPLS

### MPLS and LDP

#### MPLS and LDP Summary

| Setting | Value |
| -------- | ---- |
| MPLS IP Enabled | True |
| LDP Enabled | False |
| LDP Router ID | - |
| LDP Interface Disabled Default | - |
| LDP Transport-Address Interface | - |

#### MPLS and LDP Configuration

```eos
!
mpls ip
```

### MPLS Interfaces

| Interface | MPLS IP Enabled | LDP Enabled | IGP Sync |
| --------- | --------------- | ----------- | -------- |
| Ethernet3 | True | - | - |
| Ethernet4 | True | - | - |

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

## EOS CLI

```eos
!
!
mpls label range static 16 15984
mpls label range bgp-sr 16000 8000
mpls label range isis-sr 16000 8000

!

router isis CORE
  lsp purge origination-identification
  set-overload-bit on-startup wait-for-bgp
  authentication mode md5
  graceful-restart restart-hold-time 300
  authentication key edwardjones
  address-family ipv4 unicast
    bfd all-interfaces
  address-family ipv6 unicast
    bfd all-interfaces
    multi-topology
interface Loopback0
  isis multi-topology address-family ipv4 unicast
  isis multi-topology address-family ipv6 unicast

```
