# Switchport Role Map

## CORE-3850E
- Gi1/0/24: Routed /30 to ISR4331 (10.0.0.2/30)
- Gi1/0/23: SPAN Destination (sensor)
- Gi1/0/1 : Trunk to 2960X (10,20,30,40,50,60,99)
- Gi1/0/2 : Trunk to 2960S (30,50,99)
- Gi1/0/11–18: Access VLAN 99 (mgmt/iDRAC)

## ACCESS-2960X
- Gi1/0/24: Trunk to CORE-3850E
- Gi1/0/10: Lenovo Admin (Access VLAN 99)
- Gi1/0/9 : AP Trunk (native 99; allowed 20,40,50,60,99)
- Gi1/0/7 : Phone+PC (Access 20, Voice 60)

## ACCESS-2960S (Honeypots/IoT)
- Gi1/0/24: Trunk to CORE-3850E (30,50,99)
- Remaining: Access VLAN 50 unless otherwise noted
