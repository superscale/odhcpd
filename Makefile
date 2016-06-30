SOURCES=\
		src/config.c\
		src/dhcpv4.c\
		src/dhcpv6-ia.c\
		src/dhcpv6.c\
		src/ndp.c\
		src/odhcpd.c\
		src/router.c\
		src/ubus.c

OBJECTS := $(patsubst %.c,%.o,$(SOURCES))
odhcpd: $(OBJECTS)
	$(CC) $^ -o $@ -lubus -lubox -luci
