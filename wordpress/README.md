##はじめに

EC2(AWS) + WordPress の導入手順メモです。

##環境

- AWS EC2 (Amazin Linux)
- WordPress 4.4.1

##準備

####その他のソフトウェアを準備する

```
# yum install wget
# yum install httpd
# yum install mod_ssl
# yum install mysql-server
# yum install php
# yum install php-mysql
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


##Wordpress をインストール

Wordpress 自体のインストールは、ファイルを配置するだけです。/var/www/html/wordpress とう位置に置いても、/var/www/html という位置に置いても構いません。

```
cd /tmp
wget https://ja.wordpress.org/wordpress-4.4-ja.tar.gz
tar xvf https://ja.wordpress.org/wordpress-4.4-ja.tar.gz
mv wordpress /var/www/html/
chown -R apache:apache /var/www/html/wordpress
```

##セットアップ

ウェブブラウザで下記の URL を開きます。あとは WordPress の指示に従って作業を進めてください。

> http://example.com/wordpress

