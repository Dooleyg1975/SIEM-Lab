# Asset: PSIM-HOST01 (Dell PowerEdge R630)

**Role:** Physical Security & SIEM Processing Node  
**Service Tag:** 4Q0BC42  
**Location:** LAB-RACK-01 (U4)  
**Hypervisor:** Proxmox VE 8.x (boot via 80GB SSD)

---

## CPU / Memory
- **2 × Intel Xeon E5-2695 v4 (36 cores / 72 threads total)**
- **512GB ECC RAM Installed** *(upgraded from 384GB as goodwill bonus noted for lab history)*

---

## Storage Plan (ZFS — No Hardware RAID)
| Pool | Device Type | Purpose |
|------|------------|--------|
| `zroot` | 80GB SSD (mirror optional) | Proxmox boot / mgmt |
| `zfast` | 960GB SSD (planned) | Hot tier – Frigate, Wazuh Index hot |
| `zbulk` | 7.2TB RAID10 SAS pool | CCTV ingest, SIEM warm data |
| `zevidence` | Dataset on zbulk or mirror pair | Evidence vault with snapshot & send/recv |

---

## Network VLAN Roles
| VLAN | Purpose | Example IP Range | Notes |
|------|--------|-----------------|------|
| **VLAN30** | Management (Proxmox + iDRAC) | `10.30.0.x` | Restricted access only |
| **VLAN80** | CCTV Cameras / Frigate / MQTT | `192.168.80.x` | WAN blocked, local event only |

---

## Services Assigned to This Node
- **Frigate AI Container (GPU Passthrough)** – RTSP ingest + Person Detection
- **Mosquitto MQTT Broker** – `/cctv/<camera>/person_detected`
- **Wazuh Agent** – Sends event logs to SIEM Manager
- **Evidence Share** – `/mnt/evidence/<CAM-ID>/<DATE>/`
- *(Future)* ZFS send-based replication to SIEM-HOST02 for chain-of-custody

---

## Physical Labeling (Brady Printer Ready)
| Component | Label |
|----------|------|
| Chassis Front | `PSIM-HOST01 | CCTV/SIEM NODE | VLAN30+80` |
| Drive Bays | `BAY0-1: zroot`, `BAY2-5: zbulk RAID10`, `BAY6-7: zevidence` |
| Switch Port | `TRUNK-PVE-PSIM-01` |
| iDRAC Port | `MGMT-PSIM-HOST01` |

---

## Operational Notes / SOP
- **Incident Export:** Copy clip to `/mnt/evidence/<case-id>/`, run `zfs snapshot`, replicate via `zfs send` to backup node.
- **Monthly Maintenance:** `zpool scrub` + SMART long tests.
- **Snapshots:** Hourly (24), Daily (7), Weekly (4 retention policy).

---

_This file is part of the SOC-Grade Documentation Set. All configurations are tracked under `/infrastructure/` in Git._

---

### GIT COMMIT INSTRUCTIONS (Run after saving)
