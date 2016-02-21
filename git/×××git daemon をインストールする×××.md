##はじめに

自分用 Git サーバーを構築した時のメモ

2014-07-08 追記: このまま運用すると超遅いことがわかってきた。どうも clone するときに `ssh://username@a.b.c.d/var/lib/public/xxx.git` すると劇的に高速になる(というかこれが本来の利用方法？)ようだ。ただし、毎回パスワードを尋ねられる...。これを回避するには公開鍵認証をセットアップすることになりそうだ... → 公開鍵のくだりと clone 手順を追記した。  
2014-07-09 追記: ssh://user@server/full/path/to/repo.git で clone して公開鍵でやりとりする場合、git-daemon は必要ないことがわかった... なんだこれ...  
2014-07-13 追記: git プロトコル(git://)でリモート接続するとすごく遅い。ローカルでは高速。何か不要な処理をしている雰囲気。  
2014-12-01 追記: サーバーをインストールする方法を断念。このドキュメントはメモとして残すが一旦無効とする。中央リポジトリを `git init --bare` で作成、authorized_keys に追加して ssh 経由で使うところで落ち着いている。

##環境

- CentOS 6.5

##準備

####ユーザー

ユーザーを作成
```
# useradd git
```

####SELinux

SELinux を permissive に
```
# setenforce 0
# vi /etc/selinux/config

SELINUX=permissive
```

####iptables

位置を確認してから
```
# iptables -nvx --line-numbers
```

ポートを解放  

※2014-07-08 追記 ssh:// で通信する場合には必要ない...

```
# iptables --insert INPUT {position to insert} --protocol tcp --destination-port 9418 --jump ACCEPT
# service iptables save
```



##インストール

インストール
```
# yum install git-daemon git
```

リポジトリのホームを初期化
```
# mkdir /var/lib/git/public
# chown -R git:git /var/lib/git
```

git サービスを有効にする

```
# vi /etc/xinetd.d/git

service git
{
    disable = no
    socket_type = stream
    wait = no
    user = git
    server = /usr/libexec/git-core/git-daemon
    server_args = --base-path=/var/lib/git --export-all --user-path=public --syslog --inetd --verbose --enable=receive-pack
    log_on_failure += USERID
}
```

デーモンを起動
```
# service xinetd start
```





##リポジトリを公開する

テストリポジトリを公開用に初期化する
```
# sudo -u git mkdir /var/lib/git/public/test.git
# cd /var/lib/git/public/test.git
# sudo -u git git --bare init --shared
```


##clone する

(2014-07-08: このセクションを作成)

Windows 側で ssh-keygen(GitHub についてきた Power Shell を使用した)
```
>ssh-keygen
```

C:/Users/xxxxxx/.ssh/id_rsa.pub が作成されるのでその中身をコピーして git-daemon サーバーの /home/git/.ssh/authorized_keys に追記

パーミッションを変更
```
# sudo -u git mkdir /home/git/.ssh
# sudo -u git vi /home/git/.ssh/authorized_keys
# chmod 600 /home/git/.ssh/authorized_keys
```

Windows 側で clone する際は
```
>git clone ssh://git@192.168.40.133:/var/lib/git/public/test.git
```

「ssh 接続で、パスワードを毎回訊かれない」設定が完了するはず  
  
Windows 側から pull/push などをすると git サーバー側でログが出る
```
# tailf /var/log/secure
Jul  8 22:51:26 gsv sshd[1448]: Accepted publickey for git from 192.168.141.1 port 58666 ssh2
Jul  8 22:51:26 gsv sshd[1448]: pam_unix(sshd:session): session opened for user git by (uid=0)
Jul  8 22:51:26 gsv sshd[1448]: pam_unix(sshd:session): session closed for user git
```



##その他

- /var/log/messages に出るログが意外に役立ちました。
- SELinux に注意。
- iptables に注意。
- デフォルトの nobody にしておけば git ユーザーは必要ないかも。しかし、物事をわかりやすくしておくためには git ユーザーの方がよいのかも。
- 2014-07-08: git://x.x.x.x で clone すると超遅い。推測だがいろいろな認証方法を試しているのではなかろうか。
