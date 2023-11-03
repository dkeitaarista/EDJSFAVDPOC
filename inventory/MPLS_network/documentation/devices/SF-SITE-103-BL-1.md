# SF-SITE-103-BL-1

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
  - [Router ISIS](#router-isis)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [MPLS](#mpls)
  - [MPLS and LDP](#mpls-and-ldp)
  - [MPLS Interfaces](#mpls-interfaces)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
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
| Management1 | oob_management | oob | default | 192.168.0.25/24 | - |

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
   ip address 192.168.0.25/24
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
| 100 | vlan_100 | - |
| 101 | vlan_101 | - |
| 102 | vlan_102 | - |
| 103 | vlan_103 | - |
| 104 | vlan_104 | - |
| 200 | vlan_200 | - |
| 201 | vlan_201 | - |
| 202 | vlan_202 | - |
| 203 | vlan_203 | - |
| 204 | vlan_204 | - |
| 500 | vlan_500 | - |
| 600 | vlan_600 | - |
| 700 | vlan_700 | - |

### VLANs Device Configuration

```eos
!
vlan 100
   name vlan_100
!
vlan 101
   name vlan_101
!
vlan 102
   name vlan_102
!
vlan 103
   name vlan_103
!
vlan 104
   name vlan_104
!
vlan 200
   name vlan_200
!
vlan 201
   name vlan_201
!
vlan 202
   name vlan_202
!
vlan 203
   name vlan_203
!
vlan 204
   name vlan_204
!
vlan 500
   name vlan_500
!
vlan 600
   name vlan_600
!
vlan 700
   name vlan_700
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet3 | SF-SITE-103-TOR-1A_Ethernet3 | *trunk | *100-104,200-204,500,600,700 | *- | *- | 3 |
| Ethernet4 | SF-SITE-103-TOR-1A_Ethernet4 | *trunk | *100-104,200-204,500,600,700 | *- | *- | 3 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Port-channel11.104 | - | l3dot1q | - | 104 |
| Port-channel11.204 | - | l3dot1q | - | 204 |
| Port-channel11.700 | - | l3dot1q | - | 700 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet9 | P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet9 | routed | - | 10.1.0.5/31 | default | 1500 | False | - | - |
| Ethernet10 | P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet10 | routed | - | 10.1.0.9/31 | default | 1500 | False | - | - |
| Port-channel11.104 | - | l3dot1q | - | 10.255.103.0/31 | BRANCH-10019 | - | False | - | - |
| Port-channel11.204 | - | l3dot1q | - | 10.255.103.2/31 | CORP-10020 | - | False | - | - |
| Port-channel11.700 | - | l3dot1q | - | 10.255.103.20/31 | BRANCH-20103 | - | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet9 | - | CORE | 10 | point-to-point | level-2 | True | - |
| Ethernet10 | - | CORE | 10 | point-to-point | level-2 | True | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3
   description SF-SITE-103-TOR-1A_Ethernet3
   no shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description SF-SITE-103-TOR-1A_Ethernet4
   no shutdown
   channel-group 3 mode active
!
interface Ethernet9
   description P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet9
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.5/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Ethernet10
   description P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet10
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.9/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Port-channel11
   no shutdown
   no switchport
!
interface Port-channel11.104
   no shutdown
   encapsulation dot1q vlan 104
   vrf BRANCH-10019
   ip address 10.255.103.0/31
!
interface Port-channel11.204
   no shutdown
   encapsulation dot1q vlan 204
   vrf CORP-10020
   ip address 10.255.103.2/31
!
interface Port-channel11.700
   no shutdown
   encapsulation dot1q vlan 700
   vrf BRANCH-20103
   ip address 10.255.103.20/31
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel3 | SF-SITE-103-TOR-1A_Po3 | switched | trunk | 100-104,200-204,500,600,700 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel3
   description SF-SITE-103-TOR-1A_Po3
   no shutdown
   switchport
   switchport trunk allowed vlan 100-104,200-204,500,600,700
   switchport mode trunk
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 100.3.2.25/32 |
| Loopback10 | Inband management | default | 192.168.101.25/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | MPLS_Overlay_peering | default | - |
| Loopback10 | Inband management | default | - |

##### ISIS

| Interface | ISIS instance | ISIS metric | Interface mode |
| --------- | ------------- | ----------- | -------------- |
| Loopback0 | CORE | - | passive |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description MPLS_Overlay_peering
   no shutdown
   ip address 100.3.2.25/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 25
!
interface Loopback10
   description Inband management
   ip address 192.168.101.25/32
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
| BRANCH-10019 | True |
| BRANCH-20103 | True |
| CORP-10020 | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BRANCH-10019
ip routing vrf BRANCH-20103
ip routing vrf CORP-10020
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BRANCH-10019 | false |
| BRANCH-20103 | false |
| CORP-10020 | false |
| default | false |

### Router ISIS

#### Router ISIS Summary

| Settings | Value |
| -------- | ----- |
| Instance | CORE |
| Net-ID | 51.0001.1921.6800.0025.00 |
| Type | level-2 |
| Router-ID | 100.3.2.25 |
| Log Adjacency Changes | True |
| Local Convergence Delay (ms) | 10000 |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet9 | CORE | 10 | point-to-point |
| Ethernet10 | CORE | 10 | point-to-point |
| Loopback0 | CORE | - | passive |

#### ISIS Segment-routing Node-SID

| Loopback | IPv4 Index | IPv6 Index |
| -------- | ---------- | ---------- |
| Loopback0 | 25 | - |

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
   net 51.0001.1921.6800.0025.00
   is-type level-2
   router-id ipv4 100.3.2.25
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

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 6.6971|  100.3.2.25 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| bgp always-compare-med |
| graceful-restart restart-time 300 |
| graceful-restart |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### MPLS-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | mpls |
| Remote AS | 6.6971 |
| Source | Loopback0 |
| BFD | True |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- |
| 100.1.1.13 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 100.1.1.20 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 10.255.103.1 | 65505 | BRANCH-10019 | - | - | - | - | True | - | - | - |
| 10.255.103.21 | 65501 | BRANCH-20103 | - | - | - | - | True | - | - | - |
| 10.255.103.3 | 65525 | CORP-10020 | - | - | - | - | True | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| MPLS-OVERLAY-PEERS | True | default |

##### EVPN Neighbor Default Encapsulation

| Neighbor Default Encapsulation | Next-hop-self Source Interface |
| ------------------------------ | ------------------------------ |
| mpls | Loopback0 |

#### Router BGP VPN-IPv4 Address Family

##### VPN-IPv4 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out |
| ---------- | -------- | ------------ | ------------- |
| MPLS-OVERLAY-PEERS | True | - | - |

#### Router BGP VPN-IPv6 Address Family

##### VPN-IPv6 Peer Groups

| Peer Group | Activate | Route-map In | Route-map Out |
| ---------- | -------- | ------------ | ------------- |
| MPLS-OVERLAY-PEERS | True | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BRANCH-10019 | 100.3.2.25:10011 | connected |
| BRANCH-20103 | 100.3.2.25:20103 | connected |
| CORP-10020 | 100.3.2.25:10012 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 6.6971
   router-id 100.3.2.25
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
   bgp asn notation asdot
   bgp always-compare-med
   neighbor MPLS-OVERLAY-PEERS peer group
   neighbor MPLS-OVERLAY-PEERS remote-as 6.6971
   neighbor MPLS-OVERLAY-PEERS update-source Loopback0
   neighbor MPLS-OVERLAY-PEERS bfd
   neighbor MPLS-OVERLAY-PEERS send-community
   neighbor MPLS-OVERLAY-PEERS maximum-routes 0
   neighbor 100.1.1.13 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.13 description SF-SITE-101-RR-1
   neighbor 100.1.1.20 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.20 description SF-SITE-102-RR-1
   !
   address-family evpn
      neighbor default encapsulation mpls next-hop-self source-interface Loopback0
      neighbor MPLS-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor MPLS-OVERLAY-PEERS activate
   !
   address-family vpn-ipv4
      neighbor MPLS-OVERLAY-PEERS activate
   !
   address-family vpn-ipv6
      neighbor MPLS-OVERLAY-PEERS activate
   !
   vrf BRANCH-10019
      rd 100.3.2.25:10011
      route-target import vpn-ipv4 6.6971:10011
      route-target import vpn-ipv6 6.6971:10011
      route-target export vpn-ipv4 6.6971:10011
      route-target export vpn-ipv6 6.6971:10011
      router-id 100.3.2.25
      neighbor 10.255.103.1 remote-as 65505
      neighbor 10.255.103.1 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.103.1 activate
      !
      bgp additional-paths receive
      bgp additional-paths send any
      bgp bestpath tie-break router-id

   !
   vrf BRANCH-20103
      rd 100.3.2.25:20103
      route-target import vpn-ipv4 6.6971:20103
      route-target import vpn-ipv4 2000
      route-target import vpn-ipv6 6.6971:20103
      route-target import vpn-ipv6 2000
      route-target export vpn-ipv4 6.6971:20103
      route-target export vpn-ipv4 5000
      route-target export vpn-ipv6 6.6971:20103
      route-target export vpn-ipv6 5000
      router-id 100.3.2.25
      neighbor 10.255.103.21 remote-as 65501
      neighbor 10.255.103.21 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.103.21 activate
      !
      bgp additional-paths receive
      bgp additional-paths send any
      bgp bestpath tie-break router-id

   !
   vrf CORP-10020
      rd 100.3.2.25:10012
      route-target import vpn-ipv4 6.6971:10012
      route-target import vpn-ipv6 6.6971:10012
      route-target export vpn-ipv4 6.6971:10012
      route-target export vpn-ipv6 6.6971:10012
      router-id 100.3.2.25
      neighbor 10.255.103.3 remote-as 65525
      neighbor 10.255.103.3 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.103.3 activate
      !
      bgp additional-paths receive
      bgp additional-paths send any
      bgp bestpath tie-break router-id

```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 1200 | 1200 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 1200 min-rx 1200 multiplier 3
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
| Ethernet9 | True | - | - |
| Ethernet10 | True | - | - |

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
| BRANCH-10019 | enabled |
| BRANCH-20103 | enabled |
| CORP-10020 | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BRANCH-10019
!
vrf instance BRANCH-20103
!
vrf instance CORP-10020
```

## EOS CLI

```eos
!
!
mpls label range static 16 15984
mpls label range bgp-sr 16000 8000
mpls label range isis-sr 16000 8000

!
router bgp 6.6971
  vpws BRANCH
    mpls control-word
  address-family vpn-ipv4
    bgp additional-paths receive
    bgp additional-paths send any
  address-family vpn-ipv6
    bgp additional-paths receive
    bgp additional-paths send any

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
