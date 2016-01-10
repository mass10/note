##準備

####その他のソフトウェアを準備する

```
# yum install httpd
# yum install mysql-server
# yum install php
# yum install php-mysql
```

####データベースを作成する

mysql コマンドを実行。

```
# mysql
```

データベースを作成

```
mysql> create database wordpress_db;
mysql> create user wordpress identified by 'wordpress';
mysql> grant all privileges on wordpress_db.* to wordpress;
```


##インストール

インストールは、ファイルを配置するだけです。

```
cd /tmp
wget https://ja.wordpress.org/wordpress-4.4-ja.tar.gz
tar xvf https://ja.wordpress.org/wordpress-4.4-ja.tar.gz
mv wordpress /var/www/html/
chown -R apache:apache /var/www/html/wordpress
```

##セットアップ

ウェブブラウザで下記の URL を開きます。

> http://example.com/wordpress

