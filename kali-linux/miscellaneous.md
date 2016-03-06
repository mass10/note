##static ip address

```
vim /etc/network/interfaces
```

for example.

```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

auto eth0
allow-hotplug eth0
iface eth0 inet static
address 192.168.141.153
mask 255.255.255.0
gateway 192.168.141.2
```

