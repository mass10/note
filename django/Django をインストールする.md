####環境

- CentOS 6.5
- Python 2.6.6
- easy_install 0.6.10 (python-setuptools-0.6.10-3)
- Django 1.6.5

####Python をインストール

    # yum install python

####easy_install をインストール

easy_install は Python のパッケージ管理ソフトウェアです。

    # yum install python-setuptools

####Django をインストール

```
# easy_install Django
```

もしくは

```
# pip install Django
```

環境にもよりますが、/usr/lib/python2.6/site-packages/ 以下に Django がインストールされます。

##ファイルから直接インストールする

```
# pip install Django-1.6.5.tar.gz
```


