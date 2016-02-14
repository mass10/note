##環境

- CentOS 6.7

##準備

####その他のソフトウェアを準備する

```
# yum install wget
# yum install httpd
# yum install mysql-server
# yum install php
# yum install php-mysql
```

####必要なサービスを起動する

※root で作業する

```
# service mysqld start
# service httpd start
```



####データベースを作成する

mysql コマンドを起動してデータベースを作成します。






```
# mysql

mysql> create database wordpress_db;
mysql> create user 'wordpress'@'localhost' identified by 'wordpress';
mysql> grant all privileges on wordpress_db.* to wordpress@localhost;
mysql> quit
```

ログインできることを確認する

```
mysql -u wordpress -h localhost wordpress_db -p
```







##Wordpress をインストール

Wordpress 自体のインストールは、ファイルを配置するだけです。/var/www/html/wordpress という位置に置いても、/var/www/html という位置に置いても構いません。

```
cd /tmp
wget https://ja.wordpress.org/wordpress-4.4-ja.tar.gz
tar xvf wordpress-4.4-ja.tar.gz
mv wordpress/* /var/www/html/
chown -R apache:apache /var/www/html
```




##セットアップ

ウェブブラウザで下記の URL を開きます。あとは WordPress の指示に従って作業を進めます。

> http://example.com/wordpress



##管理コンテンツを SSL アクセスにリダイレクトする

```
vi /var/www/html/wp-config.php
```

> define('FORCE_SSL_ADMIN', true);

