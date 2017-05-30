# Apache をインストール

##### Ubuntu

```
$ sudo apt-get install apache2
$ sudo a2enmod rewrite
$ sudo service apache2 restart
```


# Composer を設置

composer を任意のディレクトリにダウンロードして

```
$ wget https://getcomposer.org/installer
```

実行

```
$ php installer
$ mv composer.phar composer
$ mv composer /usr/local/bin/
```

# Laravel をインストールする

```
$ composer global require "laravel/installer"
```

# スケルトンを作成

```
$ PATH=$PATH:~/.config/composer/vendor/bin/
$ laravel new myapp1
```


# アプリケーションを配置する

##### HTTPS を有効にする

(Ubuntu)

```
$ sudo a2enmod ssl
$ sudo a2ensite default-ssl
$ sudo service apache2 restart
```

##### パーミッションについて

```
# chown -R www-data:www-data storage
# chown -R www-data:www-data bootstrap/cache
```

