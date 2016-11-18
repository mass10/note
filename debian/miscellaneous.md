#タイムゾーンを変更する

↓のコマンドを実行すると、キャラクターベースの管理ツールが開く。

```
$ sudo dpkg-reconfigure tzdata
```

#ロケールを UTF-8 に変更する

```
# apt-get install task-japanese
```

- ja_JP.UTF-8 を有効にする

```
# vi /etc/locale.gen
```

```
# locale-gen
```

- ロケールを変更

```
# vi /etc/default/locale
```

> LANG=ja_JP.UTF-8

```
# reboot
```

#サービスの操作

##サービス一覧

```
# systemctl -t service
```

#パッケージ操作

##[apt-get] ファイルがどのパッケージによってインストールされたものか調べる

準備

```
# apt-get install apt-file
# apt-file update
```

検索

```
# apt-file search 'in/caba'
cabal-debian: /usr/bin/cabal-debian
cabal-debian: /usr/bin/cabal-debian-tests
cabal-install: /usr/bin/cabal
```

#Apache HTTP Server

##インストール

```
# apt-get install apache2
```

##SSL を有効にする

```
# a2ensite default-ssl
# a2enmod ssl
# service apache2 restart
```

