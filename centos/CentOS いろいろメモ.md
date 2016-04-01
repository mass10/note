##環境

- CentOS 6.5

##インストールしたら

#####インストール時

minimal を入れる。インストール時にネットワーク(eth0)を生かしておくこと以外は特になし。日本語を選択している。

#####.bashrc

    alias l='/bin/ls -lF --full-time --color=auto'
    alias n='/bin/ls -ltrF --full-time --color=auto'
    alias u='cd ..'

#####時計

最初に必ずやる作業

    # yum install ntp
    # ntpdate 0.centos.pool.ntp.org
    # chkconfig ntpd on

#####wget は入れておくことが多い

    # yum install wget

#####man も入れておくことが多い

    # yum install man

#####nslookup なども入れておくことが多い

    # yum install bind-utils

#####dstat

```
# yum install dstat
```

#####Vim

    # yum install vim

#####.vimrc

自分の .vimrc を転送して ~/ に保管

```
# cd
# wget https://raw.githubusercontent.com/mass10/vim.note/master/vimrc/.vimrc
```

zenburn.vim と molokai.vim を転送して配置

```
# cd /usr/share/vim/vimfiles/colors/
# wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
# wget https://raw.githubusercontent.com/jnurmine/Zenburn/master/colors/zenburn.vim
```

#####locate

普通の開発機なら locate を入れておくことが多い。ただし、極度にファイル数が増減するサーバー、例えばメールサーバーなどでは、負荷を気にしておくこと。

```
# yum install mlocate
# updatedb
```




#####Samba

Samba は必ずと言っていいほど入れる

```
# yum install samba
```


#####SELinux

```
# vim /etc/selinux/config
```

`SELinux=permissive` に変更する


##IPアドレスを追加する(一時的、揮発性)

```
# ip address add 192.168.141.180/24 dev eth0
# ip address
```

