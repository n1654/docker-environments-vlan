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
