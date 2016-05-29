##サービス一覧

```
# systemctl -t service
```

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