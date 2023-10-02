# SF_SITE_101_BL-1

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [IP Name Servers](#ip-name-servers)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [AAA Authorization](#aaa-authorization)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
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
- [Patch Panel](#patch-panel)
  - [Patch Panel Summary](#patch-panel-summary)
  - [Patch Panel Configuration](#patch-panel-configuration)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
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
| Management1 | oob_management | oob | default | 192.168.0.14/24 | - |

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
   ip address 192.168.0.14/24
```

### DNS Domain

#### DNS domain: EDJ.poc

#### DNS Domain Device Configuration

```eos
dns domain EDJ.poc
!
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 8.8.8.8 | default | - |
| 8.8.4.4 | default | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf default 8.8.4.4
ip name-server vrf default 8.8.8.8
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
| cvpadmin | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username cvpadmin privilege 15 role network-admin secret sha512 <removed>
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

### VLANs Device Configuration

```eos
!
vlan 100
   name vlan_100
!
vlan 101
   name vlan_101
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet11 | SF_SITE_101_TOR-1A_Ethernet3 | *trunk | *100-101 | *- | *- | 11 |
| Ethernet12 | SF_SITE_101_TOR-1A_Ethernet4 | *trunk | *100-101 | *- | *- | 11 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Port-channel11.100 | - | l3dot1q | - | 100 |
| Port-channel11.101 | - | l3dot1q | - | 101 |

##### Flexible Encapsulation Interfaces

| Interface | Description | Type | Vlan ID | Client Unmatched | Client Dot1q VLAN | Client Dot1q Outer Tag | Client Dot1q Inner Tag | Network Retain Client Encapsulation | Network Dot1q VLAN | Network Dot1q Outer Tag | Network Dot1q Inner Tag |
| --------- | ----------- | ---- | ------- | -----------------| ----------------- | ---------------------- | ---------------------- | ----------------------------------- | ------------------ | ----------------------- | ----------------------- |
| Port-channel11.99 | - | l2dot1q | - | False | 99 | - | - | True | - | - | - |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3 | P2P_LINK_TO_SF_SITE_101_SPINE-1_Ethernet3 | routed | - | 10.0.0.1/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_SF_SITE_101_SPINE-2_Ethernet3 | routed | - | 10.0.0.5/31 | default | 1500 | False | - | - |
| Ethernet7 | P2P_LINK_TO_SF_SITE_101_RR-1_Ethernet3 | routed | - | 10.0.0.8/31 | default | 1500 | False | - | - |
| Ethernet9 | P2P_LINK_TO_SF_SITE_102_BL-1_Ethernet9 | routed | - | 10.1.0.2/31 | default | 1500 | False | - | - |
| Ethernet10 | P2P_LINK_TO_SF_SITE_104_BL-1_Ethernet10 | routed | - | 10.1.0.0/31 | default | 1500 | False | - | - |
| Port-channel11.100 | - | l3dot1q | - | 10.255.101.0/31 | BRANCH-10011 | - | False | - | - |
| Port-channel11.101 | - | l3dot1q | - | 10.255.101.2/31 | BRANCH-10013 | - | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet3 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet4 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet7 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet9 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet10 | - | CORE | 50 | point-to-point | level-2 | True | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3
   description P2P_LINK_TO_SF_SITE_101_SPINE-1_Ethernet3
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.1/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_SF_SITE_101_SPINE-2_Ethernet3
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.5/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet7
   description P2P_LINK_TO_SF_SITE_101_RR-1_Ethernet3
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.8/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet9
   description P2P_LINK_TO_SF_SITE_102_BL-1_Ethernet9
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.2/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet10
   description P2P_LINK_TO_SF_SITE_104_BL-1_Ethernet10
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.0/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet11
   description SF_SITE_101_TOR-1A_Ethernet3
   no shutdown
   channel-group 11 mode active
!
interface Ethernet12
   description SF_SITE_101_TOR-1A_Ethernet4
   no shutdown
   channel-group 11 mode active
!
interface Port-channel11
   no shutdown
   no switchport
!
interface Port-channel11.99
   no shutdown
   encapsulation vlan
      client dot1q 99 network client
!
interface Port-channel11.100
   no shutdown
   encapsulation dot1q vlan 100
   vrf BRANCH-10011
   ip address 10.255.101.0/31
!
interface Port-channel11.101
   no shutdown
   encapsulation dot1q vlan 101
   vrf BRANCH-10013
   ip address 10.255.101.2/31
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel11 | SF_SITE_101_TOR-1A_Po3 | switched | trunk | 100-101 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel11
   description SF_SITE_101_TOR-1A_Po3
   no shutdown
   switchport
   switchport trunk allowed vlan 100-101
   switchport mode trunk
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 100.1.2.1/32 |
| Loopback10 | Inband management | default | 192.168.101.14/32 |

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
   ip address 100.1.2.1/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 1
!
interface Loopback10
   description Inband management
   ip address 192.168.101.14/32
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
| BRANCH-10011 | True |
| BRANCH-10013 | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BRANCH-10011
ip routing vrf BRANCH-10013
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BRANCH-10011 | false |
| BRANCH-10013 | false |
| default | false |

### Router ISIS

#### Router ISIS Summary

| Settings | Value |
| -------- | ----- |
| Instance | CORE |
| Type | level-2 |
| Router-ID | 100.1.2.1 |
| Log Adjacency Changes | True |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet3 | CORE | 50 | point-to-point |
| Ethernet4 | CORE | 50 | point-to-point |
| Ethernet7 | CORE | 50 | point-to-point |
| Ethernet9 | CORE | 50 | point-to-point |
| Ethernet10 | CORE | 50 | point-to-point |
| Loopback0 | CORE | - | passive |

#### ISIS Segment-routing Node-SID

| Loopback | IPv4 Index | IPv6 Index |
| -------- | ---------- | ---------- |
| Loopback0 | 1 | - |

#### ISIS IPv4 Address Family Summary

| Settings | Value |
| -------- | ----- |
| IPv4 Address-family Enabled | True |
| Maximum-paths | 4 |

#### Router ISIS Device Configuration

```eos
!
router isis CORE
   is-type level-2
   router-id ipv4 100.1.2.1
   log-adjacency-changes
   !
   address-family ipv4 unicast
      maximum-paths 4
   !
   segment-routing mpls
      no shutdown
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 6.6971|  100.1.2.1 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| bgp always-compare-med |
| bgp bestpath tie-break router-id |
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
| 100.1.1.1 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 100.1.1.2 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 10.255.101.1 | 65501 | BRANCH-10011 | - | - | - | - | True | - | - | - |

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

#### Router BGP VPWS Instances

| Instance | Route-Distinguisher | Both Route-Target | MPLS Control Word | Label Flow | MTU | Pseudowire | Local ID | Remote ID |
| -------- | ------------------- | ----------------- | ----------------- | -----------| --- | ---------- | -------- | --------- |
| BRANCH | 100.1.2.1:5000 | 6.6971:5000 | False | False | - | SF_SITE_101_BL-1-SF_SITE_102_BL-1_99 | 100 | 101 |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BRANCH-10011 | 100.1.2.1:10011 | connected |
| BRANCH-10013 | 100.1.2.1:10013 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 6.6971
   router-id 100.1.2.1
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
   bgp asn notation asdot
   bgp always-compare-med
   bgp bestpath tie-break router-id
   neighbor MPLS-OVERLAY-PEERS peer group
   neighbor MPLS-OVERLAY-PEERS remote-as 6.6971
   neighbor MPLS-OVERLAY-PEERS update-source Loopback0
   neighbor MPLS-OVERLAY-PEERS bfd
   neighbor MPLS-OVERLAY-PEERS send-community
   neighbor MPLS-OVERLAY-PEERS maximum-routes 0
   neighbor 100.1.1.1 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.1 description SF_SITE_101_RR-1
   neighbor 100.1.1.2 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.2 description SF_SITE_102_RR-1
   !
   vpws BRANCH
      rd 100.1.2.1:5000
      route-target import export evpn 6.6971:5000
      !
      pseudowire SF_SITE_101_BL-1-SF_SITE_102_BL-1_99
         evpn vpws id local 100 remote 101
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
   vrf BRANCH-10011
      rd 100.1.2.1:10011
      route-target import vpn-ipv4 6.6971:10011
      route-target import vpn-ipv6 6.6971:10011
      route-target export vpn-ipv4 6.6971:10011
      route-target export vpn-ipv6 6.6971:10011
      router-id 100.1.2.1
      neighbor 10.255.101.1 remote-as 65501
      neighbor 10.255.101.1 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.101.1 activate
      !
      bgp additional-paths receive
      bgp additional-paths send any
      bgp bestpath tie-break router-id

   !
   vrf BRANCH-10013
      rd 100.1.2.1:10013
      route-target import vpn-ipv4 6.6971:10013
      route-target import vpn-ipv6 6.6971:10013
      route-target export vpn-ipv4 6.6971:10013
      route-target export vpn-ipv6 6.6971:10013
      router-id 100.1.2.1
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
      !
      bgp additional-paths receive
      bgp additional-paths send any

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
| Ethernet3 | True | - | - |
| Ethernet4 | True | - | - |
| Ethernet7 | True | - | - |
| Ethernet9 | True | - | - |
| Ethernet10 | True | - | - |

## Patch Panel

### Patch Panel Summary

| Patch Name | Enabled | Connector A Type | Connector A Endpoint | Connector B Type | Connector B Endpoint |
| ---------- | ------- | ---------------- | -------------------- | ---------------- | -------------------- |
| SF_SITE_101_BL-1-SF_SITE_102_BL-1_99 | True | Interface | Port-channel11.99 | Pseudowire | bgp vpws BRANCH pseudowire SF_SITE_101_BL-1-SF_SITE_102_BL-1_99 |

### Patch Panel Configuration

```eos
!
patch panel
   patch SF_SITE_101_BL-1-SF_SITE_102_BL-1_99
      connector 1 interface Port-channel11.99
      connector 2 pseudowire bgp vpws BRANCH pseudowire SF_SITE_101_BL-1-SF_SITE_102_BL-1_99
   !
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

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| BRANCH-10011 | enabled |
| BRANCH-10013 | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BRANCH-10011
!
vrf instance BRANCH-10013
```

## EOS CLI

```eos
!
router bgp 6.6971
  vpws BRANCH
    mpls control-word
  address-family vpn-ipv4
    bgp additional-paths receive
    bgp additional-paths send any

```
