pc_01

pc_02:
ip a d 10.222.223.12/24 dev eth1
ip a a 10.222.222.12/24 dev eth1

switch:
ip link set eth1 promisc on
ip link set eth2 promisc on
brctl addbr switch
brctl addif switch eth1
brctl addif switch eth2
ifconfig switch up


#!/bin/sh

NUM=`echo $HOSTNAME | grep -E -o '[1-9]'`

IPADDR=`ifconfig eth1 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`

NEW_IPADDR='10.222.222.1'$NUM

ip a d $IPADDR dev eth1
ip a a $NEW_IPADDR dev eth1
