#!/bin/bash
service knxd stop
rm -f /lib/systemd/system/knxd.socket
cp -f /usr/lib/wb-knxd-config/knxd.service /lib/systemd/system/knxd.service
systemctl daemon-reload && service knxd start
