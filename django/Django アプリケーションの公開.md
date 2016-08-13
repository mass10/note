##環境

- CentOS 6.5
- Django 1.6.5
- Apache HTTP Server 2.2.15

##前提

- Django アプリケーションが作成済みである。

##httpd との連携

- ```/etc/httpd/conf/httpd.conf``` に ```Include conf.d/*.conf``` の記述があること。

```/etc/httpd/conf.d``` に新しいファイルを追加して

```
vim /etc/httpd/conf.d/example.conf
```

下記を追加

```
WSGIScriptAlias / /PATH/TO/PROJECT-ROOT/PROJECT/wsgi.py
WSGIPythonPath /PATH/TO/PROJECT-ROOT

<Directory /PATH/TO/PROJECT-ROOT>
    <Files wsgi.py>
        Order deny,allow
        Allow from all
    </Files>
</Directory>
```

httpd を再起動

```
# apachectl restart
```

ログを確認

```
# tailf /var/log/httpd/error_log
```

