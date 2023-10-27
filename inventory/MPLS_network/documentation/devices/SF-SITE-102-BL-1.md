# SF-SITE-102-BL-1

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
- [ACL](#acl)
  - [IP Access-lists](#ip-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [MACsec](#macsec)
  - [MACsec Summary](#macsec-summary)
  - [MACsec Device Configuration](#macsec-device-configuration)
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
| Management1 | oob_management | oob | default | 192.168.0.21/24 | - |

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
   ip address 192.168.0.21/24
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
| Ethernet11 | SF-SITE-102-TOR-1A_Ethernet3 | *trunk | *102-103,202-203 | *- | *- | 11 |
| Ethernet12 | SF-SITE-102-TOR-1A_Ethernet4 | *trunk | *102-103,202-203 | *- | *- | 11 |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3 | P2P_LINK_TO_SF-SITE-104-BL-1_Ethernet6 | routed | - | 10.1.0.7/31 | default | 1500 | False | - | - |
| Ethernet4 | P2P_LINK_TO_SF-SITE-102-SPINE-2_Ethernet3 | routed | - | 10.1.0.5/31 | default | 1500 | False | - | - |
| Ethernet7 | P2P_LINK_TO_SF-SITE-102-RR-1_Ethernet3 | routed | - | 10.1.0.8/31 | default | 1500 | False | - | - |
| Ethernet9 | P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet9 | routed | - | 10.1.0.3/31 | default | 1500 | False | - | - |

##### ISIS

| Interface | Channel Group | ISIS Instance | ISIS Metric | Mode | ISIS Circuit Type | Hello Padding | Authentication Mode |
| --------- | ------------- | ------------- | ----------- | ---- | ----------------- | ------------- | ------------------- |
| Ethernet3 | - | CORE | 10 | point-to-point | level-2 | True | - |
| Ethernet4 | - | CORE | 10 | point-to-point | level-2 | True | - |
| Ethernet7 | - | CORE | 10 | point-to-point | level-2 | True | - |
| Ethernet9 | - | CORE | 10 | point-to-point | level-2 | True | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3
   description P2P_LINK_TO_SF-SITE-104-BL-1_Ethernet6
   no shutdown
   mtu 1500
   mac security profile Backbone
   no switchport
   ip address 10.1.0.7/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Ethernet4
   description P2P_LINK_TO_SF-SITE-102-SPINE-2_Ethernet3
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
interface Ethernet7
   description P2P_LINK_TO_SF-SITE-102-RR-1_Ethernet3
   no shutdown
   mtu 1500
   no switchport
   ip address 10.1.0.8/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Ethernet9
   description P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet9
   no shutdown
   mtu 1500
   mac security profile Backbone
   no switchport
   ip address 10.1.0.3/31
   mpls ip
   isis enable CORE
   isis circuit-type level-2
   isis metric 10
   isis hello padding
   isis network point-to-point
!
interface Ethernet11
   description SF-SITE-102-TOR-1A_Ethernet3
   no shutdown
   channel-group 11 mode active
!
interface Ethernet12
   description SF-SITE-102-TOR-1A_Ethernet4
   no shutdown
   channel-group 11 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel11 | SF-SITE-102-TOR-1A_Po3 | switched | trunk | 102-103,202-203 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel11
   description SF-SITE-102-TOR-1A_Po3
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
| Loopback0 | MPLS_Overlay_peering | default | 100.2.2.1/32 |
| Loopback10 | Inband management | default | 192.168.101.21/32 |

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
   ip address 100.2.2.1/32
   isis enable CORE
   isis passive
   node-segment ipv4 index 1
!
interface Loopback10
   description Inband management
   ip address 192.168.101.21/32
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
| Net-ID | 51.0001.1921.6800.0001.00 |
| Type | level-2 |
| Router-ID | 100.2.2.1 |
| Log Adjacency Changes | True |
| Local Convergence Delay (ms) | 10000 |
| SR MPLS Enabled | True |

#### ISIS Interfaces Summary

| Interface | ISIS Instance | ISIS Metric | Interface Mode |
| --------- | ------------- | ----------- | -------------- |
| Ethernet3 | CORE | 10 | point-to-point |
| Ethernet4 | CORE | 10 | point-to-point |
| Ethernet7 | CORE | 10 | point-to-point |
| Ethernet9 | CORE | 10 | point-to-point |
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
   net 51.0001.1921.6800.0001.00
   is-type level-2
   router-id ipv4 100.2.2.1
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
| 6.6971|  100.2.2.1 |

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

#### Router BGP Device Configuration

```eos
!
router bgp 6.6971
   router-id 100.2.2.1
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
   neighbor 100.1.1.1 description SF-SITE-101-RR-1
   neighbor 100.1.1.2 peer group MPLS-OVERLAY-PEERS
   neighbor 100.1.1.2 description SF-SITE-102-RR-1
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
      neighbor default encapsulation mpls next-hop-self source-interface null=
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

### VRF Instances Device Configuration

```eos
```

## MACsec

### MACsec Summary

License is not installed.

FIPS restrictions enabled.

#### MACsec Profiles Summary

**Profile Backbone:**

Settings:

| Cipher | Key-Server Priority | Rekey-Period | SCI |
| ------ | ------------------- | ------------ | --- |
| aes256-gcm-xpn | - | 86400 | - |

Keys:

| Key ID | Fallback |
| ------ |  -------- |
| 4261636b62306e65 | - |

### MACsec Device Configuration

```eos
!
mac security
   fips restrictions
   !
   profile Backbone
      cipher aes256-gcm-xpn
      key 4261636b62306e65 7 <removed>
      mka session rekey-period 86400
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
!
router isis CORE
  lsp purge origination-identification
  set-overload-bit on-startup wait-for-bgp
  authentication mode md5
  graceful-restart restart-hold-time 300
  authentication key 7 U93fJqF1/pY=
  address-family ipv4 unicast
    bfd all-interfaces
  address-family ipv6 unicast
    bfd all-interfaces
    multi-topology
interface Loopback0
  isis multi-topology address-family ipv4 unicast
  isis multi-topology address-family ipv6 unicast

```
