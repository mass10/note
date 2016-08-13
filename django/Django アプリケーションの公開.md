##環境

- CentOS 6.5
- Django 1.6.5
- Apache HTTP Server 2.2.15

##前提

- Django アプリケーションが作成済みである。

##~~wsgi.py にアプリケーションパスを追加~~

~~下記のファイルを開く~~

```
~~vim /PATH/TO/PROJECT-ROOT/PROJECT/wsgi.py~~
```

~~下記を追記~~

~~**これが本当に一般的な方法か検証中です。[WSGIPythonPath] が機能していないような** → 消した...~~

```
# ~~import sys~~
# ~~sys.path.append('/PATH/TO/PROJECT-ROOT')~~
```


##httpd との連携

```
vim /etc/httpd/conf/httpd.conf
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

