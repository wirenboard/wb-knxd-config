PREFIX=/usr
dummy:
	echo

install:
	install -Dm0644 wb-knxd-config.conf -t $(DESTDIR)/etc
	install -Dm0755 wb-knxd-config.sh -t $(DESTDIR)$(PREFIX)/lib/wb-knxd-config
	install -Dm0644 wb-knxd-config.schema.json -t $(DESTDIR)$(PREFIX)/share/wb-mqtt-confed/schemas
	install -Dm0644 wb-knxd-config.wbconfigs $(DESTDIR)/etc/wb-configs.d/04wb-knxd-config

.PHONY: dummy install
