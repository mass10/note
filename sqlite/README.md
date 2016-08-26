##sqlite3

####sqlite3 の対話モードで使うコマンドいろいろ

使い方

```
sqlite> .help
```

データベースのリスト(最近開いたもの？？)

```
sqlite> .databases
```

現在の設定

```
sqlite> .show
```

表リスト

```
sqlite> .tables
sqlite> .tables %TABLE_NAME%
```

インデックスのリスト

```
sqlite> .indices
sqlite> .indices %TABLE_NAME%
```

表の構造

```
sqlite> .schema
sqlite> .schema %TABLE_NAME%
```

終了

```
sqlite> .quit

or 

sqlite> .exit
```


