##はじめに

CentOS 7 でポートを開ける作業の記録。

2014-08-25 作成

##環境

- CentOS 7

##状況を見る

```
# firewall-cmd --list-all
public (default)
  interfaces:
  sources:
  services: dhcpv6-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

```


```
# firewall-cmd --list-all-zones
block
  interfaces:
  sources:
  services:
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

dmz
  interfaces:
  sources:
  services: ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

drop
  interfaces:
  sources:
  services:
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

external
  interfaces:
  sources:
  services: ssh
  ports:
  masquerade: yes
  forward-ports:
  icmp-blocks:
  rich rules:

home
  interfaces:
  sources:
  services: dhcpv6-client ipp-client mdns samba-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

internal
  interfaces:
  sources:
  services: dhcpv6-client ipp-client mdns samba-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

public (default)
  interfaces:
  sources:
  services: dhcpv6-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

trusted
  interfaces:
  sources:
  services:
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

work
  interfaces:
  sources:
  services: dhcpv6-client ipp-client ssh
  ports:
  masquerade: no
  forward-ports:
  icmp-blocks:
  rich rules:

```

##ファイアウォールを止める

```
# systemctl stop firewalld
# firewall-cmd --list-all
FirewallD is not running
```

##ファイアウォールを無効にする

```
# systemctl disable firewalld
```

##ポートを開ける

- CentOS 7 では iptables コマンドを使わない
- `--permanent` を付加することにより永続化されるようだ。
- zone という概念があるが、既定では public。さしあたってはこの zone のポートを開けることを考える。

例えば http を開けるには

```
firewall-cmd --zone=public --add-service=http --permanent
```

例えば Samba を開けるには

```
firewall-cmd --zone=public --add-port=139/tcp --permanent
firewall-cmd --zone=public --add-port=445/tcp --permanent
```

##通信トラフィックを知る

これまでと同様に

```
# iptables --list -nvx
```

ただし、outgoing の計測方法については調査中...
