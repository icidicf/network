#!/bin/bash

sudo ipvsadm -C
ipvsadm -A -t 192.168.23.140:80 -s rr
ipvsadm -a -t 192.168.23.140:80 -r 192.168.100.139:80 -g
ipvsadm -a -t 192.168.23.140:80 -r 192.168.100.131:80 -g

