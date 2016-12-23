##インストール(CentOS)

現在、CentOS 向けのインストーラは提供なし。圧縮ファイルを解凍してコマンドラインで実行する。

ただし、“非推奨”ではあるがインストールスクリプトが提供(=$NEO4J_HOME/bin/neo4j_installer)されている。

neo4j-community-2.3.0-M01-unix.tar.gz をダウンロードして解凍。/usr/local/ などの下へ mv。

```
# cd /usr/local/neo4j-community-2.3.0-M01/bin
# ./neo4j-installer install
```

質問には無言で [enter] を押す。(※[y]と答えると何故か y というユーザーでセットアップされてしまう)


