##環境

- CentOS 6.5

##はじめに

作成: 2014-07-15

/media/CentOS をリポジトリとするための設定ファイルがはじめから用意されているので、これを利用する。ただ、[他の設定ファイルを削除／コマンドライン引数でいちいち除外] しないと期待する挙動にならない。  
  
ここでは他の設定ファイルを(一次的に)削除する手順を残しておく。

##手順

```
# mkdir /media/CentOS
# mount /dev/dvd /media/CentOS
```

/etc/yum.repos.d/CentOS* を tar
```
# cd /etc/yum.repos.d/
# tar cvf xxx.tar Cent*
```

Media 以外を除去
```
# rm CentOS-Ba*
# rm CentOS-De*
# rm CentOS-Va*
```

Media を enabled に変更(vi)
```
enabled=1
```

yum install!
```
# yum install vim
```

tar を元に戻すには
```
# tar xvf xxx.tar
```
