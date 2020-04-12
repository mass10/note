# すべての BOM を生まれる前に消し去りたい (2020-04-12)

ソリューションのルートに `.editconfig` というファイルを置きます。

```
root = true

[*]
charset = utf-8
```

https://qiita.com/magnet163/items/b1061be4fb1c1833c156

* ファイルを作成した時点では BOM(EF BB BF)が付いていますが、一度 Ctrl + S すると消えます。
* `.csproj` の BOM を消すことはできませんでした。

