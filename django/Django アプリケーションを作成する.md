##環境

- CentOS 6.5
- Python 2.6.6
- Django 1.6.5

##スケルトンを作成する

```
$ django-admin.py startproject test
$ cd test
$ django-admin.py startapp myapp
```

##準備

```
# iptables --insert INPUT {位置} --protocol tcp --destination-port 80 --jump ACCEPT
```

##動作確認

```
$ ./manage.py runserver 0.0.0.0:80
```

「It worked!」というページが表示されればまずはOK。
