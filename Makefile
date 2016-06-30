SOURCES=\
		src/config.c\
		src/dhcpv4.c\
		src/odhcpd.c\
		src/ubus.c

CFLAGS+=-DWITH_UBUS

OBJECTS := $(patsubst %.c,%.o,$(SOURCES))
odhcpd: $(OBJECTS)
	$(CC) $^ -o $@ -lubus -lubox -luci

clean:
	rm -f $(OBJECTS) odhcpd

run:
	ssh 16.shakuras.lifeline killall odhcpd || true
	make -j4
	sleep 1.5
	mips-openwrt-linux-strip odhcpd
	scp odhcpd 16.shakuras.lifeline:/tmp/odhcpd
	sleep 2
	ssh 16.shakuras.lifeline /tmp/odhcpd


