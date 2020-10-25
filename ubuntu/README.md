# Ubuntu 18.04 LTS (Desktop) で sshd (2018-06-09)

```
apt install openssh-server
```

すぐに LISTEN が始まる。

# vmware-install.pl on Ubuntu 18.04 LTS (Desktop) (2018-05-05)

VMware の vmware-tools を入れようとすると、`open-vm-tools` をおすすめされたので

```
sudo apt install open-vm-tools
```

# Ubuntu 18.04 LTS (Server) で静的IPアドレス (2018-05-04)

`/etc/netplan/50-cloud-init.yaml` を編集して

```
network:
    ethernets:
        ens33:
            addresses: ["192.168.187.129/24"]
            gateway4: "192.168.187.2"
            dhcp4: false
            optional: true
            nameservers:
                addresses: ["192.168.187.2"]
    version: 2
```

※ `sudo netplan apply` で即時反映可能だが、既に様々なシステムが稼働していれば `reboot`。

# Ubuntu 18.04 LTS (Server) で静的IPアドレス (2018-12-31)

GUI で設定すると、`/etc/NetworkManager/system-connections/` というところに設定ファイルができる。 `/etc/netplan/50-cloud-init.yaml` というファイルはできない。

# Ubuntu 18.04 LTS (Server) で日本語キーボード配列にならない

※VMware のコンソールのはなし。

# Ubuntu 14.04 LTS で静的IPアドレス

- Ubuntu 14.04 LTS (仮想マシン on Windows)

```
# cat /etc/network/interfaces
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address 192.168.141.157
netmask 255.255.255.0
gateway 192.168.141.2
dns-nameservers 192.168.141.2
```

再起動

```
# reboot 
```

- `systemctl restart networking.service` でもよいが中途半端な状態になるので、reboot の方がベター。


















# サービス関連操作

- 系統がいくつかあるっぽいけど意味わからん...

```
# ~initctl list~
```

現在の状態を表示

```
# systemctl -t service
```

現在の状態を単純に表示

```
# service --status-all
```

自動起動の状態

```
# systemctl -t service list-unit-files
# systemctl -t service list-unit-files apache2.service
```

サービスを止める

```
sudo service nginx stop
```

サービスを起動する

```
sudo service nginx start
```

自動起動 OFF

```
sydo systemctl disable nginx
```

自動起動 ON

```
# update-rc.d docker.io defaults
```
or

```
# systemctl enable nginx
```





















# タイムゾーンを変更する

```
$ sudo dpkg-reconfigure tzdata
```


















# locale を日本語環境にするには ######################

```
# update-locale LANG=ja_JP.UTF-8
```












# update-locale LANG=ja_JP.UTF-8 がエラー(*** update-locale: Error: invalid locale settings:  LANG=ja_JP.UTF-8)を吐くときは ######################

```
# apt-get install language-pack-ja
```

してから

```
# update-locale LANG=ja_JP.UTF-8
```





# locale が ja_JP.UTF-8 になっているのに man の内容が日本語化されない時は ######################

```
# apt-get install manpages-ja
```



# Apache をインストールする ######################

```
$ sudo apt-get install apache2
```

# PHP をインストールする ######################

```
$ sudo apt-get install libapache2-mod-php
$ sudo service apache2 restart
```

# Installing mod_wsgi on Ubuntu 16.04 LTS ######################

```
$ sudo apt install libapache2-mod-wsgi-py3
$ sudo service apache2 restart
```

# HTTPS を有効にする ######################

```
$ sudo a2enmod ssl
$ sudo a2ensite default-ssl
$ sudo service apache2 restart
```

# rewrite を有効にする ######################

```
$ sudo a2enmod rewrite
$ sudo service apache2 restart
```

# apt ######################

パッケージを検索する

```
$ sudo apt search openjdk
```

# dpkg ######################

* インストール済みパッケージを表示する

```
dpkg --list
```

# Installing SNMP Daemon

```
$ sudo apt-get install snmpd
```

# sudo with no password on Ubuntu 16.04 LTS

- append `ubuntu ALL=(ALL:ALL) NOPASSWD: ALL` to a new file `/etc/sudoers.d/ubuntu`.


# dpkg install (Ubuntu 16.04.4)

```
sudo dpkg --install elasticsearch-6.2.2.deb
```

# openjdk on ubuntu 18 LTS (2018-10-07)

```
apt search openjdk
sudo apt install openjdk-8-jdk
```

# Ubuntu Desktop の日本語入力 (18.04 LTS Desktop)

入力方式を選択するあたりで「日本語(かな)」を選んでおくと特に問題なかった。



# ファイルをインストールしたパッケージを知る

```shell
apt-file search /usr/games/sl
```

# locale: Cannot set LC_CTYPE to default locale: No such file or directory

```
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
```

```bash
localedef --list
```

> en_US.utf8

```bash
sudo locale-gen ja_JP.UTF-8
```

```bash
localedef --list
```

> en_US.utf8
> ja_JP.utf8
