# DVD から yum する

#### 環境

- CentOS 6.5

#### はじめに

作成: 2014-07-15

/media/CentOS をリポジトリとするための設定ファイルがはじめから用意されているので、これを利用する。ただ、[他の設定ファイルを削除／コマンドライン引数でいちいち除外] しないと期待する挙動にならない。  
  
ここでは他の設定ファイルを(一次的に)削除する手順を残しておく。

#### 手順

```
# mkdir /media/CentOS
# mount /dev/dvd /media/CentOS
```

/etc/yum.repos.d/CentOS* を tar

```
# cd /etc/yum.repos.d/
# tar cvf xxx.tar Cent*
```

Media 以外を除去

```
# rm CentOS-Ba*
# rm CentOS-De*
# rm CentOS-Va*
```

Media を enabled に変更(vi)

```
enabled=1
```

yum install!
```
# yum install vim
```

tar を元に戻すには
```
# tar xvf xxx.tar
```


# EPEL を有効にする

有用だがまだ正式にリリースされていないパッケージが、一足先に公開される。

#### 環境

- CentOS 6.5

#### 手順

```
# yum install epel-release
```




# iptables (CentOS 6.x)

#### 現在の設定を表示する

iptables では “現在のチェインを表示する” と言うっぽい。

リスト

    # iptables --list

チェインの番号を表示

    # iptables --list --line-numbers

アドレスを数値化／サービスを数値化／パケット数を表示／バイト数を表示

    # iptables --list -nvx --line-numbers

#### ポートを開く

8080番への着信を許可する。iptables では “チェイン INPUT に新しいルールを追加する” と言う。

--list --line-numbers で挿入(したい)位置を確認してから

    # iptables --insert INPUT 挿入位置 --protocol tcp --destination-port 8080 --jump ACCEPT

※単純に --append だと REJECT よりも後ろに追加されてしまい、全く意味の無いルールができる。また、restart すると累積パケット数やバイト数がクリアされてしまう。

永続化

    # service iptables save

#### 開けたポートを閉じる

iptables では “チェイン INPUT のルールを削除する” と言う。

INPUT Chain の13番を削除

    # iptables --delete INPUT 13

永続化

    # service iptables save

#### ブロックされたリクエストを知る

ロギングすることでブロックを検出できる

まず現在のチェインを確認して

    # iptables --list -nvx --line-numbers

INPUT Chain の REJECT の直前にルールを挿入

    # iptables --insert INPUT 位置 --protocol tcp --jump LOG --log-prefix "[iptables blocked]: "
    
永続化

    # service iptables save

ログ `/var/log/messages` をみる








#### 通信トラフィックを知る

**・iptables が起動していなければ出ないことに注意**  
**・INPUT でポートを開けていなければ出ないことに注意** 
**・レスポンスについては OUTPUT のチェインが明示的に追加されていなければ出ないことに注意**

    # iptables --list -nvx

出力イメージ

    2014年  5月 31日 土曜日 11:52:01 JST
    --------------
    Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
        pkts      bytes target     prot opt in     out     source               destination
          50     2592 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
           0        0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
           0        0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:25
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:110
           0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:137
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:139
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:143
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:587
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:993
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:995
           0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:10050
           0        0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited

    Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
        pkts      bytes target     prot opt in     out     source               destination
           0        0 REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited

    Chain OUTPUT (policy ACCEPT 101 packets, 52560 bytes)
        pkts      bytes target     prot opt in     out     source               destination



pkts はパケット数、bytes はバイト数を意味します。 値は iptables が起動してからの累積になります。  
たとえば1時間経過前後でその差を計算すると、1時間あたりの通信量を知ることができます。


80番ポートの出力トラフィックを知るには `--source-port` となることに注意。

```
# iptables --insert OUTPUT 位置 --protocol tcp --source-port 80 --jump ACCEPT
# iptables --list -nvx
```



















# UUID

```
$ uuidgen
d8e06ae2-f4dc-4f4e-aa35-59fbe2fbcc19

$ uuidgen
89a0d2ed-d65f-4a95-a993-4943a716256b

$ uuidgen
0fc6224e-1507-4e7b-b06a-1600fea05459

...
```




# パッケージをインストールせずにダウンロードする (CentOS 6.x)

まず yum を拡張

```
# yum install yum-downloadonly
```

オプションを付けてインストール

```
# yum install --downloadonly PACKAGE_NAME
```

- そのときの環境にもよるっぽいが一旦 `/var/cache/yum/x86_64/6/updates/packages` 付近に落ちるようだ。


# ファイルがどのパッケージなのかを知るには

作成: 2014-06-16  
- CentOS release 6.5(/etc/redhat-release)
- RPM バージョン 4.8.0(rpm --version)  


```
# rpm -qf /usr/bin/uuidgen
util-linux-ng-2.17.2-12.14.el6.x86_64

# rpm -qf /var/www/html
httpd-2.2.15-29.el6.centos.x86_64
```



# その他メモ

#### 環境

- CentOS 6.5

#### インストールしたら

##### インストール時

minimal を入れる。インストール時にネットワーク(eth0)を生かしておくこと以外は特になし。日本語を選択している。

##### .bashrc

    alias l='/bin/ls -lF --full-time --color=auto'
    alias n='/bin/ls -ltrF --full-time --color=auto'
    alias u='cd ..'

##### 時計

最初に必ずやる作業

    # yum install ntp
    # ntpdate 0.centos.pool.ntp.org
    # chkconfig ntpd on

##### wget は入れておくことが多い

    # yum install wget

##### man も入れておくことが多い

    # yum install man

##### nslookup なども入れておくことが多い

    # yum install bind-utils

##### dstat

```
# yum install dstat
```

##### Vim

    # yum install vim

##### .vimrc

自分の .vimrc を転送して ~/ に保管

```
# cd
# wget https://raw.githubusercontent.com/mass10/vim.note/master/vimrc/.vimrc
```

zenburn.vim と molokai.vim を転送して配置

```
# cd /usr/share/vim/vimfiles/colors/
# wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
# wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim
```

##### mlocate

普通の開発機なら mlocate を入れておくことが多い。ただし、極度にファイル数が増減するサーバー、例えばメールサーバーなどでは、負荷を気にしておくこと。

```
# yum install mlocate
# updatedb
```




##### Samba

社内のちょこっとサーバーでは、Samba は必ずと言っていいほど入れる

```
# yum install samba
```

##### SELinux

```
# vim /etc/selinux/config
```

`SELinux=permissive` に変更する


## IPアドレスを追加する(一時的、揮発性)

```
# ip address add 192.168.141.180/24 dev eth0
# ip address
```







# yum behind proxy

```
# vi /etc/yum.conf
```

```
proxy=http://proxy-host-name:80
```

# CentOS 7 をシャットダウン

halt はこうなります。

```
# systemctl poweroff
```

もしくは単純に

```
# poweroff
```

# CentOS 7 でサービスの一覧

```
# systemctl list-unit-files
# systemctl -t service
```

# CentOS 7 のサービスを on にする

```
# systemctl enable mariadb
```
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
Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
Removed symlink /etc/systemd/system/basic.target.wants/firewalld.service.
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
