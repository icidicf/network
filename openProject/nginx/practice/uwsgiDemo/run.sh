#!/bin/bash


#http://openresty.org/
#https://uwsgi-docs.readthedocs.org/en/latest/WSGIquickstart.html
nginx -p ./ -c config/nginx.conf

./uwsgi-2.0.11.2/uwsgi --socket 127.0.0.1:10050 --wsgi-file foobar.py --master --processes 4 --threads 2 --stats 127.0.0.1:9198


