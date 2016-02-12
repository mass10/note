##現在の設定を表示する

iptables では “現在のチェインを表示する” と言うっぽい。

リスト

    # iptables --list

チェインの番号を表示

    # iptables --list --line-numbers

アドレスを数値化／サービスを数値化／パケット数を表示／バイト数を表示

    # iptables --list -nvx --line-numbers

##ポートを開く

8080番への着信を許可する。iptables では “チェイン INPUT に新しいルールを追加する” と言う。

--list --line-numbers で挿入(したい)位置を確認してから

    # iptables --insert INPUT 挿入位置 --protocol tcp --destination-port 8080 --jump ACCEPT

※単純に --append だと REJECT よりも後ろに追加されてしまい、全く意味の無いルールができる。また、restart すると累積パケット数やバイト数がクリアされてしまう。

永続化

    # service iptables save

##開けたポートを閉じる

iptables では “チェイン INPUT のルールを削除する” と言う。

INPUT Chain の13番を削除

    # iptables --delete INPUT 13

永続化

    # service iptables save

##ブロックされたリクエストを知る

ロギングすることでブロックを検出できる

まず現在のチェインを確認して

    # iptables --list -nvx --line-numbers

INPUT Chain の REJECT の直前にルールを挿入

    # iptables --insert INPUT 位置 --protocol tcp --jump LOG --log-prefix "[iptables blocked]: "
    
永続化

    # service iptables save

ログ `/var/log/messages` をみる








##通信トラフィックを知る

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
