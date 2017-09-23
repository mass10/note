# タイムゾーンを変更する ################################

↓のコマンドを実行すると、キャラクターベースの管理ツールが開く。

```
$ sudo dpkg-reconfigure tzdata
```

# ロケールを UTF-8 に変更する ###########################

いくらやっても変わらない人は↓これがたりない

```
# apt-get install task-japanese
```

ja_JP.UTF-8 の行がコメントになっていたらコメントをはずして有効にする

```
# vi /etc/locale.gen
```

上記の操作をシステムに反映(?)させる

```
# locale-gen
```

ロケールを変更

```
# vi /etc/default/locale
```

> LANG=ja_JP.UTF-8

全てのプロセスを新しいロケールで起動させておきたいので再起動

```
# reboot
```

# サービスの操作

## サービス一覧

```
# systemctl -t service
```

## サービスを起動

```
# systemctl start apache2
```

## サービスを再起動

```
# systemctl restart apache2
```

## サービスを停止

```
# systemctl stop apache2
```

## サービスを有効にする

```
# systemctl enable apache2
```

## サービスを無効にする

```
# systemctl disable apache2
```

## 自動起動の状況を確認する

```
# systemctl list-unit-files -t service
```

# パッケージ操作

## [apt-get] ファイルがどのパッケージによってインストールされたものか調べる

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

# Apache HTTP Server

## インストール

```
# apt-get install apache2
```

## SSL を有効にする

```
# a2ensite default-ssl
# a2enmod ssl
# systemctl restart apache2
```




# E: The method driver /usr/lib/apt/methods/https could not be found.

apt-get update でエラー。

> E: The method driver /usr/lib/apt/methods/https could not be found.
> N: Is the package apt-transport-https installed?
> E: Failed to fetch https://pkg.jenkins.io/debian-stable/binary/InRelease  
> E: Some index files failed to download. They have been ignored, or old ones used instead.

```
# apt-get install apt-transport-https
```

