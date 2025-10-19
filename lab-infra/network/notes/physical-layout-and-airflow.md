# Physical Layout, Pads, and Airflow (Desk Build)

## Stack Order (Top → Bottom)
1. pfSense appliance (light)
2. 2960X (PoE / APs / Phones)
3. 2960-S (IoT / Honeypots)
4. ISR4331 (WAN edge)
5. **3850-E (Core L3)**
6. Servers (R730xd / etc.)

## Pad Sizes & Placement
- pfSense: 4 × 0.31" pads (corners)
- 2960X / 2960S: 4 × 0.31" pads (offset ~1 cm from edges for side airflow channel)
- ISR4331: 4 × 0.31" pads (shift rear pads slightly inward to lift rear for convection)
- **3850-E**: **8 pads** (stack 2 per corner → ~0.62" lift) to help side exhaust
- Servers: heavy-duty square pads (existing)

## Target Vertical Gaps
- pfSense → 2960X: **0.5"**
- 2960X → 2960S: **1"**
- 2960S → ISR4331: **1.5"**
- ISR4331 → **3850-E**: **2"** (mandatory for side exhaust)
- 3850-E → Servers: **2–2.5"**

## Airflow Directions
- 2960S/2960X/3850-E: **side intake/exhaust** → keep side channels clear
- ISR4331 / Servers: **front in → rear out** → keep rear cable slack off exhaust

## Cable Management
- Power left, data right (or vice-versa) — keep separation.
- Velcro ties only (no hard zip-ties on live bundles).
- Label both ends with **Brady M211** using repo CSVs.

## Validation Checklist
- 3850-E side vents unobstructed (≥ 20 mm channel).
- ISR4331: ≥ 50 mm rear clearance; no cable bundle blocking fan.
- Touch test after 30 min load: warm is OK; hot to touch = increase gap.
- Noise spike = starving airflow → increase vertical spacing.

