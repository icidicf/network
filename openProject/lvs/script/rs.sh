#!/bin/sh

VIP=192.168.23.140

BROADCAST=192.168.23.255 #vip's broadcast



Usage ()

{

    echo "Usage:`basename $0` (start|stop)"

    exit 1

}



if [ $# -ne 1 ];then

    Usage

fi



case $1 in

    start)

        echo "reparing for Real Server"

        echo "1" >/proc/sys/net/ipv4/conf/lo/arp_ignore

        echo "2" >/proc/sys/net/ipv4/conf/lo/arp_announce

        echo "1" >/proc/sys/net/ipv4/conf/all/arp_ignore

        echo "2" >/proc/sys/net/ipv4/conf/all/arp_announce

        /sbin/ifconfig lo:0 $VIP netmask 255.255.255.255 broadcast $BROADCAST up

        /sbin/route add -host $VIP dev lo:0

        ;;

    stop)

        /sbin/ifconfig lo:0 down

        echo "0" >/proc/sys/net/ipv4/conf/lo/arp_ignore

        echo "0" >/proc/sys/net/ipv4/conf/lo/arp_announce

        echo "0" >/proc/sys/net/ipv4/conf/all/arp_ignore

        echo "0" >/proc/sys/net/ipv4/conf/all/arp_announce

        echo "stop Real Server"

        ;;

    *)

        Usage

esac
