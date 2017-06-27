# easy_install #######################################################

- CentOS 6.5
- Python 2.6.6

```
# yum install python-setuptools
```







# easy_install をインストールする #######################################################

```
# yum install python-setuptools
```







# pip #######################################################

- CentOS 6.5
- Python 2.6.6

Python のパッケージシステム pip をインストールする。

```
# easy_install pip
```







# パッケージをインストールする #######################################################

```
# easy_install django
```

もしくは

```
# pip install django
```






# ファイルからパッケージをインストールする #######################################################

```
# pip install Django-1.6.7.tar.gz
```
















# pip 向けの requirements.txt を作成するには #######################################################

別の環境を新しく構築する際に使うパッケージリスト。

```
# pip freeze > requirements.txt
```




# パッケージリストを指定して一括インストールする #######################################################

```
# pip install -r requirements.txt
```






# pyenv をセットアップする #######################################################

最初に下記のパッケージをインストールしておくこと。

- for yum

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

- for apt-get

```
# apt-get install python-dev
# apt-get install gcc
# apt-get install g++
# apt-get install zlib1g-dev
# apt-get install libreadline-dev
# apt-get install libbz2-dev
# apt-get install libssl-dev
# apt-get install libsqlite3-dev
```

本体のインストール

```
# git clone https://github.com/yyuu/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

<br>
<br>
<br>
<br>

# Python から Oracle に接続する(cx_Oracle の場合) #######################################################

- CentOS 6.5
- Python 2.6.6

```
$ pip install cx_Oracle
```

### トラブルシューティング(libclntsh.so.11.1: cannot open shared object file: No such file or directory)

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

```
# python
Python 2.6.6 (r266:84292, Jul 23 2015, 15:22:56)
[GCC 4.4.7 20120313 (Red Hat 4.4.7-11)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import cx_Oracle
>>> connection = cx_Oracle.connect('sys/root@localhost:1521/XE', mode = cx_Oracle.SYSDBA)
>>> print connection.version
11.2.0.2.0
>>>
```







# virtualenv #######################################################

システムの Python パッケージとは異なる場所に環境を作成する。

```
$ virtualenv local-project-1 -p python3
$ cd local-project-1
$ . bin/activate
$ pip install xxxxxxxxxxxxxx
```

# Python で MySQL #######################################################

#### MySQL 公式ドライバー(mysql-connector-python)をインストールする

2016-08-11 追記: pip で入らなくなっている。

```
# pip install mysql-connector-python
```

#### 2016-08-11 yum 経由になっているぽい？？

↓下記で成功！

```
# yum install epel-release
# yum install mysql-connector-python
```

#### MySQL-python をインストールする

```
# pip install MySQL-python
```

- おそらく mysql-devel が必要である


# memcached #######################################################

```
# pip install python-memcached
```


