# VLAN management LAB

## Purpose
The main purpose of this LAB is to show how MSActivator can manage VLAN configuration.
Achieved level of abstraction allows human controlling l2-switch as a typical swich despite the fact that this switch is a pure linux machine.

             +-------+        +-------+        +-------+        +-------+
             |       |        |       |        |       |        |       |
             | pc_01 |        | pc_02 |        | pc_03 |        | pc_04 |
             |       |        |       |        |       |        |       |
             +-------+        +-------+        +-------+        +-------+
           +vlandefault+    +vlandefault+    +-vlan 100--+    +-vlan 200--+
           +-untagged--+    +-untagged--+    +-untagged--+    +---tagged--+
                 |                |                |                |
                 |                |                |                |
     +--------------------------------------------------------------------------+
     |        |eth0 |          |eth1 |          |eth2 |          |eth3 |        |
     |        +-----+          +-----+          +-----+          +-----+        |
     |                                                                          |
     +--------------------------------------------------------------------------+

## Diagram

    +------------------------+                       +------------------------+
    | pc_01  172.20.0.141/24 |                       | pc_02  172.20.0.142/24 |
    |                        |                       |                        |
    +-----------+------------+                       +------------+-----------+
                |                                                 |
       default vlan untagged                            default vlan untagged
                |                                                 |
                |            +-----------------------+            |
                |            |switch 172.20.0.145/24 |            |
                +------------+     +-----------+     +------------+
                             |     | VLAN:     |     |
                             |     | default   |     |
                             |     | vlan_100  |     |
                +------------+     | vlan_200  |     +------------+
                |            |     +-----------+     |            |
                |            +-----------------------+            |
        vlan 100 untagged                                 vlan 200 tagged
                |                                                 |
                |                                                 |
    +-----------+------------+                       +------------+-----------+
    |                        |                       |                        |
    | pc_03  172.20.0.143/24 |                       | pc_04  172.20.0.144/24 |
    +------------------------+                       +------------------------+

## Scenario
0. Default state:
 - pc_01, pc_02 - can ping each other, placed in default_vlan
 - pc_03 is not reachable, placed in 100 vlan
 - pc_03 is not reachable, placed in 200 vlan, encapsulates frames with 200 802.1q tag.

1. Set pc_01 in vlan 100 and ping pc_03

2. Set pc_01 in vlan 200(untagged) and ping pc_04
 - ensure with TCP dump packets are encapsulated/de-encapsulated properly

3. Set pc_01 in vlan 200(tagged) and ping pc04
 - note: pc_01 should have tagging enabled
