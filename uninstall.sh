#!/bin/bash -e
chef-server-ctl stop || chef-server-ctl kill

killall -9 -u opscode
killall -9 runsvdir
killall -9 rabbitmq
killall -9 nginx

chef-server-ctl uninstall

dpkg -P opscode-push-jobs-server
dpkg -P chef-manage
dpkg -P chef-server-core

rm -v -rf /etc/che* /etc/opscod* /opt/chef-manage /opt/opscod* /var/opt/*
