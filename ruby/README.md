##環境

- CentOS 6.5

##準備

```
# yum install gcc gcc-c++
# yum install openssl-devel
```

##rbenv をインストールしてセットアップ

```
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
rbenv install -l
rbenv install 2.0.0-p645
rbenv local 2.0.0-p645
```

