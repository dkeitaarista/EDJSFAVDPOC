
# Validate State Report

**Table of Contents:**

- [Validate State Report](validate-state-report)
  - [Test Results Summary](#test-results-summary)
  - [Failed Test Results Summary](#failed-test-results-summary)
  - [All Test Results](#all-test-results)

## Test Results Summary

### Summary Totals

| Total Tests | Total Tests Passed | Total Tests Failed |
| ----------- | ------------------ | ------------------ |
| 18 | 14 | 4 |

### Summary Totals Devices Under Tests

| DUT | Total Tests | Tests Passed | Tests Failed | Categories Failed |
| --- | ----------- | ------------ | ------------ | ----------------- |
| SF-SITE-101-SPINE-1 |  9 | 7 | 2 | IP Reachability |
| SF-SITE-101-SPINE-2 |  9 | 7 | 2 | IP Reachability |

### Summary Totals Per Category

| Test Category | Total Tests | Tests Passed | Tests Failed |
| ------------- | ----------- | ------------ | ------------ |
| NTP |  2 | 2 | 0 |
| Interface State |  8 | 8 | 0 |
| LLDP Topology |  4 | 4 | 0 |
| IP Reachability |  4 | 0 | 4 |

## Failed Test Results Summary

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 15 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet3 | FAIL | 100% packet loss |
| 16 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet3 | FAIL | 100% packet loss |
| 17 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet4 | FAIL | 100% packet loss |
| 18 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet4 | FAIL | 100% packet loss |

## All Test Results

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 1 | SF-SITE-101-SPINE-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 2 | SF-SITE-101-SPINE-2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 3 | SF-SITE-101-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet3 | PASS | - |
| 4 | SF-SITE-101-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet3 | PASS | - |
| 5 | SF-SITE-101-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet4 | PASS | - |
| 6 | SF-SITE-101-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet4 | PASS | - |
| 7 | SF-SITE-101-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 8 | SF-SITE-101-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 9 | SF-SITE-101-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 10 | SF-SITE-101-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 11 | SF-SITE-101-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet3 | PASS | - |
| 12 | SF-SITE-101-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet3 | PASS | - |
| 13 | SF-SITE-101-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet4 | PASS | - |
| 14 | SF-SITE-101-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet4 | PASS | - |
| 15 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet3 | FAIL | 100% packet loss |
| 16 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet3 | FAIL | 100% packet loss |
| 17 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet4 | FAIL | 100% packet loss |
| 18 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet4 | FAIL | 100% packet loss |
