
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
| 304 | 286 | 18 |

### Summary Totals Devices Under Tests

| DUT | Total Tests | Tests Passed | Tests Failed | Categories Failed |
| --- | ----------- | ------------ | ------------ | ----------------- |
| BRANCH-A2A-CE1 |  3 | 3 | 0 | - |
| BRANCH-A2A-CE2 |  3 | 3 | 0 | - |
| BRANCH-A2A-CE3 |  3 | 3 | 0 | - |
| BRANCH-A2A-CE4 |  3 | 3 | 0 | - |
| BRANCH-A2A-CE5 |  3 | 3 | 0 | - |
| BRANCH-A2A-CE6 |  3 | 3 | 0 | - |
| BRANCH-HS-CE1 |  3 | 3 | 0 | - |
| BRANCH-HS-CE2 |  3 | 3 | 0 | - |
| BRANCH-HS-CE3 |  3 | 3 | 0 | - |
| BRANCH-VPWS-CE2 |  3 | 3 | 0 | - |
| CORP-A2A-CE1 |  3 | 3 | 0 | - |
| CORP-A2A-CE2 |  3 | 3 | 0 | - |
| CORP-A2A-CE3 |  3 | 3 | 0 | - |
| CORP-A2A-CE4 |  3 | 3 | 0 | - |
| CORP-A2A-CE5 |  3 | 3 | 0 | - |
| CORP-A2A-CE6 |  3 | 3 | 0 | - |
| SF-SITE-101-BL-1 |  30 | 26 | 4 | Interface State |
| SF-SITE-101-BL-2 |  24 | 21 | 3 | Interface State |
| SF-SITE-101-RR-1 |  10 | 10 | 0 | - |
| SF-SITE-101-SPINE-1 |  9 | 9 | 0 | - |
| SF-SITE-101-SPINE-2 |  9 | 9 | 0 | - |
| SF-SITE-101-TOR-1A |  13 | 13 | 0 | - |
| SF-SITE-101-TOR-1B |  11 | 11 | 0 | - |
| SF-SITE-102-BL-1 |  30 | 26 | 4 | Interface State |
| SF-SITE-102-BL-2 |  24 | 21 | 3 | Interface State |
| SF-SITE-102-RR-1 |  10 | 10 | 0 | - |
| SF-SITE-102-SPINE-1 |  9 | 9 | 0 | - |
| SF-SITE-102-SPINE-2 |  9 | 9 | 0 | - |
| SF-SITE-102-TOR-1A |  13 | 13 | 0 | - |
| SF-SITE-102-TOR-1B |  11 | 11 | 0 | - |
| SF-SITE-103-BL-1 |  19 | 15 | 4 | Interface State |
| SF-SITE-103-TOR-1A |  13 | 13 | 0 | - |
| SF-SITE-104-BL-1 |  12 | 12 | 0 | - |

### Summary Totals Per Category

| Test Category | Total Tests | Tests Passed | Tests Failed |
| ------------- | ----------- | ------------ | ------------ |
| NTP |  33 | 33 | 0 |
| Interface State |  146 | 128 | 18 |
| LLDP Topology |  67 | 67 | 0 |
| IP Reachability |  34 | 34 | 0 |
| BGP |  24 | 24 | 0 |

## Failed Test Results Summary

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 41 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.100 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 42 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.301 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 43 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.200 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 46 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 53 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.101 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 54 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.201 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 55 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 78 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.102 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 79 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.302 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 80 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.202 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 83 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 90 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.103 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 91 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.203 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 92 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 112 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.104 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 113 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.303 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 114 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.204 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 115 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |

## All Test Results

| Test ID | Node | Test Category | Test Description | Test | Test Result | Failure Reason |
| ------- | ---- | ------------- | ---------------- | ---- | ----------- | -------------- |
| 1 | BRANCH-A2A-CE1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 2 | BRANCH-A2A-CE2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 3 | BRANCH-A2A-CE3 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 4 | BRANCH-A2A-CE4 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 5 | BRANCH-A2A-CE5 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 6 | BRANCH-A2A-CE6 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 7 | BRANCH-HS-CE1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 8 | BRANCH-HS-CE2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 9 | BRANCH-HS-CE3 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 10 | BRANCH-VPWS-CE2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 11 | CORP-A2A-CE1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 12 | CORP-A2A-CE2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 13 | CORP-A2A-CE3 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 14 | CORP-A2A-CE4 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 15 | CORP-A2A-CE5 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 16 | CORP-A2A-CE6 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 17 | SF-SITE-101-BL-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 18 | SF-SITE-101-BL-2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 19 | SF-SITE-101-RR-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 20 | SF-SITE-101-SPINE-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 21 | SF-SITE-101-SPINE-2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 22 | SF-SITE-101-TOR-1A | NTP | Synchronised with NTP server | NTP | PASS | - |
| 23 | SF-SITE-101-TOR-1B | NTP | Synchronised with NTP server | NTP | PASS | - |
| 24 | SF-SITE-102-BL-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 25 | SF-SITE-102-BL-2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 26 | SF-SITE-102-RR-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 27 | SF-SITE-102-SPINE-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 28 | SF-SITE-102-SPINE-2 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 29 | SF-SITE-102-TOR-1A | NTP | Synchronised with NTP server | NTP | PASS | - |
| 30 | SF-SITE-102-TOR-1B | NTP | Synchronised with NTP server | NTP | PASS | - |
| 31 | SF-SITE-103-BL-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 32 | SF-SITE-103-TOR-1A | NTP | Synchronised with NTP server | NTP | PASS | - |
| 33 | SF-SITE-104-BL-1 | NTP | Synchronised with NTP server | NTP | PASS | - |
| 34 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet11 - SF-SITE-101-TOR-1A_Ethernet3 | PASS | - |
| 35 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet12 - SF-SITE-101-TOR-1A_Ethernet4 | PASS | - |
| 36 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-SPINE-1_Ethernet3 | PASS | - |
| 37 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-SPINE-2_Ethernet3 | PASS | - |
| 38 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - P2P_LINK_TO_SF-SITE-101-RR-1_Ethernet3 | PASS | - |
| 39 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_SF-SITE-104-BL-1_Ethernet10 | PASS | - |
| 40 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_SF-SITE-102-BL-1_Ethernet9 | PASS | - |
| 41 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.100 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 42 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.301 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 43 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.200 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 44 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet13.99 -  | PASS | - |
| 45 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet13 -  | PASS | - |
| 46 | SF-SITE-101-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 47 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet11 - SF-SITE-101-TOR-1B_Ethernet3 | PASS | - |
| 48 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet12 - SF-SITE-101-TOR-1B_Ethernet4 | PASS | - |
| 49 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-SPINE-1_Ethernet4 | PASS | - |
| 50 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-SPINE-2_Ethernet4 | PASS | - |
| 51 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - P2P_LINK_TO_SF-SITE-101-RR-1_Ethernet4 | PASS | - |
| 52 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_SF-SITE-103-BL-1_Ethernet9 | PASS | - |
| 53 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.101 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 54 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.201 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 55 | SF-SITE-101-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 56 | SF-SITE-101-RR-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet7 | PASS | - |
| 57 | SF-SITE-101-RR-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet7 | PASS | - |
| 58 | SF-SITE-101-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet3 | PASS | - |
| 59 | SF-SITE-101-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet3 | PASS | - |
| 60 | SF-SITE-101-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet4 | PASS | - |
| 61 | SF-SITE-101-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet4 | PASS | - |
| 62 | SF-SITE-101-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-101-BL-1_Ethernet11 | PASS | - |
| 63 | SF-SITE-101-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-101-BL-1_Ethernet12 | PASS | - |
| 64 | SF-SITE-101-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - BRANCH-A2A-CE1_Ethernet1 | PASS | - |
| 65 | SF-SITE-101-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 - CORP-A2A-CE1_Ethernet1 | PASS | - |
| 66 | SF-SITE-101-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - BRANCH-HS-CE1_Ethernet1 | PASS | - |
| 67 | SF-SITE-101-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-101-BL-2_Ethernet11 | PASS | - |
| 68 | SF-SITE-101-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-101-BL-2_Ethernet12 | PASS | - |
| 69 | SF-SITE-101-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - BRANCH-A2A-CE2_Ethernet1 | PASS | - |
| 70 | SF-SITE-101-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 - CORP-A2A-CE2_Ethernet1 | PASS | - |
| 71 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet11 - SF-SITE-102-TOR-1A_Ethernet3 | PASS | - |
| 72 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet12 - SF-SITE-102-TOR-1A_Ethernet4 | PASS | - |
| 73 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-102-SPINE-1_Ethernet3 | PASS | - |
| 74 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-102-SPINE-2_Ethernet3 | PASS | - |
| 75 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - P2P_LINK_TO_SF-SITE-102-RR-1_Ethernet3 | PASS | - |
| 76 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet9 | PASS | - |
| 77 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_SF-SITE-104-BL-1_Ethernet6 | PASS | - |
| 78 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.102 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 79 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.302 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 80 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.202 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 81 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet13.99 -  | PASS | - |
| 82 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet13 -  | PASS | - |
| 83 | SF-SITE-102-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 84 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet11 - SF-SITE-102-TOR-1B_Ethernet3 | PASS | - |
| 85 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet12 - SF-SITE-102-TOR-1B_Ethernet4 | PASS | - |
| 86 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-102-SPINE-1_Ethernet4 | PASS | - |
| 87 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-102-SPINE-2_Ethernet4 | PASS | - |
| 88 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - P2P_LINK_TO_SF-SITE-102-RR-1_Ethernet4 | PASS | - |
| 89 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_SF-SITE-103-BL-1_Ethernet10 | PASS | - |
| 90 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.103 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 91 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11.203 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 92 | SF-SITE-102-BL-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel11 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 93 | SF-SITE-102-RR-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-102-BL-1_Ethernet7 | PASS | - |
| 94 | SF-SITE-102-RR-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet7 | PASS | - |
| 95 | SF-SITE-102-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-102-BL-1_Ethernet3 | PASS | - |
| 96 | SF-SITE-102-SPINE-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet3 | PASS | - |
| 97 | SF-SITE-102-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - P2P_LINK_TO_SF-SITE-102-BL-1_Ethernet4 | PASS | - |
| 98 | SF-SITE-102-SPINE-2 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet4 | PASS | - |
| 99 | SF-SITE-102-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-102-BL-1_Ethernet11 | PASS | - |
| 100 | SF-SITE-102-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-102-BL-1_Ethernet12 | PASS | - |
| 101 | SF-SITE-102-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - BRANCH-A2A-CE3_Ethernet1 | PASS | - |
| 102 | SF-SITE-102-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 - CORP-A2A-CE3_Ethernet1 | PASS | - |
| 103 | SF-SITE-102-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - BRANCH-HS-CE2_Ethernet1 | PASS | - |
| 104 | SF-SITE-102-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-102-BL-2_Ethernet11 | PASS | - |
| 105 | SF-SITE-102-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-102-BL-2_Ethernet12 | PASS | - |
| 106 | SF-SITE-102-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - BRANCH-A2A-CE4_Ethernet1 | PASS | - |
| 107 | SF-SITE-102-TOR-1B | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 - CORP-A2A-CE4_Ethernet1 | PASS | - |
| 108 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-103-TOR-1A_Ethernet3 | PASS | - |
| 109 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-103-TOR-1A_Ethernet4 | PASS | - |
| 110 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - P2P_LINK_TO_SF-SITE-101-BL-2_Ethernet9 | PASS | - |
| 111 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_SF-SITE-102-BL-2_Ethernet10 | PASS | - |
| 112 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.104 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 113 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.303 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 114 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3.204 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 115 | SF-SITE-103-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Port-channel3 -  | FAIL | Interface shutdown: False - interface status: Not present - line protocol status: Not present |
| 116 | SF-SITE-103-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet3 - SF-SITE-103-BL-1_Ethernet3 | PASS | - |
| 117 | SF-SITE-103-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet4 - SF-SITE-103-BL-1_Ethernet4 | PASS | - |
| 118 | SF-SITE-103-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 - BRANCH-A2A-CE5_Ethernet1 | PASS | - |
| 119 | SF-SITE-103-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 - CORP-A2A-CE5_Ethernet1 | PASS | - |
| 120 | SF-SITE-103-TOR-1A | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet9 - BRANCH-HS-CE3_Ethernet1 | PASS | - |
| 121 | SF-SITE-104-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet10 - P2P_LINK_TO_SF-SITE-101-BL-1_Ethernet10 | PASS | - |
| 122 | SF-SITE-104-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet6 - P2P_LINK_TO_SF-SITE-102-BL-1_Ethernet6 | PASS | - |
| 123 | SF-SITE-104-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet7 -  | PASS | - |
| 124 | SF-SITE-104-BL-1 | Interface State | Ethernet Interface & Line Protocol == "up" | Ethernet8 -  | PASS | - |
| 125 | SF-SITE-101-BL-1 | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel11 - SF-SITE-101-TOR-1A_Po3 | PASS | - |
| 126 | SF-SITE-101-BL-2 | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel11 - SF-SITE-101-TOR-1B_Po3 | PASS | - |
| 127 | SF-SITE-101-TOR-1A | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-101-BL-1_Po11 | PASS | - |
| 128 | SF-SITE-101-TOR-1B | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-101-BL-2_Po11 | PASS | - |
| 129 | SF-SITE-102-BL-1 | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel11 - SF-SITE-102-TOR-1A_Po3 | PASS | - |
| 130 | SF-SITE-102-BL-2 | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel11 - SF-SITE-102-TOR-1B_Po3 | PASS | - |
| 131 | SF-SITE-102-TOR-1A | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-102-BL-1_Po11 | PASS | - |
| 132 | SF-SITE-102-TOR-1B | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-102-BL-2_Po11 | PASS | - |
| 133 | SF-SITE-103-BL-1 | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-103-TOR-1A_Po3 | PASS | - |
| 134 | SF-SITE-103-TOR-1A | Interface State | Port-Channel Interface & Line Protocol == "up" | Port-Channel3 - SF-SITE-103-BL-1_Po3 | PASS | - |
| 135 | BRANCH-A2A-CE1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test for A2AVPN | PASS | - |
| 136 | BRANCH-A2A-CE2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 137 | BRANCH-A2A-CE3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 138 | BRANCH-A2A-CE4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 139 | BRANCH-A2A-CE5 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 140 | BRANCH-A2A-CE6 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 141 | BRANCH-HS-CE1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test for A2AVPN | PASS | - |
| 142 | BRANCH-HS-CE2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test for A2AVPN | PASS | - |
| 143 | BRANCH-HS-CE3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test for A2AVPN | PASS | - |
| 144 | BRANCH-VPWS-CE2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 145 | CORP-A2A-CE1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 146 | CORP-A2A-CE2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 147 | CORP-A2A-CE3 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 148 | CORP-A2A-CE4 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 149 | CORP-A2A-CE5 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 150 | CORP-A2A-CE6 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 -  CE IP for test | PASS | - |
| 151 | SF-SITE-101-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 152 | SF-SITE-101-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 153 | SF-SITE-101-BL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 154 | SF-SITE-101-BL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 155 | SF-SITE-101-RR-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 156 | SF-SITE-101-RR-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 157 | SF-SITE-101-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 158 | SF-SITE-101-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 159 | SF-SITE-101-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 160 | SF-SITE-101-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 161 | SF-SITE-101-TOR-1A | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 162 | SF-SITE-101-TOR-1B | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 163 | SF-SITE-102-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 164 | SF-SITE-102-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 165 | SF-SITE-102-BL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 166 | SF-SITE-102-BL-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 167 | SF-SITE-102-RR-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 168 | SF-SITE-102-RR-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 169 | SF-SITE-102-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 170 | SF-SITE-102-SPINE-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 171 | SF-SITE-102-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - LSR_Router_ID | PASS | - |
| 172 | SF-SITE-102-SPINE-2 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 173 | SF-SITE-102-TOR-1A | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 174 | SF-SITE-102-TOR-1B | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 175 | SF-SITE-103-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 176 | SF-SITE-103-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 177 | SF-SITE-103-TOR-1A | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 178 | SF-SITE-104-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback0 - MPLS_Overlay_peering | PASS | - |
| 179 | SF-SITE-104-BL-1 | Interface State | Loopback Interface Status & Line Protocol == "up" | Loopback10 - Inband management | PASS | - |
| 180 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet11 - remote: SF-SITE-101-TOR-1A_Ethernet3 | PASS | - |
| 181 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet12 - remote: SF-SITE-101-TOR-1A_Ethernet4 | PASS | - |
| 182 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-SPINE-1_Ethernet3 | PASS | - |
| 183 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-SPINE-2_Ethernet3 | PASS | - |
| 184 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: SF-SITE-101-RR-1_Ethernet3 | PASS | - |
| 185 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet10 - remote: SF-SITE-104-BL-1_Ethernet10 | PASS | - |
| 186 | SF-SITE-101-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: SF-SITE-102-BL-1_Ethernet9 | PASS | - |
| 187 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet11 - remote: SF-SITE-101-TOR-1B_Ethernet3 | PASS | - |
| 188 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet12 - remote: SF-SITE-101-TOR-1B_Ethernet4 | PASS | - |
| 189 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-SPINE-1_Ethernet4 | PASS | - |
| 190 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-SPINE-2_Ethernet4 | PASS | - |
| 191 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: SF-SITE-101-RR-1_Ethernet4 | PASS | - |
| 192 | SF-SITE-101-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: SF-SITE-103-BL-1_Ethernet9 | PASS | - |
| 193 | SF-SITE-101-RR-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet7 | PASS | - |
| 194 | SF-SITE-101-RR-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet7 | PASS | - |
| 195 | SF-SITE-101-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet3 | PASS | - |
| 196 | SF-SITE-101-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet3 | PASS | - |
| 197 | SF-SITE-101-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet4 | PASS | - |
| 198 | SF-SITE-101-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet4 | PASS | - |
| 199 | SF-SITE-101-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-1_Ethernet11 | PASS | - |
| 200 | SF-SITE-101-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-1_Ethernet12 | PASS | - |
| 201 | SF-SITE-101-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: BRANCH-A2A-CE1_Ethernet1 | PASS | - |
| 202 | SF-SITE-101-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet8 - remote: CORP-A2A-CE1_Ethernet1 | PASS | - |
| 203 | SF-SITE-101-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: BRANCH-HS-CE1_Ethernet1 | PASS | - |
| 204 | SF-SITE-101-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-101-BL-2_Ethernet11 | PASS | - |
| 205 | SF-SITE-101-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-101-BL-2_Ethernet12 | PASS | - |
| 206 | SF-SITE-101-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: BRANCH-A2A-CE2_Ethernet1 | PASS | - |
| 207 | SF-SITE-101-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet8 - remote: CORP-A2A-CE2_Ethernet1 | PASS | - |
| 208 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet11 - remote: SF-SITE-102-TOR-1A_Ethernet3 | PASS | - |
| 209 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet12 - remote: SF-SITE-102-TOR-1A_Ethernet4 | PASS | - |
| 210 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-SPINE-1_Ethernet3 | PASS | - |
| 211 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-SPINE-2_Ethernet3 | PASS | - |
| 212 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: SF-SITE-102-RR-1_Ethernet3 | PASS | - |
| 213 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: SF-SITE-101-BL-1_Ethernet9 | PASS | - |
| 214 | SF-SITE-102-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet6 - remote: SF-SITE-104-BL-1_Ethernet6 | PASS | - |
| 215 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet11 - remote: SF-SITE-102-TOR-1B_Ethernet3 | PASS | - |
| 216 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet12 - remote: SF-SITE-102-TOR-1B_Ethernet4 | PASS | - |
| 217 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-SPINE-1_Ethernet4 | PASS | - |
| 218 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-SPINE-2_Ethernet4 | PASS | - |
| 219 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: SF-SITE-102-RR-1_Ethernet4 | PASS | - |
| 220 | SF-SITE-102-BL-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet10 - remote: SF-SITE-103-BL-1_Ethernet10 | PASS | - |
| 221 | SF-SITE-102-RR-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-BL-1_Ethernet7 | PASS | - |
| 222 | SF-SITE-102-RR-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-BL-2_Ethernet7 | PASS | - |
| 223 | SF-SITE-102-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-BL-1_Ethernet3 | PASS | - |
| 224 | SF-SITE-102-SPINE-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-BL-2_Ethernet3 | PASS | - |
| 225 | SF-SITE-102-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-BL-1_Ethernet4 | PASS | - |
| 226 | SF-SITE-102-SPINE-2 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-BL-2_Ethernet4 | PASS | - |
| 227 | SF-SITE-102-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-BL-1_Ethernet11 | PASS | - |
| 228 | SF-SITE-102-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-BL-1_Ethernet12 | PASS | - |
| 229 | SF-SITE-102-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: BRANCH-A2A-CE3_Ethernet1 | PASS | - |
| 230 | SF-SITE-102-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet8 - remote: CORP-A2A-CE3_Ethernet1 | PASS | - |
| 231 | SF-SITE-102-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: BRANCH-HS-CE2_Ethernet1 | PASS | - |
| 232 | SF-SITE-102-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-102-BL-2_Ethernet11 | PASS | - |
| 233 | SF-SITE-102-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-102-BL-2_Ethernet12 | PASS | - |
| 234 | SF-SITE-102-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: BRANCH-A2A-CE4_Ethernet1 | PASS | - |
| 235 | SF-SITE-102-TOR-1B | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet8 - remote: CORP-A2A-CE4_Ethernet1 | PASS | - |
| 236 | SF-SITE-103-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-103-TOR-1A_Ethernet3 | PASS | - |
| 237 | SF-SITE-103-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-103-TOR-1A_Ethernet4 | PASS | - |
| 238 | SF-SITE-103-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: SF-SITE-101-BL-2_Ethernet9 | PASS | - |
| 239 | SF-SITE-103-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet10 - remote: SF-SITE-102-BL-2_Ethernet10 | PASS | - |
| 240 | SF-SITE-103-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet3 - remote: SF-SITE-103-BL-1_Ethernet3 | PASS | - |
| 241 | SF-SITE-103-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet4 - remote: SF-SITE-103-BL-1_Ethernet4 | PASS | - |
| 242 | SF-SITE-103-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet7 - remote: BRANCH-A2A-CE5_Ethernet1 | PASS | - |
| 243 | SF-SITE-103-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet8 - remote: CORP-A2A-CE5_Ethernet1 | PASS | - |
| 244 | SF-SITE-103-TOR-1A | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet9 - remote: BRANCH-HS-CE3_Ethernet1 | PASS | - |
| 245 | SF-SITE-104-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet10 - remote: SF-SITE-101-BL-1_Ethernet10 | PASS | - |
| 246 | SF-SITE-104-BL-1 | LLDP Topology | LLDP topology - validate peer and interface | local: Ethernet6 - remote: SF-SITE-102-BL-1_Ethernet6 | PASS | - |
| 247 | SF-SITE-101-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-1_Ethernet3 - Destination: SF-SITE-101-SPINE-1_Ethernet3 | PASS | - |
| 248 | SF-SITE-101-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-1_Ethernet4 - Destination: SF-SITE-101-SPINE-2_Ethernet3 | PASS | - |
| 249 | SF-SITE-101-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-1_Ethernet7 - Destination: SF-SITE-101-RR-1_Ethernet3 | PASS | - |
| 250 | SF-SITE-101-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-1_Ethernet10 - Destination: SF-SITE-104-BL-1_Ethernet10 | PASS | - |
| 251 | SF-SITE-101-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-1_Ethernet9 - Destination: SF-SITE-102-BL-1_Ethernet9 | PASS | - |
| 252 | SF-SITE-101-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-2_Ethernet3 - Destination: SF-SITE-101-SPINE-1_Ethernet4 | PASS | - |
| 253 | SF-SITE-101-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-2_Ethernet4 - Destination: SF-SITE-101-SPINE-2_Ethernet4 | PASS | - |
| 254 | SF-SITE-101-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-2_Ethernet7 - Destination: SF-SITE-101-RR-1_Ethernet4 | PASS | - |
| 255 | SF-SITE-101-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-BL-2_Ethernet9 - Destination: SF-SITE-103-BL-1_Ethernet9 | PASS | - |
| 256 | SF-SITE-101-RR-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-RR-1_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet7 | PASS | - |
| 257 | SF-SITE-101-RR-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-RR-1_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet7 | PASS | - |
| 258 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet3 | PASS | - |
| 259 | SF-SITE-101-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-1_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet3 | PASS | - |
| 260 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet3 - Destination: SF-SITE-101-BL-1_Ethernet4 | PASS | - |
| 261 | SF-SITE-101-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-101-SPINE-2_Ethernet4 - Destination: SF-SITE-101-BL-2_Ethernet4 | PASS | - |
| 262 | SF-SITE-102-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-1_Ethernet3 - Destination: SF-SITE-102-SPINE-1_Ethernet3 | PASS | - |
| 263 | SF-SITE-102-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-1_Ethernet4 - Destination: SF-SITE-102-SPINE-2_Ethernet3 | PASS | - |
| 264 | SF-SITE-102-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-1_Ethernet7 - Destination: SF-SITE-102-RR-1_Ethernet3 | PASS | - |
| 265 | SF-SITE-102-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-1_Ethernet9 - Destination: SF-SITE-101-BL-1_Ethernet9 | PASS | - |
| 266 | SF-SITE-102-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-1_Ethernet6 - Destination: SF-SITE-104-BL-1_Ethernet6 | PASS | - |
| 267 | SF-SITE-102-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-2_Ethernet3 - Destination: SF-SITE-102-SPINE-1_Ethernet4 | PASS | - |
| 268 | SF-SITE-102-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-2_Ethernet4 - Destination: SF-SITE-102-SPINE-2_Ethernet4 | PASS | - |
| 269 | SF-SITE-102-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-2_Ethernet7 - Destination: SF-SITE-102-RR-1_Ethernet4 | PASS | - |
| 270 | SF-SITE-102-BL-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-BL-2_Ethernet10 - Destination: SF-SITE-103-BL-1_Ethernet10 | PASS | - |
| 271 | SF-SITE-102-RR-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-RR-1_Ethernet3 - Destination: SF-SITE-102-BL-1_Ethernet7 | PASS | - |
| 272 | SF-SITE-102-RR-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-RR-1_Ethernet4 - Destination: SF-SITE-102-BL-2_Ethernet7 | PASS | - |
| 273 | SF-SITE-102-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-SPINE-1_Ethernet3 - Destination: SF-SITE-102-BL-1_Ethernet3 | PASS | - |
| 274 | SF-SITE-102-SPINE-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-SPINE-1_Ethernet4 - Destination: SF-SITE-102-BL-2_Ethernet3 | PASS | - |
| 275 | SF-SITE-102-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-SPINE-2_Ethernet3 - Destination: SF-SITE-102-BL-1_Ethernet4 | PASS | - |
| 276 | SF-SITE-102-SPINE-2 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-102-SPINE-2_Ethernet4 - Destination: SF-SITE-102-BL-2_Ethernet4 | PASS | - |
| 277 | SF-SITE-103-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-103-BL-1_Ethernet9 - Destination: SF-SITE-101-BL-2_Ethernet9 | PASS | - |
| 278 | SF-SITE-103-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-103-BL-1_Ethernet10 - Destination: SF-SITE-102-BL-2_Ethernet10 | PASS | - |
| 279 | SF-SITE-104-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-104-BL-1_Ethernet10 - Destination: SF-SITE-101-BL-1_Ethernet10 | PASS | - |
| 280 | SF-SITE-104-BL-1 | IP Reachability | ip reachability test p2p links | Source: SF-SITE-104-BL-1_Ethernet6 - Destination: SF-SITE-102-BL-1_Ethernet6 | PASS | - |
| 281 | BRANCH-A2A-CE1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 282 | BRANCH-A2A-CE2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 283 | BRANCH-A2A-CE3 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 284 | BRANCH-A2A-CE4 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 285 | BRANCH-A2A-CE5 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 286 | BRANCH-A2A-CE6 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 287 | BRANCH-HS-CE1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 288 | BRANCH-HS-CE2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 289 | BRANCH-HS-CE3 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 290 | BRANCH-VPWS-CE2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 291 | CORP-A2A-CE1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 292 | CORP-A2A-CE2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 293 | CORP-A2A-CE3 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 294 | CORP-A2A-CE4 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 295 | CORP-A2A-CE5 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 296 | CORP-A2A-CE6 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 297 | SF-SITE-101-BL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 298 | SF-SITE-101-BL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 299 | SF-SITE-101-RR-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 300 | SF-SITE-102-BL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 301 | SF-SITE-102-BL-2 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 302 | SF-SITE-102-RR-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 303 | SF-SITE-103-BL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
| 304 | SF-SITE-104-BL-1 | BGP | ArBGP is configured and operating | ArBGP | PASS | - |
