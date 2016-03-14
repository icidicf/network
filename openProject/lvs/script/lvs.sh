#!/bin/sh

TIMEOUT=30
# set the vip and port
VIP=192.168.23.140
VPORT1=80

# set the rip and port
# web
slave1=192.168.23.139
slave2=192.168.23.141
# port
RPORT1=80


Usage ()
{
    echo "Usage:`basename $0` (start|stop|status) "
    exit 1
}

if [ $# -ne 1 ];then
    Usage
fi

case $1 in
    start)
        echo "start LVS of DirectorServer"
        echo 1 > /proc/sys/net/ipv4/ip_forward
        # set the vip
        /sbin/ifconfig eth0:1 $VIP broadcast $VIP netmask 255.255.255.255 up
        /sbin/route add -host $VIP dev eth0:1
        # clear ipvs table
        /sbin/ipvsadm -C
        # add lvs vip and port
        /sbin/ipvsadm -A -t $VIP:$VPORT1 -s rr
        # add rip and port
        /sbin/ipvsadm -a -t $VIP:$VPORT1 -r $slave1:$RPORT1 -g -w 1
        /sbin/ipvsadm -a -t $VIP:$VPORT1 -r $slave2:$RPORT1 -g -w 1

        /sbin/ipvsadm -L -n
        ;;
    stop)
        echo "close LVS DirectorServer"
        /sbin/ipvsadm -C
        /sbin/ifconfig eth0:1 down
        ;;
    status)
        /sbin/ipvsadm -L -n
        ;;
    *)
        Usage
esac
