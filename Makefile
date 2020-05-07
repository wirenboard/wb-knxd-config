DESTDIR=/
dummy:
	echo


install:
	install -D -m 0644  wb-knxd-config.conf $(DESTDIR)/etc/wb-knxd-config.conf
	install -D -m 0755  knxd.service $(DESTDIR)/usr/lib/wb-knxd-config/knxd.service
	install -D -m 0755  knxd-patch.sh $(DESTDIR)/usr/lib/wb-knxd-config/knxd-patch.sh
	install -D -m 0755  wb-knxd-config.sh $(DESTDIR)/usr/lib/wb-knxd-config/wb-knxd-config.sh
	install -D -m 0755  wb-knxd-config.service $(DESTDIR)/etc/systemd/system/wb-knxd-config.service
	install -D -m 0644  wb-knxd-config.schema.json $(DESTDIR)/usr/share/wb-mqtt-confed/schemas/wb-knxd-config.schema.json
	
.PHONY: dummy install
