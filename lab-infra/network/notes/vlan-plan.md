# VLAN / IP Plan

| VLAN | Name          | Gateway           | Notes                     |
|-----:|---------------|-------------------|---------------------------|
| 99   | Management    | 192.168.99.1/24   | iDRAC, Proxmox mgmt       |
| 10   | Servers       | 192.168.10.1/24   | DCs, infra services       |
| 20   | Workstations  | 192.168.20.1/24   | Admin/test clients        |
| 30   | SIEM          | 192.168.30.1/24   | Wazuh/Elastic (30.5 etc)  |
| 40   | Guest         | 192.168.40.1/24   | Internet only             |
| 50   | IoT/Honeypots | 192.168.50.1/24   | PBR/inspect, SPAN         |
| 60   | Voice         | 192.168.60.1/24   | QoS/DSCP EF               |
