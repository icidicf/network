#!/bin/bash


#http://openresty.org/
#http://webpy.org/cookbook/fastcgi-nginx.zh-cn

#sudo pip install flux
#try to run index.py to ensure everything is ok
#9003 can not be visited , need visted by nginx

spawn-fcgi -d ./ -f  ./index.py -a 127.0.0.1 -p 9003
nginx -p ./ -c conf/nginx.conf


