##はじめに

BIND をインストールし、単純な“フォワーディングサーバー”としてセットアップします。社内の検証環境用などのために単純な DNS を立てることを目的とした手順です。企業内 DNS などは想定していません。

##環境

- CentOS 6.5
- BIND 9.8.2rc1

##インストール

※bind をインストールすると bind-libs, portreserve が自動的にインストールされます。  
※bind-utils は nslookup や dig などのコマンドを含んでいます。  

    # yum install bind
    # yum install bind-utils

BIND を起動します。

    # service named start

特に理由が無ければ自動起動にしておきます。

    # chkconfig named on




##準備


tcp:53, udp:53, tcp:953 を開けるために状況を確認します。INPUT Chain の順序(=画面上の num 列)に着目してください。

    # iptables --list -nvx --line-numbers

位置を明示して INPUT Chain にルールを挿入します。REJECT よりも手前(=上位)に挿入しなければなりません。

    # iptables --insert INPUT 挿入位置 --protocol tcp --destination-port 53 --jump ACCEPT
    # iptables --insert INPUT 挿入位置 --protocol udp --destination-port 53 --jump ACCEPT
    # iptables --insert INPUT 挿入位置 --protocol tdp --destination-port 953 --jump ACCEPT

永続化します。

    # service iptables save

SELinux の設定

※SELinux を無効にしている場合は必要ありません。

    # setsebool -P named_write_master_zones 1








##単純なフォワーディングサーバーとして BIND をセットアップする

リッスンするインターフェイスを追加します。デフォルトでは 127.0.0.1 のみとなっているため他のコンピューターから接続することはできません。

```
options {

    listen-on port 53 {
        127.0.0.1;
        192.168.xxx.xxx;
    };

    ...

};
```



接続を許可するクライアントアドレスやセグメントを設定します。

※いくつかのアドレスを“ACL”というグループにまとめて表記する方法もありますが割愛します。

```
options {

    ...

    allow-query {
        localhost;
        192.168.xxx.5;
        192.168.yyy.0/24;
    };

    ...
};
```

named.conf の設定をテストします。

    # named-checkconf -z

起動していない場合は起動します。

    # service named start

既に起動している場合は named に再読み込みを指示するだけです。

    # service named reload









##レコードの追加

※作成中

[/etc/named.conf] を編集します。
```
zone "example.jp" IN {
    type master;
    file "/etc/named/example.jp.zone";
};
```

[/etc/named/example.jp.zone] を編集します。無ければ作成します。

```
;
; Time To Live (in seconds. 3600=1h)
;
$TTL 3600

;
; SOA(Start Of Authority)
;
@ 3600 IN SOA bind1.example.jp. root@bind1.example.jp. (
    2014061013        ; Serial
    3600              ; Refresh
    900               ; Retry
    3600000           ; Expire
    3600              ; Minimum
);

;
; [NS]
; ※左端は空白で始まることに注意。つめてはならない。
 IN NS bind1.example.jp.

;
; [A]
;
bind1 3600 IN A  192.168.xxx.xxx
```



##確認

named が起動していることを確認します。

    # ps aux | grep named

意図したインターフェイスで named がポートを開いていることを確認します。

    # netstat -ntlp

netfilter がポートをブロックしていないことを確認します。

    # iptables --list -nvx --line-numbers

他のコンピューターから telnet してみます。

    $ telnet {bind サーバー} 53

他のコンピューター上から実際に問い合わせてみます。{bind サーバー} の /var/log/messages にログが出ていれば接続には成功しています。

    $ nslookup www.example.com {bind サーバー}






