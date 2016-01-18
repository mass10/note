##設定

MTA を宣言する

```
# vi /usr/lib/mailman/Mailman/mm_cfg.py
```

次の行を終端に追記

> MTA = 'Postfix'

aliases を作成。この操作には8秒くらいかかる。

```
# /usr/lib/mailman/bin/genaliases
```

何が起きたか確認。ドキュメントでは $prefix/data/ のような位置で説明されているが、手元の環境では /etc/mailman/ が変化した。

```
[root@xmta data]# n /etc/mailman/
合計 32
-rw-r--r--. 1 root mailman 14100 2012-11-21 09:11:11.000000000 +0900 sitelist.cfg
lrwxrwxrwx. 1 root mailman    34 2015-03-14 09:18:39.254626717 +0900 mm_cfg.py -> /usr/lib/mailman/Mailman/mm_cfg.py
-rw-rw----. 1 root mailman   355 2015-03-14 11:40:20.346018131 +0900 aliases
-rw-r-----. 1 root mailman 12288 2015-03-14 11:40:26.058952314 +0900 aliases.db
```

ここでパーミッションをテストしてみると

```
# /usr/lib/mailman/bin/check_perms

/etc/mailman/aliases.db の所有者は root です. (mailman でなければいけません)
/etc/mailman/aliases.db のパーミッションは 066x でなければいけません (0100640 になっています)
問題があります: 2
修正するには -f オプションをつけて mailman か root の権限で実行してください
```

と言われるので -f を付けて

```
# /usr/lib/mailman/bin/check_perms -f
警告: 限定公開保存書庫ディレクトリが other-executable (o+x) に
      なっています. あなたのシステムのシェルユーザがこの保存書庫
      を読むことができます. インストールマニュアルには, これを
      どうしたら修正できるか書いてありますので, 参考にしてください.

/etc/mailman/aliases.db の所有者は root です. (mailman でなければいけません) (修正中)
/etc/mailman/aliases.db のパーミッションは 066x でなければいけません (0100640 になっています) (修正中)
問題があります: 2
修正するには -f オプションをつけて mailman か root の権限で実行してください
```

確認

```
[root@xmta mailman]# pwd
/etc/mailman
[root@xmta mailman]# n
合計 32
-rw-r--r--. 1 root    mailman 14100 2012-11-21 09:11:11.000000000 +0900 sitelist.cfg
lrwxrwxrwx. 1 root    mailman    34 2015-03-14 09:18:39.254626717 +0900 mm_cfg.py -> /usr/lib/mailman/Mailman/mm_cfg.py
-rw-rw----. 1 root    mailman   355 2015-03-14 11:40:20.346018131 +0900 aliases
-rw-rw----. 1 mailman mailman 12288 2015-03-14 11:40:26.058952314 +0900 aliases.db
```

Postfix が /etc/mailman/aliases を見るように設定

```
vi /etc/postfix/main.cf
```

alias_maps を下記のように編集

```
alias_maps = hash:/etc/aliases, hash:/etc/mailman/aliases
```

Postfix を reload する

```
# postfix reload
```


##セットアップ

最初に site-wide のリストを作成する。

```
# /usr/lib/mailman/bin/newlist mailman
```

「リスト管理者のメールアドレスを入力してください」と言われるので `postmaster@example.jp` と入力してエンター。

次に「mailman の初期パスワード」と言われるので `mailman` (もちろん任意)。「Enter を押して mailman の管理者にメール通知する...」と言われるのでエンター。

##site-wide パスワードの設定

```
# /usr/lib/mailman/bin/mmsitepass
```

> site password (任意)

```
# /usr/lib/mailman/bin/mmsitepass -c
```

> list creator







##参考

- http://www.gnu.org/software/mailman/mailman-install/postfix-integration.html
