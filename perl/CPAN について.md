##環境

/usr/bin/cpan script version 1.9, CPAN.pm version 1.9402 (by cpan -v)

##CPAN モジュールをインストールする際に、依存関係も(自動で)解決したい

CPAN モジュールをインストールしようとすると、「XXX というモジュールに依存しているが、どうするか？」のように訊ねられることがある。デフォルトが y(=はい) の場合は enter を押すだけでインストールされるのだが、この作業を自動化したい時には cpan の設定を変更することで自動的にデフォルト設定に従わせることが可能。

```
# cpan

cpan> o conf prerequisites_policy follow
cpan> o conf commit
cpan> quit
```

テストのために必要なパッケージを永続的にインストールするかどうかの選択を [yes] に固定する。

```
cpan> o conf build_requires_install_policy yes
```

