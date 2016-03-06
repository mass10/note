##updating system.

```
# apt-get update
```

##show services.

```
# systemctl -t service
```

##show status of service.

```
# systemctl is-enabled ssh
```

##show status of services.

```
# sysv-rc-conf --list
```

##enabling or disabling services.

```
# sysv-rc-conf
```

```

l SysV Runlevel Config   -: stop service  =/+: start service  h: help  q: quit qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
x                                                                                                                         x
x service      1       2       3       4       5       0       6       S                                                  x
x ----------------------------------------------------------------------------                                            x
x anacron     [ ]     [X]     [X]     [X]     [X]     [ ]     [ ]     [ ]                                                 x
x apache2     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]                                                 x
x arpwatch    [ ]     [X]     [X]     [X]     [X]     [ ]     [ ]     [ ]                                                 x
x atftpd      [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]                                                 x
x avahi-dae$  [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]                                                 x
x beef-xss    [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]                                                 x
x binfmt-su$  [ ]     [X]     [X]     [X]     [X]     [ ]     [ ]     [ ]                                                 x
x bluetooth   [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]     [ ]                                                 x
x bootlogs    [X]     [X]     [X]     [X]     [X]     [ ]     [ ]     [ ]                                                 x
x                                                                                                                         x
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj
lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
x Use the arrow keys or mouse to move around.      ^n: next pg     ^p: prev pg                                            x
x                        space: toggle service on / off                                                                   x
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj
```







##enabling service.

```
# systemctl enable ssh
```

##setting static ip address.

```
# vim /etc/network/interfaces
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

