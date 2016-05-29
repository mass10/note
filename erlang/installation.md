##R16B03 をソースからインストールする

作成: 2014-06-12

####環境
- CentOS 6.5
- Erlang/OTP 16B03


####手順

Erlang のウェブサイト(http://www.erlang.org/)に Download Erlang/OTP とあるのでそれをクリック。R16B03 を選択。「R16B03 Source File」とあるのでこれをクリックしてダウンロード。

あとは 

    # ./configure
    # make 
    # make install

いろいろ必要になるので何度か失敗するが [Building and Installing Erlang/OTP](http://www.erlang.org/doc/installation_guide/INSTALL.html) にちゃんと書いてあるので読む。なお、`make release_tests` といった情報があるが、失敗したのでスルーした。(2009年8月時点では未実装だったぽい記述をみつけた... http://erlang.org/pipermail/erlang-bugs/2009-August/001487.html)

参考までに history を残しておく。これらをインストールしたのかもしれないし、しなかったのかもしれない。(あてずっぽうで打ったものもあることに注意。)

    # history | grep install
    yum install ntp
    yum install vim
    yum install ntp
    yum install samba
    yum install gcc gcc-c++
    yum install httpd
    make install
    yum install openssl-devel
    yum install openssl
    yum install openssl-clients
    yum install openssl-client
    yum install openssh
    yum install openssh-devel
    yum install libcrypto
    yum install crypto
    yum install crypt
    yum install fop
    yum install xsltproc
    yum install libcslt
    yum install libxslt
    yum install fop
    yum install java-1.6.0-openjdk-devel
    yum install wx
    yum install wxgtk
    yum install wxGTK
    yum install odbc
    yum install libodbc
    yum install unixODBC
    yum install wxGTK
    yum install wxGTK-devel
    yum install unixODBC-devel
    yum install curses
    yum install libcurses
    yum install ncurses
    yum install ncurses-devel
    make install
    yum install telnet
    yum install man
    yum install mail
    yum install iftop
    yum install tcpdump

####マニュアル

まず man。

    # yum install man

ソースをダウンロードしたところに「R16B03 Man Pages File」とあるので、これをダウンロードし、適当なところに解凍する。

    # tar xvf otp_doc_man_R16B03.tar.gz

カレントに man ができるので、これを Erlang のインストール先に移動する。

    # mv man /usr/local/lib/erlang/

MANPATH に追加する。/etc/man.config を開いて下記の行を追記。

    MANPATH /usr/local/lib/erlang/man

man を打つとマニュアルが見えると思う。

    # man erl

※R16B03 に関しては、環境を ls、find しながら思い出して書いた。誤りがあったら大変心苦しい。









##Erlang/OTP 17.0 を yum でインストールする

作成: 2014-06-12

**2014-06-12: yum はできたが、落ちてきたのは 17.0 ではなく全部 R1603B。何かの間違い...？**

http://www.erlang.org/ から DOWNLOADS を開いても RHEL(CentOS) みたいな単語がみつからない。下の方に少し行くと [Additional Packages] とあるので読んでみると「他にもあるよ！」的なことが書いてあるので、そのすぐ下のリンク(Erlang Solutions Downloads page)を開く。www.erlang-solutions.com というサイトに移動した。もう少し下を読むと Installation using repository とある。説明に従ってまず

    # wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
    # rpm -Uvh erlang-solutions-1.0-1.noarch.rpm

`/etc/yum.repos.d` に `erlang_solutions.repo` が保管された。これで yum が erlang-solutions.com を見に行く。

    # yum install erlang

結構なボリュームのパッケージが羅列されるが、思い切って y。R16 のときはこの方法が提供されていなかったか、もしくはみつけられなかったため、拍子抜けした。簡単...。

ちょっと man 打ってみたら

   # man erl

> No manual entry for erl

マニュアル入っていないっぽい...

リポジトリのパッケージをダウンロードしたところ(https://www.erlang-solutions.com/downloads/download-erlang-otp)の下の方に FAQ があり、この中で manpages とかをさらにインストールするように書かれていた。




>erlang-doc — HTML/PDF documentation

なんとなく入れる。

    # yum install erlang-doc

ない...



>erlang-manpages — manpages

これは必要だと思うので入れる。

    yum install erlang-manpages

ない...

>erlang-mode — major edit

知らんけど入れる

    # yum install erlang-mode

 ないっぽい
 



ところで `rpm -qa | grep erlang` してみたらたくさんの erlang パッケージがインストールされているんだけど、よくみたら全て R16B03 だった...

(2014-06-12 現在)


