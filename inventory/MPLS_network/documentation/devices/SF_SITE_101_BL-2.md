# SF_SITE_101_BL-2

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
- [EOS CLI](#eos-cli)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | default | 192.168.0.15/24 | - |

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
   ip address 192.168.0.15/24
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
| 200 | vlan_200 | - |
| 201 | vlan_201 | - |

### VLANs Device Configuration

```eos
!
vlan 100
   name vlan_100
!
vlan 101
   name vlan_101
!
vlan 200
   name vlan_200
!
vlan 201
   name vlan_201
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet11 | SF_SITE_101_TOR-1B_Ethernet3 | *trunk | *100-101,200-201 | *- | *- | 11 |
| Ethernet12 | SF_SITE_101_TOR-1B_Ethernet4 | *trunk | *100-101,200-201 | *- | *- | 11 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Port-channel11.101 | - | l3dot1q | - | 101 |
| Port-channel11.201 | - | l3dot1q | - | 201 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3 | P2P_LINK_TO_SF_SITE_101_SPINE-1_Ethernet4 | routed | - | 10.0.0.3/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_SF_SITE_101_SPINE-2_Ethernet4 | routed | - | 10.0.0.7/31 | default | 1500 | False | - | - |
| Ethernet7 | P2P_LINK_TO_SF_SITE_101_RR-1_Ethernet4 | routed | - | 10.0.0.10/31 | default | 1500 | False | - | - |
| Ethernet9 | P2P_LINK_TO_SF_SITE_103_BL-1_Ethernet9 | routed | - | 10.1.0.4/31 | default | 1500 | False | - | - |
| Port-channel11.101 | - | l3dot1q | - | 10.255.101.2/31 | BRANCH-10013 | - | False | - | - |
| Port-channel11.201 | - | l3dot1q | - | 10.255.101.6/31 | CORP-10014 | - | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet3 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet4 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet7 | - | CORE | 50 | point-to-point | level-2 | True | - |
| Ethernet9 | - | CORE | 50 | point-to-point | level-2 | True | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3
   description P2P_LINK_TO_SF_SITE_101_SPINE-1_Ethernet4
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.3/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_SF_SITE_101_SPINE-2_Ethernet4
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.7/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet7
   description P2P_LINK_TO_SF_SITE_101_RR-1_Ethernet4
   no shutdown
   mtu 1500
   no switchport
   ip address 10.0.0.10/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet9
   description P2P_LINK_TO_SF_SITE_103_BL-1_Ethernet9
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.4/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 50
   isis hello padding
   isis network point-to-point
!
interface Ethernet11
   description SF_SITE_101_TOR-1B_Ethernet3
   no shutdown
   channel-group 11 mode active
!
interface Ethernet12
   description SF_SITE_101_TOR-1B_Ethernet4
   no shutdown
   channel-group 11 mode active
!
interface Port-channel11
   no shutdown
   no switchport
!
interface Port-channel11.101
   no shutdown
   encapsulation dot1q vlan 101
   vrf BRANCH-10013
   ip address 10.255.101.2/31
   no qos trust
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-1G
   !
   tx-queue 0
      no priority
      bandwidth percent 5
   !
   tx-queue 1
      no priority
      bandwidth percent 1
   !
   tx-queue 2
      no priority
      bandwidth percent 19
   !
   tx-queue 3
      no priority
      bandwidth percent 20
   !
   tx-queue 4
      priority strict
      bandwidth percent 30
   !
   tx-queue 5
      priority strict
      bandwidth percent 25

!
interface Port-channel11.201
   no shutdown
   encapsulation dot1q vlan 201
   vrf CORP-10014
   ip address 10.255.101.6/31
   no qos trust
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-1G
   !
   tx-queue 0
      no priority
      bandwidth percent 5
   !
   tx-queue 1
      no priority
      bandwidth percent 1
   !
   tx-queue 2
      no priority
      bandwidth percent 19
   !
   tx-queue 3
      no priority
      bandwidth percent 20
   !
   tx-queue 4
      priority strict
      bandwidth percent 30
   !
   tx-queue 5
      priority strict
      bandwidth percent 25

```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel11 | SF_SITE_101_TOR-1B_Po3 | switched | trunk | 100-101,200-201 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel11
   description SF_SITE_101_TOR-1B_Po3
   no shutdown
   switchport
   switchport trunk allowed vlan 100-101,200-201
   switchport mode trunk
   qos trust dscp
   service-policy type qos input TENANT-INGRESS-CLASSIFIER-1G
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | MPLS_Overlay_peering | default | 100.1.2.2/32 |
| Loopback10 | Inband management | default | 192.168.101.15/32 |

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
   ip address 100.1.2.2/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 2
!
interface Loopback10
   description Inband management
   ip address 192.168.101.15/32
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
| BRANCH-10013 | True |
| CORP-10014 | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BRANCH-10013
ip routing vrf CORP-10014
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BRANCH-10013 | false |
| CORP-10014 | false |
| default | false |

### Router ISIS

#### Router ISIS Summary

| Settings | Value |
| -------- | ----- |
| Instance | CORE |
| Type | level-2 |
| Router-ID | 100.1.2.2 |
| Log Adjacency Changes | True |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet3 | CORE | 50 | point-to-point |
| Ethernet4 | CORE | 50 | point-to-point |
| Ethernet7 | CORE | 50 | point-to-point |
| Ethernet9 | CORE | 50 | point-to-point |
| Loopback0 | CORE | - | passive |

#### ISIS Segment-routing Node-SID

| Loopback | IPv4 Index | IPv6 Index |
| -------- | ---------- | ---------- |
| Loopback0 | 2 | - |

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
   router-id ipv4 100.1.2.2
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
| 6.6971 | 100.1.2.2 |

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
| 100.1.1.1 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 100.1.1.2 | Inherited from peer group MPLS-OVERLAY-PEERS | default | - | Inherited from peer group MPLS-OVERLAY-PEERS | Inherited from peer group MPLS-OVERLAY-PEERS | - | Inherited from peer group MPLS-OVERLAY-PEERS | - | - | - |
| 10.255.101.3 | 65503 | BRANCH-10013 | - | - | - | - | True | - | - | - |
| 10.255.101.3 | 65504 | CORP-10014 | - | - | - | - | True | - | - | - |

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
| BRANCH-10013 | 100.1.2.2:10013 | connected |
| CORP-10014 | 100.1.2.2:10014 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 6.6971
   router-id 100.1.2.2
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
   neighbor 100.1.1.1 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.1 description SF_SITE_101_RR-1
   neighbor 100.1.1.2 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.2 description SF_SITE_102_RR-1
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
   vrf BRANCH-10013
      rd 100.1.2.2:10013
      route-target import vpn-ipv4 6.6971:10013
      route-target import vpn-ipv6 6.6971:10013
      route-target export vpn-ipv4 6.6971:10013
      route-target export vpn-ipv6 6.6971:10013
      router-id 100.1.2.2
      neighbor 10.255.101.3 remote-as 65503
      neighbor 10.255.101.3 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.101.3 activate
      !
      bgp additional-paths receive
      bgp additional-paths send any
      bgp bestpath tie-break router-id

   !
   vrf CORP-10014
      rd 100.1.2.2:10014
      route-target import vpn-ipv4 6.6971:10014
      route-target import vpn-ipv6 6.6971:10014
      route-target export vpn-ipv4 6.6971:10014
      route-target export vpn-ipv6 6.6971:10014
      router-id 100.1.2.2
      neighbor 10.255.101.3 remote-as 65504
      neighbor 10.255.101.3 bfd
      redistribute connected
      !
      address-family ipv4
         bgp additional-paths install
         neighbor 10.255.101.3 activate
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
| Ethernet3 | True | - | - |
| Ethernet4 | True | - | - |
| Ethernet7 | True | - | - |
| Ethernet9 | True | - | - |

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
| BRANCH-10013 | enabled |
| CORP-10014 | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BRANCH-10013
!
vrf instance CORP-10014
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
| Port-channel11.101 | disabled | - | - | - |
| Port-channel11.201 | disabled | - | - | - |
| Port-Channel11 | dscp | - | - | - |

## EOS CLI

```eos
!
!
mpls label range bgp-sr 16000 8000
mpls label range isis-sr 16000 8000
mpls label range static 16 15984
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
qos map exp 0 to traffic-class 0
qos map exp 1 to traffic-class 1
!
policy-map type quality-of-service TENANT-INGRESS-CLASSIFIER-1G
 class BUSINESS
    police rate 1440 mbps burst-size 125000 bytes rate 1540 mbps burst-size 125000 bytes

```
