##easy_install

- CentOS 6.5

```
# yum install python-setuptools
```

##pip

- CentOS 6.5

Python のパッケージシステム pip をインストールする。

```
# easy_install pip
```

##pyenv

- CentOS 6.5

最初に下記のパッケージをインストールしておくこと。

```
# yum install python-devel
# yum install gcc
# yum install gcc-c++
# yum install zlib-devel
# yum install readline-devel
# yum install bzip2-devel
# yum install openssl-devel
# yum install sqlite-devel
```

本体のインストール

```
# git clone https://github.com/yyuu/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

##Python から Oracle に接続する

cx_Oracle を利用する。

```
$ pip install cx_Oracle
```

#####トラブルシューティング

下記のような例外がスローされた場合には

> Traceback (most recent call last):
>   File "./test.py", line 4, in <module>
>     import cx_Oracle
> ImportError: libclntsh.so.11.1: cannot open shared object file: No such file or directory

libclntsh.so が無いらしい。libclntsh.so とはどこにあるのか調べてみると

```
# locate libclntsh.so
```

下記のような答えが返ってくるので

> /u01/app/oracle/product/11.2.0/xe/lib/libclntsh.so
> /u01/app/oracle/product/11.2.0/xe/lib/libclntsh.so.11.1

パスを通す

```
LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/xe/lib
export LD_LIBRARY_PATH
```
