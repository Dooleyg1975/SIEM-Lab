# pfSense Interface Map

| Interface | Role            | VLANs/Tags          | IP/CIDR          | Gateway         | Notes                         |
|----------:|------------------|---------------------|------------------|-----------------|-------------------------------|
| WAN       | Upstream test    | —                   | dhcp/static      | ISP             | Lab Internet                   |
| LAN       | Transit to Core  | — or VLAN trunk     | 10.10.10.2/30    | 10.10.10.1      | /30 to CORE for PBR tests      |
| OPT1      | IoT Inspect In   | VLAN 50 (tagged)    | 192.168.50.2/24  | 192.168.50.1    | Suricata inline/IDS            |
| OPT2      | VPN / Captive    | VLAN 40/guest       | 192.168.40.2/24  | 192.168.40.1    | Optional services              |

**Static Routes (if PBR path):**
- `0.0.0.0/0` via WAN
- `192.168.10.0/24` via 10.10.10.1 (core)
- `192.168.99.0/24` via 10.10.10.1
