#!/bin/sh
# ExecCondition= of knxd.service, see knxd.service.d/wb-knxd-config.conf.
#
# KNXD_DEVICE is the serial KNX interface from the Layer2 driver option
# (e.g. /dev/ttyKNX for ncn5120:/dev/ttyKNX). wb-knxd-config.sh writes it to
# /etc/knxd.conf next to KNXD_OPTS.
#
# Exit 1 if the device does not exist: systemd then skips starting knxd
# without marking it as failed, so Restart=on-failure does not loop.

if [ -n "$KNXD_DEVICE" ] && [ ! -e "$KNXD_DEVICE" ]; then
	echo "$KNXD_DEVICE not found, not starting knxd" >&2
	exit 1
fi
