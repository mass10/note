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
