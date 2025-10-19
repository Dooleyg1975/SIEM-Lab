# SIEM-Lab

Enterprise-style homelab with Cisco core/edge (ISR4331 + 3850-E), segmented VLANs, Proxmox, and SOC tooling (Wazuh/Elastic).  
**Status:** Rebuild v1 – structured docs, versioned configs, printable labels.

## Architecture Summary
- **Edge/WAN:** Cisco ISR4331 (NAT, default route, optional ZBFW), /30 routed link to core
- **Core L3:** Cisco 3850-E (SVIs for VLANs 10/20/30/40/50/60/99, NetFlow, SPAN)
- **Access:** 2960X (PoE/AP/Phones) and 2960-S (IoT/Honeypots)
- **Security Sidecar:** pfSense (IDS/VPN/PBR experiments)
- **Compute:** Proxmox nodes; SIEM on VLAN30

## VLAN / IP Plan
| VLAN | Name          | Gateway         | Notes                          |
|----: |---------------|-----------------|--------------------------------|
| 99   | Management    | 192.168.99.1/24 | iDRAC, Proxmox, admin devices  |
| 10   | Servers       | 192.168.10.1/24 | DCs/infra                      |
| 20   | Workstations  | 192.168.20.1/24 | Admin/test clients             |
| 30   | SIEM          | 192.168.30.1/24 | Wazuh/Elastic                  |
| 40   | Guest         | 192.168.40.1/24 | Internet-only                  |
| 50   | IoT/Honeypots | 192.168.50.1/24 | PBR/inspect; SPAN source       |
| 60   | Voice         | 192.168.60.1/24 | QoS/DSCP EF                    |

## Repo Layout


### Key Docs
- **Switchport Map:** `lab-infra/network/notes/switchport-role-map.md`
- **Airflow & Pads:** `lab-infra/network/notes/physical-layout-and-airflow.md`
- **Brady Labels:** `lab-infra/network/labels/*.csv`

### Config Entry Points
- Core: `lab-infra/network/configs/CORE-3850E-running-config.txt`
- Edge: `lab-infra/network/configs/EDGE-ISR4331-running-config.txt`
- Access: `lab-infra/network/configs/ACCESS-2960X-config.txt`, `ACCESS-2960S-config.txt`
- pfSense: `lab-infra/network/configs/pfSense-interface-map.md`

## Change Control (see `CHANGELOG.md`)
- v1.0.0 – repo skeleton
- v1.0.1 – placeholders
- v1.0.2 – notes/labels
- v1.0.4 – airflow + final labels
